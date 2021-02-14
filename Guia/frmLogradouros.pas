unit frmLogradouros;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FMX.Objects, FMX.Layouts, FMX.StdCtrls, FMX.Edit,
  FMX.Controls.Presentation, ACBrBase, ACBrValidador;

type
  Tfrm_Logradouros = class(TForm)
    Label1: TLabel;
    edtCEP: TEdit;
    Panel1: TPanel;
    sbtnSair: TSpeedButton;
    Line1: TLine;
    Label3: TLabel;
    lblStatusCheck: TLabel;
    recModal: TRectangle;
    recMsg: TRectangle;
    Layout1: TLayout;
    Line10: TLine;
    Image7: TImage;
    lblCaption: TLabel;
    Layout2: TLayout;
    imgIcoMsg: TImage;
    lblMensagem: TLabel;
    sbtnOK: TSpeedButton;
    sbtnSim: TSpeedButton;
    sbtnNao: TSpeedButton;
    edtLogradouro: TEdit;
    edtBairro: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    edtCidade: TEdit;
    lblCidade: TLabel;
    edtUF: TEdit;
    Label5: TLabel;
    sbtnSalvar: TSpeedButton;
    ACBrValidador: TACBrValidador;
    procedure sbtnSairClick(Sender: TObject);
    procedure edtCEPExit(Sender: TObject);
    procedure edtCEPKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure sbtnSalvarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    function VerificaCampos : Boolean;
    procedure sbtnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Logradouros: Tfrm_Logradouros;

implementation

{$R *.fmx}

uses untGlobal, untDmGeral, frmFindCep;

function Tfrm_Logradouros.VerificaCampos : Boolean;
var
i : Integer;
R : Boolean;
begin
R := True;
for i := 0 to ComponentCount - 1 do
   begin
   if Components[i] is TEdit then
      if TEdit(Components[i]).Text = '' then
         R := False;
   end;
Result := R;
end;

procedure Tfrm_Logradouros.edtCEPExit(Sender: TObject);
begin
ACBrValidador.Documento := formataCNPJCEP(edtCEP.Text,'2');
if not ACBrValidador.Validar then
   begin
      edtLogradouro.Text := '';
      edtCidade.Text := '';
      edtBairro.Text := '';
      edtUF.Text := '';
      fMsg(Self,'','CEP inválido, verifique!',fIconInformation,fBtnOK);
      Exit;
   end;

end;

procedure Tfrm_Logradouros.edtCEPKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
If not(KeyChar in ['0' .. '9', #08]) then
   KeyChar := #0;
end;

procedure Tfrm_Logradouros.FormKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
   if Key = vkReturn then
      begin
         Key := vkTab;
         KeyDown(Key, KeyChar, Shift);
      end;
end;

procedure Tfrm_Logradouros.sbtnOKClick(Sender: TObject);
begin
if Tag = 2 then
   begin
      frm_FindCep.sbtnPesquisarClick(frm_FindCep);
      frm_Logradouros.Close;
   end;
      recModal.Visible := False;
end;

procedure Tfrm_Logradouros.sbtnSairClick(Sender: TObject);
begin
edtCEP.Text := '';
edtLogradouro.Text := '';
edtBairro.Text := '';
edtCidade.Text := '';
edtUF.Text := '';
Close;
end;

procedure Tfrm_Logradouros.sbtnSalvarClick(Sender: TObject);
begin
if VerificaCampos then
   begin
      //Inclusão
      if Tag = 1 then
         begin
            With dmGeral.qryGeral do
               begin
                  Close;
                  Sql.Clear;
                  Sql.Add('SELECT * FROM LOGRADOUROS');
                  Sql.Add('WHERE CEP = :CEP');
                  Params[0].AsString := edtCEP.Text;
                  ExecSql;
                  if RecordCount > 0 then
                     begin
                        fMsg(Self,'','CEP ja cadastrado, verifique!',fIconExclamation,fBtnOK);
                        Exit;
                     end
                  else
                     begin
                        Close;
                        Sql.Clear;
                        Sql.Add('INSERT INTO LOGRADOUROS');
                        Sql.Add('(CEP,LOGRADOURO,CIDADE,BAIRRO,UF) VALUES');
                        Sql.Add('(:CEP,:LOGRADOURO,:CIDADE,:BAIRRO,:UF)');
                        Params[0].AsString := edtCEP.Text;
                        Params[1].AsString := edtLogradouro.Text;
                        Params[2].AsString := edtCidade.Text;
                        Params[3].AsString := edtBairro.Text;
                        Params[4].AsString := edtUF.Text;
                        ExecSql;
                        fMsg(Self,'','Logradouro cadastrado com sucesso!',fIconInformation,fBtnOK);
                        LimpaEdit(Self);
                        Exit;
                     end;
               end;
         end;
      //Alteração
      if Tag = 2 then
         begin
            With dmGeral.qryGeral do
               begin
                  Close;
                  Sql.Clear;
                  Sql.Add('UPDATE LOGRADOUROS SET');
                  Sql.Add('LOGRADOURO = :LOGRADOURO,');
                  Sql.Add('CIDADE     = :CIDADE,');
                  Sql.Add('BAIRRO     = :BAIRRO,');
                  Sql.Add('UF         = :UF,');
                  Sql.Add('UPDATELOG  = :UPDATELOG');
                  Sql.Add('WHERE CEP  = :CEP');
                  Params[0].AsString := edtLogradouro.Text;
                  Params[1].AsString := edtCidade.Text;
                  Params[2].AsString := edtBairro.Text;
                  Params[3].AsString := edtUF.Text;
                  Params[4].AsString := '1';
                  Params[5].AsString := edtCEP.Text;
                  ExecSql;
                  fMsg(Self,'','Logradouro atualizado com sucesso!',fIconInformation,fBtnOK);
                  edtCEP.Enabled := True;
                  LimpaEdit(Self);
                  Exit;
               end;
         end;
   end
else
   begin
      fMsg(Self,'','É necessário preencher todos os campos, verifique!',fIconError,fBtnOK);
      edtLogradouro.SetFocus;
      Exit;
   end;
end;

end.
