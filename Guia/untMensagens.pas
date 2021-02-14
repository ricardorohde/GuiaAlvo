unit untMensagens;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.TMSBaseControl, FMX.TMSGridCell, FMX.TMSGridOptions, FMX.TMSGridData,
  FMX.TMSCustomGrid, FMX.TMSGrid, FMX.StdCtrls, FMX.Controls.Presentation,
  FMX.Objects, FMX.Layouts;

type
  TfrmMensagens = class(TForm)
    TMSFMXGrid1: TTMSFMXGrid;
    Panel1: TPanel;
    sbtnSalvar: TSpeedButton;
    sbtnSair: TSpeedButton;
    Image1: TImage;
    Image2: TImage;
    lblAviso: TLabel;
    lblErros: TLabel;
    recModal: TRectangle;
    recMsg: TRectangle;
    Layout1: TLayout;
    Line10: TLine;
    Image7: TImage;
    lblCaption: TLabel;
    Layout2: TLayout;
    imgIcoMsg: TImage;
    lblMensagem: TLabel;
    sbtnOK: TSpeedButton;
    sbtnSim: TSpeedButton;
    sbtnNao: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnSairClick(Sender: TObject);
    procedure sbtnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMensagens: TfrmMensagens;

implementation

{$R *.fmx}

uses untGlobal, untPrincipal, untDmGeral, FMX.ListBox, untComercio, untCaixaMsg;

procedure TfrmMensagens.FormClose(Sender: TObject; var Action: TCloseAction);
begin
frmMensagens := nil;
end;

procedure TfrmMensagens.FormResize(Sender: TObject);
begin
TMSFMXGrid1.DefaultColumnWidth := Self.Width - 20;
end;

procedure TfrmMensagens.FormShow(Sender: TObject);
var
i : Integer;
begin
TMSFMXGrid1.DefaultColumnWidth := TMSFMXGrid1.Width;
TMSFMXGrid1.RowCount := 0;
  for I := 0 to vListaErros.Count - 1 do
    begin
      TMSFMXGrid1.RowCount := i + 1;
      if Copy(vListaErros.Strings[i],1,1) = '0' then
         begin
            TMSFMXGrid1.AddBitmapFile(0, i, gPathArquivos+'\Icones\Ponto_Vermelho.png');
            TMSFMXGrid1.Cells[0,i] := Copy(vListaErros.Strings[i],2,length(vListaErros.Strings[i]));
         end;
      if Copy(vListaErros.Strings[i],1,1) = '1' then
         begin
            TMSFMXGrid1.AddBitmapFile(0, i, gPathArquivos+'\Icones\Ponto_Laranja.png');
            TMSFMXGrid1.Cells[0,i] := Copy(vListaErros.Strings[i],2,length(vListaErros.Strings[i]));
         end;
      if Copy(vListaErros.Strings[i],1,1) = '2' then
         begin
            TMSFMXGrid1.AddBitmapFile(0, i, gPathArquivos+'\Icones\Ponto_Azul.png');
            TMSFMXGrid1.Cells[0,i] := Copy(vListaErros.Strings[i],2,length(vListaErros.Strings[i]));
         end;
    end;
end;

procedure TfrmMensagens.sbtnSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmMensagens.sbtnSalvarClick(Sender: TObject);
begin
With frmCaixaMsg do
   begin
      Tag := 1;
      lblMensagem.Text := 'Confirma a inclusão deste comércio?';
      pLoadImage(imgIcoMsg,fIconInterrogation);
      sbtnSim.Visible := True;
      sbtnNao.Visible := True;
      sbtnOK.Visible  := False;
      ShowModal;
   end;
end;

end.
