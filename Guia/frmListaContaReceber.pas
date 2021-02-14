unit frmListaContaReceber;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.TMSBaseControl, FMX.TMSGridCell, FMX.TMSGridOptions,
  FMX.TMSGridData, FMX.TMSCustomGrid, FMX.TMSGrid, FMX.Effects, FMX.StdCtrls,
  FMX.Ani, FMX.Controls.Presentation, FMX.TMSBaseGroup, FMX.TMSRadioGroup,
  FMX.Edit, FMX.ScrollBox, FMX.Memo, FMX.ListBox, FMX.DateTimeCtrls, FireDAC.Stan.Param;

type
  Tfrm_ListaContaReceber = class(TForm)
    grdContasReceber: TTMSFMXGrid;
    btnContrato: TButton;
    btnParcela: TButton;
    btnID: TButton;
    btnComercio: TButton;
    btnVencto: TButton;
    btnPagto: TButton;
    btnValor: TButton;
    Panel1: TPanel;
    sbtnSair: TSpeedButton;
    recBaixar: TRectangle;
    Label1: TLabel;
    Image1: TImage;
    ShadowEffect4: TShadowEffect;
    recPesquisar: TRectangle;
    Label3: TLabel;
    Image3: TImage;
    ShadowEffect2: TShadowEffect;
    Rectangle11: TRectangle;
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
    recPesquisa: TRectangle;
    Image2: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Pago: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnDocumento: TButton;
    recCancelar: TRectangle;
    Label2: TLabel;
    Image8: TImage;
    ShadowEffect1: TShadowEffect;
    ModalObs: TRectangle;
    recObs: TRectangle;
    ShadowEffect3: TShadowEffect;
    sbtnCancelar: TSpeedButton;
    sbtnVoltar: TSpeedButton;
    Layout3: TLayout;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    lblContrato: TLabel;
    lblComercio: TLabel;
    lblParcela: TLabel;
    recBaixa: TRectangle;
    ShadowEffect5: TShadowEffect;
    Layout4: TLayout;
    sbtnBaixar: TSpeedButton;
    sbtnBaixarVoltar: TSpeedButton;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    lblBaixaContrato: TLabel;
    lblBaixaComercio: TLabel;
    lblBaixaParcela: TLabel;
    Label15: TLabel;
    lblVencimento: TLabel;
    Label17: TLabel;
    lblValor: TLabel;
    edtDocumento: TEdit;
    recFiltro: TRectangle;
    ShadowEffect6: TShadowEffect;
    cbComercio: TComboBox;
    Label16: TLabel;
    edtData: TDateEdit;
    Memo1: TMemo;
    rbMaiorQue: TRadioButton;
    rbMenorQue: TRadioButton;
    rbIgual: TRadioButton;
    Label18: TLabel;
    cbTipoData: TComboBox;
    Label20: TLabel;
    cbStatus: TComboBox;
    recBtnFiltro: TRectangle;
    Label19: TLabel;
    Image9: TImage;
    ShadowEffect7: TShadowEffect;
    Line1: TLine;
    Line2: TLine;
    Label21: TLabel;
    edtNrContrato: TEdit;
    Line3: TLine;
    procedure FormShow(Sender: TObject);
    procedure sbtnSairClick(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure btnContratoClick(Sender: TObject);
    procedure sbtnVoltarClick(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure sbtnOKClick(Sender: TObject);
    procedure sbtnCancelarClick(Sender: TObject);
    procedure sbtnSimClick(Sender: TObject);
    procedure sbtnNaoClick(Sender: TObject);
    procedure sbtnBaixarVoltarClick(Sender: TObject);
    procedure sbtnBaixarClick(Sender: TObject);
    function FiltroSQL : String;
    procedure Image9Click(Sender: TObject);
  private
    { Private declarations }
  public
    var
    vSQL : String;
    vListaFiltro: String;
    { Public declarations }
  end;

var
  frm_ListaContaReceber: Tfrm_ListaContaReceber;
  vParcela : Integer;
implementation

{$R *.fmx}

uses untDmGeral, untGlobal;

procedure Tfrm_ListaContaReceber.btnContratoClick(Sender: TObject);
var
vCaption : String;
var
i : Integer;
begin
vCaption := TButton(Sender).Name;

if vCaption = 'btnContrato'  then vSQL := 'ORDER BY r.IDCONTRATO_CR';
if vCaption = 'btnParcela'   then vSQL := 'ORDER BY r.NRPARCELACR';
if vCaption = 'btnID'        then vSQL := 'ORDER BY c.IDCOM';
if vCaption = 'btnComercio'  then vSQL := 'ORDER BY c.RAZAOCOM';
if vCaption = 'btnVencto'    then vSQL := 'ORDER BY r.VENCTOCR';
if vCaption = 'btnPagto'     then vSQL := 'ORDER BY r.PAGTOCR';
if vCaption = 'btnValor'     then vSQL := 'ORDER BY r.VALORCR';
if vCaption = 'btnDocumento' then vSQL := 'ORDER BY r.DOCCR';


for i := 0 to frm_ListaContaReceber.ComponentCount - 1 do
   begin
      if Components[i] is TButton then
         If Pos(Copy(vCaption,4,Length(vCaption)), TButton(Components[i]).Text) > 0 then
            TButton(frm_ListaContaReceber.FindComponent(vCaption)).Text := Copy(vCaption,4,Length(vCaption)) + ' ↓'
         else
            TButton(Components[i]).Text := Copy(TButton(Components[i]).Name,4,Length(TButton(Components[i]).Name));
   end;
FormShow(frm_ListaContaReceber);
end;

function Tfrm_ListaContaReceber.FiltroSQL: String;
var
vResSql, vCampo : String;
begin

if cbComercio.ItemIndex > 0 then
   vResSql := '(c.IDCOM = '+Integer(cbComercio.Items.Objects[cbComercio.ItemIndex]).ToString+')';

if cbStatus.ItemIndex > 0 then
   if vResSql <> '' then
      vResSql := vResSql+' AND (STATUSCR='+QuotedStr(cbStatus.Items[cbStatus.ItemIndex])+')'
   else
      vResSql := '(STATUSCR=' + UpperCase(QuotedStr(StringReplace(cbStatus.Items[cbStatus.ItemIndex],' ',EmptyStr, [rfReplaceAll])))+')';

if cbTipoData.ItemIndex = 1 then vCampo := 'r.VENCTOCR';
if cbTipoData.ItemIndex = 2 then vCampo := 'r.PAGTOCR';
if cbTipoData.ItemIndex > 0 then
   begin
      if vResSql <> '' then
         begin
            if rbIgual.IsChecked    then vResSql := vResSql + ' AND ('+vCampo+' = '+QuotedStr(StringReplace(DateToStr(edtData.Date),'/','.',[rfReplaceAll]))+')';
            if rbMaiorQue.IsChecked then vResSql := vResSql + ' AND ('+vCampo+' > '+QuotedStr(StringReplace(DateToStr(edtData.Date),'/','.',[rfReplaceAll]))+')';
            if rbMenorQue.IsChecked then vResSql := vResSql + ' AND ('+vCampo+' < '+QuotedStr(StringReplace(DateToStr(edtData.Date),'/','.',[rfReplaceAll]))+')';
         end
      else
         begin
            if rbIgual.IsChecked    then vResSql := ' ('+vCampo+' = '+QuotedStr(StringReplace(DateToStr(edtData.Date),'/','.',[rfReplaceAll]))+')';
            if rbMaiorQue.IsChecked then vResSql := ' ('+vCampo+' > '+QuotedStr(StringReplace(DateToStr(edtData.Date),'/','.',[rfReplaceAll]))+')';
            if rbMenorQue.IsChecked then vResSql := ' ('+vCampo+' < '+QuotedStr(StringReplace(DateToStr(edtData.Date),'/','.',[rfReplaceAll]))+')';
         end;
   end;

if edtNrContrato.Text <> '' then
   if vResSql <> '' then
      if edtNrContrato.Text <> '' then vResSql := vResSql + ' AND (r.IDCONTRATO = '+QuotedStr(edtNrContrato.Text)+')'
   else
      if edtNrContrato.Text <> '' then vResSql := ' (r.IDCONTRATO = '+QuotedStr(edtNrContrato.Text)+')';

if vResSql = '' then
   Result := '' else Result := 'WHERE '+vResSql
end;

procedure Tfrm_ListaContaReceber.FormShow(Sender: TObject);
var
i : Integer;
begin
   grdContasReceber.Cells[0, 0] := 'Contrato';
   grdContasReceber.Cells[1, 0] := 'Parcela';
   grdContasReceber.Cells[2, 0] := 'ID';
   grdContasReceber.Cells[3, 0] := 'Comércio';
   grdContasReceber.Cells[4, 0] := 'Vencto';
   grdContasReceber.Cells[5, 0] := 'Documento';
   grdContasReceber.Cells[6, 0] := 'Pagto';
   grdContasReceber.Cells[7, 0] := 'Valor';
   With dmGeral.qryGeral do
      begin
         Close;
         Sql.Clear;
         Sql.Add('SELECT IDCOM, RAZAOCOM FROM ALCOMERCIO');
         Sql.Add('ORDER BY RAZAOCOM');
         Open;
         First;
         cbComercio.Clear;
         cbComercio.Items.Add('=>TODOS<=');
         while not eof do
            begin
               cbComercio.Items.AddObject(FieldByName('RAZAOCOM').AsString,TObject(FieldByName('IDCOM').AsInteger));
               Next;
            end;
         cbComercio.ItemIndex := 0;
         Close;
         Sql.Clear;
         Sql.Add('SELECT c.IDCOM, c.RAZAOCOM, r.* FROM ALCOMERCIO c');
         Sql.Add('INNER JOIN CONTARECEBER r');
         Sql.Add('ON (r.IDCOM_CR = c.IDCOM)');
         Sql.Add(vListaFiltro);
         Sql.Add(vSql);
         Open;
         First;
         if RecordCount > 0 then
            begin
               First;
               for i := 0 to RecordCount do
                  begin
                     grdContasReceber.RowCount := i + 1;
                     grdContasReceber.Cells[0, i + 1] := FormatFloat('0000',FieldByName('IDCONTRATO_CR').AsInteger) + '/' + FieldByName('LETRACR').AsString;
                     grdContasReceber.Cells[1, i + 1] := FieldByName('NRPARCELACR').AsString;
                     grdContasReceber.Cells[2, i + 1] := FormatFloat('0000',FieldByName('IDCOM').AsInteger);
                     grdContasReceber.Cells[3, i + 1] := FieldByName('RAZAOCOM').AsString;
                     grdContasReceber.Cells[4, i + 1] := PintarStatus(FieldByName('STATUSCR').AsString) + DateToStr(FieldByName('VENCTOCR').AsDateTime)+'</s></font>';
                     grdContasReceber.Cells[5, i + 1] := FieldByName('DOCCR').AsString;;

                     if not FieldByName('PAGTOCR').IsNull then
                        grdContasReceber.Cells[6, i + 1] := PintarStatus(FieldByName('STATUSCR').AsString) +
                                                            DateToStr(FieldByName('PAGTOCR').AsDateTime) + '</s></font>' else
                        grdContasReceber.Cells[6, i + 1] := '';
                        grdContasReceber.Cells[7, i + 1] := PintarStatus(FieldByName('STATUSCR').AsString) +
                                                            CurrToStrF(FieldByName('VALORCR').AsCurrency,ffNumber,2) + '</s></font>';
                        grdContasReceber.Cells[8, i + 1] := FieldByName('STATUSCR').AsString;
                        grdContasReceber.AddBitmapFile(8, i + 1, gPathArquivos + '\Icones\' + FieldByName('STATUSCR').AsString + '.png');

                     Next;
                  end;
            end
         else
            begin
               grdContasReceber.RowCount := RecordCount;
               Exit;
            end;
      end;
end;

procedure Tfrm_ListaContaReceber.Image8Click(Sender: TObject);
begin
   Try
      gIdContrato := Copy(grdContasReceber.Cells[0,grdContasReceber.Selected],0,4).ToInteger;
   Except
      fMsg(Self,'','Selecione um cliente na lista!',fIconExclamation,fBtnOK);
      Exit;
   End;
if (grdContasReceber.Cells[8, grdContasReceber.Selected] = 'PAGO') or
   (grdContasReceber.Cells[8, grdContasReceber.Selected] = 'CANCELADO') then
   begin
      fMsg(Self,'','Não é possivel cancelar um titulo com o status '+
         grdContasReceber.Cells[8, grdContasReceber.Selected],fIconExclamation,fBtnOK);
      Exit;
   end
else
   begin
      lblContrato.Text := grdContasReceber.Cells[0, grdContasReceber.Selected];
      lblComercio.Text := grdContasReceber.Cells[3, grdContasReceber.Selected];
      lblParcela.Text  := grdContasReceber.Cells[1, grdContasReceber.Selected];
      recObs.Visible   := True;
      recBaixa.Visible := False;
      ModalObs.Visible := True;
   end;
end;

procedure Tfrm_ListaContaReceber.Image9Click(Sender: TObject);
begin
vListaFiltro := FiltroSQL;
FormShow(Sender);
end;

procedure Tfrm_ListaContaReceber.Label1Click(Sender: TObject);
begin
   Try
      gIdContrato := Copy(grdContasReceber.Cells[0,grdContasReceber.Selected],0,4).ToInteger;
   Except
      fMsg(Self,'','Selecione um cliente na lista!',fIconExclamation,fBtnOK);
      Exit;
   End;
if (grdContasReceber.Cells[8, grdContasReceber.Selected] = 'PAGO') or
   (grdContasReceber.Cells[8, grdContasReceber.Selected] = 'CANCELADO') then
   begin
      fMsg(Self,'','Não é possivel cancelar um titulo com o status '+
         grdContasReceber.Cells[8, grdContasReceber.Selected],fIconExclamation,fBtnOK);
      Exit;
   end
else
   begin
      lblBaixaComercio.Text := grdContasReceber.Cells[3,grdContasReceber.Selected];
      lblBaixaContrato.Text := grdContasReceber.Cells[0,grdContasReceber.Selected];
      lblBaixaParcela.Text  := grdContasReceber.Cells[1,grdContasReceber.Selected];
      If grdContasReceber.Cells[8,grdContasReceber.Selected] = 'AVENCER' then
         begin
            lblVencimento.Text    := ExtractText(grdContasReceber.Cells[4,grdContasReceber.Selected],gCorStAVencer,'</s></font>');
            lblValor.Text         := 'R$ ' + ExtractText(grdContasReceber.Cells[7,grdContasReceber.Selected],gCorStAVencer,'</s></font>');
         end
      else
         begin
            lblVencimento.Text    := ExtractText(grdContasReceber.Cells[4,grdContasReceber.Selected],gCorStVencido,'</s></font>');
            lblValor.Text         := 'R$ ' + ExtractText(grdContasReceber.Cells[7,grdContasReceber.Selected],gCorStVencido,'</s></font>');
         end;
      ModalObs.Visible := True;
      recBaixa.Visible := True;
      recObs.Visible   := False;
      edtDocumento.Text := '';
      edtDocumento.SetFocus;
   end;

end;

procedure Tfrm_ListaContaReceber.sbtnBaixarClick(Sender: TObject);
begin
if edtDocumento.Text = '' then
   begin
      fMsg(Self,'','É necessário preencher o número do documento!',fIconExclamation,fBtnOK);
      Exit;
   end
else
   begin
      fMsg(Self,'','Confirma a baixa deste titulo?',fIconInterrogation,fbtnYesNo);
      Tag := 2;
      Exit;
   end;
end;

procedure Tfrm_ListaContaReceber.sbtnBaixarVoltarClick(Sender: TObject);
begin
ModalObs.Visible := False;
end;

procedure Tfrm_ListaContaReceber.sbtnCancelarClick(Sender: TObject);
begin
Tag := 1;
fMsg(Self,'','Confirma o cancelamento deste titulo?',fIconInterrogation, fbtnYesNo);
Exit;
end;

procedure Tfrm_ListaContaReceber.sbtnNaoClick(Sender: TObject);
begin
recModal.Visible := False;
end;

procedure Tfrm_ListaContaReceber.sbtnOKClick(Sender: TObject);
begin
recModal.Visible := False;
end;

procedure Tfrm_ListaContaReceber.sbtnSairClick(Sender: TObject);
begin
Close;
end;

procedure Tfrm_ListaContaReceber.sbtnSimClick(Sender: TObject);
begin
//Cancelamento TAG = 1
if Tag = 1 then
   begin
      With dmGeral.qryGeral do
         begin
            Close;
            Sql.Clear;
            Sql.Add('UPDATE CONTARECEBER SET');
            Sql.Add('STATUSCR = ''CANCELADO'',');
            Sql.Add('OBSCANCELCR = :OBS');
            Sql.Add('WHERE (IDCONTRATO_CR = :IDCONTRATO) AND');
            Sql.Add('(NRPARCELACR = :NRPARCELA)');
            Params[0].AsString := Memo1.Text;
            Params[1].AsInteger := StrToInt(Copy(lblContrato.Text,1,4));
            Params[2].AsInteger := lblParcela.Text.ToInteger;
            ExecSql;
            fMsg(Self,'','Titulo cancelado com sucesso!',fIconInformation, fBtnOK);
            recModal.Visible := False;
            ModalObs.Visible := False;
            FormShow(Self);
         end;
   end;
//Baixa TAG = 2
if Tag = 2 then
   begin
      With dmGeral.qryGeral do
         begin
            Close;
            Sql.Clear;
            Sql.Add('UPDATE CONTARECEBER SET');
            Sql.Add('STATUSCR = ''PAGO'',');
            Sql.Add('PAGTOCR  = :PAGTO,');
            Sql.Add('DOCCR    = :DOC');
            Sql.Add('WHERE (IDCONTRATO_CR = :IDCONTRATO) AND');
            Sql.Add('(NRPARCELACR = :NRPARCELA)');
            Params[0].AsDate    := Date;
            Params[1].AsString  := edtDocumento.Text;
            Params[2].AsInteger := StrToInt(Copy(lblBaixaContrato.Text,1,4));
            Params[3].AsInteger := lblBaixaParcela.Text.ToInteger;
            ExecSql;
            fMsg(Self,'','Titulo baixado com sucesso!',fIconInformation, fBtnOK);
            recModal.Visible := False;
            ModalObs.Visible := False;
            FormShow(Self);
         end;
   end;
end;

procedure Tfrm_ListaContaReceber.sbtnVoltarClick(Sender: TObject);
begin
ModalObs.Visible := False;
Memo1.Text := '';
end;

end.
