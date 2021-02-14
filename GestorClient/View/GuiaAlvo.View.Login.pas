unit GuiaAlvo.View.Login;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit, FMX.Objects,
  FMX.Layouts, FMX.Effects, FMX.Filter.Effects, uFuncoes, FMX.Ani, FMX.TabControl, ACBrValidador,
  uFormat, FMX.Platform.Win, ACBrBase, GuiaAlvo.View.CadastroComercio, GuiaAlvo.Controller.DataModuleDados, GuiaAlvo.Model.FuncoesServidor, GuiaAlvo.View.Planos;

type
  TfrmLoginPrincipal = class(TForm)
    Layout1: TLayout;
    Image1: TImage;
    Layout2: TLayout;
    Layout3: TLayout;
    Rectangle1: TRectangle;
    edtLoginPrincipal: TEdit;
    StyleBook1: TStyleBook;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Rectangle2: TRectangle;
    edtSenhaPrincipal: TEdit;
    Label4: TLabel;
    Layout4: TLayout;
    Rectangle3: TRectangle;
    Label5: TLabel;
    Label6: TLabel;
    Layout5: TLayout;
    AzulAlvo: TBrushObject;
    CinzaAlvo: TBrushObject;
    Rectangle4: TRectangle;
    Label7: TLabel;
    imgViewSenhaPrincipal: TImage;
    recModal: TRectangle;
    recLoading: TRectangle;
    ShadowEffect1: TShadowEffect;
    Layout6: TLayout;
    lblMsgLoading: TLabel;
    Layout7: TLayout;
    ArcCinza: TArc;
    faArcCinza: TFloatAnimation;
    arcAzul: TArc;
    faArcAzul: TFloatAnimation;
    tbcLogin: TTabControl;
    tbiLogin: TTabItem;
    tbiEsqueciSenha: TTabItem;
    Layout8: TLayout;
    Image2: TImage;
    Layout10: TLayout;
    recVoltar: TRectangle;
    Label11: TLabel;
    Layout9: TLayout;
    Layout11: TLayout;
    recLogin: TRectangle;
    edtLoginValidacao: TEdit;
    Label8: TLabel;
    lytCodigoValidacao: TLayout;
    Label12: TLabel;
    lytTipoRecebimento: TLayout;
    Label9: TLabel;
    Rectangle6: TRectangle;
    Label13: TLabel;
    Layout13: TLayout;
    rbEmail: TRadioButton;
    rbCelular: TRadioButton;
    Rectangle7: TRectangle;
    Label14: TLabel;
    ACBrValidador: TACBrValidador;
    tbiCadastroSenha: TTabItem;
    Rectangle8: TRectangle;
    Label10: TLabel;
    Layout12: TLayout;
    Rectangle5: TRectangle;
    Rectangle9: TRectangle;
    Rectangle10: TRectangle;
    Rectangle11: TRectangle;
    Rectangle12: TRectangle;
    Rectangle13: TRectangle;
    edtNumero3: TEdit;
    edtNumero4: TEdit;
    edtNumero5: TEdit;
    edtNumero6: TEdit;
    edtNumero1: TEdit;
    edtNumero2: TEdit;
    Layout15: TLayout;
    Image3: TImage;
    recConfirmaSenha: TRectangle;
    Label24: TLabel;
    edtConfirmaSenha: TEdit;
    imgViewConfirmaSenha: TImage;
    FillRGBEffect1: TFillRGBEffect;
    recSenha: TRectangle;
    Label23: TLabel;
    edtSenha: TEdit;
    imgViewSenha: TImage;
    FillRGBEffect3: TFillRGBEffect;
    Label25: TLabel;
    Rectangle14: TRectangle;
    Label15: TLabel;
    procedure Rectangle3MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure Rectangle3MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure Label6MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure Label6MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtLoginPrincipalKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtSenhaPrincipalKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure imgViewSenhaPrincipalClick(Sender: TObject);
    procedure Rectangle3MouseLeave(Sender: TObject);
    procedure Label6MouseLeave(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure recVoltarClick(Sender: TObject);
    procedure Rectangle6Click(Sender: TObject);
    procedure Rectangle7Click(Sender: TObject);
    procedure edtNumero1KeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure Rectangle8Click(Sender: TObject);
    procedure imgViewSenhaClick(Sender: TObject);
    procedure imgViewConfirmaSenhaClick(Sender: TObject);
    procedure Rectangle14Click(Sender: TObject);
    procedure Rectangle4Click(Sender: TObject);
    procedure Rectangle3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLoginPrincipal: TfrmLoginPrincipal;
  lcVertListaMobile : TVertScrollBox;
  lcEmail, lcValidacao, lcCelular : String;
  lcIndiceEdit : Integer = 1;
  lcIdComercio : Integer;
implementation

uses
  Winapi.Windows, Guia.Controle, GuiaAlvo.View.Principal;

{$R *.fmx}


procedure TfrmLoginPrincipal.edtLoginPrincipalKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin

  if Key = vkReturn then
    edtSenhaPrincipal.SetFocus;

end;

procedure TfrmLoginPrincipal.edtNumero1KeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
    var ANomeAtivo := TEdit(Sender).Name;
    var AIndiceAtivo := ApenasNumeros(ANomeAtivo).ToInteger;
    var ANextIndice := AindiceAtivo + 1;

    if ANextIndice < 7 then
        if Length(TEdit(Sender).Text) = 1 then
            TEdit(frmLoginPrincipal.FindComponent('edtNumero' + ANextIndice.ToString)).SetFocus;

    lcValidacao := '';

    for var i := 1 to 6 do
        lcValidacao := lcValidacao + TEdit(Self.FindComponent('edtNumero' + i.ToString)).Text;
end;

procedure TfrmLoginPrincipal.edtSenhaPrincipalKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin

  if Key = vkReturn then
    edtLoginPrincipal.SetFocus;

end;

procedure TfrmLoginPrincipal.FormCreate(Sender: TObject);
begin

  getControle;
  edtLoginPrincipal.Text := ParamStr(1);

end;

procedure TfrmLoginPrincipal.FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkReturn then
     begin
       Key := vkTab;
       KeyDown(Key, KeyChar, Shift);
     end;
end;

procedure TfrmLoginPrincipal.imgViewConfirmaSenhaClick(Sender: TObject);
begin
    ViewSenha(imgViewConfirmaSenha, edtConfirmaSenha.Password);
    edtConfirmaSenha.Password := not edtConfirmaSenha.Password;
end;

procedure TfrmLoginPrincipal.imgViewSenhaClick(Sender: TObject);
begin
    ViewSenha(imgViewSenha, edtSenha.Password);
    edtSenha.Password := not edtSenha.Password;
end;

procedure TfrmLoginPrincipal.imgViewSenhaPrincipalClick(Sender: TObject);
begin

    ViewSenha(imgViewSenhaPrincipal, edtSenhaPrincipal.Password);
    edtSenhaPrincipal.Password := not edtSenhaPrincipal.Password;

end;

procedure TfrmLoginPrincipal.Label6Click(Sender: TObject);
begin
tbcLogin.Next(TTabTransition.Slide);
end;

procedure TfrmLoginPrincipal.Label6MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
TLabel(Sender).Opacity := 0.7;
end;

procedure TfrmLoginPrincipal.Label6MouseLeave(Sender: TObject);
begin
TLabel(Sender).Opacity := 1;
end;

procedure TfrmLoginPrincipal.Label6MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
TLabel(Sender).Opacity := 1;
end;

procedure TfrmLoginPrincipal.Rectangle14Click(Sender: TObject);
begin

    if Length(edtSenha.Text) < 6 then
        begin
            MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                       'A senha deve conter o minimo de 6 caracteres!',
                       'Guia Alvo', MB_OK + MB_ICONERROR);
            edtSenha.SetFocus;
            Exit;
        end;
    if edtConfirmaSenha.Text <> edtSenha.Text then
        begin
            Messagebox(WindowHandleToPlatform(Self.Handle).Wnd,
                       'A confirmação não confere, verifique!',
                       'Guia Alvo', MB_OK + MB_ICONERROR);
            edtSenha.SetFocus;
            Exit;
        end
    else
        begin

            if UpdateSenha(lcIdComercio, edtSenha.Text) then
                begin
                    Messagebox(WindowHandleToPlatform(Self.Handle).Wnd,
                               'Sua senha foi alterada com sucesso!',
                               'Guia Alvo', MB_OK + MB_ICONINFORMATION);

                    for var i := 1 to 6 do
                        TEdit(Self.FindComponent('edtNumero' + i.ToString)).Text := '';

                    lytCodigoValidacao.Visible := False;
                    rbEmail.IsChecked          := False;
                    rbCelular.IsChecked        := False;
                    lytTipoRecebimento.Visible := False;
                    edtSenha.Text              := '';
                    edtConfirmaSenha.Text      := '';
                    tbcLogin.TabIndex          := 0;
                end;

        end;

end;

procedure TfrmLoginPrincipal.Rectangle3Click(Sender: TObject);
begin

    if (edtLoginPrincipal.Text = '') or
       (edtSenhaPrincipal.Text = '') or
       (Length(edtSenhaPrincipal.Text) < 6) then
        begin
            MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                       'Usuário e/ou senha inválidos, verifique!',
                       'Guia Alvo', MB_OK + MB_ICONERROR);
            edtLoginPrincipal.SetFocus;
        end
    else
        begin

            if getLogin(edtLoginPrincipal.Text, MD5(edtSenhaPrincipal.Text)) = True then
                begin
                    cfgIdComercio := dmGeralClient.memComercio.FieldByName('IDCOM').AsInteger;
                    Application.CreateForm(TfrmGestorClient, frmGestorClient);
                    Application.MainForm := frmGestorClient;
                    frmGestorClient.Show;
                    frmLoginPrincipal.Close;
                end;

        end;

end;

procedure TfrmLoginPrincipal.Rectangle3MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
TRectangle(Sender).Opacity := 0.7;
end;

procedure TfrmLoginPrincipal.Rectangle3MouseLeave(Sender: TObject);
begin
TRectangle(Sender).Opacity := 1;
end;

procedure TfrmLoginPrincipal.Rectangle3MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
TRectangle(Sender).Opacity := 1;
end;

procedure TfrmLoginPrincipal.Rectangle4Click(Sender: TObject);
begin
     Application.CreateForm(TfrmCadastroNovo, frmCadastroNovo);
     Application.MainForm := frmCadastroNovo;
     frmCadastroNovo.Show;
     frmLoginPrincipal.Close;
end;

procedure TfrmLoginPrincipal.Rectangle6Click(Sender: TObject);
begin

    if not getNovaSenha(edtLoginValidacao.Text) then
        begin

            MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                      'Nenhuma empresa localizada com a informação digitada!',
                      'Guia Alvo', MB_OK + MB_ICONEXCLAMATION);
            edtLoginValidacao.SetFocus;
            Exit;

        end
    else
        begin

            lcCelular := dmGeralClient.memValidacao.FieldByName('DDDFONE').AsString +
                         dmGeralClient.memValidacao.FieldByName('TELFONE').AsString;
            lcEmail := dmGeralClient.memValidacao.FieldByName('EMAILCOM').AsString;
            lcIdComercio := dmGeralClient.memValidacao.FieldByName('IDCOM').AsInteger;

            var CelularValidado := StrToBoolValue(dmGeralClient.memValidacao.FieldByName('CELULARVALIDADOCOM').AsString,'T','F');
            var EmailValidado := StrToBoolValue(dmGeralClient.memValidacao.FieldByName('EMAILVALIDADOCOM').AsString,'T','F');

            rbCelular.Visible := CelularValidado;
            rbEmail.Visible := EmailValidado;

            rbEmail.Text := 'Receber no e-mail: ' + lcEmail;
            rbCelular.Text := 'Receber no celular: ' + Mask('(##) *****-####',lcCelular);
            lytTipoRecebimento.Visible := True;
            Exit;

        end;
end;

procedure TfrmLoginPrincipal.Rectangle7Click(Sender: TObject);
begin

    if (not rbEmail.IsChecked) and (not rbCelular.IsChecked) then
        begin
            MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                       'É necessário selecionar uma opção de envio!',
                       'Guia Alvo',MB_OK + MB_ICONERROR);
            Exit;
        end
    else
        begin
            Randomize;
            cfgValidacaoEmail := '';
            cfgValidacaoCelular := '';

            if rbEmail.IsChecked then
                begin
                    cfgValidacaoEmail := FormatFloat('000000', Random(999999));
                    EnviarEmail(cfgValidacaoEmail, 'Código de Validação', '', lcEmail, 'EMAILVALIDACAO');
                end
            else
                begin
                    cfgValidacaoCelular := FormatFloat('000000', Random(999999));
                    SendSMS(lcCelular, cfgValidacaoCelular + ' e o seu codigo de verificacao');
                end;

            lytCodigoValidacao.Visible := True;
        end;

end;

procedure TfrmLoginPrincipal.Rectangle8Click(Sender: TObject);
begin

    if (cfgValidacaoEmail <> '') or (cfgValidacaoCelular <> '') then
        begin
            if (lcValidacao <> cfgValidacaoEmail) or
               (lcValidacao <> cfgValidacaoCelular) or
               (Length(lcValidacao) < 6) then
                begin
                    MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                               'Código de validação inválido, verifique!',
                               'Guia Alvo', MB_OK + MB_ICONERROR);
                    edtNumero1.SetFocus;
                    Exit;
                end;
        end
    else
        begin
            tbcLogin.Next(TTabTransition.Slide);
        end;

end;

procedure TfrmLoginPrincipal.recVoltarClick(Sender: TObject);
begin
    tbcLogin.Previous(TTabTransition.Slide);
end;

end.
