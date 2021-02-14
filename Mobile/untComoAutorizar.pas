unit untComoAutorizar;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Ani, FMX.Objects, FMX.StdCtrls, FMX.Controls.Presentation, FMX.TabControl, FMX.Effects, FMX.Layouts;

type
  TfrmComoAutorizar = class(TForm)
    tbiConfigurar: TTabControl;
    tbiConfiguracao: TTabItem;
    tbiAPPNotificacao: TTabItem;
    tbiAtivarLocalizacao: TTabItem;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    CalloutPanel1: TCalloutPanel;
    Label1: TLabel;
    CalloutPanel2: TCalloutPanel;
    Label2: TLabel;
    CalloutPanel3: TCalloutPanel;
    Label3: TLabel;
    CalloutPanel4: TCalloutPanel;
    Label4: TLabel;
    Arc1: TArc;
    faindicacao: TFloatAnimation;
    Rectangle1: TRectangle;
    ShadowEffect1: TShadowEffect;
    Label5: TLabel;
    Rectangle2: TRectangle;
    ShadowEffect2: TShadowEffect;
    Label6: TLabel;
    Rectangle3: TRectangle;
    ShadowEffect3: TShadowEffect;
    Label7: TLabel;
    Rectangle4: TRectangle;
    ShadowEffect4: TShadowEffect;
    Label8: TLabel;
    Rectangle5: TRectangle;
    ShadowEffect5: TShadowEffect;
    Label9: TLabel;
    recModal: TRectangle;
    recMsg: TRectangle;
    ShadowEffect9: TShadowEffect;
    Layout12: TLayout;
    Image18: TImage;
    Layout16: TLayout;
    Layout17: TLayout;
    lblOKRegistronaoEncontrado: TLabel;
    Label10: TLabel;
    Layout96: TLayout;
    lblCaptionMSG: TLabel;
    Line12: TLine;
    Label11: TLabel;
    Label12: TLabel;
    procedure Label5Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure Label9Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure lblOKRegistronaoEncontradoClick(Sender: TObject);
    procedure Label11Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmComoAutorizar: TfrmComoAutorizar;

implementation

{$R *.fmx}

procedure TfrmComoAutorizar.FormClose(Sender: TObject; var Action: TCloseAction);
begin

    Action := TCloseAction.caFree;

end;

procedure TfrmComoAutorizar.Label11Click(Sender: TObject);
begin
recModal.Visible := False;
end;

procedure TfrmComoAutorizar.Label5Click(Sender: TObject);
begin
tbiConfigurar.Next;
end;

procedure TfrmComoAutorizar.Label6Click(Sender: TObject);
begin
tbiConfigurar.Next;
faindicacao.Enabled := True;
end;

procedure TfrmComoAutorizar.Label7Click(Sender: TObject);
begin
tbiConfigurar.Previous;
end;

procedure TfrmComoAutorizar.Label8Click(Sender: TObject);
begin

    recModal.Visible := True;

end;

procedure TfrmComoAutorizar.Label9Click(Sender: TObject);
begin
tbiConfigurar.Previous;
end;

procedure TfrmComoAutorizar.lblOKRegistronaoEncontradoClick(Sender: TObject);
begin
Application.Terminate;
end;

end.
