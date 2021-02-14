unit untFrameLoading;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Ani, FMX.Objects, FMX.Controls.Presentation, FMX.Effects, FMX.Layouts;

type
  TfrmFrameLoading = class(TFrame)
    Arc1: TArc;
    Arc2: TArc;
    FloatAnimation: TFloatAnimation;
    Rectangle1: TRectangle;
    Label1: TLabel;
    Layout1: TLayout;
    Layout2: TLayout;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
