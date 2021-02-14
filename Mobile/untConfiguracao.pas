unit untConfiguracao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Effects, FMX.Filter.Effects,
  untGlobal, Guia.DmGeral, FMX.Edit, FMX.EditBox, FMX.ComboTrackBar, Guia.Controle;

type
  TfrmConfiguracao = class(TForm)
    recTool: TRectangle;
    sbtnVoltar: TImage;
    FillRGBEffect16: TFillRGBEffect;
    lytTitulos: TLayout;
    Layout60: TLayout;
    lblGrupo: TLabel;
    Line10: TLine;
    Layout61: TLayout;
    lblSubGrupo: TLabel;
    Label1: TLabel;
    Line1: TLine;
    swcNotificacao: TSwitch;
    Label2: TLabel;
    Layout1: TLayout;
    Layout2: TLayout;
    Label3: TLabel;
    Line2: TLine;
    tbDistancia: TTrackBar;
    lblRaioMinimo: TLabel;
    Label6: TLabel;
    lblRaioMaximo: TLabel;
    Label8: TLabel;
    Layout5: TLayout;
    Layout6: TLayout;
    Layout7: TLayout;
    lblRaioAtual: TLabel;
    Layout3: TLayout;
    Layout4: TLayout;
    recModal: TRectangle;
    recMsg: TRectangle;
    ShadowEffect1: TShadowEffect;
    Layout12: TLayout;
    Image18: TImage;
    Layout16: TLayout;
    Layout17: TLayout;
    lblOKRegistronaoEncontrado: TLabel;
    Label5: TLabel;
    Layout96: TLayout;
    lblCaptionMSG: TLabel;
    Line12: TLine;
    Image1: TImage;
    Label4: TLabel;
    procedure swcNotificacaoSwitch(Sender: TObject);
    procedure sbtnVoltarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbDistanciaChange(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure lblOKRegistronaoEncontradoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfiguracao: TfrmConfiguracao;
  lcRaioAtual : Integer;

implementation

{$R *.fmx}

uses untMain;

procedure TfrmConfiguracao.FormClose(Sender: TObject; var Action: TCloseAction);
begin

     Action := TCloseAction.caFree;

end;

procedure TfrmConfiguracao.FormCreate(Sender: TObject);
begin

     swcNotificacao.IsChecked := gRecebeNotificacao;

     lblRaioMinimo.Text := ctrRAIOMINIMO.ToString + 'km';
     lblRaioMaximo.Text := ctrRAIOMAXIMO.ToString + 'km';
     lblRaioAtual.Text  := gRaio.ToString + 'km';

     tbDistancia.Min    := ctrRAIOMINIMO;
     tbDistancia.Max    := ctrRAIOMAXIMO;
     tbDistancia.Value  := gRaio;
     lcRaioAtual        := gRaio;

end;

procedure TfrmConfiguracao.Label4Click(Sender: TObject);
begin

    UpdateRaioUsuario(tbDistancia.Value.ToString.ToInteger);
    frmConfiguracao.Close;

end;

procedure TfrmConfiguracao.lblOKRegistronaoEncontradoClick(Sender: TObject);
begin

    UpdateRaioUsuario(tbDistancia.Value.ToString.ToInteger);
    Application.Terminate;

end;

procedure TfrmConfiguracao.sbtnVoltarClick(Sender: TObject);
begin

    if tbDistancia.Value <> lcRaioAtual then
        begin
            UpdateRaioUsuario(tbDistancia.Value.ToString.ToInteger);
            gRaio := tbDistancia.Value.ToString.ToInteger;

            for var i := frmMain.tbcAnuncios.TabCount - 1 downto 0 do
                  frmMain.tbcAnuncios.Tabs[i].DisposeOf;

            frmMain.lstvPrincipal.Items.Clear;
            frmMain.CarregaSecoesPrincipal;
            gExibeLoading := True;
            frmConfiguracao.Close;
        end
    else
        begin
            gExibeLoading := False;
            Close;
        end;

end;

procedure TfrmConfiguracao.swcNotificacaoSwitch(Sender: TObject);
begin

     gRecebeNotificacao := swcNotificacao.IsChecked;
     AtivaPush(gRecebeNotificacao);

end;

procedure TfrmConfiguracao.tbDistanciaChange(Sender: TObject);
begin

     lblRaioAtual.Text := FloatToStr(tbDistancia.Value) + ' km';


end;

end.
