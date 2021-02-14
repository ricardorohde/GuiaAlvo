unit untComercio;

interface

uses
   System.SysUtils, System.Types, System.UITypes, System.Classes,
   System.Variants,
   FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
   FMX.Grid.Style, FMX.Memo, FMX.Layouts, FMX.DateTimeCtrls, FMX.ListBox,
   FMX.StdCtrls, FMX.Grid, FMX.ScrollBox, FMX.Objects,
   FMX.Controls.Presentation,
   FMX.Edit, FMX.TabControl, System.Actions,
   FMX.ActnList, FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
   FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
   FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
   FireDAC.Comp.DataSet, FMX.Effects, System.ImageList, FMX.ImgList, ACBrBase, ACBrValidador, Guia.Controle;

type
   TfrmComercio = class(TForm)
      Panel1: TPanel;
      sbtnSair: TSpeedButton;
      Label43: TLabel;
      Line9: TLine;
      Panel2: TPanel;
      sbtnContinuar: TSpeedButton;
      btnVoltar: TSpeedButton;
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
      tbTelefones: TTabItem;
      Rectangle6: TRectangle;
      sgrdTelefones: TStringGrid;
      StringColumn1: TStringColumn;
      StringColumn2: TStringColumn;
      imgWhatsApp: TImage;
      Label17: TLabel;
      Line3: TLine;
      edtDDD: TEdit;
      edtTelefone: TEdit;
    chkWhats: TCheckBox;
      Label18: TLabel;
      Label19: TLabel;
      sbtnAdicionarTelefone: TSpeedButton;
    sbtnDeleteTel: TSpeedButton;
      Line4: TLine;
      tbCheckList: TTabItem;
      Label20: TLabel;
      Line5: TLine;
      lstCheckListCad: TListBox;
      lstCheckListSel: TListBox;
      Label21: TLabel;
      Label22: TLabel;
      SpeedButton7: TSpeedButton;
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
      tbImagens: TTabItem;
      Rectangle9: TRectangle;
      Label39: TLabel;
      Line8: TLine;
      recImagesView: TRectangle;
      Label40: TLabel;
      Label41: TLabel;
      imgLogo: TImage;
      sbtnAdicionarImagens: TSpeedButton;
      tbSobre: TTabItem;
      Rectangle10: TRectangle;
      Label37: TLabel;
      lblTotalMemo: TLabel;
    mmDescricao: TMemo;
      ActionList1: TActionList;
      actRedesSociais: TChangeTabAction;
      actTelefones: TChangeTabAction;
      actCheckList: TChangeTabAction;
      actFuncionamento: TChangeTabAction;
      actImagens: TChangeTabAction;
      actSobre: TChangeTabAction;
      actInfoBasicas: TChangeTabAction;
      ACBrValidador: TACBrValidador;
      vLista: TStringGrid;
      StringColumn3: TStringColumn;
      StringColumn4: TStringColumn;
    OpenDialogjpg: TOpenDialog;
      GridLayout1: TGridLayout;
      imgCom1: TImage;
      imgCom2: TImage;
      imgCom3: TImage;
      imgCom4: TImage;
      imgCom5: TImage;
      imgCom6: TImage;
      imgCom7: TImage;
      imgCom8: TImage;
      ShadowEffect1: TShadowEffect;
      ShadowEffect2: TShadowEffect;
      ShadowEffect3: TShadowEffect;
      ShadowEffect4: TShadowEffect;
      ShadowEffect5: TShadowEffect;
      ShadowEffect6: TShadowEffect;
      ShadowEffect7: TShadowEffect;
      ShadowEffect8: TShadowEffect;
      sbtnDelImage1: TSpeedButton;
      ImageList1: TImageList;
      sbtnDelImage3: TSpeedButton;
      sbtnDelImage4: TSpeedButton;
      sbtnDelImage5: TSpeedButton;
      sbtnDelImage6: TSpeedButton;
      sbtnDelImage7: TSpeedButton;
      sbtnDelImage8: TSpeedButton;
      sbtnDelImage2: TSpeedButton;
      sbtnDelLogo: TSpeedButton;
      tbCategoria: TTabItem;
      Rectangle11: TRectangle;
      Line11: TLine;
      Label38: TLabel;
      Line7: TLine;
      actCategorias: TChangeTabAction;
      Label42: TLabel;
      lstCategoria: TListBox;
      Label45: TLabel;
      SpeedButton1: TSpeedButton;
      lstSubCategoria: TListBox;
      SpeedButton3: TSpeedButton;
      Rectangle7: TRectangle;
      SpeedButton4: TSpeedButton;
      sbtnAbre: TSpeedButton;
      sbtnPara: TSpeedButton;
      sbtnVolta: TSpeedButton;
      sbtnFecha: TSpeedButton;
    Label46: TLabel;
    edtSlogam: TEdit;
    lblQtdeSlogam: TLabel;
    sbtnSalvar: TSpeedButton;
    chkInterno: TCheckBox;
    edtContato: TEdit;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Image8: TImage;
    edtYoutube: TEdit;
    Rectangle12: TRectangle;
    StringColumn5: TStringColumn;
    StringColumn6: TStringColumn;
    StringColumn7: TStringColumn;
    StringColumn8: TStringColumn;
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
    imgAdicionar: TImage;
    StringColumn9: TStringColumn;
    StringColumn10: TStringColumn;
    OpenDialog: TOpenDialog;
    Label44: TLabel;
    edtTitulo: TEdit;
    Label50: TLabel;
    Image9: TImage;
    edtGooglePlay: TEdit;
    Label51: TLabel;
    mmTagCom: TMemo;
    Label52: TLabel;
    edtAbreDom: TTimeEdit;
    edtAbreSab: TTimeEdit;
    edtAbreSex: TTimeEdit;
    edtAbreQui: TTimeEdit;
    edtAbreQua: TTimeEdit;
    edtAbreTer: TTimeEdit;
    edtAbreSeg: TTimeEdit;
    edtParaSab: TTimeEdit;
    edtParaDom: TTimeEdit;
    edtParaSex: TTimeEdit;
    edtParaQui: TTimeEdit;
    edtParaQua: TTimeEdit;
    edtParaTer: TTimeEdit;
    edtParaSeg: TTimeEdit;
    edtVoltaSab: TTimeEdit;
    edtVoltaDom: TTimeEdit;
    edtVoltaSex: TTimeEdit;
    edtVoltaQui: TTimeEdit;
    edtVoltaQua: TTimeEdit;
    edtVoltaTer: TTimeEdit;
    edtVoltaSeg: TTimeEdit;
    edtFechaSab: TTimeEdit;
    edtFechaDom: TTimeEdit;
    edtFechaSex: TTimeEdit;
    edtFechaQui: TTimeEdit;
    edtFechaQua: TTimeEdit;
    edtFechaTer: TTimeEdit;
    edtFechaSeg: TTimeEdit;
    tbAvaliacoes: TTabItem;
    Label53: TLabel;
    Line12: TLine;
    Rectangle13: TRectangle;
    chkAvaliaAmbiente: TCheckBox;
    Layout3: TLayout;
    Layout4: TLayout;
    Layout5: TLayout;
    Label54: TLabel;
    Layout6: TLayout;
    chkAvaliaPrecos: TCheckBox;
    Label55: TLabel;
    Layout7: TLayout;
    chkAvaliaLocalizacao: TCheckBox;
    Label56: TLabel;
    Layout8: TLayout;
    chkAvaliaLimpeza: TCheckBox;
    Label57: TLabel;
    Layout9: TLayout;
    chkAvaliaAtendimento: TCheckBox;
    Label58: TLabel;
    Label59: TLabel;
    actAvaliacoes: TChangeTabAction;
    imgDestaqueView: TImage;
    Label60: TLabel;
    Line13: TLine;
    Label61: TLabel;
    Image10: TImage;
    edtIfood: TEdit;
    Label62: TLabel;
    edtRappi: TEdit;
    Label63: TLabel;
    Image11: TImage;
    Image12: TImage;
    edtUberEats: TEdit;
    Label64: TLabel;
    edtAppleStore: TEdit;
    Image13: TImage;
    Label65: TLabel;
      procedure btnVoltarClick(Sender: TObject);
      procedure sbtnContinuarClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure edtCNPJEnter(Sender: TObject);
      procedure edtCNPJExit(Sender: TObject);
      procedure SpeedButton8Click(Sender: TObject);
      procedure edtCEPExit(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
         Shift: TShiftState);
      procedure edtCEPKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
         Shift: TShiftState);
      procedure edtDDDExit(Sender: TObject);
      procedure edtTelefoneEnter(Sender: TObject);
      procedure edtTelefoneExit(Sender: TObject);
      procedure sbtnAdicionarTelefoneClick(Sender: TObject);
      procedure sbtnDeleteTelClick(Sender: TObject);
      procedure lstCheckListCadDblClick(Sender: TObject);
      procedure lstCheckListSelDblClick(Sender: TObject);
      procedure sbtnAdicionarImagensClick(Sender: TObject);
      procedure sbtnDelImage1Click(Sender: TObject);
      procedure imgLogoClick(Sender: TObject);
      procedure sbtnDelLogoClick(Sender: TObject);
      procedure SpeedButton1Click(Sender: TObject);
      procedure sbtnSairClick(Sender: TObject);
      procedure lstCategoriaClick(Sender: TObject);
      procedure SpeedButton4Click(Sender: TObject);
      procedure SpeedButton3Click(Sender: TObject);
    procedure sbtnAbreClick(Sender: TObject);
    procedure sbtnParaClick(Sender: TObject);
    procedure sbtnVoltaClick(Sender: TObject);
    procedure sbtnFechaClick(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure edtSlogamKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure mmDescricaoKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure sbtnOKClick(Sender: TObject);
    procedure sbtnSalvarClick(Sender: TObject);
    procedure sgrdTelefonesCellDblClick(const Column: TColumn;
      const Row: Integer);
    procedure sbtnNaoClick(Sender: TObject);
    procedure sbtnSimClick(Sender: TObject);
    procedure mmTagComKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure imgDestaqueViewClick(Sender: TObject);

   private

      { Private declarations }
   public
   function getHorarios(fForm : TForm;fDiadaSemana : String) : String;
   procedure LimpaComercio;
      { Public declarations }
   end;

var
   frmComercio: TfrmComercio;
   vCount: Integer = 0;
   vLine: Integer = 0;
   vNextImage: Integer = 1;
   vPositionX: Integer = 8;
   vPositionY: Integer = 8;
   vDelete: Boolean = False;
   vListaImagens: TStringList;
   vSelected: String;
   vSubCat : String;

const
   cSemana: Array [1 .. 7] of String = ('Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab', 'Dom');

implementation

{$R *.fmx}

uses untGlobal, untDmGeral, untCategorias, untCheckList, untMensagens,
  untCaixaMsg, frmLogradouros;

procedure TfrmComercio.LimpaComercio;
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

function TfrmComercio.getHorarios(fForm : TForm;fDiadaSemana : String) : String;
var
vChk : String;
begin
if TCheckBox(fForm.FindComponent('chkFechado'+fDiadaSemana)).IsChecked then
   vChk := '1' else vChk := '0';
Result := TTimeEdit(fForm.FindComponent('edtAbre'+fDiadaSemana)).Text +
          TTimeEdit(fForm.FindComponent('edtPara'+fDiadaSemana)).Text +
          TTimeEdit(fForm.FindComponent('edtVolta'+fDiadaSemana)).Text +
          TTimeEdit(fForm.FindComponent('edtFecha'+fDiadaSemana)).Text +
          vChk;
end;

procedure TfrmComercio.btnVoltarClick(Sender: TObject);
begin
   sbtnContinuar.Visible := True;
   if tabCadastro.ActiveTab = tbInfoBasicas then
      begin
         Exit;
      end;
   if tabCadastro.ActiveTab = tbRedesSociais then
      begin
         actInfoBasicas.ExecuteTarget(Self);
         btnVoltar.Visible := False;
         Exit;
      end;
   if tabCadastro.ActiveTab = tbTelefones then
      begin
         actRedesSociais.ExecuteTarget(Self);
         Exit;
      end;
   if tabCadastro.ActiveTab = tbCheckList then
      begin
         actTelefones.ExecuteTarget(Self);
         Exit;
      end;
   if tabCadastro.ActiveTab = tbFuncionamento then
      begin
         actCategorias.ExecuteTarget(Self);
         Exit;
      end;
   if tabCadastro.ActiveTab = tbCategoria then
      begin
         actCheckList.ExecuteTarget(Self);
         Exit;
      end;
   if tabCadastro.ActiveTab = tbImagens then
      begin
         actFuncionamento.ExecuteTarget(Self);
         Exit;
      end;
   if tabCadastro.ActiveTab = tbAvaliacoes then
      begin
         sbtnSalvar.Visible := False;
         actSobre.ExecuteTarget(Self);
         Exit;
      end;
   if tabCadastro.ActiveTab = tbSobre then
      begin
         actImagens.ExecuteTarget(Self);
         Exit;
      end;
end;

procedure TfrmComercio.FormCreate(Sender: TObject);
var
   i: Integer;
begin
   sbtnSalvar.Visible := False;
   vListaImagens := TStringList.Create;
   for i := 0 to frmComercio.ComponentCount - 1 do
      begin
         if frmComercio.Components[i] is TTimeEdit then
            TTimeEdit(frmComercio.Components[i]).Time := StrToTime('00:00');
      end;
   btnVoltar.Visible := False;
   tabCadastro.TabPosition := TTabPosition.None;
   tabCadastro.ActiveTab := tbInfoBasicas;
   vCount := 0;
   With dmGeral.qryGeral do
      begin
         Close;
         Sql.Clear;
         Sql.Add('SELECT * FROM ALCHECKLIST');
         Sql.Add('ORDER BY DESCRCHECK');
         Open;
         lstCheckListCad.Clear;
         while not eof do
            begin
               lstCheckListCad.Items.Add(FieldByName('DESCRCHECK').AsString);
               Next;
            end;
         Close;
         Sql.Clear;
         Sql.Add('SELECT IDCAT, NOMECAT FROM ALCATEGORIA');
         Open;
         lstCategoria.Clear;
         While not eof do
            begin
               lstCategoria.Items.AddObject(FieldByName('NOMECAT').AsString, TObject(FieldByName('IDCAT').AsInteger));
               Next;
            end;
      end;
   lstCheckListSel.Clear;
   lstSubCategoria.Clear;
end;

procedure TfrmComercio.FormKeyDown(Sender: TObject; var Key: Word;
   var KeyChar: Char; Shift: TShiftState);
begin
   if Key = vkReturn then
      begin
         Key := vkTab;
         KeyDown(Key, KeyChar, Shift);
      end;
end;

procedure TfrmComercio.imgDestaqueViewClick(Sender: TObject);
begin
if OpenDialogjpg.Execute then
    begin
       if SizeImgPx(OpenDialogjpg.FileName) <> ctrSIZEIMGDESTAKE then
          begin
             fMsg(frmComercio,'', 'A foto do destaque deve estar no formato de ' + ctrSIZEIMGDESTAKE + ' px!',
                  fIconError, fBtnOK);
             Exit;
          end
       else
          begin
             imgDestaqueView.Bitmap.LoadFromFile(OpenDialogjpg.FileName);
          end;
    end;
end;

procedure TfrmComercio.imgLogoClick(Sender: TObject);
begin
   if OpenDialog.Execute then
      begin
         if SizeImgPx(OpenDialog.FileName) <> ctrSizeLogoComercio then
            begin
               fMsg(frmComercio,'', 'O logo da empresa deve estar no formato de ' + ctrSizeLogoComercio + ' px!',
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

procedure TfrmComercio.lstCategoriaClick(Sender: TObject);
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

procedure TfrmComercio.lstCheckListCadDblClick(Sender: TObject);
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

procedure TfrmComercio.lstCheckListSelDblClick(Sender: TObject);
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

procedure TfrmComercio.mmTagComKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
var
   vFaltante: Integer;
begin
   vFaltante := 200 - Length(mmTagCom.Text);

   label51.Text := vFaltante.ToString + ' caracteres';

end;

procedure TfrmComercio.mmDescricaoKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
var
   vFaltante: Integer;
begin
   vFaltante := 500 - Length(mmDescricao.Text);

   lblTotalMemo.Text := vFaltante.ToString + ' caracteres';
end;

procedure TfrmComercio.edtCEPExit(Sender: TObject);
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
If not preencheCEP(edtCEP.Text, Self) then
      fMsg(Self,'','CEP não encontrado, verifique.',fIconInterrogation,fBtnOK);

edtCEP.Text := FormatarCEP(edtCEP.Text);
end;

procedure TfrmComercio.edtCEPKeyDown(Sender: TObject; var Key: Word;
   var KeyChar: Char; Shift: TShiftState);
begin
   if KeyChar = #13 then
      sbtnAdicionarTelefoneClick(Sender);

   If not(KeyChar in ['0' .. '9', #08]) then
      KeyChar := #0;
end;

procedure TfrmComercio.edtCNPJEnter(Sender: TObject);
begin
   edtCNPJ.Text := formataCNPJCEP(edtCNPJ.Text, ffmtEnter);
end;

procedure TfrmComercio.edtCNPJExit(Sender: TObject);
var
   _doc: String;
begin
   if Length(edtCNPJ.Text) = 11 then
      begin
         ACBrValidador.TipoDocto := docCPF;
         _doc := 'CPF';
      end
   else
      begin
         ACBrValidador.TipoDocto := docCNPJ;
         _doc := 'CNPJ';
      end;

   ACBrValidador.Documento := edtCNPJ.Text;

   if not ACBrValidador.Validar then
      fMsg(frmComercio, '', _doc + ' inválido, verifique!', fIconExclamation, fBtnOK);
   edtCNPJ.Text := formataCNPJCEP(edtCNPJ.Text, 'fmtExit');
end;

procedure TfrmComercio.edtDDDExit(Sender: TObject);
begin
   edtDDD.Text := formataDDD(edtDDD.Text);
end;

procedure TfrmComercio.edtSlogamKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
var
   vFaltante: Integer;
begin
   vFaltante := 100 - Length(edtSlogam.Text);

   lblQtdeSlogam.Text := vFaltante.ToString + ' caracteres';

end;

procedure TfrmComercio.edtTelefoneEnter(Sender: TObject);
begin
   edtTelefone.Text := FormataFone(edtTelefone.Text, 'ffEnter');
end;

procedure TfrmComercio.edtTelefoneExit(Sender: TObject);
begin
edtTelefone.Text := FormataFone(edtTelefone.Text, 'ffExit');
end;

procedure TfrmComercio.sbtnContinuarClick(Sender: TObject);
begin
   btnVoltar.Visible := True;
   if tabCadastro.ActiveTab = tbInfoBasicas then
      begin
         actRedesSociais.ExecuteTarget(Self);
         Exit;
      end;
   if tabCadastro.ActiveTab = tbRedesSociais then
      begin
         actTelefones.ExecuteTarget(Self);
         Exit;
      end;

   if tabCadastro.ActiveTab = tbTelefones then
      begin
         actCheckList.ExecuteTarget(Self);
         Exit;
      end;
   if tabCadastro.ActiveTab = tbCheckList then
      begin
         actCategorias.ExecuteTarget(Self);
         Exit;
      end;
   if tabCadastro.ActiveTab = tbCategoria then
      begin
         actFuncionamento.ExecuteTarget(Self);
         Exit;
      end;
   if tabCadastro.ActiveTab = tbFuncionamento then
      begin
         actImagens.ExecuteTarget(Self);
         Exit;
      end;
   if tabCadastro.ActiveTab = tbSobre then
      begin
         sbtnSalvar.Visible := True;
         sbtnContinuar.Visible := False;
         actAvaliacoes.ExecuteTarget(Self);
         Exit;
      end;

   if tabCadastro.ActiveTab = tbImagens then
      begin
         actSobre.ExecuteTarget(Self);
         Exit;
      end;
end;

procedure TfrmComercio.sbtnDelImage1Click(Sender: TObject);
var
   vIndex: String;
   i: Integer;
begin
   vIndex := Copy(TSpeedButton(Sender).Name, Length(TSpeedButton(Sender).Name), 1);
   TImage(frmComercio.FindComponent('imgCom' + vIndex)).Bitmap := nil;
   TSpeedButton(Sender).Visible := False;
   vListaImagens.Delete(vIndex.ToInteger - 1);
   vNextImage := vNextImage - 1;

   for i := 1 to 8 do
      begin
         TImage(frmComercio.FindComponent('imgCom' + i.ToString)).Bitmap := nil;
         TSpeedButton(frmComercio.FindComponent('sbtnDelImage' + i.ToString)).Visible := False;
      end;
   for i := 0 to vListaImagens.Count - 1 do
      begin
         TImage(frmComercio.FindComponent('imgCom' + (i + 1).ToString)).Bitmap.LoadFromFile(vListaImagens.Strings[i]);
         TSpeedButton(frmComercio.FindComponent('sbtnDelImage' + (i + 1).ToString)).Visible := True;
      end;
end;

procedure TfrmComercio.sbtnDelLogoClick(Sender: TObject);
begin
   pLoadImage(imgAdicionar, 'imgAdicionar');
   imgLogo.Bitmap := nil;
   sbtnDelLogo.Visible := False;
end;

procedure TfrmComercio.sbtnFechaClick(Sender: TObject);
var
i : Integer;
begin
for i := 2 to 7 do
   TTimeEdit(Self.FindComponent('edtFecha'+cSemana[i])).Time := edtFechaSeg.Time;
end;

procedure TfrmComercio.sbtnNaoClick(Sender: TObject);
begin
   recModal.Visible := False;
end;

procedure TfrmComercio.sbtnOKClick(Sender: TObject);
begin
recModal.Visible := False;
end;

procedure TfrmComercio.sbtnParaClick(Sender: TObject);
var
i : Integer;
begin
for i := 2 to 7 do
   TTimeEdit(Self.FindComponent('edtPara'+cSemana[i])).Time := edtParaSeg.Time;
end;

procedure TfrmComercio.sbtnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmComercio.sbtnSalvarClick(Sender: TObject);
var
i, vAviso,vErro : Integer;
vlbi : TListBoxItem;
_doc, vDoc: String;
begin
vListaErros := TStringList.Create;
vListaErros.Clear;
//InfoBasicas
if Pos('.',edtCNPJ.Text) > 0 then
   vDoc := formataCNPJCEP(edtCNPJ.Text,ffmtEnter);
if Length(vDoc) = 11 then
   begin
      ACBrValidador.TipoDocto := docCPF;
      _doc := 'CPF';
   end
else
   begin
      ACBrValidador.TipoDocto := docCNPJ;
      _doc := 'CNPJ';
   end;

ACBrValidador.Documento := vDoc;

if not ACBrValidador.Validar then
   vListaErros.Add('0|'+_doc + ' inválido, verifique!');
if Trim(edtCNPJ.Text) = '' then
   vListaErros.Add('0|O campo CNPJ esta em branco.');
With dmGeral.qryGeral do
   begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT * FROM ALCOMERCIO');
      Sql.Add('WHERE CNPJCOM = :CNPJ');
      Params[0].AsString := vDoc;
      Open;
      if RecordCount > 0 then
         vListaErros.Add('0|_doc ja esta cadastrado com o cliente: "'+FieldByName('RAZAOCOM').AsString+'"');
   end;
if Length(edtRazao.Text) < 5 then
   vListaErros.Add('0|O campo razão social esta em branco ou o preenchimento é inválido.');
if Length(edtFantasia.Text) < 5 then
   vListaErros.Add('1|O campo nome fantasia esta em branco ou o preenchimento é inválido.');
if Length(edtLogradouro.Text) < 3 then
   vListaErros.Add('0|O campo logradouro esta em branco ou o preenchimento é inválido.');
if Length(edtBairro.Text) < 3 then
   vListaErros.Add('0|O campo bairro esta em branco ou o preenchimento é inválido.');
if Length(edtCEP.Text) < 9 then
   vListaErros.Add('0|O campo CEP esta em branco ou o preenchimento é inválido.');
if Length(edtCidade.Text) < 5 then
   vListaErros.Add('0|O Campo cidade esta em branco ou o preenchimento é inválido.');
if Length(edtUF.Text) < 2 then
   vListaErros.Add('0|O Campo UF esta em branco ou o preenchimento é inválido.');
if Pos(edtUF.Text,gEstados) = 0 then
   vListaErros.Add('0|A sigla ' + edtUF.Text + ' é inválida.');
//RedesSociais
if Trim(edtFace.Text) = '' then
   vListaErros.Add('1|Campo Facebook esta vazio');
if Trim(edtInsta.Text) = '' then
   vListaErros.Add('1|Campo Instagram esta vazio');
if Trim(edtTwiter.Text) = '' then
   vListaErros.Add('1|Campo Twiter esta vazio');
if Trim(edtYoutube.Text) = '' then
   vListaErros.Add('1|Campo Youtube esta vazio');
if Trim(edtGoogle.Text) = '' then
   vListaErros.Add('1|Campo Google + esta vazio');
if Trim(edtSite.Text) = '' then
   vListaErros.Add('1|Campo Site esta vazio');
if Trim(edtEmail.Text) = '' then
   vListaErros.Add('1|Campo Email esta vazio');
if Trim(edtUberEats.Text) = '' then
   vListaErros.Add('1|Campo Uber Eats esta vazio');
if Trim(edtIfood.Text) = '' then
   vListaErros.Add('1|Campo IFood esta vazio');
if Trim(edtRappi.Text) = '' then
   vListaErros.Add('1|Campo Rappi esta vazio');

//Telefones
if sgrdTelefones.RowCount = 0 then
   vListaErros.Add('0|É necessário cadastrar pelo menos um número de telefone!');

for i := 0 to sgrdTelefones.RowCount - 1 do
   begin
      if Pos('-',sgrdTelefones.Cells[1,i]) = 0 then
         vListaErros.Add('0|O telefone "'+sgrdTelefones.Cells[1,i]+'" esta com o formato inválido!');

      With dmGeral.qryGeral do
         begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT * FROM ALFONE f');
            Sql.Add('INNER JOIN ALCOMERCIO c');
            Sql.Add('ON (c.IDCOM = f.IDCOM_FONE)');
            Sql.Add('WHERE (DDDFONE = :DDD) AND (TELFONE = :TEL)');
            Params[0].AsString := sgrdTelefones.Cells[0,i];
            Params[1].AsString := sgrdTelefones.Cells[1,i];
            Open;
            if RecordCount > 0 then
               begin
                  vListaErros.Add('0|'+sgrdTelefones.Cells[0,i]+' '+sgrdTelefones.Cells[1,i] +
                              ' ja encontra-se cadastrado com o cliente '+
                              FieldByName('RAZAOCOM').AsString);
               end;
         end;
   end;
if lstCheckListSel.Count <= 0 then
   vLIstaErros.Add('1|Atenção!! Nenhum checklist foi selecionado!');
//Categorias
vSubCat := '';
for i := 0 to lstSubCategoria.Items.Count - 1 do
   begin
      vlbi := TListBoxItem(lstSubCategoria.ListItems[i]);
      if vlbi.IsChecked then
         vSubCat := vSubCat + Integer(TObject(lstSubCategoria.Items[lstSubCategoria.ItemIndex])).ToString+'|'
   end;
if vSubCat = '' then
   vListaErros.Add('0|Nehuma sub-categoria foi selecionada, é necessário selecionar pelo menos uma sub-categoria!');
vListaErros.Add('2|O horário de funcionamento não é verificado no salvamento, verifique se esta correto antes de continuar!');
if imgLogo.Bitmap.IsEmpty then
   vListaErros.Add('0|É preciso selecionar o logo da empresa!');
if imgDestaqueView.Bitmap.IsEmpty then
   vListaErros.Add('0|É preciso selecionar a imagem de destaque da empresa!');
if imgCom1.Bitmap.IsEmpty then
   vListaErros.Add('0|É necessário selecionar ao menos uma foto da empresa!');
if Trim(edtTitulo.Text) = '' then
   vListaErros.Add('0|É necessário preencher o campo titulo da empresa!');
if Length(Trim(mmDescricao.Text)) <= 0 then
   vListaErros.Add('1|Você não preencheu a descrição da empresa!');
if Trim(edtSlogam.Text) = '' then
   vListaErros.Add('1|Você não preencheu o slogam da empresa!');
if Trim(mmTagCom.Text) = '' then
   vListaErros.Add('0|O campo TAG é obrigatório pois sem ele a empresa não aparecera nas pesquisas!');

With dmGeral.qryGeral do
   begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT * FROM ALCOMERCIO');
      Sql.Add('WHERE CNPJCOM = :CNPJ');
      Params[0].AsString := edtCNPJ.Text;
      Open;
      if RecordCount > 0 then
         begin
            vListaErros.Add(edtCNPJ.Text+ ' já esta cadastrado para a empresa '+FieldByName('RAZAOCOM').AsString);
            Exit;
         end;
   end;
   vAviso := 0;
   vErro  := 0;
   for i := 0 to vListaErros.Count - 1 do
      begin
         if Copy(vListaErros.Strings[i],1,1) = '0' then vErro := vErro + 1;
         if Copy(vListaErros.Strings[i],1,1) = '1' then vAviso := vAviso + 1;
     end;
      if frmMensagens = nil then
         begin
            Application.CreateForm(TfrmMensagens,frmMensagens);
            if vErro = 0 then
               frmMensagens.sbtnSalvar.Visible := True
            else
               frmMensagens.sbtnSalvar.Visible := False;

            frmMensagens.lblErros.Text := vErro.ToString + ' erro(s) encontrado(s)';
            frmMensagens.lblAviso.Text := vAviso.ToString + ' aviso(s) encontrado(s)';

            frmMensagens.ShowModal;
         end
      else
         begin
            if vErro = 0 then
               frmMensagens.sbtnSalvar.Visible := True
            else
               frmMensagens.sbtnSalvar.Visible := False;

            frmMensagens.lblErros.Text := vErro.ToString + ' erro(s) encontrado(s)';
            frmMensagens.lblAviso.Text := vAviso.ToString + ' aviso(s) encontrado(s)';

            frmMensagens.FormShow(Sender);
         end;
end;

procedure TfrmComercio.sbtnSimClick(Sender: TObject);
begin
//Cadastro de CEP
With frm_Logradouros do
   begin
      edtCEP.Text := frmComercio.edtCEP.Text;
      Tag := 1;
      edtLogradouro.SetFocus;
      ShowModal;
   end;
end;

procedure TfrmComercio.sbtnVoltaClick(Sender: TObject);
var
i : Integer;
begin
for i := 2 to 7 do
   TTimeEdit(Self.FindComponent('edtVolta'+cSemana[i])).Time := edtVoltaSeg.Time;
end;

procedure TfrmComercio.sgrdTelefonesCellDblClick(const Column: TColumn;
  const Row: Integer);
begin
edtDDD.Text      := sgrdTelefones.Cells[0, sgrdTelefones.Row];
edtTelefone.Text := sgrdTelefones.Cells[1, sgrdTelefones.Row];
edtContato.Text  := sgrdTelefones.Cells[2, sgrdTelefones.Row];
if sgrdTelefones.Cells[3, sgrdTelefones.Row] = '●' then
   chkWhats.IsChecked := True else chkWhats.IsChecked := False;
if sgrdTelefones.Cells[4,sgrdTelefones.Row] = '●' then
   chkInterno.IsChecked := True else chkInterno.IsChecked := False;

sbtnDeleteTelClick(frmComercio);
end;

procedure TfrmComercio.sbtnAdicionarTelefoneClick(Sender: TObject);
var
i : Integer;
begin
   if (Length(Trim(edtDDD.Text)) = 0) or (Length(Trim(edtTelefone.Text)) = 0)
   then
      begin
         fMsg(frmComercio, '', 'É necessário preencher o campo DDD e Telefone!',
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

procedure TfrmComercio.SpeedButton1Click(Sender: TObject);
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

procedure TfrmComercio.sbtnDeleteTelClick(Sender: TObject);
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

procedure TfrmComercio.SpeedButton3Click(Sender: TObject);
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

procedure TfrmComercio.SpeedButton4Click(Sender: TObject);
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

procedure TfrmComercio.SpeedButton7Click(Sender: TObject);
begin
frmChekList.ShowModal;
end;

procedure TfrmComercio.sbtnAbreClick(Sender: TObject);
var
i : Integer;
begin
for i := 2 to 7 do
   TTimeEdit(Self.FindComponent('edtAbre'+cSemana[i])).Time := edtAbreSeg.Time;
end;

procedure TfrmComercio.sbtnAdicionarImagensClick(Sender: TObject);
begin
   if vNextImage > 8 then
      begin
         fMsg(frmComercio, '', 'Só é possivel adicionar 8 imagens por comércio!',
            fIconInformation, fBtnOK);
         Exit;
      end
   else
      begin
         if OpenDialogjpg.Execute then
            begin
               if SizeImgPx(OpenDialogjpg.FileName) <> ctrSIZEANUNCIOCOMERCIO then
                  begin
                     fMsg(frmComercio,'', 'As fotos devem estar no formato de '+ctrSIZEANUNCIOCOMERCIO+' px!',
                        fIconError, fBtnOK);
                     Exit;
                  end
               else
                  begin
                     TSpeedButton(frmComercio.FindComponent('sbtnDelImage' + vNextImage.ToString)).Visible := True;
                     TImage(frmComercio.FindComponent('imgCom' + vNextImage.ToString)).Bitmap.LoadFromFile(OpenDialogjpg.FileName);
                     vNextImage := vNextImage + 1;
                     vListaImagens.Add(OpenDialogjpg.FileName);
                  end;
            end;
      end;
end;

procedure TfrmComercio.SpeedButton8Click(Sender: TObject);
begin
   recMsg.Visible := False;
   recModal.Visible := False;
end;

end.
