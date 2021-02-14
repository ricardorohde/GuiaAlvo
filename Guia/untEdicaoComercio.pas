unit untEdicaoComercio;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, System.ImageList, FMX.ImgList, ACBrBase, ACBrValidador,
  System.Actions, FMX.ActnList, FMX.TabControl, FMX.Layouts, FMX.Memo,
  FMX.Effects, FMX.DateTimeCtrls, FMX.ListBox, FMX.StdCtrls, FMX.Grid,
  FMX.ScrollBox, FMX.Objects, FMX.Edit, FMX.Controls.Presentation, System.UiConsts,
  FireDAC.Comp.Client, FireDAC.Stan.Param, Guia.Controle;

type
  TfrmEdicaoComercio = class(TForm)
    Panel1: TPanel;
    sbtnSair: TSpeedButton;
    lblEdicao: TLabel;
    Line9: TLine;
    OpenDialogjpg: TOpenDialog;
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
    OpenDialog: TOpenDialog;
    ActionList1: TActionList;
    actRedesSociais: TChangeTabAction;
    actTelefones: TChangeTabAction;
    actCheckList: TChangeTabAction;
    actFuncionamento: TChangeTabAction;
    actImagens: TChangeTabAction;
    actSobre: TChangeTabAction;
    actInfoBasicas: TChangeTabAction;
    actCategorias: TChangeTabAction;
    ACBrValidador: TACBrValidador;
    ImageList1: TImageList;
    pnlMenu: TPanel;
    pnlInformacoes: TCalloutPanel;
    tabCadastro: TTabControl;
    tbInfoBasicas: TTabItem;
    Rectangle4: TRectangle;
    edtCNPJ: TEdit;
    edtFantasia: TEdit;
    edtLogradouro: TEdit;
    edtNrLog: TEdit;
    edtComplemento: TEdit;
    edtBairro: TEdit;
    edtCEP: TEdit;
    edtCidade: TEdit;
    edtRazao: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    CEP: TLabel;
    Cidade: TLabel;
    edtUF: TEdit;
    Label8: TLabel;
    Label1: TLabel;
    Label16: TLabel;
    Line2: TLine;
    tbRedesSociais: TTabItem;
    Rectangle5: TRectangle;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    edtFace: TEdit;
    edtInsta: TEdit;
    edtTwiter: TEdit;
    edtGoogle: TEdit;
    edtSite: TEdit;
    edtEmail: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Line1: TLine;
    Label15: TLabel;
    Label49: TLabel;
    Image8: TImage;
    edtYoutube: TEdit;
    tbTelefones: TTabItem;
    Rectangle6: TRectangle;
    sgrdTelefones: TStringGrid;
    StringColumn1: TStringColumn;
    StringColumn2: TStringColumn;
    StringColumn5: TStringColumn;
    StringColumn6: TStringColumn;
    StringColumn9: TStringColumn;
    imgWhatsApp: TImage;
    Label17: TLabel;
    Line3: TLine;
    edtDDD: TEdit;
    edtTelefone: TEdit;
    chkWhats: TCheckBox;
    Label18: TLabel;
    Label19: TLabel;
    sbtnDeleteTel: TSpeedButton;
    Line4: TLine;
    vLista: TStringGrid;
    StringColumn3: TStringColumn;
    StringColumn4: TStringColumn;
    StringColumn7: TStringColumn;
    StringColumn8: TStringColumn;
    StringColumn10: TStringColumn;
    chkInterno: TCheckBox;
    edtContato: TEdit;
    Label47: TLabel;
    Label48: TLabel;
    Rectangle12: TRectangle;
    sbtnAdicionarTelefone: TSpeedButton;
    tbCheckList: TTabItem;
    Rectangle7: TRectangle;
    Label20: TLabel;
    Line5: TLine;
    lstCheckListCad: TListBox;
    lstCheckListSel: TListBox;
    Label21: TLabel;
    Label22: TLabel;
    SpeedButton7: TSpeedButton;
    SpeedButton4: TSpeedButton;
    tbCategoria: TTabItem;
    Rectangle11: TRectangle;
    Line11: TLine;
    Label38: TLabel;
    Label42: TLabel;
    lstCategoria: TListBox;
    Label45: TLabel;
    lstSubCategoria: TListBox;
    tbFuncionamento: TTabItem;
    Rectangle8: TRectangle;
    Rectangle3: TRectangle;
    Rectangle2: TRectangle;
    Rectangle1: TRectangle;
    Label23: TLabel;
    Line6: TLine;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    edtAbreSeg: TTimeEdit;
    edtParaSeg: TTimeEdit;
    edtVoltaSeg: TTimeEdit;
    edtFechaSeg: TTimeEdit;
    edtFechaTer: TTimeEdit;
    edtVoltaTer: TTimeEdit;
    edtParaTer: TTimeEdit;
    edtAbreTer: TTimeEdit;
    edtVoltaQua: TTimeEdit;
    edtParaQua: TTimeEdit;
    edtAbreQua: TTimeEdit;
    edtFechaQui: TTimeEdit;
    edtVoltaQui: TTimeEdit;
    edtParaQui: TTimeEdit;
    edtAbreQui: TTimeEdit;
    edtFechaSex: TTimeEdit;
    edtVoltaSex: TTimeEdit;
    edtParaSex: TTimeEdit;
    edtAbresex: TTimeEdit;
    edtFechaSab: TTimeEdit;
    edtVoltaSab: TTimeEdit;
    edtParaSab: TTimeEdit;
    edtAbreSab: TTimeEdit;
    edtFechaDom: TTimeEdit;
    edtVoltaDom: TTimeEdit;
    edtParaDom: TTimeEdit;
    edtAbreDom: TTimeEdit;
    edtFechaQua: TTimeEdit;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    chkFechadoSeg: TCheckBox;
    chkFechadoTer: TCheckBox;
    chkFechadoQua: TCheckBox;
    chkFechadoQui: TCheckBox;
    chkFechadoSex: TCheckBox;
    chkFechadoSab: TCheckBox;
    chkFechadoDom: TCheckBox;
    Label36: TLabel;
    sbtnAbre: TSpeedButton;
    sbtnPara: TSpeedButton;
    sbtnVolta: TSpeedButton;
    sbtnFecha: TSpeedButton;
    tbImagens: TTabItem;
    Rectangle9: TRectangle;
    Label39: TLabel;
    Line8: TLine;
    recImagesView: TRectangle;
    GridLayout1: TGridLayout;
    imgCom1: TImage;
    ShadowEffect1: TShadowEffect;
    sbtnDelImage1: TSpeedButton;
    imgCom2: TImage;
    ShadowEffect2: TShadowEffect;
    sbtnDelImage2: TSpeedButton;
    imgCom3: TImage;
    ShadowEffect3: TShadowEffect;
    sbtnDelImage3: TSpeedButton;
    imgCom4: TImage;
    ShadowEffect4: TShadowEffect;
    sbtnDelImage4: TSpeedButton;
    imgCom5: TImage;
    ShadowEffect5: TShadowEffect;
    sbtnDelImage5: TSpeedButton;
    imgCom6: TImage;
    ShadowEffect6: TShadowEffect;
    sbtnDelImage6: TSpeedButton;
    imgCom7: TImage;
    ShadowEffect7: TShadowEffect;
    sbtnDelImage7: TSpeedButton;
    imgCom8: TImage;
    ShadowEffect8: TShadowEffect;
    sbtnDelImage8: TSpeedButton;
    Label40: TLabel;
    Label41: TLabel;
    sbtnAdicionarImagens: TSpeedButton;
    imgAdicionar: TImage;
    SpeedButton5: TSpeedButton;
    imgLogo: TImage;
    sbtnDelLogo: TSpeedButton;
    tbSobre: TTabItem;
    Rectangle10: TRectangle;
    Label37: TLabel;
    lblTotalMemo: TLabel;
    mmDescricao: TMemo;
    Line7: TLine;
    Label46: TLabel;
    edtSlogam: TEdit;
    lblQtdeSlogam: TLabel;
    recInfoBasicas: TRectangle;
    recRedesSociais: TRectangle;
    recCategorias: TRectangle;
    recCheckList: TRectangle;
    recFuncionamento: TRectangle;
    recImagens: TRectangle;
    recTelefones: TRectangle;
    recSobre: TRectangle;
    Label44: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    sbtnSalvarInfoBasicas: TSpeedButton;
    edtTitulo: TEdit;
    Label43: TLabel;
    edtGooglePlay: TEdit;
    Label57: TLabel;
    Image9: TImage;
    SpeedButton1: TSpeedButton;
    tbAvaliacoes: TTabItem;
    Rectangle13: TRectangle;
    Layout3: TLayout;
    Label58: TLabel;
    Line12: TLine;
    Label59: TLabel;
    Layout4: TLayout;
    Layout5: TLayout;
    chkAvaliaAmbiente: TCheckBox;
    Label60: TLabel;
    Layout6: TLayout;
    chkAvaliaPrecos: TCheckBox;
    Label61: TLabel;
    Layout7: TLayout;
    chkAvaliaLocalizacao: TCheckBox;
    Label62: TLabel;
    Layout8: TLayout;
    chkAvaliaLimpeza: TCheckBox;
    Label63: TLabel;
    Layout9: TLayout;
    chkAvaliaAtendimento: TCheckBox;
    Label64: TLabel;
    recAvaliacoes: TRectangle;
    Label65: TLabel;
    actAvaliacoes: TChangeTabAction;
    Label66: TLabel;
    imgDestaqueView: TImage;
    Label67: TLabel;
    edtRappi: TEdit;
    Image11: TImage;
    edtIfood: TEdit;
    Label68: TLabel;
    Image10: TImage;
    Image12: TImage;
    edtUberEats: TEdit;
    Label69: TLabel;
    Label70: TLabel;
    Line13: TLine;
    procedure FormShow(Sender: TObject);
    procedure PintaBotao(btnRect : TRectangle);
    procedure recCategoriasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MudaTab(pAct : TChangeTabAction);
    procedure sbtnSairClick(Sender: TObject);
    procedure edtCEPExit(Sender: TObject);
    function loadHorarios : String;
    procedure sbtnSalvarInfoBasicasClick(Sender: TObject);
    procedure sbtnSimClick(Sender: TObject);
    procedure sbtnOKClick(Sender: TObject);
    procedure sbtnNaoClick(Sender: TObject);
    procedure edtDDDExit(Sender: TObject);
    procedure edtDDDKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure edtTelefoneEnter(Sender: TObject);
    procedure edtTelefoneExit(Sender: TObject);
    procedure sbtnAdicionarTelefoneClick(Sender: TObject);
    procedure lstCheckListCadDblClick(Sender: TObject);
    procedure lstCheckListSelDblClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure lstCategoriaClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure sbtnAbreClick(Sender: TObject);
    procedure sbtnParaClick(Sender: TObject);
    procedure sbtnVoltaClick(Sender: TObject);
    procedure sbtnFechaClick(Sender: TObject);
    procedure imgLogoClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure sbtnDelLogoClick(Sender: TObject);
    procedure sbtnAdicionarImagensClick(Sender: TObject);
    procedure sbtnDelImage1Click(Sender: TObject);
    procedure mmDescricaoKeyUp(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edtSlogamKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure sbtnDeleteTelClick(Sender: TObject);
    procedure imgDestaqueViewClick(Sender: TObject);
  private
    { Private declarations }
  public
    var
    vTxtSobre, vImgIco : String;
    procedure LimpaEdicaoComercio;
    { Public declarations }
  end;

var
  frmEdicaoComercio: TfrmEdicaoComercio;
  vImagens : Array[1..8] of String;
  vNrImg : Integer;
  vNextImage : Integer = 1;
  vBtnPress : String;
  vListImg: TStringList;
implementation

{$R *.fmx}

uses untGlobal, untDmGeral, untComercio, untCheckList, untCaixaMsg,
  untCategorias, frmLogradouros;

procedure TfrmEdicaoComercio.LimpaEdicaoComercio;
var
i : Integer;
begin
for i := 0 to ComponentCount - 1 do
   begin
      if Components[i] is TEdit then TEdit(Components[i]).Text := '';
      if Components[i] is TCheckBox then TCheckBox(Components[i]).IsChecked := False;
   end;
for i := 1 to 8 do
   begin
      TImage(FindComponent('imgCom'+i.ToString)).Bitmap := nil;
      TSpeedButton(FindComponent('sbtnDelImage'+i.ToString)).Visible := False;
   end;
sbtnDelLogo.Visible := False;
pLoadImage(imgAdicionar, 'imgAdicionar');
imgLogo.Bitmap := nil;
mmDescricao.Text := '';
sgrdTelefones.RowCount := 0;
end;

procedure TfrmEdicaoComercio.MudaTab(pAct : TChangeTabAction);
begin
   pAct.ExecuteTarget(Self);
end;

function TfrmEdicaoComercio.loadHorarios : String;
var
vchk : Boolean;
i : Integer;
const
lSemana : array[1..7] of String = ('SEG','TER','QUA','QUI','SEX','SAB','DOM');
begin
for i := 1 to 7 do
   begin
      With dmGeral.qryGeral do
         begin
            TTimeEdit(Self.FindComponent('edtAbre'+lSemana[i])).Text :=
                      Copy(FieldByName('HR'+lSemana[i]+'COM').AsString,1,5);
            TTimeEdit(Self.FindComponent('edtPara'+lSemana[i])).Text :=
                      Copy(FieldByName('HR'+lSemana[i]+'COM').AsString,6,5);
            TTimeEdit(Self.FindComponent('edtVolta'+lSemana[i])).Text :=
                      Copy(FieldByName('HR'+lSemana[i]+'COM').AsString,11,5);
            TTimeEdit(Self.FindComponent('edtFecha'+lSemana[i])).Text :=
                      Copy(FieldByName('HR'+lSemana[i]+'COM').AsString,16,5);
            if Copy(FieldByName('HR'+lSemana[i]+'COM').AsString,21,1) = '0' then
               vchk := False else vchk := True;
                      TCheckBox(Self.FindComponent('chkFechado'+lSemana[i])).IsChecked := vchk;
         end;
   end;
end;

procedure TfrmEdicaoComercio.lstCategoriaClick(Sender: TObject);
begin
   if lstCategoria.ItemIndex >= 0 then
      begin
         With dmGeral.qryGeral do
            begin
               Close;
               Sql.Clear;
               Sql.Add('SELECT * FROM ALSUBCATEGORIA');
               Sql.Add('WHERE IDCAT_SUBCAT = :IDSUBCAT');
               Params[0].AsInteger :=
                  Integer(lstCategoria.Items.Objects[lstCategoria.ItemIndex]);
               Open;
               lstSubCategoria.Clear;
               While not eof do
                  begin
                     lstSubCategoria.Items.AddObject(FieldByName('NOMESUBCAT').AsString,
                           TObject(FieldByName('IDSUBCAT').AsInteger));
                     Next;
                  end;
            end;
      end;
end;

procedure TfrmEdicaoComercio.lstCheckListCadDblClick(Sender: TObject);
var
   i: Integer;
begin
   Try
      vSelected := lstCheckListCad.Items[lstCheckListCad.ItemIndex];
      lstCheckListSel.Items.Add(vSelected);

      vSelected := '';
      for i := 0 to lstCheckListSel.Items.Count - 1 do
         begin
            if vSelected = '' then
               vSelected := QuotedStr(lstCheckListSel.Items[i])
            else
               vSelected := vSelected + ',' +
                  QuotedStr(lstCheckListSel.Items[i]);
         end;

      With dmGeral.qryGeral do
         begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT * FROM ALCHECKLIST');
            Sql.Add('WHERE DESCRCHECK NOT IN (' + vSelected + ')');
            Sql.Add('ORDER BY DESCRCHECK');
            Open;
            lstCheckListCad.Clear;
            While not eof do
               begin
                  lstCheckListCad.Items.AddObject(FieldByName('DESCRCHECK').AsString,
                              TObject(FieldByName('IDCHECK').AsInteger));
                  Next;
               end;

         end;
   Except

   End;
end;

procedure TfrmEdicaoComercio.lstCheckListSelDblClick(Sender: TObject);
var
   vSelected: String;
   i: Integer;
begin
   Try
      vSelected := lstCheckListSel.Items[lstCheckListSel.ItemIndex];
      lstCheckListCad.Items.Add(vSelected);

      vSelected := '';
      for i := 0 to lstCheckListCad.Items.Count - 1 do
         begin
            if vSelected = '' then
               vSelected := QuotedStr(lstCheckListCad.Items[i])
            else
               vSelected := vSelected + ',' +
                  QuotedStr(lstCheckListCad.Items[i]);
         end;

      With dmGeral.qryGeral do
         begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT * FROM ALCHECKLIST');
            Sql.Add('WHERE DESCRCHECK NOT IN (' + vSelected + ')');
            Sql.Add('ORDER BY DESCRCHECK');
            Open;
            lstCheckListSel.Clear;
            While not eof do
               begin
                  lstCheckListSel.Items.AddObject(FieldByName('DESCRCHECK').AsString,
                              TObject(FieldByName('IDCHECK').AsInteger));
                  Next;
               end;

         end;
   Except

   End;
end;

procedure TfrmEdicaoComercio.mmDescricaoKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
var
   vFaltante: Integer;
begin
   vFaltante := 500 - Length(mmDescricao.Text);

   lblTotalMemo.Text := vFaltante.ToString + ' caracteres';
end;

procedure TfrmEdicaoComercio.PintaBotao(btnRect : TRectangle);
begin
recInfoBasicas.Fill.Color    := StringToAlphaColor('#FFE0E0E0');
recRedesSociais.Fill.Color   := StringToAlphaColor('#FFE0E0E0');
recCategorias.Fill.Color     := StringToAlphaColor('#FFE0E0E0');
recCheckList.Fill.Color      := StringToAlphaColor('#FFE0E0E0');
recFuncionamento.Fill.Color  := StringToAlphaColor('#FFE0E0E0');
recImagens.Fill.Color        := StringToAlphaColor('#FFE0E0E0');
recTelefones.Fill.Color      := StringToAlphaColor('#FFE0E0E0');
recSobre.Fill.Color          := StringToAlphaColor('#FFE0E0E0');
recAvaliacoes.Fill.Color     := StringToAlphaColor('#FFE0E0E0');
btnRect.Fill.Color           := StringToAlphaColor('#FFABA6A6');
pnlInformacoes.CalloutOffset := btnRect.Position.Y + 20;//((recInfoBasicas.Height / 2) - 5);
end;

procedure TfrmEdicaoComercio.recCategoriasClick(Sender: TObject);
var
vFaltante: Integer;
i,vLine : Integer;
vItens : String;
vlbi : TListBoxItem;
begin
vLine := 0;
PintaBotao(TRectangle(Sender));
MudaTab(TChangeTabAction(frmEdicaoComercio.FindComponent('act'+
        Copy(TRectangle(Sender).Name,4,Length(TRectangle(Sender).Name)))));
if tabCadastro.ActiveTab = tbTelefones then
   begin
      With dmGeral.qryGeral do
         begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT * FROM ALFONE');
            Sql.Add('WHERE IDCOM_FONE = :IDCOM');
            Params[0].AsInteger := gIdComercio;
            Open;
            First;
            sgrdTelefones.RowCount := RecordCount;
            While not eof do
               begin
                  sgrdTelefones.Cells[0, vLine] := formataDDD(FieldByName('DDDFONE').AsString);
                  sgrdTelefones.Cells[1, vLine] := FieldByName('TELFONE').AsString;
                  sgrdTelefones.Cells[2, vLine] := FieldByName('CONTATOFONE').AsString;
                  if FieldByName('ZAPFONE').AsString = '1' then
                     sgrdTelefones.Cells[3, vLine] := '●' else sgrdTelefones.Cells[3, vLine] := '';
                  if FieldByName('INTFONE').AsString = '1' then
                     sgrdTelefones.Cells[4, vLine] := '●' else sgrdTelefones.Cells[4, vLine] := '';
                  vLine := vLine + 1;
                  Next;
               end;
         end;
   end;
if tabCadastro.ActiveTab = tbCheckList then
   begin
      lstCheckListCad.Clear;
      lstCheckListSel.Clear;
      With dmGeral.qryGeral do
         begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT * FROM ALCHECKLIST');
            Sql.Add('WHERE IDCHECK IN (SELECT IDCHECK_CHEKCOM FROM ALCHECKCOM');
            Sql.Add('WHERE IDCOM_CHECKCOM = :IDCOM)');
            Params[0].AsInteger := gIdComercio;
            Open;
            First;
            While not eof do
               begin
                  lstCheckListSel.Items.AddObject(FieldByName('DESCRCHECK').AsString,
                     TObject(FieldByName('IDCHECK').AsInteger));
                  Next;
               end;
            Close;
            Sql.Clear;
            Sql.Add('SELECT * FROM ALCHECKLIST');
            Sql.Add('WHERE IDCHECK NOT IN (SELECT IDCHECK_CHEKCOM FROM ALCHECKCOM');
            Sql.Add('WHERE IDCOM_CHECKCOM = :IDCOM)');
            Params[0].AsInteger := gIdComercio;
            Open;
            First;
            While not eof do
               begin
                  lstCheckListCad.Items.AddObject(FieldByName('DESCRCHECK').AsString,
                     TObject(FieldByName('IDCHECK').AsInteger));
                  Next;
               end;
         end;
   end;
if tabCadastro.ActiveTab = tbCategoria then
   begin
      lstCategoria.Clear;
      lstSubCategoria.Clear;
      vItens := '';
      With dmGeral.qryGeral do
         begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT * FROM ALCATEGORIA');
            Open;
            First;
            lstCategoria.Clear;
            lstSubCategoria.Clear;
            While not eof do
               begin
                  lstCategoria.Items.AddObject(FieldByName('NOMECAT').AsString,
                     TObject(FieldByName('IDCAT').AsInteger));
                  Next;
               end;

               Close;
               Sql.Clear;
               Sql.Add('SELECT * FROM ALSUBCATEGORIA');
               Sql.Add('WHERE IDCAT_SUBCAT IN (SELECT ID_CAT FROM ALSUBCATCOM');
               Sql.Add('WHERE ID_COM = :IDCOM)');
               Params[0].AsInteger := gIdComercio;
               Open;
               lstSubCategoria.Clear;
               While not eof do
                  begin
                     lstSubCategoria.Items.AddObject(FieldByName('NOMESUBCAT').AsString,
                           TObject(FieldByName('IDSUBCAT').AsInteger));
                     Next;
                  end;

              for i := 0 to lstSubCategoria.Items.Count - 1 do
                 begin
                    Close;
                    Sql.Clear;
                    Sql.Add('SELECT * FROM ALSUBCATCOM c');
                    Sql.Add('INNER JOIN ALSUBCATEGORIA s');
                    Sql.Add('ON (c.ID_SUBCAT = s.IDSUBCAT)');
                    Sql.Add('WHERE (c.ID_COM = :IDCOM) AND');
                    Sql.Add('(s.NOMESUBCAT = :NOMESUBCAT)');
                    Params[0].AsInteger := gIdComercio;
                    Params[1].AsString := lstSubCategoria.Items[i];
                    Open;
                    vlbi := TListBoxItem(lstSubCategoria.ListItems[i]);
                    if FieldByName('NOMESUBCAT').AsString = vlbi.Text then
                        vlbi.IsChecked := True else vlbi.IsChecked := False;
                 end;
         end;
   end;
if tabCadastro.ActiveTab = tbImagens then
   begin
      With dmGeral.qryGeral do
         begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT * FROM ALFILES');
            Sql.Add('WHERE IDCOM_FILES = :IDCOMFILES');
            Params[0].AsInteger := gIdComercio;
            Open;
            vNextImage := 1;
            First;
            While not eof do
               begin
                  TImage(frmEdicaoComercio.FindComponent('imgCom'+vNextImage.ToString)).Bitmap.LoadFromFile(
                        gPathArquivos+'\Fotos\'+FieldByName('NOMEFILES').AsString);
                  TSpeedButton(frmEdicaoComercio.FindComponent('sbtnDelImage' + vNextImage.ToString)).Visible := True;
                  vImagens[vNextImage] := FieldByName('NOMEFILES').AsString;
                  vListImg.Add(gPathArquivos+'\Fotos\'+FieldByName('NOMEFILES').AsString);
                  vNextImage := vNextImage + 1;
                  Next;
               end;
               vNrImg := vNextImage;
         end;
   end;
if tabCadastro.ActiveTab = tbSobre then
   begin
      vFaltante := 100 - Length(edtSlogam.Text);
      lblQtdeSlogam.Text := vFaltante.ToString + ' caracteres';

      vFaltante := 500 - Length(mmDescricao.Text);
      lblTotalMemo.Text := vFaltante.ToString + ' caracteres';
   end;


if tabCadastro.ActiveTab = tbInfoBasicas   then vBtnPress := 'Informações Básicas';
if tabCadastro.ActiveTab = tbRedesSociais  then vBtnPress := 'Redes Sociais';
if tabCadastro.ActiveTab = tbTelefones     then vBtnPress := 'Telefones';
if tabCadastro.ActiveTab = tbCheckList     then vBtnPress := 'ChyeckList';
if tabCadastro.ActiveTab = tbCategoria     then vBtnPress := 'Categoria';
if tabCadastro.ActiveTab = tbFuncionamento then vBtnPress := 'Horário de Funcionamento';
if tabCadastro.ActiveTab = tbImagens       then vBtnPress := 'Imagens';
if tabCadastro.ActiveTab = tbSobre         then vBtnPress := 'Sobre';
if tabCadastro.ActiveTab = tbAvaliacoes    then vBtnPress := 'Avaliacoes';

end;

procedure TfrmEdicaoComercio.sbtnAbreClick(Sender: TObject);
var
i : Integer;
begin
for i := 2 to 7 do
   TTimeEdit(Self.FindComponent('edtAbre'+cSemana[i])).Time := edtAbreSeg.Time;
end;

procedure TfrmEdicaoComercio.sbtnAdicionarImagensClick(Sender: TObject);
begin
if vNextImage > 8 then
   begin
      fMsg(frmEdicaoComercio, '', 'Só é possivel adicionar 8 imagens por comércio!', fIconInformation, fBtnOK);
      Exit;
   end
else
   begin
      if OpenDialogjpg.Execute then
         begin
            if SizeImgPx(OpenDialogjpg.FileName) <> ctrSIZEIMGDESTAKE then
               begin
                  fMsg(Self,'', 'As fotos devem estar no formato de '+ctrSIZEIMGDESTAKE+' px!',
                     fIconError, fBtnOK);
                  Exit;
               end
            else
               begin
                  TSpeedButton(frmEdicaoComercio.FindComponent('sbtnDelImage' + vNextImage.ToString)).Visible := True;
                  TImage(frmEdicaoComercio.FindComponent('imgCom' + vNextImage.ToString)).Bitmap.LoadFromFile(OpenDialogjpg.FileName);
                  vNextImage := vNextImage + 1;
                  vListImg.Add(OpenDialogjpg.FileName);
               end;
         end;
   end;
end;

procedure TfrmEdicaoComercio.sbtnAdicionarTelefoneClick(Sender: TObject);
var
i : Integer;
begin
   if (Length(Trim(edtDDD.Text)) = 0) or (Length(Trim(edtTelefone.Text)) = 0)
   then
      begin
         fMsg(frmEdicaoComercio, '', 'É necessário preencher o campo DDD e Telefone!',
            fIconExclamation, fBtnOK);
         edtDDD.SetFocus;
      end
   else
      begin
         if Pos('-', edtTelefone.Text) = 0 then
            edtTelefoneExit(Sender);
         if Pos('0', edtDDD.Text) = 0 then
            edtDDDExit(Sender);

         for i := 0 to sgrdTelefones.RowCount - 1 do
            begin
               if (sgrdTelefones.Cells[0,i] = edtDDD.Text) and
                  (sgrdTelefones.Cells[1,i] = edtTelefone.Text) then
                  begin
                     fMsg(self,'','Número de telefone ja cadastrado, verifique!',fIconExclamation, fBtnOK);
                     Exit;
                  end;
            end;
         sgrdTelefones.RowCount := sgrdTelefones.RowCount + 1;
         sgrdTelefones.Cells[0, vLine] := edtDDD.Text;
         sgrdTelefones.Cells[1, vLine] := edtTelefone.Text;
         sgrdTelefones.Cells[2, vLine] := edtContato.Text;
         if chkWhats.IsChecked then
            sgrdTelefones.Cells[3, vLine] := '●'
         else
            sgrdTelefones.Cells[3, vLine] := '';

         if chkInterno.IsChecked then
            sgrdTelefones.Cells[4, vLine] := '●'
         else
            sgrdTelefones.Cells[4, vLine] := '';
         vLine := vLine + 1;
         edtDDD.Text := '';
         edtTelefone.Text := '';
         edtContato.Text := '';
         chkWhats.IsChecked := False;
         chkInterno.IsChecked := False;
         edtDDD.SetFocus;
      end;
end;

procedure TfrmEdicaoComercio.sbtnDeleteTelClick(Sender: TObject);
var
   i, j, vLinhaDelete: Integer;
begin
   j := 0;
   vLista.RowCount := sgrdTelefones.RowCount;
   vLinhaDelete := sgrdTelefones.Selected;
   for i := 0 to sgrdTelefones.RowCount - 1 do
      begin
         if i <> vLinhaDelete then
            begin
               vLista.Cells[0, j] := sgrdTelefones.Cells[0, i];
               vLista.Cells[1, j] := sgrdTelefones.Cells[1, i];
               vLista.Cells[2, j] := sgrdTelefones.Cells[2, i];
               vLista.Cells[3, j] := sgrdTelefones.Cells[3, i];
               vLista.Cells[4, j] := sgrdTelefones.Cells[4, i];
               j := j + 1;
            end
         else
            begin

            end;
      end;
   j := 0;
   for i := 0 to vLista.RowCount - 1 do
      begin
         if i <> vLinhaDelete then
            begin
               sgrdTelefones.RowCount := vLista.RowCount;
               sgrdTelefones.Cells[0, j] := vLista.Cells[0, j];
               sgrdTelefones.Cells[1, j] := vLista.Cells[1, j];
               sgrdTelefones.Cells[2, j] := vLista.Cells[2, j];
               sgrdTelefones.Cells[3, j] := vLista.Cells[3, j];
               sgrdTelefones.Cells[4, j] := vLista.Cells[4, j];
               j := j + 1;
            end
         else
            begin

            end;
      end;
   if vLine > 0 then
      vLine := vLine - 1;

   vLista.RowCount := vLista.RowCount - 1;
   sgrdTelefones.RowCount := vLista.RowCount;
end;

procedure TfrmEdicaoComercio.sbtnDelImage1Click(Sender: TObject);
var
   vIndex: String;
   i: Integer;
begin
   vIndex := Copy(TSpeedButton(Sender).Name,Length(TSpeedButton(Sender).Name), 1);
   TImage(frmEdicaoComercio.FindComponent('imgCom' + vIndex)).Bitmap := nil;
   TSpeedButton(Sender).Visible := False;
   vListImg.Delete(vIndex.ToInteger - 1);
   vNextImage := vNextImage - 1;

   for i := 1 to 8 do
      begin
         TImage(frmEdicaoComercio.FindComponent('imgCom' + i.ToString)).Bitmap := nil;
         TSpeedButton(frmEdicaoComercio.FindComponent('sbtnDelImage' + i.ToString)).Visible := False;
      end;
   for i := 0 to vListImg.Count - 1 do
      begin
         TImage(frmEdicaoComercio.FindComponent('imgCom' + (i + 1).ToString)).Bitmap.LoadFromFile(vListImg.Strings[i]);
         TSpeedButton(frmEdicaoComercio.FindComponent('sbtnDelImage' + (i + 1).ToString)).Visible := True;
      end;
end;

procedure TfrmEdicaoComercio.sbtnDelLogoClick(Sender: TObject);
begin
pLoadImage(imgAdicionar, 'imgAdicionar');
imgLogo.Bitmap := nil;
sbtnDelLogo.Visible := False;
end;

procedure TfrmEdicaoComercio.sbtnFechaClick(Sender: TObject);
var
i : Integer;
begin
for i := 2 to 7 do
   TTimeEdit(Self.FindComponent('edtFecha'+cSemana[i])).Time := edtFechaSeg.Time;
end;

procedure TfrmEdicaoComercio.sbtnNaoClick(Sender: TObject);
begin
recModal.Visible := False;
end;

procedure TfrmEdicaoComercio.sbtnOKClick(Sender: TObject);
begin
recModal.Visible := False;
end;

procedure TfrmEdicaoComercio.sbtnParaClick(Sender: TObject);
var
i : Integer;
begin
for i := 2 to 7 do
   TTimeEdit(Self.FindComponent('edtPara'+cSemana[i])).Time := edtParaSeg.Time;
end;

procedure TfrmEdicaoComercio.sbtnSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmEdicaoComercio.sbtnSalvarInfoBasicasClick(Sender: TObject);
var
tmp, vNomeFile : String;
i : Integer;
vErro : Boolean;
vlbi : TListBoxItem;
vLat, vLong, vR, vEndereco, vImgDestaque : String;
begin
vErro := False;
if tabCadastro.ActiveTab = tbInfoBasicas then
   begin
      With dmGeral.qryGeral do
         begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT * FROM ALCOMERCIO');
            Sql.Add('WHERE (RAZAOCOM = :RAZAO)');
            Sql.Add('AND (IDCOM <> :IDCOM)');
            Params[0].AsString  := edtRazao.Text;
            Params[1].AsInteger := gIdComercio;
            Open;
            if RecordCount >  0 then
               begin
                  fMsg(Self,'','Já existe uma empresa com esta razão social, verifique!',
                        fIconExclamation,fBtnOK);
                  Exit;
               end;
            Close;
            Sql.Clear;
            Sql.Add('SELECT * FROM ALCOMERCIO');
            Sql.Add('WHERE (FANTASIACOM = :RAZAO)');
            Sql.Add('AND (IDCOM <> :IDCOM)');
            Params[0].AsString  := edtFantasia.Text;
            Params[1].AsInteger := gIdComercio;
            Open;
            if RecordCount >  0 then
               begin
                  fMsg(Self,'','Já existe uma empresa com este nome fantasia, verifique!',
                        fIconExclamation,fBtnOK);
                  Exit;
               end;
         end;
      if Length(edtRazao.Text) < 5 then
         begin
            fMsg(Self,'','O campo razão social esta em branco ou o preenchimento é inválido.',
                  fIconExclamation,fBtnOK);
            Exit;
         end;

      if Length(edtFantasia.Text) < 5 then
         begin
            fMsg(Self,'','O campo nome fantasia esta em branco ou o preenchimento é inválido.',
                  fIconExclamation,fBtnOK);
            Exit;
         end;
      if Length(edtLogradouro.Text) < 3 then
         begin
            fMsg(Self,'','O campo logradouro esta em branco ou o preenchimento é inválido.',
                  fIconExclamation,fBtnOK);
            Exit;
         end;
      if Length(edtBairro.Text) < 3 then
         begin
            fMsg(Self,'','O campo bairro esta em branco ou o preenchimento é inválido.',
                  fIconExclamation,fBtnOK);
            Exit;
         end;
      if Length(edtCEP.Text) < 9 then
         begin
            fMsg(Self,'','O campo CEP esta em branco ou o preenchimento é inválido.',
                  fIconExclamation,fBtnOK);
            Exit;
         end;
      if Length(edtCidade.Text) < 5 then
         begin
            fMsg(Self,'','O Campo cidade esta em branco ou o preenchimento é inválido.',
                  fIconExclamation,fBtnOK);
            Exit;
         end;
      if Length(edtUF.Text) < 2 then
         begin
            fMsg(Self,'','O Campo UF esta em branco ou o preenchimento é inválido.',
                  fIconExclamation,fBtnOK);
            Exit;
         end;
      if Pos(edtUF.Text,gEstados) = 0 then
         begin
            fMsg(Self,'','A sigla ' + edtUF.Text + ' é inválida.',
                  fIconExclamation,fBtnOK);
            Exit;
         end;


      vEndereco := edtLogradouro.Text+','+edtNrLog.Text+'-'+
      edtBairro.Text+'-'+edtCidade.Text+'-'+edtUF.Text;
      vR := CarregaPosicaoMapa(vEndereco);
      vLat  := Trim(Copy(vR,1,Pos('|',vR) - 1));
      vLong := Trim(Copy(vR,Pos('|',vR) + 1, Length(vR)));

      With dmGeral.qryGeral do
         begin
            Close;
            Sql.Clear;
            Sql.Add('UPDATE ALCOMERCIO SET');
            Sql.Add('RAZAOCOM    = :RAZAOCOM,');
            Sql.Add('FANTASIACOM = :FANTASIACOM,');
            Sql.Add('CEPLOG_COM  = :CEPCOM,');
            Sql.Add('NRLOGCOM    = :NRLOGCOM,');
            Sql.Add('COMPLCOM    = :COMPLCOM,');
            Sql.Add('UPDATECOM   = :UPDATECOM,');
            Sql.Add('LATCOM      = :LATCOM,');
            Sql.Add('LONGCOM     = :LONGCOM');
            Sql.Add('WHERE IDCOM = :IDCOM');
            Params[0].AsString  := edtRazao.Text;
            Params[1].AsString  := edtFantasia.Text;
            Params[2].AsString  := edtCEP.Text;
            Params[3].AsString  := edtNrLog.Text;
            Params[4].AsString  := edtComplemento.Text;
            Params[5].AsString  := '1';
            Params[6].AsString  := StringReplace(vLat,',','',[rfReplaceAll]);
            Params[7].AsString  := StringReplace(vLong,',','',[rfReplaceAll]) ;
            Params[8].AsInteger := gIdComercio;
            ExecSql;
            fMsg(Self,'','Informações Basicas salvas com sucesso!', fIconInformation,fBtnOK);
         end;
   end;

//RedesSociais
if tabCadastro.ActiveTab = tbRedesSociais then
   begin
      With dmGeral.qryGeral do
         begin
            Close;
            Sql.Clear;
            Sql.Add('UPDATE ALCOMERCIO SET');
            Sql.Add('SITECOM     = :SITECOM,');
            Sql.Add('EMAILCOM    = :EMAILCOM,');
            Sql.Add('FACECOM     = :FACECOM,');
            Sql.Add('INSTACOM    = :INSTACOM,');
            Sql.Add('TWITERCOM   = :TWITERCOM,');
            Sql.Add('GOOGLECOM   = :GOOGLECOM,');
            Sql.Add('UPDATECOM   = :UPDATECOM,');
            Sql.Add('APPCOM      = :APPCOM,');
            Sql.Add('IFOODCOM    = :IFOODCOM,');
            Sql.Add('RAPPICOM    = :RAPPICOM,');
            Sql.Add('UBEREATSCOM = :UBEREATSCOM');
            Sql.Add('WHERE IDCOM = :IDCOM');
            Params[0].AsString   := edtSite.Text;
            Params[1].AsString   := edtEmail.Text;
            Params[2].AsString   := edtFace.Text;
            Params[3].AsString   := edtInsta.Text;
            Params[4].AsString   := edtTwiter.Text;
            Params[5].AsString   := edtGoogle.Text;
            Params[6].AsString   := '1';
            Params[7].AsString   := edtGooglePlay.Text;
            Params[8].AsString   := edtIfood.Text;
            Params[9].AsString   := edtRappi.Text;
            Params[10].AsString  := edtUberEats.Text;
            Params[11].AsInteger := gIdComercio;
            ExecSql;
            fMsg(Self,'','Redes Sociais salvas com sucesso!', fIconInformation, fBtnOK);
         end;
   end;
//Telefones
if tabCadastro.ActiveTab = tbTelefones then
   begin
   if sgrdTelefones.RowCount = 0 then
      begin
         fMsg(Self,'','É necessário cadastrar pelo menos um número de telefone!', fIconInformation,
             fBtnOK);
         Exit;
      end;

      for i := 0 to sgrdTelefones.RowCount - 1 do
         begin
            if Pos('-',sgrdTelefones.Cells[1,i]) = 0 then
               begin
                  fMsg(Self,'','O telefone "'+sgrdTelefones.Cells[1,i]+'" esta com o formato inválido!', fIconInformation,
                        fBtnOK);
                  vErro := True;
                  Exit;
               end
            else
               begin
                  With dmGeral.qryGeral do
                     begin
                        Close;
                        Sql.Clear;
                        Sql.Add('SELECT * FROM ALFONE f');
                        Sql.Add('INNER JOIN ALCOMERCIO c');
                        Sql.Add('ON (c.IDCOM = f.IDCOM_FONE)');
                        Sql.Add('WHERE (DDDFONE = :DDD) AND (TELFONE = :TEL)');
                        Sql.Add('AND (IDCOM_FONE <> :IDCOMFONE)');
                        Params[0].AsString  := sgrdTelefones.Cells[0,i];
                        Params[1].AsString  := sgrdTelefones.Cells[1,i];
                        Params[2].AsInteger := gIdComercio;
                        Open;
                        if RecordCount > 0 then
                           begin
                              fMsg(Self,'',sgrdTelefones.Cells[0,i]+' '+sgrdTelefones.Cells[1,i] +
                                          ' ja encontra-se cadastrado com o cliente '+
                                          FieldByName('RAZAOCOM').AsString, fIconInformation,
                                          fBtnOK);
                              vErro := True;
                              Exit;
                           end;
                     end;
               end;
         end;
         if vErro = False then
            begin
               With dmGeral.qryGeral do
                  begin
                     Close;
                     Sql.Clear;
                     Sql.Add('DELETE FROM ALFONE');
                     Sql.Add('WHERE IDCOM_FONE = :IDCOMFONE');
                     Params[0].AsInteger := gIdComercio;
                     ExecSql;
                     for i := 0 to sgrdTelefones.RowCount - 1 do
                        begin
                           Close;
                           Sql.Clear;
                           Sql.Add('INSERT INTO ALFONE');
                           Sql.Add('(IDCOM_FONE, DDDFONE, TELFONE,');
                           Sql.Add('ZAPFONE, CONTATOFONE, INTFONE) VALUES ');
                           Sql.Add('(:IDCOM_FONE, :DDDFONE, :TELFONE,');
                           Sql.Add(':ZAPFONE, :CONTATOFONE, :INTFONE)');
                           Params[0].AsInteger := gIdComercio;
                           Params[1].AsString  := sgrdTelefones.Cells[0,i];//DDD
                           Params[2].AsString  := sgrdTelefones.Cells[1,i];//Telefone

                           if sgrdTelefones.Cells[3,i] = '●' then
                              Params[3].AsString  := '1'
                           else
                              Params[3].AsString := '0';//Zap

                           Params[4].AsString  := sgrdTelefones.Cells[2,i];//Contato

                           if sgrdTelefones.Cells[4,i] = '●' then
                              Params[5].AsString  := '1'
                           else
                              Params[5].AsString := '0';//AL

                           ExecSql;
                        end;
                  end;
                  fMsg(Self,'','Telefones atualizados com sucesso!', fIconInformation, fBtnOK);
            end;
   end;

//CheckList
if tabCadastro.ActiveTab = tbCheckList then
   begin
   if lstCheckListSel.Count <= 0 then
      begin
         fMsg(Self,'','Atenção!! Nenhum checklist foi selecionado!', fIconInformation, fBtnOK);
         Exit;
      end
   else
      begin
         With dmGeral.qryGeral do
            begin
               Close;
               Sql.Clear;
               Sql.Add('DELETE FROM ALCHECKCOM');
               Sql.Add('WHERE IDCOM_CHECKCOM = :IDCHECKCOM');
               Params[0].AsInteger := gIdComercio;
               ExecSql;
               for i := 0 to lstCheckListSel.Count - 1 do
                  begin
                     Close;
                     Sql.Clear;
                     Sql.Add('INSERT INTO ALCHECKCOM');
                     Sql.Add('(IDCOM_CHECKCOM, UPDATECHECK ,IDCHECK_CHEKCOM) VALUES ');
                     Sql.Add('(:IDCOM_CHECKCOM, 0,(SELECT IDCHECK FROM ALCHECKLIST WHERE '+
                              'DESCRCHECK = '+QuotedStr(frmEdicaoComercio.lstCheckListSel.Items[i])+'))');
                     Params[0].AsInteger := gIdComercio;
                     ExecSql;
                  end;
            end;
        fMsg(Self,'','CheckList atualizados com sucesso!', fIconInformation, fBtnOK);
      end;
   end;

//Categorias
if tabCadastro.ActiveTab = tbCategoria then
   begin
      vSubCat := '';
      if lstCategoria.ItemIndex < 0 then
         begin
            fMsg(Self,'','É necessário selecionar uma categoria!',fIconExclamation, fBtnOK);
            Exit;
         end;


      for i := 0 to lstSubCategoria.Items.Count - 1 do
         begin
            vlbi := TListBoxItem(lstSubCategoria.ListItems[i]);
            if vlbi.IsChecked then
               vSubCat := vSubCat + Integer(TObject(lstSubCategoria.Items[lstSubCategoria.ItemIndex])).ToString+'|'
         end;
      if vSubCat = '' then
         begin
            fMsg(Self,'','Nehuma sub-categoria foi selecionada, é necessário selecionar pelo menos uma sub-categoria!', fIconInformation, fBtnOK);
            Exit;
         end
      else
         begin
            With dmGeral.qryGeral do
               begin
                  Close;
                  Sql.Clear;
                  Sql.Add('DELETE FROM ALSUBCATCOM');
                  Sql.Add('WHERE ID_COM = :IDCOM');
                  Params[0].AsInteger := gIdComercio;
                  ExecSql;
                  for i := 0 to lstSubCategoria.Items.Count - 1 do
                     begin
                        vlbi := TListBoxItem(lstSubCategoria.ListItems[i]);
                        if vlbi.IsChecked = True then
                           begin
                              Close;
                              Sql.Clear;
                              Sql.Add('INSERT INTO ALSUBCATCOM');
                              Sql.Add('(ID_COM, ID_SUBCAT, ID_CAT) VALUES ');
                              Sql.Add('(:ID_COM, :ID_SUBCAT, :ID_CAT)');
                              Params[0].AsInteger := gIdComercio;
                              Params[1].AsInteger := Integer(lstSubCategoria.Items.Objects[i]);
                              Params[2].AsInteger := Integer(lstCategoria.Items.Objects[lstCategoria.ItemIndex]);
                              ExecSql;
                           end;
                     end;
                  fMsg(Self,'','Categorias atualizadas com sucesso!', fIconInformation, fBtnOK);
               end;
         end;
   end;
//Horario de funcionamento
if tabCadastro.ActiveTab = tbFuncionamento then
   begin
      With dmGeral.qryGeral do
         begin
            Close;
            Sql.Clear;
            Sql.Add('UPDATE ALCOMERCIO SET');
            Sql.Add('HRSEGCOM = :HRSEGCOM,');
            Sql.Add('HRTERCOM = :HRTERCOM,');
            Sql.Add('HRQUACOM = :HRQUACOM,');
            Sql.Add('HRQUICOM = :HRQUICOM,');
            Sql.Add('HRSEXCOM = :HRSEXCOM,');
            Sql.Add('HRSABCOM = :HRSABCOM,');
            Sql.Add('HRDOMCOM = :HRDOMCOM,');
            Sql.Add('UPDATECOM = :UPDATECOM');
            Sql.Add('WHERE IDCOM = :IDCOM');
            Params[0].AsString  := frmComercio.getHorarios(Self,'Seg');
            Params[1].AsString  := frmComercio.getHorarios(Self,'Ter');
            Params[2].AsString  := frmComercio.getHorarios(Self,'Qua');
            Params[3].AsString  := frmComercio.getHorarios(Self,'Qui');
            Params[4].AsString  := frmComercio.getHorarios(Self,'Sex');
            Params[5].AsString  := frmComercio.getHorarios(Self,'Sab');
            Params[6].AsString  := frmComercio.getHorarios(Self,'Dom');
            Params[7].AsString  := '1';
            Params[8].AsInteger := gIdComercio;
            ExecSql;
            fMsg(Self,'','Horarios atualizadas com sucesso!', fIconInformation, fBtnOK);
         end;
   end;
//Imagens
if tabCadastro.ActiveTab = tbImagens then
   begin
   if imgLogo.Bitmap.IsEmpty then
      begin
         fMsg(Self,'','É preciso selecionar o logo da empresa!', fIconInformation, fBtnOK);
         Exit;
      end;
   if imgCom1.Bitmap.IsEmpty then
      begin
         fMsg(Self,'','É necessário selecionar ao menos uma foto da empresa!', fIconInformation, fBtnOK);
         Exit;
      end;
   if edtTitulo.Text = '' then
      begin
         fMsg(Self,'','É necessário preencher o campo titulo da empresa!', fIconInformation, fBtnOK);
         Exit;
      end;
   if imgDestaqueView.Bitmap.IsEmpty then
      begin
         fMsg(Self,'','É necessário colocar a foto de destaque da empresa!', fIconInformation, fBtnOK);
         Exit;
      end;

      vImgDestaque := 'FTO' + GeraNameFile + '.jpg';
      With dmGeral.qryGeral do
         begin
            Close;
            Sql.Clear;
            Sql.Add('DELETE FROM ALFILES');
            Sql.Add('WHERE IDCOM_FILES = :IDCOMFILES');
            Params[0].AsInteger := gIdComercio;
            ExecSql;
            imgLogo.Bitmap.SaveToFile(gPathArquivos+'\Logos\'+vImgIco);
            Close;
            Sql.Clear;
            Sql.Add('UPDATE ALCOMERCIO SET');
            Sql.Add('TITULOCOM          = :TITULO,');
            Sql.Add('IMGDESTAQUEVIEWCOM = :IMGDESTAQUEVIEWCOM');
            Sql.Add('WHERE IDCOM = :IDCOM');
            Params[0].AsString  := edtTitulo.Text;
            Params[1].AsString  := vImgDestaque;
            Params[2].AsInteger := gIdComercio;
            ExecSql;
            for I := 1 to vNextImage - 1 do
               begin
                  Close;
                  Sql.Clear;
                  Sql.Add('INSERT INTO ALFILES');
                  Sql.Add('(NOMEFILES, IDCOM_FILES) VALUES ');
                  Sql.Add('(:NOMEFILES, :IDCOM_FILES)');
                  if i > (vNrImg - 1) then
                     begin
                        vNomeFile := 'FTO' + GeraNameFile + '.jpg';
                        TImage(frmEdicaoComercio.FindComponent('imgCom'+i.ToString)).Bitmap.SaveToFile(gPathArquivos+'\Fotos\'+vNomeFile);
                        Params[0].AsString := vNomeFile;
                     end
                  else
                     begin
                        Params[0].AsString  := vImagens[i];
                        TImage(frmEdicaoComercio.FindComponent('imgCom'+i.ToString)).Bitmap.SaveToFile(gPathArquivos+'\Fotos\'+vImagens[i]);
                     end;
                  Params[1].AsInteger := gIdComercio;
                  ExecSql;
               end;
               Params[0].AsString  := vImgDestaque;
               frmEdicaoComercio.imgDestaqueView.Bitmap.SaveToFile(gPathArquivos+'\Fotos\'+vImgDestaque);
               Params[1].AsInteger := 0;
               ExecSql;

               fMsg(Self,'','Imagens atualizadas com sucesso!', fIconInformation, fBtnOK);
         end;
   end;
//Sobre
if tabCadastro.ActiveTab = tbSobre then
   begin
      if Trim(edtSlogam.Text) = '' then
         begin
            fMsg(Self,'','Você não preencheu o slogam da empresa!',fIconExclamation,fBtnOK);
            Exit;
         end;
         With dmGeral.qryGeral do
            begin
               Close;
               Sql.Clear;
               Sql.Add('UPDATE ALCOMERCIO SET');
               Sql.Add('SLOGAMCOM   = :SLOGAMCOM,');
               Sql.Add('UPDATECOM   = :UPDATECOM');
               Sql.Add('WHERE IDCOM = :IDCOM');
               Params[0].AsString  := edtSlogam.Text;
               Params[1].AsString  := '1';
               Params[2].AsInteger := gIdComercio;
               ExecSql;
               Close;
               Sql.Clear;
               Sql.Add('UPDATE ALFILES SET');
               Sql.Add('UPDATE_FILES = 1');
               Sql.Add('WHERE (NOMEFILES = :NOMEFILES)');
               Params[0].AsString  := vTxtSobre;
               ExecSql;
               frmEdicaoComercio.mmDescricao.Lines.SaveToFile(gPathArquivos+'\Textos\'+vTxtSobre, TEncoding.UTF8);
               fMsg(Self,'','Informações salvas com sucesso!', fIconInformation, fBtnOK);
            end;
   end;
//Avaliacoes
if tabCadastro.ActiveTab = tbAvaliacoes then
   begin
     With dmGeral.qryGeral do
        begin
           Close;
           Sql.Clear;
           Sql.Add('UPDATE ALCOMERCIO SET');
           Sql.Add('AVALIAAMBIENTECOM     = :AVALIAAMBIENTECOM,');
           Sql.Add('AVALIAATENDIMENTOCOM  = :AVALIAATENDIMENTOCOM,');
           Sql.Add('AVALIALIMPEZACOM      = :AVALIALIMPEZACOM,');
           Sql.Add('AVALIALOCALCOM        = :AVALIALOCALCOM,');
           Sql.Add('AVALIAPRECOCOM        = :AVALIAPRECOSCOM,');
           Sql.Add('QTDECAMPOAVALIACAOCOM = :QTDECAMPOAVALIACAOCOM');
           Sql.Add('WHERE IDCOM = :IDCOM');
           var ATotalAvaliacoes := 0;
           Params[0].AsString   := BoolToStrValue(chkAvaliaAmbiente.IsChecked);
           Params[1].AsString   := BoolToStrValue(chkAvaliaAtendimento.IsChecked);
           Params[2].AsString   := BoolToStrValue(chkAvaliaLimpeza.IsChecked);
           Params[3].AsString   := BoolToStrValue(chkAvaliaLocalizacao.IsChecked);
           Params[4].AsString   := BoolToStrValue(chkAvaliaPrecos.IsChecked);

           if chkAvaliaAmbiente.IsChecked    = True then ATotalAvaliacoes := ATotalAvaliacoes + 1;
           if chkAvaliaAtendimento.IsChecked = True then ATotalAvaliacoes := ATotalAvaliacoes + 1;
           if chkAvaliaLimpeza.IsChecked     = True then ATotalAvaliacoes := ATotalAvaliacoes + 1;
           if chkAvaliaLocalizacao.IsChecked = True then ATotalAvaliacoes := ATotalAvaliacoes + 1;
           if chkAvaliaPrecos.IsChecked      = True then ATotalAvaliacoes := ATotalAvaliacoes + 1;

           Params[5].AsInteger  := ATotalAvaliacoes;
           Params[6].AsInteger  := gIdComercio;
           ExecSql;
           fMsg(Self,'','Informações salvas com sucesso!', fIconInformation, fBtnOK);
        end;
   end;
end;

procedure TfrmEdicaoComercio.sbtnSimClick(Sender: TObject);
begin
//Cadastro de CEP
With frm_Logradouros do
   begin
      edtCEP.Text := frmEdicaoComercio.edtCEP.Text;
      Tag := 1;
      edtLogradouro.SetFocus;
      ShowModal;
   end;
end;

procedure TfrmEdicaoComercio.sbtnVoltaClick(Sender: TObject);
var
i : Integer;
begin
for i := 2 to 7 do
   TTimeEdit(Self.FindComponent('edtVolta'+cSemana[i])).Time := edtVoltaSeg.Time;
end;

procedure TfrmEdicaoComercio.SpeedButton2Click(Sender: TObject);
begin
   With dmGeral.qryGeral do
      begin
         Close;
         Sql.Clear;
         Sql.Add('SELECT * FROM ALCATEGORIA');
         Open;
         lstCategoria.Clear;
         lstSubCategoria.Clear;
         While not eof do
            begin
               lstCategoria.Items.AddObject(FieldByName('NOMECAT').AsString,
                  TObject(FieldByName('IDCAT').AsInteger));
               Next;
            end;
      end;
end;

procedure TfrmEdicaoComercio.SpeedButton3Click(Sender: TObject);
begin
   With dmGeral.qryCategoria do
      begin
         Close;
         Sql.Clear;
         Sql.Add('SELECT * FROM ALCATEGORIA');
         Open;
         frmCategorias.lstCategorias.Clear;
         While not eof do
            begin
               frmCategorias.lstCategorias.Items.Add(FieldByName('NOMECAT')
                  .AsString);
               Next;
            end;
      end;
   frmCategorias.ShowModal;
end;

procedure TfrmEdicaoComercio.SpeedButton4Click(Sender: TObject);
begin
   With dmGeral.qryGeral do
      begin
         Close;
         Sql.Clear;
         Sql.Add('SELECT * FROM ALCHECKLIST');
         Sql.Add('ORDER BY DESCRCHECK');
         Open;
         lstCheckListCad.Clear;
         lstCheckListSel.Clear;
         vSelected := '';
         While not eof do
            begin
               lstCheckListCad.Items.AddObject(FieldByName('DESCRCHECK').AsString,
                              TObject(FieldByName('IDCHECK').AsInteger));
               Next;
            end;
      end;
end;

procedure TfrmEdicaoComercio.SpeedButton5Click(Sender: TObject);
begin
   pLoadImage(imgAdicionar, 'imgAdicionar');
   imgLogo.Bitmap := nil;
   sbtnDelLogo.Visible := False;
end;

procedure TfrmEdicaoComercio.SpeedButton7Click(Sender: TObject);
begin
frmChekList.ShowModal;
end;

procedure TfrmEdicaoComercio.edtCEPExit(Sender: TObject);
begin
ACBrValidador.TipoDocto := docCEP;
ACBrValidador.Documento := formataCNPJCEP(edtCEP.Text,'2');

if not ACBrValidador.Validar then
   begin
      edtLogradouro.Text := '';
      edtCidade.Text := '';
      edtBairro.Text := '';
      edtUF.Text := '';
      fMsg(Self,'','CEP inválido, verifique!',fIconInformation,fBtnOK);
      Exit;
   end;
If not preencheCEP(edtCEP.Text, frmEdicaoComercio) then
     fMsg(Self,'','CEP não encontrado, verifique!',fIconInterrogation,fBtnOK);

    edtCEP.Text := FormatarCEP(edtCEP.Text);
end;

procedure TfrmEdicaoComercio.edtDDDExit(Sender: TObject);
begin
   edtDDD.Text := formataDDD(edtDDD.Text);
end;

procedure TfrmEdicaoComercio.edtDDDKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
   if KeyChar = #13 then
      sbtnAdicionarTelefoneClick(Sender);

   If not(KeyChar in ['0' .. '9', #08]) then
      KeyChar := #0;
end;

procedure TfrmEdicaoComercio.edtSlogamKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
var
   vFaltante: Integer;
begin
   vFaltante := 100 - Length(edtSlogam.Text);

   lblQtdeSlogam.Text := vFaltante.ToString + ' caracteres';

end;

procedure TfrmEdicaoComercio.edtTelefoneEnter(Sender: TObject);
begin
   edtTelefone.Text := FormataFone(edtTelefone.Text, 'ffEnter');
end;

procedure TfrmEdicaoComercio.edtTelefoneExit(Sender: TObject);
begin
edtTelefone.Text := FormataFone(edtTelefone.Text, 'ffExit');
end;

procedure TfrmEdicaoComercio.FormCreate(Sender: TObject);
begin
tabCadastro.TabPosition := TTabPosition.None;
tabCadastro.ActiveTab := tbInfoBasicas;
vListImg := TStringList.Create;
end;

procedure TfrmEdicaoComercio.FormShow(Sender: TObject);
var
vHeigth : Extended;
begin
tabCadastro.TabPosition := TTabPosition.None;
tabCadastro.ActiveTab := tbInfoBasicas;
PintaBotao(recInfoBasicas);
vHeigth := ((pnlMenu.Height - 30) / 9);
recInfoBasicas.Height   := vHeigth;
recRedesSociais.Height  := vHeigth;
recCategorias.Height    := vHeigth;
recCheckList.Height     := vHeigth;
recFuncionamento.Height := vHeigth;
recImagens.Height       := vHeigth;
recTelefones.Height     := vHeigth;
recSobre.Height         := vHeigth;
recAvaliacoes.Height    := vHeigth;
pnlInformacoes.CalloutOffset := recInfoBasicas.Position.Y + 20;
recInfoBasicas.Fill.Color := StringToAlphaColor('#FFABA6A6');
vBtnPress := 'Informações Básicas';
end;

procedure TfrmEdicaoComercio.imgDestaqueViewClick(Sender: TObject);
begin
if OpenDialogjpg.Execute then
    begin
       if SizeImgPx(OpenDialogjpg.FileName) <> ctrSIZEIMGDESTAKE then
          begin
             fMsg(frmComercio,'', 'A foto do destaque deve estar no formato de '+ctrSIZEIMGDESTAKE+' px!',
                fIconError, fBtnOK);
             Exit;
          end
       else
          begin
             imgDestaqueView.Bitmap.LoadFromFile(OpenDialogjpg.FileName);
          end;
    end;
end;

procedure TfrmEdicaoComercio.imgLogoClick(Sender: TObject);
begin
if OpenDialog.Execute then
   begin
      if SizeImgPx(OpenDialog.FileName) <> ctrSIZELOGOCOMERCIO then
         begin
            fMsg(frmChekList,'', 'O logo da empresa deve estar no formato de '+ctrSIZELOGOCOMERCIO+' px!',
               fIconError, fBtnOK);
            Exit;
         end
      else
         begin
            imgLogo.Bitmap.LoadFromFile(OpenDialog.FileName);
            imgAdicionar.Bitmap := nil;
            sbtnDelLogo.Visible := True;
         end;
   end;
end;

end.
