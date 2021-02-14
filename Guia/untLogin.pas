unit untLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.Layouts, FMX.Platform.Win,
  shellapi,FireDAC.Stan.Param, Guia.Controle;

type
  TfrmLogin = class(TForm)
    Image1: TImage;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Line1: TLine;
    recAcessar: TRectangle;
    Label4: TLabel;
    recFechar: TRectangle;
    Label5: TLabel;
    Layout1: TLayout;
    lblEsqueciSenha: TLabel;
    lblPrimeiroAcesso: TLabel;
    edtValidacao: TEdit;
    Label3: TLabel;
    Label6: TLabel;
    Image2: TImage;
    lblNovoUsuario: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure lblPrimeiroAcessoClick(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure lblEsqueciSenhaClick(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure lblNovoUsuarioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.fmx}

uses untGlobal, untLoginDmGeral, Winapi.Windows, untCadastroUsuarios;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
With dmLoginGeral.fdqryUsuarios do
   begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT * FROM ALUSUARIOS');
      Open;
      if RecordCount = 0 then
         begin
            lblPrimeiroAcesso.Visible := True;
            lblNovoUsuario.Visible := False;
            lblEsqueciSenha.Visible := False;
         end
      else
         begin
            lblPrimeiroAcesso.Visible := False;
            lblNovoUsuario.Visible := True;
            lblEsqueciSenha.Visible := True;
         end;
      Close;
   end;
end;

procedure TfrmLogin.Image2Click(Sender: TObject);
begin
edtSenha.Password := not edtSenha.Password;
end;

procedure TfrmLogin.Label4Click(Sender: TObject);
var
vIdUsu : Integer;
vAdmin : String;
begin
if edtUsuario.Text = '' then
   begin
      MessageBox(WindowHandleToPlatform(frmLogin.Handle).Wnd,
                 'É necessário preencher o campo LOGIN!',
                 'Aviso',MB_OK + MB_ICONEXCLAMATION);
      edtUsuario.SetFocus;
      Exit;
   end;
if edtSenha.Text = '' then
   begin
      MessageBox(WindowHandleToPlatform(frmLogin.Handle).Wnd,
                 'É necessário preencher o campo SENHA!',
                 'Aviso',MB_OK + MB_ICONEXCLAMATION);
      edtSenha.SetFocus;
      Exit;
   end;
With dmLoginGeral.fdqryUsuarios do
   begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT * FROM ALUSUARIOS');
      Sql.Add('WHERE LOGINUSU = :LOGINUSU');
      Params[0].AsString := edtUsuario.Text;
      Open;
      vAdmin := FieldByName('ADMUSU').AsString;
      if RecordCount = 0 then
         begin
            MessageBox(WindowHandleToPlatform(frmLogin.Handle).Wnd,
                       'Login não cadastrado, verifique!',
                       'Aviso',MB_OK + MB_ICONEXCLAMATION);
            edtUsuario.SetFocus;
            Exit;
         end
      else
         begin
         vIdUsu := FieldByName('IDUSU').AsInteger;
         if FieldByName('PSWUSU').AsString <> MD5(edtSenha.Text) then
            begin
               if FieldByName('NOVASENHA').AsString = '0' then
                  begin
                     MessageBox(WindowHandleToPlatform(frmLogin.Handle).Wnd,
                                'Senha inválida, verifique!',
                                'Aviso',MB_OK + MB_ICONEXCLAMATION);
                     edtSenha.SetFocus;
                     Exit;
                  end
               else
                  begin
                     if edtValidacao.Text <> FieldByName('CODUPDASENHA').AsString then
                        begin
                           ShowMessage('Código de validação inválido, verifique!');
                           edtValidacao.Visible := True;
                           edtValidacao.SetFocus;
                           Exit;
                        end
                     else
                        begin
                           if MessageBox(WindowHandleToPlatform(frmLogin.Handle).Wnd,
                                         'Você esta alterando sua senha, Deseja continuar?',
                                         'Aviso',MB_YESNO + MB_ICONQUESTION) = ID_YES then
                              begin
                                 Close;
                                 Sql.Clear;
                                 Sql.Add('UPDATE ALUSUARIOS SET');
                                 Sql.Add('NOVASENHA = 0,');
                                 Sql.Add('PSWUSU = :PSWUSU');
                                 Sql.Add('WHERE IDUSU = :IDUSU');
                                 Params[0].AsString  := MD5(edtSenha.Text);
                                 Params[1].AsInteger := vIdUsu;
                                 ExecSql;

                                 ShowMessage('Senha alterada com sucesso.');
                                 ShellExecute(WindowHandleToPlatform(frmLogin.Handle).Wnd,
                                              nil,pChar(ExtractFilePath(ParamStr(0))+'GAL.exe'),
                                              pChar('-ALST '+ edtUsuario.Text + ' ' + IntToStr(vIdUsu) + ' ' +
                                              vAdmin),nil,3);
                                 Application.Terminate;
                              end;
                        end;
                  end;
            end
         else
            begin
               if FieldByName('CELVALIDADO').AsString = '0' then
                  begin
                     if edtValidacao.Text <> FieldByName('VALIDACEL').AsString then
                        begin
                           ShowMessage('Código de validação inválido, verifique!');
                           edtValidacao.Visible := True;
                           edtValidacao.SetFocus;
                           Exit;
                        end
                     else
                        begin
                           Close;
                           Sql.Clear;
                           Sql.Add('UPDATE ALUSUARIOS SET');
                           Sql.Add('CELVALIDADO = 1');
                           Sql.Add('WHERE IDUSU = :IDUSU');
                           Params[0].AsInteger := vIdUsu;
                           ExecSql;

                           ShellExecute(WindowHandleToPlatform(frmLogin.Handle).Wnd,
                                        nil,pChar(ExtractFilePath(ParamStr(0))+'GAL.exe'),
                                        pChar('-ALST '+ edtUsuario.Text + ' '+IntToStr(vIdUsu) + ' ' +
                                        vAdmin),nil,3);
                           Application.Terminate;
                        end;
                  end
               else
                  begin
                     ShellExecute(WindowHandleToPlatform(frmLogin.Handle).Wnd,
                                  nil,pChar(ExtractFilePath(ParamStr(0))+'GAL.exe'),
                                  pChar('-ALST '+ edtUsuario.Text + ' '+IntToStr(vIdUsu) + ' ' +
                                  vAdmin),nil,3);
                     Application.Terminate;
                  end;
            end;
         end;
   end;
end;

procedure TfrmLogin.Label5Click(Sender: TObject);
begin
if MessageBox(WindowHandleToPlatform(frmLogin.Handle).Wnd,'Tem certeza que deseja sair do sistema?',
               'Guia de Comércio',MB_ICONQUESTION + MB_YESNO) = ID_YES then
   Application.Terminate;
end;

procedure TfrmLogin.Label6Click(Sender: TObject);
begin
if edtUsuario.Text = '' then
   begin
      MessageBox(WindowHandleToPlatform(frmLogin.Handle).Wnd,
                'Para reenviar o código é necessário preencher o campo LOGIN!',
                'Aviso',MB_OK + MB_ICONQUESTION);
      edtUsuario.SetFocus;
   end
else
   begin
      With dmLoginGeral.fdqryUsuarios do
         begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT * FROM ALUSUARIOS');
            Sql.Add('WHERE LOGINUSU = :LOGINUSU');
            Params[0].AsString := edtUsuario.Text;
            Open;
            if RecordCount = 0 then
               begin
                  MessageBox(WindowHandleToPlatform(frmLogin.Handle).Wnd,
                             'Usuário não cadastrado, verifique!!',
                             'Aviso',MB_OK + MB_ICONQUESTION);
                  edtUsuario.SetFocus;
                  Exit;
               end
            else
               begin
                  if FieldByName('CODUPDASENHA').AsString <> '' then
                    SendSMS(FieldByName('CELUSU').AsString, 'Codigo de validacao: '+FieldByName('CODUPDASENHA').AsString)
                 else
                    SendSMS(FieldByName('CELUSU').AsString, 'Codigo de validacao: '+FieldByName('VALIDACEL').AsString);

                  ShowMessage('O código de validação foi reenviado para seu celular.');
                  edtValidacao.SetFocus;
                  Exit;
               end;
         end;
   end;
end;

procedure TfrmLogin.lblNovoUsuarioClick(Sender: TObject);
begin
if (edtUsuario.Text = '') or (edtSenha.Text = '') then
   begin
      MessageBox(WindowHandleToPlatform(frmLogin.Handle).Wnd,
                  'Para cadastrar um novo usuário é necessário preencher o campo USUÁRIO e SENHA do administrador!',
                 'Aviso',MB_OK + MB_ICONEXCLAMATION);
      edtUsuario.SetFocus;
      Exit;
   end;
   With dmLoginGeral.fdqryUsuarios do
      begin
         Close;
         Sql.Clear;
         Sql.Add('SELECT * FROM ALUSUARIOS');
         Sql.Add('WHERE LOGINUSU = :LOGINUSU');
         Params[0].AsString := edtUsuario.Text;
         Open;
         if RecordCount = 0 then
            begin
               MessageBox(WindowHandleToPlatform(frmLogin.Handle).Wnd,
                          'Login não cadastrado, verifique!',
                          'Aviso',MB_OK + MB_ICONEXCLAMATION);
               edtUsuario.SetFocus;
               Exit;
            end
         else
            begin
               if FieldByName('PSWUSU').AsString <> MD5(edtSenha.Text) then
                  begin
                     MessageBox(WindowHandleToPlatform(frmLogin.Handle).Wnd,
                                'Senha inválida, verifique!',
                                'Aviso',MB_OK + MB_ICONEXCLAMATION);
                     edtSenha.SetFocus;
                     Exit;
                  end
               else
                  begin
                     if FieldByName('ADMUSU').AsString = '0' then
                        begin
                           MessageBox(WindowHandleToPlatform(frmLogin.Handle).Wnd,
                                      'Para cadastrar um novo usuário é necessário ser o administrador!',
                                      'Aviso',MB_OK + MB_ICONEXCLAMATION);
                           edtSenha.SetFocus;
                           Exit;
                        end
                     else
                        begin
                           With frmCadastroUsuarios do
                              begin
                                 chkAdmin.IsChecked := False;
                                 chkAdmin.Visible := False;
                                 ShowModal;
                              end;
                        end;
                  end;
            end;
      end;

end;

procedure TfrmLogin.lblEsqueciSenhaClick(Sender: TObject);
var
vIdUsu : Integer;
vNovaSenha, vCel : String;
begin
if edtUsuario.Text = '' then
   begin
      MessageBox(WindowHandleToPlatform(frmLogin.Handle).Wnd,
                'Para recuperar a senha é necessário preencher o campo LOGIN!',
                'Aviso',MB_OK + MB_ICONQUESTION);
      edtUsuario.SetFocus;
   end
else
   begin
      With dmLoginGeral.fdqryUsuarios do
         begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT * FROM ALUSUARIOS');
            Sql.Add('WHERE LOGINUSU = :LOGINUSU');
            Params[0].AsString := edtUsuario.Text;
            Open;
            if RecordCount = 0 then
               begin
                  MessageBox(WindowHandleToPlatform(frmLogin.Handle).Wnd,
                             'Usuário não cadastrado, verifique!!',
                             'Aviso',MB_OK + MB_ICONQUESTION);
                  edtUsuario.SetFocus;
                  Exit;
               end
            else
               begin
                  If MessageBox(WindowHandleToPlatform(frmLogin.Handle).Wnd,
                                'Você recebera uma um código de validação via SMS, '+
                                'digite o código e no campo senha uma nova senha para alterar.'+#13#13+
                                'Deseja continuar?',
                                'Aviso',MB_YESNO + MB_ICONQUESTION) = IDYES then
                     begin
                        vIdUsu := FieldByName('IDUSU').AsInteger;
                        vNovaSenha := GeraSenha;
                        vCel := FieldByName('CELUSU').AsString;
                        Close;
                        Sql.Clear;
                        Sql.Add('UPDATE ALUSUARIOS SET');
                        Sql.Add('CODUPDASENHA = :CODUPDASENHA,');
                        Sql.Add('NOVASENHA = 1');
                        Sql.Add('WHERE IDUSU = :IDUSU');
                        Params[0].AsString  := vNovaSenha;
                        Params[1].AsInteger := vIdUsu;
                        ExecSql;

                        SendSMS(vCel, 'Código de alteração: ' + vNovaSenha);
                        ShowMessage('Seu código de alteração foi enviado para o celular cadastrado.');
                        edtValidacao.Visible := True;
                        edtValidacao.SetFocus;
                        Exit;
                     end;
               end;
         end;
   end;
end;

procedure TfrmLogin.lblPrimeiroAcessoClick(Sender: TObject);
begin
With frmCadastroUsuarios do
   begin
      chkAdmin.IsChecked := True;
      chkAdmin.Enabled := False;
      ShowModal;
   end;
end;

end.
