unit untOnBoarding;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl, FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Effects, FMX.Filter.Effects, FMX.Objects, untGlobal;

type
  TfrmOnBoarding = class(TForm)
    tbcTutorial: TTabControl;
    tbiTutorialGrupo: TTabItem;
    tbiTutorialSubGrupo: TTabItem;
    tbiTutorialListaComercio: TTabItem;
    tbiTutorialFim: TTabItem;
    lblPular: TLabel;
    Layout2: TLayout;
    lblProximo: TLabel;
    Image1: TImage;
    Image2: TImage;
    Layout1: TLayout;
    FillRGBEffect1: TFillRGBEffect;
    Layout3: TLayout;
    Layout4: TLayout;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Image3: TImage;
    Layout5: TLayout;
    Image4: TImage;
    FillRGBEffect2: TFillRGBEffect;
    Layout7: TLayout;
    Label10: TLabel;
    Image5: TImage;
    Layout6: TLayout;
    Image6: TImage;
    FillRGBEffect3: TFillRGBEffect;
    Layout8: TLayout;
    Label7: TLabel;
    Image7: TImage;
    Layout9: TLayout;
    Image8: TImage;
    FillRGBEffect4: TFillRGBEffect;
    Layout10: TLayout;
    Label8: TLabel;
    Label1: TLabel;
    procedure lblPularClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lblProximoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOnBoarding: TfrmOnBoarding;

implementation

{$R *.fmx}

procedure TfrmOnBoarding.FormClose(Sender: TObject; var Action: TCloseAction);
begin

    Action := TCloseAction.caFree;

end;

procedure TfrmOnBoarding.FormCreate(Sender: TObject);
begin
    tbcTutorial.ActiveTab := tbiTutorialGrupo;
end;

procedure TfrmOnBoarding.lblProximoClick(Sender: TObject);
begin

    if tbcTutorial.ActiveTab = tbiTutorialListaComercio then
         lblProximo.Text := 'Finalizar';

    if tbcTutorial.ActiveTab = tbiTutorialFim then
        begin
            GravaTutorial(False);
            frmOnBoarding.Close;
        end
    else
        begin
            tbcTutorial.Next;
        end;
end;

procedure TfrmOnBoarding.lblPularClick(Sender: TObject);
begin

    GravaTutorial(False);
    frmOnBoarding.Close;

end;

end.
