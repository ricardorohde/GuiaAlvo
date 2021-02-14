unit untUsuarios;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Effects, FMX.Filter.Effects,
  FMX.TabControl, FMX.Edit, untGlobal, Guia.DmGeral, Guia.Controle, Guia.Notificacao;

type
  TfrmUsuarios = class(TForm)
    recTool: TRectangle;
    sbtnVoltar: TImage;
    FillRGBEffect16: TFillRGBEffect;
    lytTitulos: TLayout;
    Layout60: TLayout;
    lblGrupo: TLabel;
    Line10: TLine;
    Layout61: TLayout;
    lblSubGrupo: TLabel;
    Layout1: TLayout;
    Label1: TLabel;
    lblNome: TLabel;
    Layout2: TLayout;
    lblCelular: TLabel;
    lblNrCelular: TLabel;
    tbcDados: TTabControl;
    tbiDados: TTabItem;
    tbiSenha: TTabItem;
    recbtnAlterarSenha: TRectangle;
    lblCaptionAlterarSenha: TLabel;
    Layout3: TLayout;
    edtSenhaAtual: TEdit;
    Layout4: TLayout;
    edtConfirmaSenha: TEdit;
    Layout5: TLayout;
    edtNovaSenha: TEdit;
    Rectangle1: TRectangle;
    Label2: TLabel;
    recModal: TRectangle;
    recAviso: TRectangle;
    ShadowEffect11: TShadowEffect;
    Layout84: TLayout;
    Image1: TImage;
    Layout86: TLayout;
    Layout88: TLayout;
    Label4: TLabel;
    lblMsgBox: TLabel;
    Layout90: TLayout;
    Label7: TLabel;
    Line13: TLine;
    imgViewSenhaAtual: TImage;
    imgViewNovaSenha: TImage;
    imgViewConfirmaSenha: TImage;
    FillRGBEffect1: TFillRGBEffect;
    FillRGBEffect2: TFillRGBEffect;
    FillRGBEffect3: TFillRGBEffect;
    procedure sbtnVoltarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lblCaptionAlterarSenhaClick(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure imgViewSenhaAtualClick(Sender: TObject);
    procedure imgViewNovaSenhaClick(Sender: TObject);
    procedure imgViewConfirmaSenhaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure CaixaMensagem(AMensagem: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsuarios: TfrmUsuarios;

implementation

{$R *.fmx}

uses untMain;

procedure TfrmUsuarios.CaixaMensagem(AMensagem : String);
begin

     lblMsgBox.Text   := AMensagem;
     recModal.Visible := True;

end;

procedure TfrmUsuarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin

     Action := TCloseAction.caFree;

end;

procedure TfrmUsuarios.FormCreate(Sender: TObject);
begin

     tbcDados.ActiveTab := tbiDados;

end;

procedure TfrmUsuarios.imgViewConfirmaSenhaClick(Sender: TObject);
begin

     edtConfirmaSenha.Password := not edtConfirmaSenha.Password;
     ViewSenha(imgViewConfirmaSenha, edtConfirmaSenha.Password);

end;

procedure TfrmUsuarios.imgViewNovaSenhaClick(Sender: TObject);
begin

     edtNovaSenha.Password := not edtNovaSenha.Password;
     ViewSenha(imgViewNovaSenha, edtNovaSenha.Password);

end;

procedure TfrmUsuarios.imgViewSenhaAtualClick(Sender: TObject);
begin

     edtSenhaAtual.Password := not edtSenhaAtual.Password;
     ViewSenha(imgViewSenhaAtual, edtSenhaAtual.Password);

end;

procedure TfrmUsuarios.Label2Click(Sender: TObject);
begin

     if MD5(edtSenhaAtual.Text) <> gSenhaUsuario then
        begin
           CaixaMensagem('A senha atual não confere!');
           Exit;
        end;
     if Length(edtNovaSenha.Text) < 6 then
        begin
           CaixaMensagem('A senha deve conter no minimo 6 caracteres!');
           Exit;
        end;
     if edtConfirmaSenha.Text <> edtConfirmaSenha.Text then
        begin
           CaixaMensagem('A senha não confere!');
           Exit;
        end;

     UpdateUsuario(gNomeUsuario, ApenasNumeros(gCelularUsuario), MD5(edtNovaSenha.Text), gIdUsuConectado);

     TLoading.ToastMessage(frmMain,
                           'Senha alterada com sucesso.',
                           TAlignLayout.Bottom,
                           $64000000);
     frmUsuarios.Close;

end;

procedure TfrmUsuarios.Label4Click(Sender: TObject);
begin

     recModal.Visible := False;

end;

procedure TfrmUsuarios.lblCaptionAlterarSenhaClick(Sender: TObject);
begin

     tbcDados.Next;

end;

procedure TfrmUsuarios.sbtnVoltarClick(Sender: TObject);
begin

     if tbcDados.ActiveTab = tbiSenha then
        tbcDados.Previous else Close;


end;

end.
