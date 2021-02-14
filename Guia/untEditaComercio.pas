unit untEditaComercio;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.StdCtrls, FMX.TMSBaseControl, FMX.TMSGridCell, FMX.TMSGridOptions,
  FMX.TMSGridData, FMX.TMSCustomGrid, FMX.TMSGrid, FMX.Controls.Presentation,
  FMX.Objects, FMX.Layouts, FMX.TMSBaseGroup, FMX.TMSRadioGroup, FMX.Effects,
  FireDAC.Stan.Param;

type
  TfrmEditaComercio = class(TForm)
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
    Rectangle11: TRectangle;
    grdListaEdita: TTMSFMXGrid;
    Panel2: TPanel;
    edtPesquisa: TEdit;
    Panel1: TPanel;
    Line1: TLine;
    Label1: TLabel;
    Label2: TLabel;
    rbOperador: TTMSFMXRadioGroup;
    rbPor: TTMSFMXRadioGroup;
    Line2: TLine;
    btnPesquisar: TSpeedButton;
    Image1: TImage;
    btnIncluir: TSpeedButton;
    Image2: TImage;
    btnFechar: TSpeedButton;
    Image3: TImage;
    btnAtualizar: TSpeedButton;
    Image4: TImage;
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure sbtnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditaComercio: TfrmEditaComercio;

implementation

{$R *.fmx}

uses untDmGeral, untGlobal, untComercio, untEdicaoComercio;


procedure TfrmEditaComercio.FormCreate(Sender: TObject);
begin
grdListaEdita.Cells[0,0] := 'ID';
grdListaEdita.Cells[1,0] := 'CNPJ/CPF';
grdListaEdita.Cells[2,0] := 'Razão Social';
grdListaEdita.Cells[3,0] := 'Nome Fantasia';
end;

procedure TfrmEditaComercio.sbtnOKClick(Sender: TObject);
begin
recModal.Visible := False;
end;

procedure TfrmEditaComercio.btnPesquisarClick(Sender: TObject);
var
i : Integer;
vBusca, vOperador : String;
begin

if rbPor.ItemIndex = 0 then vBusca := 'RAZAOCOM';
if rbPor.ItemIndex = 1 then vBusca := 'FANTASIACOM';
if rbPor.ItemIndex = 2 then vBusca := 'CNPJCOM';

if rbOperador.ItemIndex = 0 then vOperador := '''' + edtPesquisa.Text + '%'+'''';
if rbOperador.ItemIndex = 1 then vOperador := '''' + '%' + edtPesquisa.Text +'''';
if rbOperador.ItemIndex = 2 then vOperador := '''' + '%' + edtPesquisa.Text + '%'+'''';
if rbOperador.ItemIndex = 3 then vOperador := '''' + edtPesquisa.Text + '''';

With dmGeral.qryGeral do
   begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT * FROM ALCOMERCIO');
      Sql.Add('WHERE (' + vBusca + ' Like '+vOperador+')');
      Open;
      for i := 0 to RecordCount do
         begin
            grdListaEdita.RowCount := i + 1;
            grdListaEdita.Cells[0,i + 1] := FieldByName('IDCOM').AsString;
            grdListaEdita.Cells[1,i + 1] := formataCNPJCEP(FieldByName('CNPJCOM').AsString,ffmtExit);
            grdListaEdita.Cells[2,i + 1] := FieldByName('RAZAOCOM').AsString;
            grdListaEdita.Cells[3,i + 1] := FieldByName('FANTASIACOM').AsString;
            Next;
         end;
   end;
end;

procedure TfrmEditaComercio.btnIncluirClick(Sender: TObject);
begin
With frmComercio do
   begin
      Tag := 1;
      LimpaComercio;
      vNextImage := 1;
      frmComercio.sbtnSalvar.Visible    := False;
      frmComercio.sbtnContinuar.Visible := True;
      tabCadastro.ActiveTab := tbInfoBasicas;
      ShowModal;
   end;
end;



procedure TfrmEditaComercio.btnAtualizarClick(Sender: TObject);
begin
if grdListaEdita.Selected < 0 then
   begin
      fMsg(Self,'','É necessário selecionar um comércio!',fIconExclamation,fBtnOK);
      Exit;
   end
else
   begin
      frmEdicaoComercio.LimpaEdicaoComercio;
      gIdComercio := grdListaEdita.Cells[0, grdListaEdita.ItemIndex].ToInteger;
      With dmGeral.qryGeral do
         begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT * FROM ALCOMERCIO');
            Sql.Add('WHERE IDCOM = :IDCOM');
            Params[0].AsInteger := gIdComercio;
            Open;
            frmEdicaoComercio.lblEdicao.Text      := FieldByName('RAZAOCOM').AsString;
            frmEdicaoComercio.edtCNPJ.Text        := formataCNPJCEP(FieldByName('CNPJCOM').AsString, ffmtExit);
            frmEdicaoComercio.edtRazao.Text       := FieldByName('RAZAOCOM').AsString;
            frmEdicaoComercio.edtFantasia.Text    := FieldByName('FANTASIACOM').AsString;
            frmEdicaoComercio.edtNrLog.Text       := FieldByName('NRLOGCOM').AsString;
            frmEdicaoComercio.edtComplemento.Text := FieldByName('COMPLCOM').AsString;
            frmEdicaoComercio.edtCEP.Text         := FieldByName('CEPLOG_COM').AsString;

            frmEdicaoComercio.vImgIco             := FieldByName('ICOCOM').AsString;
            frmEdicaoComercio.vTxtSobre           := FieldByName('SOBRECOM').AsString;

            frmEdicaoComercio.edtFace.Text        := FieldByName('FACECOM').AsString;
            frmEdicaoComercio.edtInsta.Text       := FieldByName('INSTACOM').AsString;
            frmEdicaoComercio.edtTwiter.Text      := FieldByName('TWITERCOM').AsString;
            frmEdicaoComercio.edtYoutube.Text     := FieldByName('TUBECOM').AsString;
            frmEdicaoComercio.edtGoogle.Text      := FieldByName('GOOGLECOM').AsString;
            frmEdicaoComercio.edtSite.Text        := FieldByName('SITECOM').AsString;
            frmEdicaoComercio.edtEmail.Text       := FieldByName('EMAILCOM').AsString;

            frmEdicaoComercio.imgDestaqueView.Bitmap.LoadFromFile(gPathArquivos+'\Fotos\'+FieldByName('IMGDESTAQUEVIEWCOM').AsString);

            frmEdicaoComercio.chkAvaliaAmbiente.IsChecked    := StrToBoolValue(FieldByName('AVALIAAMBIENTECOM').AsString,'T','F');
            frmEdicaoComercio.chkAvaliaPrecos.IsChecked      := StrToBoolValue(FieldByName('AVALIAPRECOCOM').AsString,'T','F');
            frmEdicaoComercio.chkAvaliaLocalizacao.IsChecked := StrToBoolValue(FieldByName('AVALIALOCALCOM').AsString,'T','F');
            frmEdicaoComercio.chkAvaliaLimpeza.IsChecked     := StrToBoolValue(FieldByName('AVALIALIMPEZACOM').AsString,'T','F');
            frmEdicaoComercio.chkAvaliaAtendimento.IsChecked := StrToBoolValue(FieldByName('AVALIAATENDIMENTOCOM').AsString,'T','F');


            frmEdicaoComercio.edtTitulo.Text      := FieldByName('TITULOCOM').AsString;

            frmEdicaoComercio.edtSlogam.Text      := FieldByName('SLOGAMCOM').AsString;
            frmEdicaoComercio.mmDescricao.Lines.LoadFromFile(gPathArquivos+'\Textos\'+FieldByName('SOBRECOM').AsString);

            frmEdicaoComercio.imgLogo.Bitmap.LoadFromFile(gPathArquivos+'\Logos\'+FieldByName('ICOCOM').AsString);
            frmEdicaoComercio.imgAdicionar.Bitmap := nil;
            frmEdicaoComercio.sbtnDelLogo.Visible := True;


            frmEdicaoComercio.loadHorarios;
            frmEdicaoComercio.edtCEPExit(frmEdicaoComercio);
            frmEdicaoComercio.ShowModal;
         end;
   end;
end;

procedure TfrmEditaComercio.btnFecharClick(Sender: TObject);
begin
Close;
end;

end.
