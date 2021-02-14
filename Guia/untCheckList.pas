unit untCheckList;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FMX.StdCtrls, FMX.Layouts, FMX.ListBox,
  FMX.Edit, FMX.Controls.Presentation, FMX.Objects, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Actions, FMX.ActnList,
  FMX.TabControl, FMX.Colors, System.UiConsts, Guia.Controle;

type
  TfrmChekList = class(TForm)
    ActionList: TActionList;
    actCategoria: TChangeTabAction;
    actSubCategoria: TChangeTabAction;
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
    Rectangle1: TRectangle;
    sbtnIncluir: TSpeedButton;
    Label1: TLabel;
    edtCheckList: TEdit;
    Label40: TLabel;
    imgIcoChk: TImage;
    sbtnDelIco: TSpeedButton;
    imgAdicionar: TImage;
    lstCheckList: TListBox;
    Panel1: TPanel;
    sbtnSair: TSpeedButton;
    Line1: TLine;
    Label3: TLabel;
    OpenDialog: TOpenDialog;
    ColorPanel1: TColorPanel;
    Label10: TLabel;
    recImagem: TRectangle;
    Timer: TTimer;
    lblStatusCheck: TLabel;
    procedure FormShow(Sender: TObject);
    procedure sbtnDelIcoClick(Sender: TObject);
    procedure sbtnIncluirClick(Sender: TObject);
    procedure imgIcoChkClick(Sender: TObject);
    procedure sbtnSimClick(Sender: TObject);
    procedure sbtnOKClick(Sender: TObject);
    procedure sbtnSairClick(Sender: TObject);
    procedure ColorPanel1Change(Sender: TObject);
    procedure lstCheckListDblClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChekList: TfrmChekList;
   pIdCheck : Integer;
   pImagemCheck, pStatusCheck : String;
implementation

{$R *.fmx}

uses untDmGeral, untGlobal, Winapi.Windows;

procedure TfrmChekList.ColorPanel1Change(Sender: TObject);
begin
if imgIcoChk.Bitmap.IsEmpty = False then
   recImagem.Fill.Color := ColorPanel1.Color;
end;

procedure TfrmChekList.FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
if (Key = VK_ESCAPE) and (Timer.Enabled) then
   begin
      fMsg(Self,'','Tem certeza que deseja cancelar a alteração deste registro?',fIconInterrogation,fbtnYesNo);
      Tag := 2;
   end;
end;

procedure TfrmChekList.FormShow(Sender: TObject);
begin
With dmGeral.qryCheckList do
   begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT * FROM ALCHECKLIST');
      Open;
      lstCheckList.Clear;
      While not eof do
         begin
            lstCheckList.Items.AddObject(FieldByName('DESCRCHECK').AsString,TObject(FieldByName('IDCHECK').AsInteger));
            Next;
         end;
   end;
pStatusCheck := 'INS';
edtCheckList.Text := '';
imgIcoChk.Bitmap := nil;
pLoadImage(imgAdicionar,'imgAdicionar');
sbtnDelIco.Visible := False;
end;

procedure TfrmChekList.imgIcoChkClick(Sender: TObject);
begin

if OpenDialog.Execute then
   begin
        var S := SizeImgPx(OpenDialog.FileName);
      if SizeImgPx(OpenDialog.FileName) <> ctrSIZEIMGCHECKLIST then
         begin
            fMsg(frmChekList,'', 'O icone da checklist deve estar no formato de '+ctrSIZEIMGCHECKLIST+' px!', fIconError, fBtnOK);
            Exit;
         end
      else
         begin
            imgAdicionar.Bitmap := nil;
            imgIcoChk.Bitmap.LoadFromFile(OpenDialog.FileName);

            pNameFile := 'ICO'+GeraNameFile + ExtractFileExt(OpenDialog.FileName);
            pNewFile := gPathArquivos+'\Icones\' + pNameFile;
            pOldFile := OpenDialog.FileName;

            recImagem.Fill.Color := ColorPanel1.Color;
            sbtnDelIco.Visible := True;
         end;
   end;
end;

procedure TfrmChekList.lstCheckListDblClick(Sender: TObject);
begin
if Timer.Enabled then
   begin
      fMsg(Self,'','É necessário salvar ou cancelar a edição deste registro!',fIconExclamation,fBtnOK);
      Exit;
   end
else
   begin
      pIdCheck := Integer(lstCheckList.Items.Objects[lstCheckList.ItemIndex]);
      With dmGeral.qryGeral do
         begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT * FROM ALCHECKLIST');
            Sql.Add('WHERE IDCHECK = :IDCHECK');
            Params[0].AsInteger := pIdCheck;
            Open;
            edtCheckList.Text := lstCheckList.Items[lstCheckList.ItemIndex];
            imgIcoChk.Bitmap.LoadFromFile(gPathArquivos+'\Icones\'+FieldByName('IMGCHECK').AsString);
            imgAdicionar.Bitmap := nil;
            ColorPanel1.Color := StringToAlphaColor(FieldByName('CORCHECK').AsString);
            recImagem.Fill.Color := StringToAlphaColor(FieldByName('CORCHECK').AsString);
            pImagemCheck := FieldByName('IMGCHECK').AsString;
            pStatusCheck := 'UPD';
            lstCheckList.Items.Delete(lstCheckList.ItemIndex);
            Timer.Enabled := True;
            pNameFile := '';
         end;
   end;
end;

procedure TfrmChekList.sbtnDelIcoClick(Sender: TObject);
begin
   imgIcoChk.Bitmap := nil;
   pLoadImage(imgAdicionar, 'imgAdicionar');
   sbtnDelIco.Visible := False;
end;

procedure TfrmChekList.sbtnIncluirClick(Sender: TObject);
var
   i: Integer;
   vRepetido: Boolean;
   S : String;
begin
   if pStatusCheck = 'INS' then
      S := 'inclusão' else S := 'alteração';
   if Length(Trim(edtCheckList.Text)) <= 0 then
      begin
         fMsg(frmChekList, '', 'É necessário preencher a CheckList!',
            fIconInformation, fBtnOK);
         Exit;
      end;
   if imgIcoChk.Bitmap.IsEmpty then
      begin
         fMsg(frmChekList, '', 'É necessário selecionar uma imagem para a checklist!',
            fIconInformation, fBtnOK);
         Exit;
      end;

   vRepetido := False;

   for i := 0 to lstCheckList.Count - 1 do
      if lstCheckList.Items.Strings[i] = edtCheckList.Text then
         vRepetido := True;
   Tag := 1;
   if vRepetido then
      begin
         fMsg(frmChekList, '', edtCheckList.Text + ' ja esta cadastrado, verifique!',
            fIconInformation, fBtnOK);
         Exit;
      end
   else
      begin
         sbtnSimClick(Self);
      end;
end;

procedure TfrmChekList.sbtnOKClick(Sender: TObject);
begin
   recModal.Visible := False;
end;

procedure TfrmChekList.sbtnSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmChekList.sbtnSimClick(Sender: TObject);
var
vFile : String;
begin
if (Tag = 1) and (pStatusCheck = 'INS') then
   begin
      With dmGeral.qryCheckList do
         begin
            Close;
            Sql.Clear;
            Sql.Add('INSERT INTO ALCHECKLIST');
            Sql.Add('(DESCRCHECK, IMGCHECK, CORCHECK) VALUES ');
            Sql.Add('(:DESCRCHECK, :IMGCHECK, :CORCHECK)');
            Params[0].AsString := edtCheckList.Text;
            Params[1].AsString := pNameFile;
            Params[2].AsString := AlphaColorToString(ColorPanel1.Color);
            ExecSql;

            ColorPanel1.Color := StringToAlphaColor('#00FFFFFF');
            CopyFile(pWideChar(pOldFile), pWideChar(pNewFile), False);
            recImagem.Fill.Color := StringToAlphaColor('#00E0E0E0');
            FormShow(Sender);
            edtCheckList.Text := '';
            sbtnDelIcoClick(Sender);
            recModal.Visible := False;
         end;
   end;
if (Tag = 1) and (pStatusCheck = 'UPD') then
   begin
      With dmGeral.qryCheckList do
         begin
            Close;
            Sql.Clear;
            Sql.Add('UPDATE ALCHECKLIST SET');
            Sql.Add('DESCRCHECK  = :DESCRCHECK,');
            Sql.Add('CORCHECK    = :CORCHECK,');
            Sql.Add('UPDATECHECK = :UPDATECHECK');
            Sql.Add('WHERE IDCHECK = :IDCHECK');
            Params[0].AsString  := edtCheckList.Text;
            Params[1].AsString  := AlphaColorToString(ColorPanel1.Color);
            Params[2].AsString  := '1';
            Params[3].AsInteger := pIdCheck;
            ExecSql;
            ColorPanel1.Color := StringToAlphaColor('#00FFFFFF');
            recImagem.Fill.Color := StringToAlphaColor('#00E0E0E0');
            FormShow(Sender);
            edtCheckList.Text := '';
            sbtnDelIcoClick(Sender);
            recModal.Visible := False;
            Timer.Enabled := False;
            lblStatusCheck.Visible := False;
         end;
   end;
if Tag = 2 then
   begin

           Timer.Enabled := False;
           lblStatusCheck.Visible := False;
           pStatusCheck := 'INS';
           edtCheckList.Text := '';
           imgIcoChk.Bitmap := nil;
           pLoadImage(imgAdicionar,'imgAdicionar');
           sbtnDelIco.Visible := False;
           recModal.Visible := False;

   end;
end;

procedure TfrmChekList.TimerTimer(Sender: TObject);
begin
lblStatusCheck.Visible := not lblStatusCheck.Visible;
end;

end.
