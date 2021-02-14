unit untCadastroUsuarios;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.TMSBaseControl, FMX.TMSGridCell, FMX.TMSGridOptions, FMX.TMSGridData,
  FMX.TMSCustomGrid, FMX.TMSGrid, FMX.Objects, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, FMX.Edit, FMX.Platform.Win,
  FireDac.Stan.Param, Guia.Controle;

type
  TfrmCadastroUsuarios = class(TForm)
    Label1: TLabel;
    Rectangle1: TRectangle;
    Image1: TImage;
    edtNome: TEdit;
    chkAdmin: TCheckBox;
    Label2: TLabel;
    edtlogin: TEdit;
    Label3: TLabel;
    edtSenha: TEdit;
    Label4: TLabel;
    edtConfirmaSenha: TEdit;
    Label5: TLabel;
    edtCelular: TEdit;
    Label6: TLabel;
    Line1: TLine;
    recFechar: TRectangle;
    Label7: TLabel;
    recSalvar: TRectangle;
    Label9: TLabel;
    Image2: TImage;
    Image3: TImage;
    procedure edtCelularKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure Label9Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroUsuarios: TfrmCadastroUsuarios;

implementation

uses
  Winapi.Windows, untLogin, untLoginDmGeral, untGlobal;

{$R *.fmx}

procedure TfrmCadastroUsuarios.edtCelularKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
if not CharInSet(KeyChar,['0'..'9']) then KeyChar := #0;
end;

procedure TfrmCadastroUsuarios.Image2Click(Sender: TObject);
begin
edtSenha.Password := not edtSenha.Password;
end;

procedure TfrmCadastroUsuarios.Image3Click(Sender: TObject);
begin
edtConfirmaSenha.Password := not edtConfirmaSenha.Password;
end;

procedure TfrmCadastroUsuarios.Label7Click(Sender: TObject);
begin
LimpaEdit(frmLogin);
Close;
end;

procedure TfrmCadastroUsuarios.Label9Click(Sender: TObject);
var
CodigoValidacao : String;
begin
if edtNome.Text = '' then
   begin
       MessageBox(WindowHandleToPlatform(frmCadastroUsuarios.Handle).Wnd,
                  'É necessário preencher o campo "NOME"!',
                  'Aviso',MB_OK + MB_ICONEXCLAMATION);
       edtNome.SetFocus;
       Exit;
   end;
if edtlogin.Text = '' then
   begin
       MessageBox(WindowHandleToPlatform(frmCadastroUsuarios.Handle).Wnd,
                  'É necessário preencher o campo "LOGIN"!',
                  'Aviso',MB_OK + MB_ICONEXCLAMATION);
       edtLogin.SetFocus;
       Exit;
   end;
if edtSenha.Text = '' then
   begin
       MessageBox(WindowHandleToPlatform(frmCadastroUsuarios.Handle).Wnd,
                  'É necessário preencher o campo "SENHA"!',
                  'Aviso',MB_OK + MB_ICONEXCLAMATION);
       edtSenha.SetFocus;
       Exit;
   end;
if edtConfirmaSenha.Text = '' then
   begin
       MessageBox(WindowHandleToPlatform(frmCadastroUsuarios.Handle).Wnd,
                  'É necessário preencher o campo "CONFIRMAÇÃO DA SENHA"!',
                  'Aviso',MB_OK + MB_ICONEXCLAMATION);
       edtConfirmaSenha.SetFocus;
       Exit;
   end;
if edtCelular.Text = '' then
   begin
       MessageBox(WindowHandleToPlatform(frmCadastroUsuarios.Handle).Wnd,
                  'É necessário preencher o campo "CELULAR"!',
                  'Aviso',MB_OK + MB_ICONEXCLAMATION);
       edtCelular.SetFocus;
       Exit;
   end;
if Length(edtSenha.Text) < 6 then
   begin
      MessageBox(WindowHandleToPlatform(frmCadastroUsuarios.Handle).Wnd,
                 'O campo senha senha deve contem pelo meno 6 caracteres!',
                 'Aviso',MB_OK + MB_ICONEXCLAMATION);
      edtSenha.SetFocus;
      Exit;
   end;
if Length(edtlogin.Text) < 5 then
   begin
      MessageBox(WindowHandleToPlatform(frmCadastroUsuarios.Handle).Wnd,
                 'O campo login senha deve contem pelo meno 5 caracteres!',
                 'Aviso',MB_OK + MB_ICONEXCLAMATION);
      edtlogin.SetFocus;
      Exit;
   end;
if edtConfirmaSenha.Text <> edtSenha.Text then
   begin
      MessageBox(WindowHandleToPlatform(frmCadastroUsuarios.Handle).Wnd,
                 'A confirmação da senha não confere!',
                 'Aviso',MB_OK + MB_ICONEXCLAMATION);
      edtConfirmaSenha.SetFocus;
      Exit;
   end;
With dmLoginGeral.fdqryUsuarios do
   begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT * FROM ALUSUARIOS');
      Sql.Add('WHERE LOGINUSU = :LOGINUSU');
      Params[0].AsString := edtlogin.Text;
      Open;
      if RecordCount > 0 then
         begin
            MessageBox(WindowHandleToPlatform(frmCadastroUsuarios.Handle).Wnd,
                       'Ja existe um usuário cadastrado com este login!',
                       'Aviso',MB_OK + MB_ICONEXCLAMATION);
            edtlogin.SetFocus;
            Exit;
         end
      else
         begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT * FROM ALUSUARIOS');
            Sql.Add('WHERE CELUSU = :CELUSU');
            Params[0].AsString := edtCelular.Text;
            Open;
            if RecordCount > 0 then
               begin
                  MessageBox(WindowHandleToPlatform(frmCadastroUsuarios.Handle).Wnd,
                             'Ja existe um usuário cadastrado com este numero de celular!',
                             'Aviso',MB_OK + MB_ICONEXCLAMATION);
                  edtCelular.SetFocus;
                  Exit;
               end
            else
               begin
                  if MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                             pChar('Confirme se seu celular esta correto pois ele '+
                             'podera ser usado para recuperar sua senha caso '+
                             'esqueça.'+#13#13+
                             'Celular: '+edtCelular.Text+'  esta correto?'),
                             'Aviso',MB_YESNO + MB_ICONQUESTION) = IDYES then
                     begin
                        Try
                           Close;
                           Sql.Clear;
                           Sql.Add('INSERT INTO ALUSUARIOS');
                           Sql.Add('(NOMEUSU,PSWUSU,CELUSU,ADMUSU,LOGINUSU, VALIDACEL) VALUES');
                           Sql.Add('(:NOMEUSU,:PSWUSU,:CELUSU,:ADMUSU,:LOGINUSU,:VALIDACEL)');
                           Params[0].AsString := edtNome.Text;
                           Params[1].AsString := MD5(edtSenha.Text);
                           Params[2].AsString := edtCelular.Text;
                           if chkAdmin.IsChecked then
                              Params[3].AsString := '1' else Params[3].AsString := '0';
                           Params[4].AsString := edtlogin.Text;
                           CodigoValidacao := ValidaCelular;
                           Params[5].AsString := CodigoValidacao;
                           ExecSql;
                           MessageBox(WindowHandleToPlatform(frmCadastroUsuarios.Handle).Wnd,
                                      pChar('Usuário cadastrado com sucesso.'+#13+
                                            'Em instantes recebera um SMS para o celular cadastrado '+
                                            'contendo um código para seu primeiro acesso!'),
                                      'Guia de Comércio',MB_OK + MB_ICONINFORMATION);
                           SendSMS(edtCelular.Text,'Codigo de validacao: '+CodigoValidacao);
                           frmLogin.edtUsuario.Text := edtlogin.Text;
                           frmLogin.edtSenha.SetFocus;
                           LimpaEdit(frmCadastroUsuarios);
                           frmLogin.edtValidacao.Visible := True;
                           frmLogin.lblPrimeiroAcesso.Visible := False;
                           frmCadastroUsuarios.Close;
                        Except on E:Exception do
                           begin
                               MessageBox(WindowHandleToPlatform(frmCadastroUsuarios.Handle).Wnd,
                                          pChar('Não foi possivel cadastrar este usuário!'+#13+
                                          'Erro: '+E.Message),
                                          'Erro',MB_OK + MB_ICONERROR);
                              Exit;
                           end;
                        End;
                     end;
               end;
         end;
   end;
end;

end.
