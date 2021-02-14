unit untNotificacoes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts, FMX.Effects, FMX.ListBox,
  FMX.TabControl, FMX.ScrollBox, FMX.Memo, FMX.Edit, untGlobal, Guia.Controle, untDmGeral, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FMX.DateTimeCtrls, Winapi.Windows, FMX.TMSBaseControl, FMX.TMSGridCell, FMX.TMSGridOptions, FMX.TMSGridData, FMX.TMSCustomGrid, FMX.TMSGrid, FMX.Ani;

type
  TfrmNotificacoes = class(TForm)
    Panel1: TPanel;
    sbtnSair: TSpeedButton;
    Label2: TLabel;
    Line1: TLine;
    Label3: TLabel;
    lblStatusCat: TLabel;
    recNotificacao: TRectangle;
    Layout98: TLayout;
    imgNotificacao: TImage;
    Layout104: TLayout;
    Layout108: TLayout;
    lblTituloNotificacao: TLabel;
    Layout113: TLayout;
    lblNotificacao: TLabel;
    lytNotificacao: TLayout;
    tbcNotificacoes: TTabControl;
    tbiCadastro: TTabItem;
    Layout2: TLayout;
    Layout3: TLayout;
    imgPush: TImage;
    Layout4: TLayout;
    Layout5: TLayout;
    cbComercio: TComboBox;
    Label5: TLabel;
    Layout6: TLayout;
    Layout7: TLayout;
    Layout8: TLayout;
    Label1: TLabel;
    edtTituloPush: TEdit;
    Layout9: TLayout;
    Layout10: TLayout;
    Label4: TLabel;
    mmMsgPush: TMemo;
    imgTrashTmp: TImage;
    Image3: TImage;
    Rectangle1: TRectangle;
    lblbtnSalvarPush: TLabel;
    OpenDialogAnuncio: TOpenDialog;
    qryDadosComercio: TFDQuery;
    Image1: TImage;
    Rectangle2: TRectangle;
    qryNotificacao: TFDQuery;
    OpenDialogLogo: TOpenDialog;
    GridLayout1: TGridLayout;
    ShadowEffect10: TShadowEffect;
    Label7: TLabel;
    Layout1: TLayout;
    tbiEnviar: TTabItem;
    Rectangle3: TRectangle;
    Image6: TImage;
    Layout25: TLayout;
    Rectangle5: TRectangle;
    Layout26: TLayout;
    imgLogopush: TImage;
    Layout27: TLayout;
    Layout28: TLayout;
    lblTituloPush: TLabel;
    Layout29: TLayout;
    lblMsgPush: TLabel;
    ShadowEffect1: TShadowEffect;
    grdNotificacoes: TTMSFMXGrid;
    Rectangle4: TRectangle;
    Layout13: TLayout;
    Layout14: TLayout;
    chkEnviadas: TCheckBox;
    chkNaoEnviadas: TCheckBox;
    grlytAnuncios: TGridLayout;
    Layout15: TLayout;
    recEnviarPush: TRectangle;
    Label8: TLabel;
    lblAviso: TLabel;
    recProgressoEnvioPush: TRectangle;
    Rectangle6: TRectangle;
    ShadowEffect2: TShadowEffect;
    Image2: TImage;
    Image4: TImage;
    FloatAnimation1: TFloatAnimation;
    Layout11: TLayout;
    Layout12: TLayout;
    Layout16: TLayout;
    Layout17: TLayout;
    Layout18: TLayout;
    Label6: TLabel;
    Label10: TLabel;
    pbProgresso: TProgressBar;
    lblNomeUsuarioPush: TLabel;
    lstUsuarios: TListBox;
    Layout19: TLayout;
    chkSelectUser: TCheckBox;
    qryUpdatePush: TFDQuery;
    edtValidade: TDateEdit;
    Label9: TLabel;
    procedure Image3Click(Sender: TObject);
    procedure edtTituloPushKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure mmMsgPushKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure cbComercioClosePopup(Sender: TObject);
    procedure imgPushClick(Sender: TObject);
    procedure lblbtnSalvarPushClick(Sender: TObject);
    procedure sbtnSairClick(Sender: TObject);
    procedure chkEnviadasChange(Sender: TObject);
    procedure tbiEnviarClick(Sender: TObject);
    procedure grdNotificacoesDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Label8Click(Sender: TObject);
    procedure chkSelectUserChange(Sender: TObject);
  private
    procedure CriaViewAnuncio(AParent : TFmxObject; AFileImagem : String; ADelete : Boolean = True);
    procedure OnClickDeleteAnuncio(Sender: TObject);
    function CarregaNotificacoes(AEnviadas, ANaoEnviadas : Boolean) : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNotificacoes: TfrmNotificacoes;
  AIndexImage : Integer = 0;
  AListaImages : TStringList;
  AListaFiles : TStringList;
  lcNomeFile : String;
  lcRowCount : Integer;
  lcIdPush : Integer = 0;

  lcTitulo       : String;
  lcMensagem     : String;
  lcImagem       : String;
  lcAnuncio      : String;
  lcIdComercio   : String;
  lcValidade     : TDate;
  lcNomeComercio : String;
implementation

{$R *.fmx}

uses untPrincipal;

procedure TfrmNotificacoes.cbComercioClosePopup(Sender: TObject);
var
AIdCom : Integer;
ANomeFile : String;
begin

     if cbComercio.ItemIndex >= 0 then
        begin
             AIdCom := Integer(cbComercio.Items.Objects[cbComercio.ItemIndex]);
             qryDadosComercio.Filter   := 'IDCOM = ' + QuotedStr(AIdCom.ToString);
             qryDadosComercio.Filtered := True;


             ANomeFile := qryDadosComercio.FieldByName('ICOCOM').AsString;

             Try

                imgPush.Bitmap.LoadFromFile(gPathArquivos +'\Logos\' + ANomeFile);
                lcNomeFile := gPathArquivos +'\Logos\' + ANomeFile;
                imgNotificacao.Bitmap := imgPush.Bitmap;

             Except

                   ShowMessage('Não foi possivel encontrar o icone do comércio selecionado.');
                   Exit;

             End;
        end
     else
        begin

            Exit;

        end;
end;

procedure TfrmNotificacoes.chkEnviadasChange(Sender: TObject);
begin

    case CarregaNotificacoes(chkEnviadas.IsChecked, chkNaoEnviadas.IsChecked) of

        True : begin

                    lcRowCount := dmGeral.qryGeral.RecordCount + 1;
                    grdNotificacoes.RowCount := lcRowCount;
                    if dmGeral.qryGeral.RecordCount > 0 then
                        begin

                            while not dmGeral.qryGeral.Eof do
                                begin
                                    var AIdPushs     := dmGeral.qryGeral.FieldByName('ID_PUSHS').AsString;
                                    var AIdCom       := dmGeral.qryGeral.FieldByName('IDCOM').AsString;
                                    var AComercio    := dmGeral.qryGeral.FieldByName('FANTASIACOM').AsString;
                                    var ATituloPushs := dmGeral.qryGeral.FieldByName('TITULO_PUSHS').AsString;
                                    var ADataPush    := dmGeral.qryGeral.FieldByName('DATA_PUSHS').AsString;
                                    var ADataEnPush  := dmGeral.qryGeral.FieldByName('DATAENVIADO_PUSHS').AsString;
                                    var AStatusPushs : String;

                                    if dmGeral.qryGeral.FieldByName('ENVIADO_PUSHS').AsString = 'T' then
                                        AStatusPushs := 'Enviado' else AStatusPushs := 'Cadastrado';


                                    grdNotificacoes.Cells[0, dmGeral.qryGeral.RecNo] := AIdPushs;
                                    grdNotificacoes.Cells[1, dmGeral.qryGeral.RecNo] := AIdCom;
                                    grdNotificacoes.Cells[2, dmGeral.qryGeral.RecNo] := ATituloPushs;
                                    grdNotificacoes.Cells[3, dmGeral.qryGeral.RecNo] := AComercio;
                                    grdNotificacoes.Cells[4, dmGeral.qryGeral.RecNo] := ADataPush;
                                    grdNotificacoes.Cells[5, dmGeral.qryGeral.RecNo] := ADataEnPush;
                                    grdNotificacoes.Cells[6, dmGeral.qryGeral.RecNo] := AStatusPushs;


                                    dmGeral.qryGeral.Next;
                                end;

                        end;

               end;

       False : grdNotificacoes.RowCount := 1;

    end;

end;

procedure TfrmNotificacoes.chkSelectUserChange(Sender: TObject);
begin

    if chkSelectUser.IsChecked then
        begin
            dmGeral.qryGeral.Close;
            dmGeral.qryGeral.SQL.Clear;
            dmGeral.qryGeral.SQL.Add('SELECT * FROM ALUSUARIOSAPP');
            dmGeral.qryGeral.SQL.Add('ORDER BY NOMEUSU');
            dmGeral.qryGeral.Open;
            dmGeral.qryGeral.First;

            while not dmGeral.qryGeral.Eof do
                begin

                    lstUsuarios.Items.AddObject(dmGeral.qryGeral.FieldByName('NOMEUSU').AsString, TObject(dmGeral.qryGeral.FieldByName('IDUSU').AsInteger));
                    dmGeral.qryGeral.Next;

                end;
        end
     else
        begin
            lstUsuarios.Items.Clear;
        end;
end;

procedure TfrmNotificacoes.CriaViewAnuncio(AParent : TFmxObject; AFileImagem : String; ADelete : Boolean = True);
var
AImage  : TImage;
ALayout : TLayout;
ARectangle: TRectangle;
begin

     AImage        := TImage.Create(Self);
     AImage.Parent := AParent;
     AImage.Margins.Left  := 3;
     AImage.Margins.Right := 3;
     AImage.Margins.Top   := 3;
     AImage.Name   := 'imgAnuncio' + AIndexImage.ToString;
     AImage.Bitmap.LoadFromFile(AFileImagem);

     ALayout        := TLayout.Create(Self);
     ALayout.Parent := AImage;
     ALayout.Align  := TAlignLayout.Bottom;
     ALayout.Height := 30;
     AListaImages.Add('imgAnuncio' + AIndexImage.ToString);
     AIndexImage := AIndexImage + 1;
     if ADelete = True then
        begin
             ARectangle         := TRectangle.Create(Self);
             ARectangle.Parent  := ALayout;
             ARectangle.Align   := TAlignLayout.Right;
             ARectangle.Width   := 30;
             ARectangle.Stroke.Kind := TBrushKind.None;

             AImage           := TImage.Create(Self);
             AImage.Parent    := ARectangle;
             AImage.Align     := TAlignLayout.Client;
             AImage.HitTest   := True;
             AImage.Bitmap    := imgTrashTmp.Bitmap;
             AImage.TagString := 'imgAnuncio' + AIndexImage.ToString;
             AImage.WrapMode  := TImageWrapMode.Center;
             AImage.Cursor    := crHandPoint;
             AImage.OnClick   := OnClickDeleteAnuncio;
             AImage.BringToFront;
        end;

end;

procedure TfrmNotificacoes.edtTituloPushKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin

     lblTituloNotificacao.Text := edtTituloPush.Text;

end;

function TfrmNotificacoes.CarregaNotificacoes(AEnviadas, ANaoEnviadas : Boolean) : Boolean;
begin

     dmGeral.qryGeral.Close;
     dmGeral.qryGeral.SQL.Clear;
     dmGeral.qryGeral.SQL.Add('SELECT * FROM ALPUSHS p');
     dmGeral.qryGeral.SQL.Add('LEFT JOIN ALCOMERCIO c');
     dmGeral.qryGeral.SQL.Add('ON (p.IDCOM_PUSHS = c.IDCOM)');



     if (AEnviadas = True) and (ANaoEnviadas = True) then
        begin
            dmGeral.qryGeral.SQL.Add('ORDER BY ENVIADO_PUSHS');
            dmGeral.qryGeral.Open;
            Result := True;
            Exit;
        end;

     if (AEnviadas = False) and (ANaoEnviadas = False) then
        begin
            dmGeral.qryGeral.Close;
            grdNotificacoes.RowCount := 1;
            Result := False;
        end;

     case AEnviadas of

           True : begin
                    dmGeral.qryGeral.SQL.Add('WHERE ENVIADO_PUSHS = ' + QuotedStr('T'));
                    dmGeral.qryGeral.SQL.Add('ORDER BY DATAENVIADO_PUSHS');
                    dmGeral.qryGeral.Open;
                    Result := True;
                  end;

          False : begin
                    dmGeral.qryGeral.SQL.Add('WHERE ENVIADO_PUSHS = ' + QuotedStr('F'));
                    dmGeral.qryGeral.SQL.Add('ORDER BY DATA_PUSHS');
                    dmGeral.qryGeral.Open;
                    Result := True;
                  end;


     end;


end;

procedure TfrmNotificacoes.FormClose(Sender: TObject; var Action: TCloseAction);
begin

    AListaImages.DisposeOf;

end;

procedure TfrmNotificacoes.FormShow(Sender: TObject);
begin
     AListaImages := TStringList.Create;
     qryDadosComercio.Connection := dmGeral.Conexao;
     qryNotificacao.Connection   := dmGeral.Conexao;
     qryUpdatePush.Connection    := dmGeral.Conexao;
     grdNotificacoes.RowCount    := 1;
     grdNotificacoes.Cells[2, 0] := 'Titulo Notificações';
     grdNotificacoes.Cells[3, 0] := 'Comércio';
     grdNotificacoes.Cells[4, 0] := 'Criado em';
     grdNotificacoes.Cells[5, 0] := 'Enviado em';
     grdNotificacoes.Cells[6, 0] := 'Status';

     grdNotificacoes.Columns[0].Width := 0;
     grdNotificacoes.Columns[1].Width := 0;
     grdNotificacoes.Columns[2].Width := 200;
     grdNotificacoes.Columns[3].Width := 200;
     grdNotificacoes.Columns[4].Width := 83;
     grdNotificacoes.Columns[5].Width := 83;
     grdNotificacoes.Columns[6].Width := 83;


     frmNotificacoes.lblAviso.Visible      := frmPrincipal.recUpdate.Visible;
     frmNotificacoes.recEnviarPush.Visible := not frmPrincipal.recUpdate.Visible;


     qryDadosComercio.Close;
     qryDadosComercio.SQL.Clear;
     qryDadosComercio.SQL.Add('select idcom, fantasiacom, icocom from alcomercio c');
     qryDadosComercio.SQL.Add('inner join alcontrato b');
     qryDadosComercio.SQL.Add('on (b.idcom_contrato = c.idcom)');
     qryDadosComercio.SQL.Add('where b.statuscontrato = ' +  QuotedStr('ONLINE'));

     qryDadosComercio.Open;

     qryDadosComercio.First;

     while not qryDadosComercio.Eof do
         begin

              cbComercio.Items.AddObject(qryDadosComercio.FieldByName('fantasiacom').AsString,TObject(qryDadosComercio.FieldByName('idcom').AsInteger));
              qryDadosComercio.Next;

         end;

end;

procedure TfrmNotificacoes.grdNotificacoesDblClick(Sender: TObject);
var
AIdComercio    : String;
begin
    if AListaImages.Count > 0 then
       begin
            for var i := 0 to AListaImages.Count - 1 do
                TImage(frmNotificacoes.FindComponent(AListaImages.Strings[i])).DisposeOf;
       end;

    AListaImages.Clear;

    lcIdPush := grdNotificacoes.Cells[0,grdNotificacoes.Selected].ToInteger;

    dmGeral.qryGeral.Close;
    dmGeral.qryGeral.SQL.Clear;
    dmGeral.qryGeral.SQL.Add('SELECT IDCOM_PUSHS, MSG_PUSHS, ANUNCIO_PUSHS, IMAGEM_PUSHS, DATAVALIDADEANUNCIO_PUSHS FROM ALPUSHS');
    dmGeral.qryGeral.SQL.Add('WHERE ID_PUSHS = :IDPUSH');
    dmGeral.qryGeral.ParamByName('IDPUSH').AsInteger := lcIdPush;
    dmGeral.qryGeral.Open;

    lblTituloPush.Text := grdNotificacoes.Cells[2,grdNotificacoes.Selected];
    lblMsgPush.Text    := dmGeral.qryGeral.FieldByName('MSG_PUSHS').AsString;
    imgLogopush.Bitmap.LoadFromFile(gPathArquivos+'\Push\' + dmGeral.qryGeral.FieldByName('IMAGEM_PUSHS').AsString);

    lcTitulo       := lblTituloPush.Text;
    lcMensagem     := lblMsgPush.Text;
    lcImagem       := dmGeral.qryGeral.FieldByName('IMAGEM_PUSHS').AsString;
    lcAnuncio      := dmGeral.qryGeral.FieldByName('ANUNCIO_PUSHS').AsString;
    lcIdComercio   := dmGeral.qryGeral.FieldByName('IDCOM_PUSHS').AsString;
    lcNomeComercio := grdNotificacoes.Cells[3, grdNotificacoes.Selected];
    if dmGeral.qryGeral.FieldByName('DATAVALIDADEANUNCIO_PUSHS').AsDateTime <> null then
        lcValidade := dmGeral.qryGeral.FieldByName('DATAVALIDADEANUNCIO_PUSHS').AsDateTime;

    if dmGeral.qryGeral.FieldByName('ANUNCIO_PUSHS').AsString = 'T' then
        begin

            dmGeral.qryGeral.Close;
            dmGeral.qryGeral.SQL.Clear;
            dmGeral.qryGeral.SQL.Add('SELECT * FROM ALANUNCIOS');
            dmGeral.qryGeral.SQL.Add('WHERE IDPUSH_ANUNCIO = :IDPUSH');
            dmGeral.qryGeral.ParamByName('IDPUSH').AsInteger := lcIdPush;
            dmGeral.qryGeral.Open;

            while not dmGeral.qryGeral.Eof do
                begin

                    CriaViewAnuncio(grlytAnuncios, gPathArquivos + '\Anuncios\' + dmGeral.qryGeral.FieldByName('NOMEFILE_ANUNCIO').AsString, False);
                    dmGeral.qryGeral.Next;

                end;

        end;

end;

procedure TfrmNotificacoes.Image3Click(Sender: TObject);
var
AErro : Boolean;
AQtdeImagens, AQtdeCount : Integer;
begin

   AQtdeImagens := GridLayout1.ChildrenCount;

    if AQtdeImagens = 5 then
      begin
          ShowMessage('O total de 5 anúncios já foram atingidos!');
          Exit;
      end
   else
      begin

           AErro := False;

           if OpenDialogAnuncio.Execute then
              begin

                 AQtdeCount   := AQtdeImagens + OpenDialogAnuncio.Files.Count;

                 for var i := 0 to OpenDialogAnuncio.Files.Count - 1 do
                    begin
                        if SizeImgPx(OpenDialogAnuncio.Files[i]) <> ctrSIZEANUNCIOCOMERCIO then
                            begin

                                 AErro := True;

                            end
                         else
                            begin

                                if AQtdeImagens < 5 then
                                    begin
                                        CriaViewAnuncio(GridLayout1, OpenDialogAnuncio.Files[i]);
                                        AQtdeImagens := AQtdeImagens + 1;
                                    end;

                            end;
                    end;

                    if AQtdeCount > 5 then
                        begin
                            ShowMessage('Alguns anúncios não puderam ser inseridos, pois só é possivel adicionar 5 anúncios.');
                            Exit;
                        end;

                    if AErro = True then
                        begin
                            ShowMessage('Alguns anúncios não puderam ser carregados pois estão fora do formato de '+ctrSIZEANUNCIOCOMERCIO+' px!');
                            Exit;
                        end;

              end;
      end;

end;

procedure TfrmNotificacoes.imgPushClick(Sender: TObject);
begin

     if OpenDialogLogo.Execute then
        begin
           if SizeImgPx(OpenDialogLogo.FileName)  <> ctrSIZELOGOCOMERCIO then
              begin

                  ShowMessage('A imagem da notificação deve estar no formato de '+ctrSIZELOGOCOMERCIO+' px!');
                  Exit;

              end
           else
              begin

                  imgPush.Bitmap.LoadFromFile(OpenDialogLogo.FileName);
                  imgNotificacao.Bitmap := imgPush.Bitmap;
                  lcNomeFile := OpenDialogLogo.FileName;

              end;
        end;

end;

procedure TfrmNotificacoes.Label8Click(Sender: TObject);
var
ACountErros, ATotalEnvios : Integer;
ALogUsuarios : TStringList;
AToken : String;
ASql : String;

begin
        ASql := '';
        ACountErros := 0;
        ALogUsuarios := TStringList.Create;
        if lcIdPush <= 0 then
            begin
                ShowMessage('É necessário selecionar uma notificação para ser enviada!');
                Exit;
            end
         else
            begin
                if chkSelectUser.IsChecked then
                    begin
                        for var i := 0 to lstUsuarios.Items.Count - 1 do
                            begin
                                if lstUsuarios.Selected.IsChecked then
                                    ASql := ASql + Integer(lstUsuarios.Items.Objects[lstUsuarios.ItemIndex]).ToString + ',';
                            end;
                        if ASql = '' then
                            begin
                                ShowMessage('É ncessário selecionar pelo menos um usuário!');
                                Abort;
                            end
                         else
                            begin
                                ASql := ' AND (p.IDUSU IN (' + Copy(ASql,1,Length(ASql) - 1) + '))';
                            end;
                    end;


                dmGeral.qryGeral.Close;
                dmGeral.qryGeral.SQL.Clear;
                dmGeral.qryGeral.SQL.Add('select p.keypush, p.idusu, u.nomeusu from alchavespush p');
                dmGeral.qryGeral.SQL.Add('left join alusuariosapp u');
                dmGeral.qryGeral.SQL.Add('on (u.idusu = p.idusu)');
                dmGeral.qryGeral.SQL.Add('where (p.notificacaousu = ''T'')' + ASQL);
                dmGeral.qryGeral.SQL.Add('group by p.keypush, p.idusu, u.nomeusu');
                dmGeral.qryGeral.Open;
                dmGeral.qryGeral.First;
                pbProgresso.Min := 0;
                pbProgresso.Max := dmGeral.qryGeral.RecordCount;
                recProgressoEnvioPush.Visible := True;

                TThread.CreateAnonymousThread(
                procedure
                begin

                    TThread.Synchronize(TThread.CurrentThread,
                    procedure
                    begin

                        qryUpdatePush.Close;
                        qryUpdatePush.SQL.Clear;
                        qryUpdatePush.Sql.Add('INSERT INTO ALNOTIFICACOES');
                        qryUpdatePush.Sql.Add('(IDUSU_PUSH, IDCOM_PUSH, TITULO_PUSH, MSG_PUSH, IMAGEM_PUSH, DATA_PUSH, ANUNCIO_PUSH, VALIDADE_ANUNCIO) VALUES');
                        qryUpdatePush.Sql.Add('(:IDUSU_PUSH, :IDCOM_PUSH, :TITULO_PUSH, :MSG_PUSH, :IMAGEM_PUSH, :DATA_PUSH, :ANUNCIO_PUSH, :VALIDADE_ANUNCIO);');

                        while not dmGeral.qryGeral.Eof do
                            begin

                                lblNomeUsuarioPush.Text := dmGeral.qryGeral.FieldByName('NOMEUSU').AsString;
                                AToken := dmGeral.qryGeral.FieldByName('keypush').AsString;

                                qryUpdatePush.ParamByName('IDUSU_PUSH'      ).AsInteger := dmGeral.qryGeral.FieldByName('IDUSU').AsInteger;
                                qryUpdatePush.ParamByName('IDCOM_PUSH'      ).AsString  := lcIdComercio;
                                qryUpdatePush.ParamByName('TITULO_PUSH'     ).AsString  := lcTitulo;
                                qryUpdatePush.ParamByName('MSG_PUSH'        ).AsString  := lcMensagem;
                                qryUpdatePush.ParamByName('IMAGEM_PUSH'     ).AsString  := lcImagem;
                                qryUpdatePush.ParamByName('DATA_PUSH'       ).AsDate    := DataAtual;
                                qryUpdatePush.ParamByName('ANUNCIO_PUSH'    ).AsString  := lcAnuncio;
                                qryUpdatePush.ParamByName('VALIDADE_ANUNCIO').AsDate    := lcValidade;

                                if EnviarPush(AToken, lcTitulo,
                                              lcMensagem, lcImagem,
                                              lcAnuncio, lcIdComercio, lcNomeComercio) > 0 then
                                    begin
                                        ALogUsuarios.Add('1|' + dmGeral.qryGeral.FieldByName('NOMEUSU').AsString);
                                        ACountErros := ACountErros + 1;
                                    end
                                else
                                    begin
                                        ALogUsuarios.Add('0|' + dmGeral.qryGeral.FieldByName('NOMEUSU').AsString);
                                    end;

                                qryUpdatePush.ExecSQL;
                                dmGeral.qryGeral.Next;
                                pbProgresso.Value := dmGeral.qryGeral.RecNo;
                            end;

                            recProgressoEnvioPush.Visible := False;

                    end);

                end).Start;


            end;

end;

procedure TfrmNotificacoes.lblbtnSalvarPushClick(Sender: TObject);
var
ANomeImagem : String;
begin

     if (cbComercio.ItemIndex = -1) and (GridLayout1.ChildrenCount > 0) then
        begin
             ShowMessage('É necessário selecionar um comércio!');
             Exit;
        end;
     if imgPush.Bitmap = nil then
        begin
             ShowMessage('É necessário selecionar uma imagem!');
             Exit;
        end;
     if Length(edtTituloPush.Text) <= 0 then
        begin
             ShowMessage('É necessário preencher o titulo!');
             edtTituloPush.SetFocus;
             Exit;
        end;
     if Length(mmMsgPush.Text) <= 0 then
        begin
            ShowMessage('É necessário preencher a mensagem!');
            mmMsgPush.SetFocus;
            Exit;
        end;

     ANomeImagem := 'PUS' + GeraNameFile + ExtractFileExt(lcNomeFile);
     qryNotificacao.Close;
     qryNotificacao.SQL.Clear;
     qryNotificacao.SQL.Add('INSERT INTO ALPUSHS');
     qryNotificacao.SQL.Add('(IDCOM_PUSHS, TITULO_PUSHS, MSG_PUSHS, IMAGEM_PUSHS, ANUNCIO_PUSHS, DATA_PUSHS, DATAVALIDADEANUNCIO_PUSHS) VALUES');
     qryNotificacao.SQL.Add('(:IDCOM_PUSHS, :TITULO_PUSHS, :MSG_PUSHS, :IMAGEM_PUSHS, :ANUNCIO_PUSHS, :DATA_PUSHS, :DATAVALIDADEANUNCIO_PUSHS)');

     if cbComercio.ItemIndex >= 0 then
          qryNotificacao.ParamByName('IDCOM_PUSHS'   ).AsInteger := Integer(cbComercio.Items.Objects[cbComercio.ItemIndex]) else
          qryNotificacao.ParamByName('IDCOM_PUSHS'   ).AsInteger := 0;

     qryNotificacao.ParamByName('TITULO_PUSHS'  ).AsString  := edtTituloPush.Text;
     qryNotificacao.ParamByName('MSG_PUSHS'     ).AsString  := mmMsgPush.Text;
     qryNotificacao.ParamByName('IMAGEM_PUSHS'  ).AsString  := ANomeImagem;

     if GridLayout1.ChildrenCount > 0 then
            qryNotificacao.ParamByName('ANUNCIO_PUSHS' ).AsString  := 'T' else
            qryNotificacao.ParamByName('ANUNCIO_PUSHS' ).AsString  := 'F';

     qryNotificacao.ParamByName('DATAVALIDADEANUNCIO_PUSHS').AsDate := edtValidade.Date;
     qryNotificacao.ParamByName('DATA_PUSHS'    ).AsDate    := DataAtual;
     qryNotificacao.ExecSQL;

     pOldFile := lcNomeFile;
     pNewFile := gPathArquivos+'\Push\' + ANomeImagem;
     CopyFile(pWideChar(pOldFile), pWideChar(pNewFile), False);

     qryNotificacao.Close;
     qryNotificacao.SQL.Clear;
     qryNotificacao.SQL.Add('INSERT INTO ALFILES');
     qryNotificacao.SQL.Add('(NOMEFILES,SENDFTPFILES) VALUES');
     qryNotificacao.SQL.Add('(:NOMEFILES,:SENDFTPFILES)');
     qryNotificacao.ParamByName('NOMEFILES').AsString    := ANomeImagem;
     qryNotificacao.ParamByName('SENDFTPFILES').AsString := '1';
     qryNotificacao.ExecSQL;

     Try
         if GridLayout1.ChildrenCount > 0 then
            begin
                 AListaFiles := TStringList.Create;
                 for var i := 0 to AListaImages.Count - 1 do
                    begin

                        ANomeImagem := 'ANU' + GeraNameFile + '.jpeg';

                        AListaFiles.Add(ANomeImagem);

                        qryNotificacao.Close;
                        qryNotificacao.ParamByName('NOMEFILES').AsString    := ANomeImagem;
                        qryNotificacao.ParamByName('SENDFTPFILES').AsString := '1';
                        qryNotificacao.ExecSQL;

                        pNewFile := gPathArquivos+'\Anuncios\' + ANomeImagem;
                        TImage(frmNotificacoes.FindComponent(AListaImages.Strings[i])).Bitmap.SaveToFile(pNewFile);

                    end;

                 qryNotificacao.Close;
                 qryNotificacao.SQL.Clear;
                 qryNotificacao.SQL.Add('INSERT INTO ALANUNCIOS');
                 qryNotificacao.SQL.Add('(IDPUSH_ANUNCIO, IDCOM_ANUNCIO, NOMEFILE_ANUNCIO) VALUES');
                 qryNotificacao.SQL.Add('((SELECT MAX(ID_PUSHS) FROM ALPUSHS), :IDCOM_ANUNCIO, :NOMEFILE_ANUNCIO)');

                 for var i := 0 to AListaFiles.Count - 1 do
                    begin

                        qryNotificacao.Close;
                        qryNotificacao.ParamByName('IDCOM_ANUNCIO').AsInteger   := Integer(cbComercio.Items.Objects[cbComercio.ItemIndex]);
                        qryNotificacao.ParamByName('NOMEFILE_ANUNCIO').AsString := AListaFiles.Strings[i];
                        qryNotificacao.ExecSQL;

                    end;

            end;
     finally

         AListaFiles.DisposeOf;
         imgPush.Bitmap            := nil;
         cbComercio.ItemIndex      := -1;
         edtTituloPush.Text        := '';
         mmMsgPush.Text            := '';
         imgNotificacao.Bitmap     := nil;
         lblTituloNotificacao.Text := 'Titulo Notificação';
         lblNotificacao.Text       := 'Notificação';

         if AListaImages.Count > 0 then
            begin
                 for var i := 0 to AListaImages.Count - 1 do
                     TImage(frmNotificacoes.FindComponent(AListaImages.Strings[i])).DisposeOf;
            end;

         AListaImages.Clear;
         ShowMessage('Notificação salva com sucesso!');

     end;


end;

procedure TfrmNotificacoes.mmMsgPushKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin

     lblNotificacao.Text := mmMsgPush.Text;

end;

procedure DeleteItemLista(AItem : String);
begin

     for var i := 0 to AListaImages.Count - 1 do
        if AListaImages.Strings[i] = AItem then
           begin
                AListaImages.Delete(i);
                Abort;
           end;

end;

procedure TfrmNotificacoes.OnClickDeleteAnuncio(Sender: TObject);
var
ANomeFile : String;
begin

     ANomeFile := TImage(Sender).TagString;
     TImage(frmNotificacoes.FindComponent(ANomeFile)).DisposeOf;
     DeleteItemLista(ANomeFile);

end;



procedure TfrmNotificacoes.sbtnSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmNotificacoes.tbiEnviarClick(Sender: TObject);
begin

    chkEnviadasChange(Self);

end;

end.
