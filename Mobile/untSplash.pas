unit untSplash;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Ani, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, System.Devices,
  FMX.TabControl, System.Net.URLClient, System.Net.HttpClient,
  System.Net.HttpClientComponent, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Guia.Controle, System.IniFiles,
  {$IFDEF ANDROID}
  Androidapi.Helpers,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.App, Guia.DmGeral,
  {$ENDIF}
  untGlobal, FMX.ScrollBox, FMX.Memo;

type
  TfrmSplash = class(TForm)
    Timer1: TTimer;
    Layout1: TLayout;
    Layout10: TLayout;
    Label9: TLabel;
    aniLoading: TAniIndicator;
    imgFundoSplash: TImage;
    imgLogoSplash: TImage;
    procedure Timer1Timer(Sender: TObject);
    procedure FormPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
    procedure FormCreate(Sender: TObject);
    procedure LoadMainForm;
    procedure Image1Paint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
  private
    FInitialized: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;
implementation

{$R *.fmx}

uses untMain;

procedure TfrmSplash.FormCreate(Sender: TObject);
var
{$IFDEF ANDROID}
LWindow: JWindow;
{$ENDIF ANDROID}
begin

   gImgFundoSplash     := CaminhoArquivos('FundoSplash.png');
   gImgTopoMenu        := CaminhoArquivos('FundoTopoMenu.png');
   gImgIconeMsg        := CaminhoArquivos('IconeMsg.png');
   gImgLogoErroConexao := CaminhoArquivos('LogoErroConexao.png');
   gImgLogoSplash      := CaminhoArquivos('LogoSplash.png');

   imgLogoSplash.Bitmap.LoadFromFile(gImgLogoSplash);
   imgFundoSplash.Bitmap.LoadFromFile(gImgFundoSplash);

{$IFDEF ANDROID}
   LWindow := TAndroidHelper.Activity.getWindow;
   LWindow.clearFlags(TJWindowManager_LayoutParams.JavaClass.FLAG_TRANSLUCENT_STATUS);
   LWindow.addFlags(TJWindowManager_LayoutParams.JavaClass.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
   LWindow.setStatusBarColor(TJColor.JavaClass.rgb(61, 77, 115));
{$ENDIF ANDROID}
dmGeral.getControle;

LoadControle(dmGeral.memControle);

Timer1.Enabled  := False;
Timer1.Interval := 500;
end;

procedure TfrmSplash.FormPaint(Sender: TObject; Canvas: TCanvas;
  const ARect: TRectF);
begin
   Timer1.Enabled := not FInitialized;
end;

procedure TfrmSplash.Image1Paint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
begin
Timer1.Enabled := not FInitialized;
end;

procedure TfrmSplash.LoadMainForm;
begin

     Application.CreateForm(TfrmMain, frmMain);
     Application.MainForm := frmMain;
     frmMain.Show;
     frmSplash.Close;

end;

procedure TfrmSplash.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  begin
     if not FInitialized then begin
       FInitialized := true;
       LoadMainForm;
     end;
  end;
end;

end.
