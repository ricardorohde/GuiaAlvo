unit untCategorias;

interface

uses
   System.SysUtils, System.Types, System.UITypes, System.Classes,
   System.Variants,
   FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
   FMX.ListBox, FMX.StdCtrls, FMX.Objects, FMX.Edit, FMX.Controls.Presentation,
   FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
   FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
   FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
   FireDAC.Comp.Client, FMX.ScrollBox, FMX.Memo, FMX.TabControl, System.Actions,
  FMX.ActnList, FMX.Colors, FMX.Menus, Guia.Controle;

type
   TfrmCategorias = class(TForm)
    ActionList: TActionList;
    actCategoria: TChangeTabAction;
    actSubCategoria: TChangeTabAction;
    tabCategorias: TTabControl;
    tbCategorias: TTabItem;
    imgAdicionar: TImage;
    Rectangle1: TRectangle;
    sbtnIncluir: TSpeedButton;
    Panel1: TPanel;
    sbtnSair: TSpeedButton;
    Label2: TLabel;
    Line1: TLine;
    Label3: TLabel;
    edtCategorias: TEdit;
    Label40: TLabel;
    lstCategorias: TListBox;
    Label1: TLabel;
    OpenDialog: TOpenDialog;
    mmDetalhesCat: TMemo;
    Label4: TLabel;
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
    tbSubCategorias: TTabItem;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    Label5: TLabel;
    Line2: TLine;
    Label6: TLabel;
    Label7: TLabel;
    lblCategoria: TLabel;
    Line3: TLine;
    edtSubCategoria: TEdit;
    Label8: TLabel;
    lstSubCategoria: TListBox;
    Rectangle2: TRectangle;
    SpeedButton4: TSpeedButton;
    sbtnVoltar: TSpeedButton;
    Rectangle8: TRectangle;
    Rectangle3: TRectangle;
    ColorPanel1: TColorPanel;
    Label10: TLabel;
    recImagem: TRectangle;
    PopupMenu1: TPopupMenu;
    MenuItem1: TMenuItem;
    lblStatusCat: TLabel;
    lblStatusSubCat: TLabel;
    Timer: TTimer;
    imgIcoCat: TImage;
    sbtnDelIco: TSpeedButton;
    MenuItem2: TMenuItem;
      procedure imgIcoCatClick(Sender: TObject);
      procedure sbtnDelIcoClick(Sender: TObject);
      procedure sbtnIncluirClick(Sender: TObject);
      procedure sbtnSimClick(Sender: TObject);
      procedure sbtnOKClick(Sender: TObject);
    procedure sbtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lstCategoriasDblClick(Sender: TObject);
    procedure sbtnVoltarClick(Sender: TObject);
    procedure sbtnDelIcoSCatClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure ColorPanel1Change(Sender: TObject);
    procedure lstSubCategoriaDblClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure MenuItem2Click(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   frmCategorias: TfrmCategorias;
   pIdCat, pIdSubCat : Integer;
   pImagem, pStatus : String;
implementation

{$R *.fmx}

uses untComercio, untGlobal, untDmGeral, Winapi.Windows, System.UIConsts,
  untPrincipal, FMX.Platform.Win;



procedure TfrmCategorias.ColorPanel1Change(Sender: TObject);
begin
if imgIcoCat.Bitmap.IsEmpty = False then
   recImagem.Fill.Color := ColorPanel1.Color;
end;

procedure TfrmCategorias.FormCreate(Sender: TObject);
begin
   tabCategorias.TabPosition := TTabPosition.None;
   tabCategorias.ActiveTab   := tbCategorias;
end;

procedure TfrmCategorias.FormKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
if (Key = VK_ESCAPE) and (Timer.Enabled) then
   begin
      fMsg(Self,'','Tem certeza que deseja cancelar a alteração deste registro?',fIconInterrogation,fbtnYesNo);
      Tag := 2;
   end;
end;

procedure TfrmCategorias.FormShow(Sender: TObject);
begin
With dmGeral.qryCategoria do
   begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT * FROM ALCATEGORIA');
      Open;
      lstCategorias.Clear;
      While not eof do
         begin
            lstCategorias.Items.AddObject(FieldByName('NOMECAT').AsString,TObject(FieldByName('IDCAT').AsInteger));
            Next;
         end;
   end;
FormCreate(Sender);
pStatus := 'INS';
edtCategorias.Text := '';
mmDetalhesCat.Text := '';
imgIcoCat.Bitmap := nil;
pLoadImage(imgAdicionar,'imgAdicionar');
sbtnDelIco.Visible := False;
end;

procedure TfrmCategorias.imgIcoCatClick(Sender: TObject);
begin
   if OpenDialog.Execute then
      begin
         if SizeImgPx(OpenDialog.FileName) <> ctrSIZEIMGSECOES then
            begin
               fMsg(frmCategorias, '', 'O icone da categoria deve estar no formato de '+ctrSIZEIMGSECOES+' px!',
                  fIconError, fBtnOK);
               Exit;
            end
         else
            begin
               imgAdicionar.Bitmap := nil;
               imgIcoCat.Bitmap.LoadFromFile(OpenDialog.FileName);

               pNameFile := 'ICO'+GeraNameFile + ExtractFileExt(OpenDialog.FileName);
               pNewFile := gPathArquivos+'\Icones\' + pNameFile;
               pOldFile := OpenDialog.FileName;

               recImagem.Fill.Color := ColorPanel1.Color;
               sbtnDelIco.Visible := True;
            end;
      end;
end;

{procedure TfrmCategorias.imgIcoSubCatClick(Sender: TObject);
begin
   if OpenDialog.Execute then
      begin
         if SizeImgPx(OpenDialog.FileName) <> gSizeSecoes then
            begin
               fMsg(frmCategorias, '', 'O icone da sub-categoria deve estar no formato de '+gSizeSecoes+' px!',
                  fIconError, fBtnOK);
               Exit;
            end
         else
            begin

               pNameFile := 'ICO'+GeraNameFile + ExtractFileExt(OpenDialog.FileName);
               pNewFile := gPathArquivos+'\' + pNameFile;
               pOldFile := OpenDialog.FileName;

               sbtnDelIco.Visible := True;
            end;
      end
   else
      begin
         Exit;
      end;
end;  }

procedure TfrmCategorias.lstCategoriasDblClick(Sender: TObject);
begin
if lstCategorias.ItemIndex >= 0  then
   begin
      pIdCat := Integer(lstCategorias.Items.Objects[lstCategorias.ItemIndex]);
      lblCategoria.Text := lstCategorias.Items[lstCategorias.ItemIndex];

      With dmGeral.qryCategoria do
         begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT * FROM ALSUBCATEGORIA');
            Sql.Add('WHERE IDCAT_SUBCAT = :IDSUBCAT');
            Params[0].AsInteger := pIdCat;
            Open;
            lstSubCategoria.Clear;
            While not eof do
               begin
                  lstSubCategoria.Items.AddObject(FieldByName('NOMESUBCAT').AsString,
                        TObject(FieldByName('IDSUBCAT').AsInteger));
                  Next;
               end;
         end;
      actSubCategoria.ExecuteTarget(Self);
   end;
end;

procedure TfrmCategorias.lstSubCategoriaDblClick(Sender: TObject);
begin
if Timer.Enabled then
   begin
      fMsg(Self,'','É necessário salvar ou cancelar a edição deste registro!',fIconExclamation,fBtnOK);
      Exit;
   end
else
   begin
      pIdSubCat := Integer(lstSubCategoria.Items.Objects[lstSubCategoria.ItemIndex]);
      With dmGeral.qryGeral do
         begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT * FROM ALSUBCATEGORIA s');
            Sql.Add('INNER JOIN ALCATEGORIA c');
            Sql.Add('ON (s.IDCAT_SUBCAT = c.IDCAT)');
            Sql.Add('WHERE s.IDSUBCAT = :IDSUBCAT');
            Params[0].AsInteger := pIdSubCat;
            Open;
            edtSubCategoria.Text := lstSubCategoria.Items[lstSubCategoria.ItemIndex];
//            imgIcoSubCat.Bitmap.LoadFromFile(gPathArquivos+'\'+FieldByName('IMGSUBCAT').AsString);
//            imgAdSub.Bitmap := nil;
//            recImagemSubCat.Fill.Color := StringToAlphaColor(FieldByName('CORCAT').AsString);
            pStatus := 'UPD';
            lstSubCategoria.Items.Delete(lstSubCategoria.ItemIndex);
            Timer.Enabled := True;
            pNameFile := '';
         end;
   end;
end;

procedure TfrmCategorias.MenuItem1Click(Sender: TObject);
begin
if Timer.Enabled then
   begin
      fMsg(Self,'','É necessário salvar ou cancelar a edição deste registro!',fIconExclamation,fBtnOK);
      Exit;
   end
else
   begin
      pIdCat := Integer(lstCategorias.Items.Objects[lstCategorias.ItemIndex]);
      With dmGeral.qryGeral do
         begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT * FROM ALCATEGORIA');
            Sql.Add('WHERE IDCAT = :IDCAT');
            Params[0].AsInteger := pIdCat;
            Open;
            edtCategorias.Text := lstCategorias.Items[lstCategorias.ItemIndex];
            imgIcoCat.Bitmap.LoadFromFile(gPathArquivos+'\Icones\'+FieldByName('IMGCAT').AsString);
            imgAdicionar.Bitmap := nil;
            recImagem.Fill.Color := StringToAlphaColor(FieldByName('CORCAT').AsString);
            mmDetalhesCat.Text := FieldByName('DETALHECAT').AsString;
            pImagem := FieldByName('IMGCAT').AsString;
            pStatus := 'UPD';
            lstCategorias.Items.Delete(lstCategorias.ItemIndex);
            ColorPanel1.Color := StringToAlphaColor(FieldByName('CORCAT').AsString);
            Timer.Enabled := True;
            pNameFile := '';
         end;
   end;
end;

procedure TfrmCategorias.MenuItem2Click(Sender: TObject);
begin
if Timer.Enabled then
   begin
      fMsg(Self,'','É necessário salvar ou cancelar a edição deste registro!',fIconExclamation,fBtnOK);
      Exit;
   end
else
   begin
   if gAutorizado then
      begin
         if MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                       'Com a exclusão da categoria todas as'+#13+
                       'subcategorias serão excluidas também.'+#13+
                       'Deseja continuar?','Exclusão',
                        MB_YESNO + MB_ICONWARNING) = IDYES then
            begin
               if MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                       'Este processo é ireeversivel!!!'+#13+
                       'Tem certeza que deseja continuar?','Exclusão',
                        MB_YESNO + MB_ICONWARNING) = IDYES then
                  begin
                  pIdCat := Integer(lstCategorias.Items.Objects[lstCategorias.ItemIndex]);
                  With dmGeral.qryGeral do
                     begin
                        Close;
                        Sql.Clear;
                        Sql.Add('SELECT * FROM ALCATEGORIA');
                        Sql.Add('WHERE IDCAT = :IDCAT');
                        Params[0].AsInteger := pIdCat;
                        Open;

                        DeleteFileFtp(ctrPATHICONESFTP, FieldByName('IMGCAT').AsString);

                        Close;
                        Sql.Clear;
                        Sql.Add('DELETE FROM ALCATEGORIA ');
                        Sql.Add('WHERE IDCAT = :IDCAT');
                        Params[0].AsInteger := pIdCat;
                        ExecSql;
                        lstCategorias.Items.Delete(lstCategorias.ItemIndex);
                     end;
                  end
               else
                  begin
                     Exit;
                  end;

            end
         else
            begin
               MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                          pChar(frmPrincipal.lblUsuario.Text+
                          ' você não tem autorização para excluir este registro!'),
                          'Exclusão', MB_OK + MB_ICONEXCLAMATION);
                Exit;
            end;
      end;
   end;
end;

procedure TfrmCategorias.PopupMenu1Popup(Sender: TObject);
begin
MenuItem1.Enabled := True;
   Try
      pIdCat := Integer(lstCategorias.Items.Objects[lstCategorias.ItemIndex]);
      MenuItem1.Text := 'Alterar ' + lstCategorias.Items[lstCategorias.ItemIndex];
      MenuItem2.Text := 'Excluir ' + lstCategorias.Items[lstCategorias.ItemIndex];
   Except
      MenuItem1.Enabled := False;
      MenuItem1.Text := 'Nenhuma categoria selecionada';
   end;
end;

procedure TfrmCategorias.sbtnDelIcoClick(Sender: TObject);
begin
   imgIcoCat.Bitmap := nil;
   pLoadImage(imgAdicionar, 'imgAdicionar');
   sbtnDelIco.Visible := False;
end;

procedure TfrmCategorias.sbtnDelIcoSCatClick(Sender: TObject);
begin
//   imgIcoSubCat.Bitmap := nil;
//   pLoadImage(imgAdSub, 'imgAdicionar');
//   sbtnDelIcoSCat.Visible := False;
end;

procedure TfrmCategorias.sbtnIncluirClick(Sender: TObject);
var
   i: Integer;
   vRepetido: Boolean;
   S : String;
begin
if pStatus = 'INS' then
   S := 'inclusão' else S := 'alteração';
   if Length(Trim(edtCategorias.Text)) <= 0 then
      begin
         fMsg(frmCategorias, '', 'É necessário preencher o nome da categoria!',
            fIconInformation, fBtnOK);
         Exit;
      end;
   if imgIcoCat.Bitmap.IsEmpty then
      begin
         fMsg(frmCategorias, '', 'É necessário selecionar uma imagem para a categoria!',
            fIconInformation, fBtnOK);
         Exit;
      end;

   vRepetido := False;

   for i := 0 to lstCategorias.Count - 1 do
      if lstCategorias.Items.Strings[i] = edtCategorias.Text then
         vRepetido := True;
   Tag := 1;
   if vRepetido then
      begin
         fMsg(frmCategorias, '', edtCategorias.Text + ' ja esta cadastrado, verifique!',
            fIconInformation, fBtnOK);
         Exit;
      end
   else
      begin
         sbtnSimClick(Self);
         //fMsg(frmCategorias, '', 'Confirma a '+S+' da categoria ' + edtCategorias.Text +'?',
         //   fIconInterrogation, fbtnYesNo);
      end;
end;

procedure TfrmCategorias.sbtnOKClick(Sender: TObject);
begin
   recModal.Visible := False;
end;

procedure TfrmCategorias.sbtnSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmCategorias.sbtnSimClick(Sender: TObject);
var
vFile : String;
begin
//Inclusao Categoria
   if (Tag = 1) and (pStatus = 'INS') then
      begin
         With dmGeral.qryCategoria do
            begin
               Close;
               Sql.Clear;
               Sql.Add('INSERT INTO ALCATEGORIA');
               Sql.Add('(NOMECAT, DETALHECAT, IMGCAT, CORCAT) VALUES ');
               Sql.Add('(:NOMECAT, :DETALHECAT, :IMGCAT, :CORCAT)');
               Params[0].AsString := edtCategorias.Text;
               Params[1].AsString := mmDetalhesCat.Text;
               Params[2].AsString := pNameFile;
               Params[3].AsString := AlphaColorToString(ColorPanel1.Color);
               ExecSql;

               CopyFile(pWideChar(pOldFile), pWideChar(pNewFile), False);

               ColorPanel1.Color := StringToAlphaColor('#00FFFFFF');
               recImagem.Fill.Color := StringToAlphaColor('#00E0E0E0');
               //imgAdSub.Bitmap := nil;
               //imgIcoSubCat.Bitmap := imgIcoCat.Bitmap;
               FormShow(Sender);
               edtCategorias.Text := '';
               sbtnDelIcoClick(Sender);
               mmDetalhesCat.Text := '';
               recModal.Visible := False;
            end;
      end;
//Alteracao Categoria
   if (Tag = 1) and (pStatus = 'UPD') then
      begin
         With dmGeral.qryCategoria do
            begin
               Close;
               Sql.Clear;
               Sql.Add('UPDATE ALCATEGORIA SET');
               Sql.Add('NOMECAT    =  :NOMECAT,');
               Sql.Add('DETALHECAT =  :DETALHECAT,');
               Sql.Add('CORCAT     =  :CORCAT,');
               Sql.Add('UPDATECAT  =  :UPDATECAT');
               Sql.Add('WHERE IDCAT = :IDCAT');

               Params[0].AsString  := edtCategorias.Text;
               Params[1].AsString  := mmDetalhesCat.Text;
               Params[2].AsString  := AlphaColorToString(ColorPanel1.Color);
               Params[3].AsString  := '1';
               Params[4].AsInteger := pIdCat;
               ExecSql;

               if pNameFile <> '' then
                  imgIcoCat.Bitmap.SaveToFile(gPathArquivos+'\Icones\'+pImagem);
               ColorPanel1.Color := StringToAlphaColor('#00FFFFFF');
               recImagem.Fill.Color := StringToAlphaColor('#00E0E0E0');
               FormShow(Sender);
               edtCategorias.Text := '';
               sbtnDelIcoClick(Sender);
               mmDetalhesCat.Text := '';
               recModal.Visible := False;
               Timer.Enabled := False;
               lblStatusCat.Visible   := False;
               lblStatusSubCat.Visible := False;
            end;
      end;
//Cancelar Alteração

//Categoria
if Tag = 2 then
   begin
      if tabCategorias.ActiveTab = tbCategorias then
         begin
            ColorPanel1.Color := StringToAlphaColor('#00FFFFFF');
            recImagem.Fill.Color := StringToAlphaColor('#00E0E0E0');
            FormShow(Sender);
            edtCategorias.Text := '';
            sbtnDelIcoClick(Sender);
            mmDetalhesCat.Text := '';
            recModal.Visible := False;
            Timer.Enabled := False;
            lblStatusCat.Visible   := False;
            lblStatusSubCat.Visible := False;
         end;

      //SubCategoria
      if tabCategorias.ActiveTab = tbSubCategorias then
         begin
            With dmGeral.qryCategoria do
               begin
                  Close;
                  Sql.Clear;
                  Sql.Add('SELECT * FROM ALSUBCATEGORIA');
                  Sql.Add('WHERE IDCAT_SUBCAT = :IDCAT_SUBCAT');
                  Params[0].AsInteger := pIdCat;
                  Open;
                  lstSubCategoria.Clear;
                  While not eof do
                     begin
                        lstSubCategoria.Items.AddObject(FieldByName('NOMESUBCAT').AsString,
                           TObject(FieldByName('IDSUBCAT').AsInteger));
                        Next;
                     end;
//                  ColorPanel1.Color := StringToAlphaColor('#00FFFFFF');
                  edtSubCategoria.Text := '';
                  sbtnDelIcoSCatClick(Sender);
                  recModal.Visible := False;
                  Timer.Enabled := False;
                  lblStatusCat.Visible    := False;
                  lblStatusSubCat.Visible := False;
                  pStatus := 'INS';
               end;
         end;
   end;

//Inclusao Sub-Categoria
   if (Tag = 3) and (pStatus = 'INS') then
      begin
         With dmGeral.qryCategoria do
            begin
               Close;
               Sql.Clear;
               Sql.Add('INSERT INTO ALSUBCATEGORIA');
               Sql.Add('(NOMESUBCAT, IDCAT_SUBCAT) VALUES ');
               Sql.Add('(:NOMESUBCAT, :IDCAT_SUBCAT)');
               Params[0].AsString  := Self.edtSubCategoria.Text;
               Params[1].AsInteger := pIdCat;
               ExecSql;

               Close;
               Sql.Clear;
               Sql.Add('SELECT * FROM ALSUBCATEGORIA');
               Sql.Add('WHERE IDCAT_SUBCAT = :IDCAT_SUBCAT');
               Params[0].AsInteger := pIdCat;
               Open;
               lstSubCategoria.Clear;
               While not eof do
                  begin
                     lstSubCategoria.Items.AddObject(FieldByName('NOMESUBCAT').AsString,
                        TObject(FieldByName('IDSUBCAT').AsInteger));
                     Next;
                  end;
               edtSubCategoria.Text := '';
               ColorPanel1.Color := StringToAlphaColor('#00FFFFFF');
               sbtnDelIcoSCatClick(Sender);
               recModal.Visible := False;
            end;
      end;
//Alteração Sub-Categoria
   if (Tag = 3) and (pStatus = 'UPD') then
      begin
         With dmGeral.qryCategoria do
            begin
               Close;
               Sql.Clear;
               Sql.Add('UPDATE ALSUBCATEGORIA SET');
               Sql.Add('NOMESUBCAT   = :NOMESUBCAT,');
               Sql.Add('UPDATESUBCAT = :UPDATESUBCAT');
               Sql.Add('WHERE IDSUBCAT = :IDSUBCAT');
               Params[0].AsString  := edtSubCategoria.Text;
               Params[1].AsString  := '1';
               Params[2].AsInteger := pIdSubCat;
               ExecSql;

               //if pNameFile <> '' then
               //   imgIcoSubCat.Bitmap.SaveToFile(gPathArquivos+'\'+pImagem);

               Close;
               Sql.Clear;
               Sql.Add('SELECT * FROM ALSUBCATEGORIA');
               Sql.Add('WHERE IDCAT_SUBCAT = :IDCAT_SUBCAT');
               Params[0].AsInteger := pIdCat;
               Open;
               lstSubCategoria.Clear;
               While not eof do
                  begin
                     lstSubCategoria.Items.AddObject(FieldByName('NOMESUBCAT').AsString,
                        TObject(FieldByName('IDSUBCAT').AsInteger));
                     Next;
                  end;
               edtSubCategoria.Text := '';
               sbtnDelIcoSCatClick(Sender);
               recModal.Visible := False;
               Timer.Enabled := False;
               ColorPanel1.Color := StringToAlphaColor('#00FFFFFF');
               lblStatusCat.Visible   := False;
               lblStatusSubCat.Visible := False;
               pStatus := 'INS';
            end;
      end;
end;

procedure TfrmCategorias.sbtnVoltarClick(Sender: TObject);
begin
actCategoria.ExecuteTarget(Self);
end;

procedure TfrmCategorias.SpeedButton4Click(Sender: TObject);
var
   i: Integer;
   vRepetido: Boolean;
   S : String;
begin
if pStatus = 'INS' then
   S := 'inclusão' else S := 'alteração';
   if Length(Trim(edtSubCategoria.Text)) <= 0 then
      begin
         fMsg(frmCategorias, '', 'É necessário preencher o nome da sub-categoria!',
            fIconInformation, fBtnOK);
         Exit;
      end;

   vRepetido := False;
   Tag := 3;
   for i := 0 to lstSubCategoria.Count - 1 do
      if lstSubCategoria.Items.Strings[i] = edtSubCategoria.Text then
         vRepetido := True;

   if vRepetido then
      begin
         fMsg(frmCategorias, '', edtSubCategoria.Text + ' ja esta cadastrado, verifique!',
            fIconInformation, fBtnOK);
         Exit;
      end
   else
      begin
         sbtnSimClick(Self);
         //fMsg(frmCategorias, '', 'Confirma a '+S+' da sub-categoria ' + edtSubCategoria.Text +'?',
         //   fIconInterrogation, fbtnYesNo);
      end;
end;

procedure TfrmCategorias.TimerTimer(Sender: TObject);
begin
lblStatusCat.Visible    := not lblStatusCat.Visible;
lblStatusSubCat.Visible := not lblStatusSubCat.Visible;
end;

end.
