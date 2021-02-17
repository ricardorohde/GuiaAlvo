unit GuiaAlvo.View.CadastroComercio;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit, FMX.Objects,
  uFormat, FMX.TabControl, FMX.Layouts, ACBrValidador,  uFuncoes, FMX.Effects, FMX.Filter.Effects, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, FMX.Ani, FMX.ScrollBox, FMX.Memo,
  System.Actions, FMX.ActnList, GuiaAlvo.Controller.DataModuleDados, GuiaAlvo.Model.FuncoesServidor, Guia.Controle, ACBrBase, FMX.ListBox, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef;

type
  TListaErros = record
  //{"Erro":,"%s","Mensagem":,"%s","Campo":,"%s",}
  IdErro    : String;
  MsgErro   : String;
  CampoErro : String;
end;

type
  TValidacao = (vlCelular, vlEmail);
  TfrmCadastroNovo = class(TForm)
    recCNPJCPF: TRectangle;
    Label9: TLabel;
    recRazaoSocial: TRectangle;
    edtRazaoSocial: TEdit;
    Label1: TLabel;
    recNomeFantasia: TRectangle;
    edtNomeFantasia: TEdit;
    Label2: TLabel;
    Rectangle4: TRectangle;
    Label3: TLabel;
    Rectangle5: TRectangle;
    Label4: TLabel;
    Rectangle6: TRectangle;
    Label5: TLabel;
    recNumero: TRectangle;
    edtNumero: TEdit;
    Label6: TLabel;
    recComplemento: TRectangle;
    edtComplemento: TEdit;
    Label7: TLabel;
    recCep: TRectangle;
    edtCep: TEdit;
    Label8: TLabel;
    Rectangle10: TRectangle;
    Label10: TLabel;
    lytCabecario: TLayout;
    Image1: TImage;
    Line9: TLine;
    Label11: TLabel;
    tbcNovoCadastro: TTabControl;
    tbiDadosBasicos: TTabItem;
    Label12: TLabel;
    ACBrValidador: TACBrValidador;
    lytRodape: TLayout;
    lblProgresso: TLabel;
    Line1: TLine;
    Layout3: TLayout;
    StyleBook1: TStyleBook;
    sbtnProximo: TSpeedButton;
    lytAnterior: TLayout;
    lytPróximo: TLayout;
    edtCNPJCPF: TEdit;
    tbiContatos: TTabItem;
    recTelefone: TRectangle;
    Label13: TLabel;
    edtTelefone: TEdit;
    recContato: TRectangle;
    Label15: TLabel;
    edtContato: TEdit;
    Label16: TLabel;
    recEmail: TRectangle;
    Label17: TLabel;
    edtEmail: TEdit;
    tbiValidacao: TTabItem;
    recValidaCelular: TRectangle;
    Label18: TLabel;
    edtValidaCelular: TEdit;
    recValidaEmail: TRectangle;
    Label20: TLabel;
    edtValidaEmail: TEdit;
    Labe: TLine;
    Label19: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    tbiSenha: TTabItem;
    recSenha: TRectangle;
    Label23: TLabel;
    edtSenha: TEdit;
    recConfirmaSenha: TRectangle;
    Label24: TLabel;
    edtConfirmaSenha: TEdit;
    Label25: TLabel;
    sbtnAnterior: TSpeedButton;
    edtLogradouro: TLabel;
    edtBairro: TLabel;
    edtCidade: TLabel;
    edtUF: TLabel;
    imgViewSenha: TImage;
    imgViewConfirmaSenha: TImage;
    recIERG: TRectangle;
    Label14: TLabel;
    edtIERG: TEdit;
    Label26: TLabel;
    recModal: TRectangle;
    arcAzul: TArc;
    recLoading: TRectangle;
    ShadowEffect1: TShadowEffect;
    ArcCinza: TArc;
    Layout1: TLayout;
    Layout2: TLayout;
    lblMsgLoading: TLabel;
    faArcAzul: TFloatAnimation;
    faArcCinza: TFloatAnimation;
    recMensagemFinal: TRectangle;
    ShadowEffect2: TShadowEffect;
    Layout6: TLayout;
    Layout7: TLayout;
    Layout8: TLayout;
    Imagem: TImage;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Line3: TLine;

    procedure edtCNPJCPFKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtCNPJCPFTyping(Sender: TObject);
    procedure edtCepTyping(Sender: TObject);
    procedure edtCepExit(Sender: TObject);
    procedure edtRazaoSocialKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtNomeFantasiaKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtCepKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtNumeroKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtComplementoKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure sbtnProximoClick(Sender: TObject);
    procedure sbtnAnteriorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtTelefoneTyping(Sender: TObject);
    procedure edtTelefoneKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtContatoKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtEmailKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edtValidaCelularKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtValidaEmailKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure imgViewSenhaClick(Sender: TObject);
    procedure imgViewConfirmaSenhaClick(Sender: TObject);
    procedure edtIERGKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtIERGTyping(Sender: TObject);

    procedure edtLoginPrincipalKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);

    procedure Edit1KeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);

    procedure Edit1KeyDown2(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtConfirmaSenhaKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtSenhaKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure Label27Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure LimpaCorForm;
    { Private declarations }
  public
    lcStatusTab : Integer;
    { Public declarations }
  end;

var
  frmCadastroNovo: TfrmCadastroNovo;
  lcResultListaValidaCampos : TStringList;
  lcSalvo : Boolean = False;
implementation

{$R *.fmx}

uses IniFiles, Winapi.Windows, FMX.Platform.win, System.JSON, Winapi.ShellAPI, GuiaAlvo.View.ListaErros;

function ExtraiJSonErro(AJSon : String) : TListaErros;
var
JSONObj : TJSONObject;
begin

    JSONObj := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(AJSon), 0) as TJSONObject;

    Result.IdErro    := TJSONObject(JSONObj).GetValue('Erro').Value;
    Result.MsgErro   := TJSONObject(JSONObj).GetValue('Mensagem').Value;
    Result.CampoErro := TJSONObject(JSONObj).GetValue('Campo').Value;

end;

function CamposValidados : Boolean;
begin
{
 0 = Preenchimento obrigatório
 1 = Preenchimento inválido
 2 = valor do campo ja cadastrado
}
    With frmCadastroNovo do
        begin

            lcResultListaValidaCampos := TStringList.Create;
            var AJSon := '{"Erro":"%s","Mensagem":"%s","Campo":"%s"}';

            if Length(ApenasNumeros(edtCNPJCPF.Text)) = 0 then lcResultListaValidaCampos.Add(Format(AJSon,['0','O CNPJ/CPF é de preenchimento obrigatório', 'recCNPJCPF'])) else
            if Length(ApenasNumeros(edtCNPJCPF.Text)) = 11 then
               begin
                  ACBrValidador.TipoDocto := docCPF;
                  ACBrValidador.Documento := edtCNPJCPF.Text;
                  if ACBrValidador.Validar = False then
                     lcResultListaValidaCampos.Add(Format(AJSon,['1','CPF inválido!', 'recCNPJCPF']));
               end
            else
               begin

                  ACBrValidador.TipoDocto := docCNPJ;
                  if Length(ApenasNumeros(edtCNPJCPF.Text)) = 14 then
                     begin
                     if ACBrValidador.Validar = False then
                        lcResultListaValidaCampos.Add(Format(AJSon,['1','CNPJ inválido!', 'recCNPJCPF']));
                     end else
                        lcResultListaValidaCampos.Add(Format(AJSon,['1','O campo CNPJ/CPF o preenchimento esta inválido!','recCNPJCPF']));

                  if DocRepetido('CNPJCOM', ApenasNumeros(edtCNPJCPF.Text)) = True then
                      begin
                          if Length(ApenasNumeros(edtCNPJCPF.Text)) = 11 then
                            lcResultListaValidaCampos.Add(Format(AJSon,['2','CPF ja cadastrado!', 'recCNPJCPF'])) else
                          if Length(ApenasNumeros(edtCNPJCPF.Text)) = 14 then
                            lcResultListaValidaCampos.Add(Format(AJSon,['2','CNPJ ja cadastrado!', 'recCNPJCPF']));
                      end;
               end;


            if Length(edtRazaoSocial.Text) < 5 then lcResultListaValidaCampos.Add(Format(AJSon,['1','Razão Social inválida!','recRazaoSocial']));
            if Length(edtNomeFantasia.Text) < 3 then lcResultListaValidaCampos.Add(Format(AJSon,['1','Nome Fantasia inválido!','recNomeFantasia']));
            if Length(ApenasNumeros(edtCep.Text)) = 0 then lcResultListaValidaCampos.Add(Format(AJSon,['0','O Cep é de preenchimento obrigatório!','recCep']));
            ACBrValidador.TipoDocto := docCEP;
            ACBrValidador.Documento := edtCep.Text;

            if edtLogradouro.Text = '' then lcResultListaValidaCampos.Add(Format(AJSon,['1','O CEP esta inválido!','recCep']));
            if (ACBrValidador.Validar = False) and (edtLogradouro.Text <> '') then lcResultListaValidaCampos.Add(Format(AJSon,['1','O CEP esta inválido!','recCep']));

            if Length(ApenasNumeros(edtTelefone.Text)) < 11 then lcResultListaValidaCampos.Add(Format(AJSon,['1','Telefone inválido, verifique!', 'recTelefone']));
            if Length(ApenasNumeros(edtTelefone.Text)) = 0 then lcResultListaValidaCampos.Add(Format(AJSon,['0','O número de telefone é de preenchimento obrigatório!','recTelefone']));
            if (TelRepetido(ApenasNumeros(edtTelefone.Text)) > 0) and (edtTelefone.Text <> '') then
                lcResultListaValidaCampos.Add(Format(AJSon,['2','Telefone ja cadastrado em outra conta!','recTelefone']));

            if Length(edtContato.Text) < 3 then lcResultListaValidaCampos.Add(Format(AJSon,['1','Contato inválido!','recContato']));

            if edtEmail.Text = '' then lcResultListaValidaCampos.Add(Format(AJSon,['0','O e-mail é de preenchimento obrigatório!', 'recEmail']));
            if ValidaEMail(edtEmail.Text) = False then lcResultListaValidaCampos.Add(Format(AJSon,['1','E-mail inválido!','recEmail']));
            if DocRepetido('EMAILCOM', edtEmail.Text) = True then
                lcResultListaValidaCampos.Add(Format(AJSon,['2','E-mail já cadastrado em outra conta!','recEmail']));
            if Length(edtSenha.Text) < 6 then lcResultListaValidaCampos.Add(Format(AJSon,['1','A Senha deve conter o minimo de 6 caracteres!', 'recSenha']));
            if edtConfirmaSenha.Text <> edtSenha.Text then lcResultListaValidaCampos.Add(Format(AJSon,['1','A confirmação da senha não confere!', 'recConfirmaSenha']));

        end;

    if lcResultListaValidaCampos.Count = 0 then
        begin
            Result := True;
            lcResultListaValidaCampos.DisposeOf;
        end
     else
        begin
            Result := False;
        end;

end;

procedure TfrmCadastroNovo.Label27Click(Sender: TObject);
var
AParametro : String;
begin

    if lcSalvo = False then AParametro := '' else
    AParametro := ApenasNumeros(edtCNPJCPF.Text);

    ShellExecute(WindowHandleToPlatform(frmCadastroNovo.Handle).Wnd,
                  nil,pChar(ExtractFilePath(ParamStr(0))+'GGClient.exe'),pChar(AParametro),nil,3);

    Close;
end;

procedure TfrmCadastroNovo.LimpaCorForm;
begin

     for var i := 0 to frmCadastroNovo.ComponentCount - 1 do
         begin

              if frmCadastroNovo.Components[i] is TRectangle then
                   TRectangle(frmCadastroNovo.Components[i]).Fill.Color := TAlphaColorRec.White;

         end;

end;

procedure AddErrosLista(AIndiceImageErro, AMensagemErro, ACampoErro : String);
var
   ATexto : TListItemText;
   AImage : TListItemImage;
   AItem : TListViewItem;
begin

   TRectangle(frmCadastroNovo.FindComponent(ACampoErro)).Fill.Color := cfgCorErro;

   AItem := frmListaErros.lstvErros.Items.Add;
   AItem.TagString := ACampoErro;

   ATexto := TListItemText(AItem.Objects.FindDrawable('Text1'));
   ATexto.Text := AMensagemErro;

   if AIndiceImageErro = '0' then
      begin
         AImage := TListItemImage(AItem.Objects.FindDrawable('Image2'));
         AImage.Bitmap := frmListaErros.imgObrigatorio.Bitmap;
      end;

   if AIndiceImageErro = '1' then
      begin
         AImage := TListItemImage(AItem.Objects.FindDrawable('Image2'));
         AImage.Bitmap := frmListaErros.imgInvalido.Bitmap;
      end;

   if AIndiceImageErro = '2' then
      begin
         AImage := TListItemImage(AItem.Objects.FindDrawable('Image2'));
         AImage.Bitmap := frmListaErros.imgRepetido.Bitmap;
      end;

end;

procedure TfrmCadastroNovo.edtCepExit(Sender: TObject);
begin
ACBrValidador.TipoDocto := docCEP;
ACBrValidador.Documento := edtCEP.Text;
if not ACBrValidador.Validar then
   begin
      edtLogradouro.Text := '';
      edtCidade.Text := '';
      edtBairro.Text := '';
      edtUF.Text := '';
      Exit;
   end;
preencheCEP(edtCEP.Text, Self);
edtCEP.Text := FormatarCEP(edtCEP.Text);
end;

procedure TfrmCadastroNovo.edtCepKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkReturn then edtIERG.SetFocus;
end;

procedure TfrmCadastroNovo.edtCepTyping(Sender: TObject);
begin

  Formatar(edtCep,TFormato.erCEP);

end;

procedure TfrmCadastroNovo.edtCNPJCPFKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin

  if Key = vkReturn then
    edtRazaoSocial.SetFocus;

end;

procedure TfrmCadastroNovo.edtCNPJCPFTyping(Sender: TObject);
begin

  Formatar(edtCNPJCPF,TFormato.erCNPJouCPF);

end;

procedure TfrmCadastroNovo.edtComplementoKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkReturn then
    begin
      sbtnProximoClick(Self);
      edtTelefone.SetFocus;
    end;
end;

procedure TfrmCadastroNovo.edtConfirmaSenhaKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkReturn then
     begin
         if edtConfirmaSenha.Text <> edtSenha.Text then
            begin

                MessageBox(WindowHandleToPlatform(frmCadastroNovo.Handle).Wnd,
                           'A confirmação da senha não confere!',
                           'Guia Alvo',MB_OK + MB_ICONERROR);
                Exit
            end
         else
            begin
                sbtnProximoClick(Self);
            end;
     end;
end;

procedure TfrmCadastroNovo.edtContatoKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkReturn then edtEmail.SetFocus;
end;

procedure TfrmCadastroNovo.edtEmailKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkReturn then
    begin
      sbtnProximoClick(Self);
      edtValidaCelular.SetFocus;
    end;
end;

procedure TfrmCadastroNovo.edtIERGKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkReturn then
    edtNumero.SetFocus;
end;

procedure TfrmCadastroNovo.edtIERGTyping(Sender: TObject);
begin
  Formatar(edtIERG,TFormato.erInscricaoEstadual,edtUF.Text);
end;

procedure TfrmCadastroNovo.edtNomeFantasiaKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkReturn then edtCep.SetFocus;
end;

procedure TfrmCadastroNovo.edtNumeroKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkReturn then edtComplemento.SetFocus;
end;

procedure TfrmCadastroNovo.edtRazaoSocialKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkReturn then edtNomeFantasia.SetFocus;
end;

procedure TfrmCadastroNovo.edtSenhaKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin

    if Key = VK_RETURN then
        begin
            if Length(edtSenha.Text) < 6 then
                begin

                    MessageBox(WindowHandleToPlatform(frmCadastroNovo.Handle).Wnd,
                               'A Senha deve conter o minimo de 6 caracteres!',
                               'Guia Alvo',MB_OK + MB_ICONERROR);
                    Exit
                end
            else
                begin
                    edtConfirmaSenha.SetFocus;
                end;
        end;
end;

procedure TfrmCadastroNovo.edtTelefoneKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkReturn then edtContato.SetFocus;
end;

procedure TfrmCadastroNovo.edtTelefoneTyping(Sender: TObject);
begin

   Formatar(edtTelefone, TFormato.erCelular);

end;

procedure TfrmCadastroNovo.edtValidaCelularKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkReturn then
    edtValidaEmail.SetFocus;
end;

procedure TfrmCadastroNovo.edtValidaEmailKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkReturn then
    begin
      sbtnProximoClick(Self);
      edtSenha.SetFocus;
    end;
end;

procedure TfrmCadastroNovo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := TCloseAction.caFree;
end;

procedure TfrmCadastroNovo.FormCreate(Sender: TObject);
begin

  tbcNovoCadastro.TabIndex := 0;
  lcStatusTab := 0;
  getControle;

end;

procedure TfrmCadastroNovo.FormShow(Sender: TObject);
begin

  edtCNPJCPF.SetFocus;

end;

procedure TfrmCadastroNovo.imgViewConfirmaSenhaClick(Sender: TObject);
begin

    ViewSenha(imgViewConfirmaSenha, edtConfirmaSenha.Password);
    edtConfirmaSenha.Password := not edtConfirmaSenha.Password;

end;

procedure TfrmCadastroNovo.imgViewSenhaClick(Sender: TObject);
begin

    ViewSenha(imgViewSenha, edtSenha.Password);
    edtSenha.Password := not edtSenha.Password;

end;

procedure ProgressoCadastro(AProgresso : integer);
begin
   AProgresso := AProgresso + 1;
   with frmCadastroNovo do
       lblProgresso.Text := 'Etapa ' + AProgresso.ToString + ' de 4';
end;

procedure TfrmCadastroNovo.sbtnAnteriorClick(Sender: TObject);
begin
tbcNovoCadastro.BeginUpdate;
    if tbcNovoCadastro.TabIndex = 1 then
      begin
          Inc(lcStatusTab, -1);
          tbcNovoCadastro.TabIndex := lcStatusTab;
          sbtnAnterior.Visible := False;
          ProgressoCadastro(lcStatusTab);
      end
   else
      begin
          sbtnProximo.Text := 'Próximo >';
          Inc(lcStatusTab, -1);
          tbcNovoCadastro.TabIndex := lcStatusTab;
          ProgressoCadastro(lcStatusTab);
      end;

tbcNovoCadastro.EndUpdate;
end;

function VerificaValidacao(AValidacao : TValidacao) : Boolean;
begin

    with frmCadastroNovo do
        begin

            case AValidacao of
                vlCelular : begin

                                if edtValidaCelular.Text = cfgValidacaoCelular then
                                    Result := True else Result := False;
                
                            end;
                  vlEmail : begin

                                if edtValidaEmail.Text = cfgValidacaoEmail then
                                    Result := True else Result := False;
                  
                            end;
            end;
        
        end;

end;

procedure TfrmCadastroNovo.sbtnProximoClick(Sender: TObject);
var
vCampo : String;
begin

if tbcNovoCadastro.TabIndex = lcStatusTab then
    begin
    if sbtnProximo.Text = 'Salvar' then
       begin
           LimpaCorForm;
           Case CamposValidados of

               True : begin
                          Loading('Aguarde, enviando dados ao servidor.');
                          TThread.CreateAnonymousThread(
                          procedure
                          begin

                             cfgIdComercio := AddComercioNovo(edtRazaoSocial.Text, edtNomeFantasia.Text, edtCep.Text, edtComplemento.Text,
                                                              ApenasNumeros(edtCNPJCPF.Text), ApenasNumeros(edtIERG.Text), edtEmail.Text,
                                                              edtSenha.Text, 'T', edtNumero.Text.ToInteger);

                             AddTelefone(ApenasNumeros(edtTelefone.Text), edtContato.Text, '0','0', cfgIdComercio);
                             lcSalvo := True;
                             TThread.Synchronize(nil,
                             procedure
                             begin

                                Loading('',False);

                             end);

                             recModal.Visible := True;
                             recMensagemFinal.Visible := True;

                          end).Start;

                      end;

              False : begin

                           Application.CreateForm(TfrmListaErros, frmListaErros);
                           frmListaErros.lstvErros.Items.Clear;
                           for var i := 0 to lcResultListaValidaCampos.Count - 1 do
                                begin

                                    with frmListaErros do
                                        begin
                                            var AIDErro    := ExtraiJSonErro(lcResultListaValidaCampos.Strings[i]).IdErro;
                                            var AMsgErro   := ExtraiJSonErro(lcResultListaValidaCampos.Strings[i]).MsgErro;
                                            var ACampoErro := ExtraiJSonErro(lcResultListaValidaCampos.Strings[i]).CampoErro;
                                            AddErrosLista(AIDErro, AMsgErro, ACampoErro);
                                        end;

                                end;

                           lcResultListaValidaCampos.DisposeOf;
                           frmListaErros.ShowModal;

                      end;
           end;
           Exit;
       end;

    if (lcStatusTab = 1) and (cfgEmailValidado = False) and (cfgCelularValidado = False) then
        begin

            if Length(ApenasNumeros(edtTelefone.Text)) <> 11 then
                begin

                    MessageBox(WindowHandleToPlatform(frmCadastroNovo.Handle).Wnd,
                               'O número do celular esta em um formato inválido, verifique!',
                               'Guia Alvo', MB_OK + MB_ICONERROR);
                    Exit;
                end;
            if ValidaEMail(edtEmail.Text) = False then
                begin
                    MessageBox(WindowHandleToPlatform(frmCadastroNovo.Handle).Wnd,
                               'E-mail inválido, verifique!',
                               'Guia Alvo', MB_OK + MB_ICONERROR);
                    Exit;
                end;
                        
            cfgValidacaoCelular := GeraCodigo;
            cfgValidacaoEmail   := GeraCodigo;
            edtValidaCelular.Text := cfgValidacaoCelular;

//            SendSMS(ApenasNumeros(edtTelefone.Text),
//                   'Guia Alvo informa seu codigo de validacao: ' + cfgValidacaoCelular);
//
            EnviarEmail(cfgValidacaoEmail, 'Validação Guia Alvo','', edtEmail.Text, 'EMAILVALIDACAO');

            Inc(lcStatusTab);
            sbtnAnterior.Visible := True;
            tbcNovoCadastro.TabIndex := lcStatusTab;
            ProgressoCadastro(lcStatusTab);
            Exit;
        end;
           
    if (tbcNovoCadastro.ActiveTab = tbiValidacao) and
       (cfgEmailValidado = False) and (cfgCelularValidado = True) or
       (cfgEmailValidado = True) and (cfgCelularValidado = False) then
       begin
            if cfgEmailValidado = False then
                vCampo := 'E-Mail' else vCampo := 'Celular';

            case MessageBox(WindowHandleToPlatform(frmCadastroNovo.Handle).Wnd,
                           pChar('O ' + vCampo + ' não foi validado, no momento não é obrigatório valida-lo.'+#13#13+
                           'Deseja validar agora?'),'Guia Alvo',MB_YESNO + MB_ICONEXCLAMATION) of
                ID_YES : begin

                             TThread.CreateAnonymousThread(
                             procedure
                             begin

                                  TThread.Synchronize(nil,
                                  procedure
                                  begin
                                     Loading('Enviando ' + vCampo + '...');
                                  end);

                                  if cfgEmailValidado = False then
                                      EnviarEmail(cfgValidacaoEmail, 'Validação Guia Alvo','', edtEmail.Text, 'EMAILVALIDACAO') else
                                      SendSMS(ApenasNumeros(edtTelefone.Text),'Guia Alvo informa seu codigo de validacao: ' + cfgValidacaoCelular);

                                  Inc(lcStatusTab);
                                  sbtnAnterior.Visible := True;
                                  tbcNovoCadastro.TabIndex := lcStatusTab;
                                  ProgressoCadastro(lcStatusTab);
                                                 
                             end).Start;
                                
                         end;
                 ID_NO : begin
                             Inc(lcStatusTab);
                             sbtnAnterior.Visible := True;
                             sbtnProximo.Text := 'Salvar';
                             tbcNovoCadastro.TabIndex := lcStatusTab;
                             ProgressoCadastro(lcStatusTab);
                             Exit;
                         end;
            end;
            Exit;
       end;

    if lcStatusTab = 2 then
       begin

           cfgCelularValidado := VerificaValidacao(vlCelular);
           cfgEmailValidado   := VerificaValidacao(vlEmail);

           if (cfgCelularValidado = False) and (cfgEmailValidado = False) then
               begin
                   MessageBox(WindowHandleToPlatform(frmCadastroNovo.Handle).Wnd,
                              'O código de validação esta em branco ou inválido, ' +
                              'para continuar é necessário validar ao menos uma das opções. ' +
                              'Sendo que é aconselhavel validar as duas opções pois as opções ' +
                              'validadas serão utilizadas como login de acesso.',
                              'Guia Alvo', MB_OK + MB_ICONERROR);
                   edtValidaCelular.SetFocus;
                   Exit;
               end
            else
               begin
                   if lcStatusTab = tbcNovoCadastro.TabCount - 2 then
                   begin
                     Inc(lcStatusTab);
                     tbcNovoCadastro.TabIndex := lcStatusTab;
                     sbtnProximo.Text := 'Salvar';
                     ProgressoCadastro(lcStatusTab);
                   end
                else
                   begin
                     Inc(lcStatusTab);
                     sbtnAnterior.Visible := True;
                     tbcNovoCadastro.TabIndex := lcStatusTab;
                     ProgressoCadastro(lcStatusTab);
                   end;

               end;

       end
    else
       begin
           if tbcNovoCadastro.ActiveTab = tbiSenha then
               begin
                 Inc(lcStatusTab);
                 tbcNovoCadastro.TabIndex := lcStatusTab;
                 sbtnProximo.Text := 'Salvar';
                 ProgressoCadastro(lcStatusTab);
               end
            else
               begin
                 Inc(lcStatusTab);
                 sbtnAnterior.Visible := True;
                 tbcNovoCadastro.TabIndex := lcStatusTab;
                 ProgressoCadastro(lcStatusTab);
               end;
       end;
    end;
    if lcStatusTab > 3 then
        begin
            lcStatusTab := 3;
            tbcNovoCadastro.TabIndex := lcStatusTab;
        end;
    if lcStatusTab < 0 then
        begin
            lcStatusTab := 0;
            tbcNovoCadastro.TabIndex := lcStatusTab;
        end;

end;

procedure TfrmCadastroNovo.edtLoginPrincipalKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin

  if Key = vkReturn then
    edtSenha.SetFocus;

end;

procedure TfrmCadastroNovo.Edit1KeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin

  if Key = vkReturn then
    edtSenha.SetFocus;

end;

procedure TfrmCadastroNovo.Edit1KeyDown2(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin

  if Key = vkReturn then
    edtSenha.SetFocus;

end;

end.
