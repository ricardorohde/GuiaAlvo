unit untValidacao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TfrmValidacao = class(TForm)
    recFechar: TRectangle;
    Label5: TLabel;
    recAcessar: TRectangle;
    Label4: TLabel;
    Line1: TLine;
    Label2: TLabel;
    edtCodigoValidacao: TEdit;
    Layout1: TLayout;
    Image1: TImage;
    Label1: TLabel;
    procedure Label5Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmValidacao: TfrmValidacao;

implementation

uses
  System.DateUtils;

{$R *.fmx}

procedure TfrmValidacao.Label4Click(Sender: TObject);
begin
//if edtCodigoValidacao.Text <> 'SYSMASTER' + IntToStr(DayOf(Date)) then

end;

procedure TfrmValidacao.Label5Click(Sender: TObject);
begin
Close;
end;

end.
