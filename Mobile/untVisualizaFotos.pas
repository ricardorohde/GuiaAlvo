unit untVisualizaFotos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Effects, FMX.Gestures;

type
  TfrmVisualizaFotos = class(TForm)
    imgViewFoto: TImage;
    Layout1: TLayout;
    Layout2: TLayout;
    sbtnProximaFoto: TSpeedButton;
    sbtnFecharFoto: TSpeedButton;
    sbtnFotoAnterior: TSpeedButton;
    Layout3: TLayout;
    Layout4: TLayout;
    imgFoto2: TImage;
    imgFoto6: TImage;
    imgFoto4: TImage;
    imgFoto3: TImage;
    imgFoto5: TImage;
    imgFoto1: TImage;
    imgFoto7: TImage;
    imgFoto8: TImage;
    GestureManager1: TGestureManager;
    ShadowEffect1: TShadowEffect;
    ShadowEffect2: TShadowEffect;
    ShadowEffect3: TShadowEffect;
    procedure sbtnFecharClick(Sender: TObject);
    procedure sbtnFotoAnteriorClick(Sender: TObject);
    procedure sbtnProximaFotoClick(Sender: TObject);
    procedure imgViewFotoGesture(Sender: TObject; const EventInfo: TGestureEventInfo; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVisualizaFotos: TfrmVisualizaFotos;
implementation

{$R *.fmx}

uses untGlobal, untMain;

procedure TfrmVisualizaFotos.imgViewFotoGesture(Sender: TObject; const EventInfo: TGestureEventInfo; var Handled: Boolean);
var
  Gesto : string;
begin
  if GestureToIdent(EventInfo.GestureID, Gesto) then
    begin
      case EventInfo.GestureID of
        sgiLeft : sbtnFotoAnteriorClick(Self);
        sgiRight: sbtnProximaFotoClick(Self);
      end;
    end;
end;

procedure TfrmVisualizaFotos.sbtnFecharClick(Sender: TObject);
begin
imgViewFoto.Bitmap := nil;
Close;
end;

procedure TfrmVisualizaFotos.sbtnFotoAnteriorClick(Sender: TObject);
begin
if gFotoAtual = 1 then
   begin
      Exit;
   end
else
   begin
      gFotoAtual := gFotoAtual - 1;
      frmVisualizaFotos.imgViewFoto.Bitmap := TImage(frmVisualizaFotos.FindComponent('imgFoto'+gFotoAtual.ToString)).Bitmap;
   end;
end;

procedure TfrmVisualizaFotos.sbtnProximaFotoClick(Sender: TObject);
begin
if gFotoAtual = gTotalFotos then
   begin
      Exit;
   end
else
   begin
      gFotoAtual := gFotoAtual + 1;
      frmVisualizaFotos.imgViewFoto.Bitmap := TImage(frmVisualizaFotos.FindComponent('imgFoto'+gFotoAtual.ToString)).Bitmap;
   end;
end;

end.

