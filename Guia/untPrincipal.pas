// ALTER TABLE clientes ADD COLUMN bloqueado BOOLEAN
unit untPrincipal;

interface

uses
   System.SysUtils, System.Types, System.UITypes, System.Classes,
   System.Variants,
   FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Menus,
   FMX.StdCtrls, FMX.Controls.Presentation, FMX.Effects, FMX.Objects,
   FMX.ListBox,
   FMX.EditBox, FMX.ComboTrackBar, FMX.Edit, FMX.ComboEdit, FMX.Layouts,
   FMX.TMSBaseControl, FMX.TMSGridCell, FMX.TMSGridOptions, FMX.TMSGridData,
   FMX.TMSCustomGrid, FMX.TMSGrid, DateUtils, FMX.ScrollBox, FMX.Memo,
   IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
   IdExplicitTLSClientServerBase, IdFTP, System.Rtti, System.Bindings.Outputs,
   FMX.Bind.Editors, Data.Bind.EngExt, FMX.Bind.DBEngExt, Data.Bind.Components,
   Data.Bind.DBScope, System.JSON, REST.Utils, REST.Types, System.NetEncoding,
   IPPeerClient, REST.Client, Data.Bind.ObjectScope, FireDac.Stan.Param,
   FMX.TMSProgressBar, FMX.Ani, IdIOHandler, IdIOHandlerSocket,
   IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdHTTP,FMX.Platform.Win, Guia.Controle, FireDAC.Stan.Intf,
   FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
   FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, untNotificacoes;

type
   TfrmPrincipal = class(TForm)
      Panel1: TPanel;
      btnComercio: TRectangle;
      Label1: TLabel;
      Image1: TImage;
    btnCategorias: TRectangle;
      Label2: TLabel;
      Image2: TImage;
    recCheckList: TRectangle;
      Label3: TLabel;
      Image3: TImage;
      ShadowEffect2: TShadowEffect;
      ShadowEffect1: TShadowEffect;
      ShadowEffect3: TShadowEffect;
    recContratos: TRectangle;
      Label4: TLabel;
      Image4: TImage;
      ShadowEffect4: TShadowEffect;
    recLogradouros: TRectangle;
      Label5: TLabel;
      Image5: TImage;
      ShadowEffect5: TShadowEffect;
    recFinanceiro: TRectangle;
      Label6: TLabel;
      Image6: TImage;
      ShadowEffect6: TShadowEffect;
    recUpdate: TRectangle;
      Label7: TLabel;
      ShadowEffect7: TShadowEffect;
    pnlRodape: TPanel;
    pnlUpdates: TPanel;
    Image8: TImage;
    lblUpdateFiles: TLabel;
    Timer1: TTimer;
    pnlUsuario: TPanel;
    lblUsuario: TLabel;
    Image7: TImage;
    recConfiguracoes: TRectangle;
    Label9: TLabel;
    ShadowEffect9: TShadowEffect;
    Image9: TImage;
    recDownload: TRectangle;
    Label10: TLabel;
    ShadowEffect10: TShadowEffect;
    Image10: TImage;
    recProgress: TRectangle;
    Rectangle7: TRectangle;
    ShadowEffect8: TShadowEffect;
    TMSFMXProgressBar: TTMSFMXProgressBar;
    Label8: TLabel;
    lblArquivos: TLabel;
    recNotificacao: TRectangle;
    Label11: TLabel;
    ShadowEffect11: TShadowEffect;
    Image11: TImage;
    qryControle: TFDQuery;
    procedure btnComercioClick(Sender: TObject);
    procedure btnCategoriasClick(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Image11Click(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   frmPrincipal: TfrmPrincipal;
   lcNomeFolder : String;
   lcPathFtpFolder : String;
implementation

{$R *.fmx}

uses untCategorias, untComercio, untDmGeral, untGlobal, untCheckList,
   untContrato, untListaComercio, System.UIConsts, untEditaComercio, frmFindCep,
   frmListaContaReceber, frmUpdateFtp, IdFTPCommon,
  Winapi.Windows;

procedure TfrmPrincipal.btnComercioClick(Sender: TObject);
begin
   frmEditaComercio.ShowModal;
end;

function CountUpdateFiles : Word;
var
   QueryTmp: TFDQuery;
begin
   QueryTmp := TFDQuery.Create(nil);
   QueryTmp.Connection := dmGeral.Conexao;
   With QueryTmp do
      begin
         Close;
         Sql.Clear;
         Sql.Add('SELECT * FROM ALFILES');
         Sql.Add('WHERE UPDATE_FILES = 1');
         Open;
         Result := RecordCount;
      end;
   QueryTmp.Release;
   FreeAndNil(QueryTmp);
end;



procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin

qryControle.Connection := dmGeral.Conexao;
LoadControle(qryControle);

if CountUpdateFiles = 0 then
   begin
      lblUpdateFiles.Text := 'Nenhum arquivo a ser atualizado';
      recUpdate.Visible := False;
   end
else
   begin
      lblUpdateFiles.Text := CountUpdateFiles.ToString + ' Arquivo(s) a ser(em) atualizado(s)';
      recUpdate.Visible := True;
   end;

//lblUsuario.Text := 'Usuário: '+ParamStr(2);
//gIdUsu := ParamStr(3).ToInteger;
//if ParamStr(4) = '0' then
//   gAutorizado := False else gAutorizado := True;
end;


procedure getFoldersFtp(ANomeFile : String);
const
ASiglaFolder : Array[1..6] of String = ('FTO','ICO','LGO','TXT','ANU','PUS');
AFolder      : Array[1..6] of String = ('Fotos/','Icones/','Logos/','Textos/','Anuncios/','Push/');
begin

  for var i := 1 to 6 do
     begin

        if Copy(ANomeFile,1,3) = ASiglaFolder[i] then
           begin
              lcNomeFolder    := AFolder[i];
              lcPathFtpFolder := ctrPATHRAIZFTP + AFolder[i];
           end;

     end;

end;

procedure TfrmPrincipal.Image10Click(Sender: TObject);
var
_Erro, i : Integer;
_NomeFile : TStringList;
_Msg : String;
begin
if MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
              pChar('Esta opção fara o download de todos os arquivos'+#13+
              'do servidor para o seu computador, substituindo'+#13+
              'seus arquivos locais.'+#13#13+
              'Deseja continuar?'),'Downloads',
              MB_YESNO + MB_ICONQUESTION) = IDYES then
   begin
      _NomeFile := TStringList.Create;
      With dmGeral.qryGeral do
         begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT * FROM ALFILES');
            Open;
            First;
            _Erro := 0;
            TMSFMXProgressBar.Min := 0;
            TMSFMXProgressBar.Max := RecordCount;
            recProgress.Visible := True;
            While not eof do
               begin
                  Application.ProcessMessages;
                  TMSFMXProgressBar.Value := TMSFMXProgressBar.Value + 1;
                  var ANomeFile := FieldByName('NOMEFILES').AsString;
                  lblArquivos.Text := 'Download: '+ANomeFile;

                  getFoldersFtp(ANomeFile);

                  if ReceiveFileFtp(ANomeFile,
                                    ExtractFilePath(ParamStr(0))+'\Arquivos\' + lcNomeFolder +
                                    ANomeFile, lcPathFtpFolder) then
                     begin
                        Next;
                     end
                  else
                     begin
                        _Erro := _Erro + 1;
                        _NomeFile.Add(FieldByName('NOMEFILES').AsString);
                        Next;
                     end;
               end;
            if _Erro > 0 then
               begin
                  for i := 0 to _NomeFile.Count - 1 do
                     _Msg := _Msg +#13+_NomeFile.Strings[i];

                  ShowMessage('Alguns arquivos não puderam ser baixados ao servidor:'+#13+_Msg);
               end;
         end;
      recProgress.Visible := False;
      TMSFMXProgressBar.Value := 0;
   end
else
   begin
      Exit;
   end;
end;

procedure TfrmPrincipal.Image11Click(Sender: TObject);
begin

     frmNotificacoes.ShowModal;

end;

procedure TfrmPrincipal.Image3Click(Sender: TObject);
begin
   frmChekList.ShowModal;
end;

procedure TfrmPrincipal.Image4Click(Sender: TObject);
begin
   frmListaComercio.recPesquisa.Height := 0;
   frmListaComercio.recFiltro.Visible := False;
   frmListaComercio.ShowModal;
end;

procedure TfrmPrincipal.Image5Click(Sender: TObject);
begin
   frm_FindCep.ShowModal;
end;

procedure TfrmPrincipal.Image6Click(Sender: TObject);
begin
   With frm_ListaContaReceber do
      begin
         vSql := 'ORDER BY r.VENCTOCR';
         ShowModal;
      end;
end;

procedure UpdateFiles(fNomeFiles : String);
begin
   With dmGeral.qryFiles do
      begin
         Close;
         Sql.Clear;
         Sql.Add('UPDATE ALFILES SET');
         Sql.Add('UPDATE_FILES = 0');
         Sql.Add('WHERE NOMEFILES = :NOMEFILES');
         Params[0].AsString := fNomeFiles;
         ExecSql;
      end;
end;

procedure TfrmPrincipal.Image7Click(Sender: TObject);
var
_Erro, i : Integer;
_NomeFile : TStringList;
_Msg : String;
begin
_NomeFile := TStringList.Create;
_Erro := 0;
TMSFMXProgressBar.Min := 0;
TMSFMXProgressBar.Max := CountUpdateFiles;
recProgress.Visible := True;
With dmGeral.qryGeral do
   begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT * FROM ALFILES');
      Sql.Add('WHERE UPDATE_FILES = 1');
      Open;
      First;
      While not eof do
         begin
            TMSFMXProgressBar.Value := TMSFMXProgressBar.Value + 1;
            var ANomeFiles := FieldByName('NOMEFILES').AsString;
            lblArquivos.Text := 'Enviando: '+ ANomeFiles;

            getFoldersFtp(ANomeFiles);
            if SendFileFtp(gPathArquivos + lcNomeFolder + ANomeFiles,
                           ANomeFiles, lcPathFtpFolder) then
               begin
                  UpdateFiles(FieldByName('NOMEFILES').AsString);
                  Next;
               end
            else
               begin
                  _Erro := _Erro + 1;
                  _NomeFile.Add(FieldByName('NOMEFILES').AsString);
                  Next;
               end;
               Application.ProcessMessages;
         end;
      if _Erro > 0 then
         begin
            for i := 0 to _NomeFile.Count - 1 do
               _Msg := _Msg +#13+_NomeFile.Strings[i];

            ShowMessage('Alguns arquivos não puderam ser enviados ao servidor:'+#13+_Msg);
         end;
   end;
recProgress.Visible := False;
TMSFMXProgressBar.Value := 0;
frmNotificacoes.recEnviarPush.Visible := True;
frmNotificacoes.lblAviso.Visible      := False;
FormCreate(Sender);
end;

procedure TfrmPrincipal.Image8Click(Sender: TObject);
begin
FormCreate(Sender);
end;

procedure TfrmPrincipal.btnCategoriasClick(Sender: TObject);
begin
   frmCategorias.ShowModal;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
if CountUpdateFiles = 0 then
   begin
      lblUpdateFiles.Text := 'Nenhum arquivo a ser atualizado';
      recUpdate.Visible := False;
      frmNotificacoes.lblAviso.Visible := False;
      frmNotificacoes.recEnviarPush.Visible := True;
   end
else
   begin
      lblUpdateFiles.Text := CountUpdateFiles.ToString + ' Arquivo(s) a ser(em) atualizado(s)';
      recUpdate.Visible := True;
      frmNotificacoes.lblAviso.Visible := True;
      frmNotificacoes.recEnviarPush.Visible := False;
   end;
end;

end.
