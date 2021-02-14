unit untListaComercio;

interface

uses
   System.SysUtils, System.Types, System.UITypes, System.Classes,
   System.Variants,
   FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
   FMX.TMSBaseControl, FMX.TMSGridCell, FMX.TMSGridOptions, FMX.TMSGridData,
   FMX.TMSCustomGrid, FMX.TMSGrid, FMX.TabControl, FMX.Objects,
   FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FMX.ListBox, FMX.Layouts,
   FMX.Menus, FMX.Effects, FMX.Ani, FMX.TMSBaseGroup, FMX.TMSRadioGroup;

type
   TfrmListaComercio = class(TForm)
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
      Panel1: TPanel;
      btnContrato: TRectangle;
      Label1: TLabel;
      Image1: TImage;
      btnEditar: TRectangle;
      Label4: TLabel;
      Image4: TImage;
      sbtnSair: TSpeedButton;
      Rectangle11: TRectangle;
      grdLista: TTMSFMXGrid;
      Rectangle1: TRectangle;
      Label2: TLabel;
      Image2: TImage;
      Rectangle2: TRectangle;
      Label3: TLabel;
      Image3: TImage;
      recFiltro: TRectangle;
      ShadowEffect1: TShadowEffect;
      ShadowEffect2: TShadowEffect;
      ShadowEffect3: TShadowEffect;
      ShadowEffect4: TShadowEffect;
      chkNovo: TCheckBox;
      chkPausado: TCheckBox;
      chkFinalizado: TCheckBox;
      chkAtrasado: TCheckBox;
      FloatAnimation1: TFloatAnimation;
      Rectangle3: TRectangle;
      Label5: TLabel;
      Image5: TImage;
      ShadowEffect5: TShadowEffect;
      chkCancelado: TCheckBox;
    recPesquisa: TRectangle;
    edtPesquisa: TEdit;
    Label7: TLabel;
    rbPor: TTMSFMXRadioGroup;
    rbOperador: TTMSFMXRadioGroup;
    sbtnPesquisar: TSpeedButton;
    chkOffLine: TCheckBox;
      procedure FormShow(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure btnContratoClick(Sender: TObject);
      procedure sbtnOKClick(Sender: TObject);
      procedure sbtnSairClick(Sender: TObject);
      procedure Image4Click(Sender: TObject);
      procedure chkNovoChange(Sender: TObject);
      procedure Image5Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure sbtnSimClick(Sender: TObject);
    procedure sbtnPesquisarClick(Sender: TObject);
    procedure sbtnNaoClick(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   frmListaComercio: TfrmListaComercio;
   pIdCom: Integer;
   vListaFiltro: String;
   vCorStatus : String;
   vIdContrato : Integer;
implementation

{$R *.fmx}

uses untDmGeral, untGlobal, untCadastroContrato;

procedure TfrmListaComercio.btnContratoClick(Sender: TObject);
var
   vData: TDate;
   vStatus: String;
begin

   Try
      vData := StrToDate(ExtractText(grdLista.Cells[4, grdLista.Selected], '<font color="clared"><s>', '</s></font>'));
   Except
      Try
         vData := StrToDate(grdLista.Cells[4, grdLista.Selected]);
      Except

      End;
   End;
      vStatus := NomeStatus(grdLista.Cells[5, grdLista.Selected]);

   Try
      gIdComercio := grdLista.Cells[1, grdLista.Selected].ToInteger;
   Except
      fMsg(Self,'','Selecione um cliente na lista!',fIconExclamation,fBtnOK);
      Exit;
   End;

   if vStatus = 'NOVO' then
      begin
         frmCadastroContrato.lblCliente.Text := grdLista.Cells[2, grdLista.Selected];
         gUpdate := True;
         frmCadastroContrato.edtInicio.Date := DataAtual;
         frmCadastroContrato.edtTermino.Date := IncMonth(DataAtual, 1);
         frmCadastroContrato.edtPeriodo.Text := '1';
         frmCadastroContrato.imgHome.Bitmap := nil;
         frmCadastroContrato.pnlHome.Height := 25;
         frmCadastroContrato.imgSecao.Bitmap := nil;
         frmCadastroContrato.pnlSecao.Height := 25;
         frmCadastroContrato.chkHome.IsChecked := False;
         frmCadastroContrato.chkSecao.IsChecked := False;
         frmCadastroContrato.edtValorMensal.Text := '';
         frmCadastroContrato.Tag := 1;
         frmCadastroContrato.pnlPause.Visible := False;
         vLetra := 'A';
         frmCadastroContrato.ShowModal;
      end
   else
      begin
         if (vStatus = 'FINALIZADO') or (vStatus = 'CANCELADO') then
            begin
               With dmGeral.qryGeral do
                  begin
                     Close;
                     Sql.Clear;
                     Sql.Add('SELECT * FROM ALCOMERCIO c');
                     Sql.Add('FULL JOIN ALCONTRATO a');
                     Sql.Add('on (c.IDCOM = a.IDCOM_CONTRATO)');
                     Sql.Add('WHERE (c.IDCOM = :IDCOM) AND');
                     Sql.Add('(a.STATUSCONTRATO IN ('+QuotedStr('ONLINE'  )+','+
                                                      QuotedStr('OFFLINE' )+','+
                                                      QuotedStr('ATRASADO')+','+
                                                      QuotedStr('PAUSADO' )+'))');
                     Params[0].AsInteger := gIdComercio;
                     Open;
                     if RecordCount > 0 then
                        begin
                           fMsg(Self, '','Este cliente possui um contrato ativo, verifique!', fIconInformation, fBtnOK);
                           Exit;
                        end
                     else
                        begin
                           Close;
                           Sql.Clear;
                           Sql.Add('SELECT * FROM ALCOMERCIO c');
                           Sql.Add('FULL JOIN ALCONTRATO a');
                           Sql.Add('on (c.IDCOM = a.IDCOM_CONTRATO)');
                           Sql.Add('WHERE (c.IDCOM = :IDCOM)');
                           Params[0].AsInteger := gIdComercio;
                           Open;
                           vLetra := gLetras[RecordCount + 1];
                           frmCadastroContrato.lblCliente.Text := grdLista.Cells[2, grdLista.Selected];
                           gUpdate := True;
                           frmCadastroContrato.edtInicio.Date := DataAtual;
                           frmCadastroContrato.edtTermino.Date := IncMonth(DataAtual, 1);
                           frmCadastroContrato.edtPeriodo.Text := '1';
                           frmCadastroContrato.imgHome.Bitmap := nil;
                           frmCadastroContrato.pnlHome.Height := 25;
                           frmCadastroContrato.imgSecao.Bitmap := nil;
                           frmCadastroContrato.pnlSecao.Height := 25;
                           frmCadastroContrato.chkHome.IsChecked := False;
                           frmCadastroContrato.chkSecao.IsChecked := False;
                           frmCadastroContrato.edtValorMensal.Text := '';
                           frmCadastroContrato.Tag := 1;
                           frmCadastroContrato.pnlPause.Visible := False;
                           frmCadastroContrato.ShowModal;
                        end;
                  end;
            end
         else
            begin
               fMsg(Self, '','O status deste cliente não permite criar um novo contrato!',
                  fIconInformation, fBtnOK);
               Exit;
            end;
      end;
end;

procedure TfrmListaComercio.chkNovoChange(Sender: TObject);
var
   i: Integer;
   vLista: String;
begin
   vListaFiltro := '';
   vLista := '';
   for i := 0 to Self.ComponentCount - 1 do
      begin
         if Components[i] is TCheckBox then
            begin
               if TCheckBox(frmListaComercio.Components[i]).IsChecked then
                  vLista := vLista + ',' + QuotedStr(Copy(TCheckBox(frmListaComercio.Components[i]).Name,
                                           4, Length(TCheckBox(frmListaComercio.Components[i]).Name)));
            end;
      end;
   if Length(vLista) > 0 then
      begin
         vLista := Copy(vLista, 2, Length(vLista));

         vListaFiltro := ' WHERE a.STATUSCONTRATO IN (' + UpperCase(vLista) + ')';
      end
   else
      begin
         vListaFiltro := '';
      end;
   FormShow(Self);
end;

procedure TfrmListaComercio.FormCreate(Sender: TObject);
begin
   grdLista.Cells[0, 0] := 'Contrato';
   grdLista.Cells[1, 0] := 'ID';
   grdLista.Cells[2, 0] := 'Cliente';
   grdLista.Cells[3, 0] := 'Inicio';
   grdLista.Cells[4, 0] := 'Término';
   grdLista.Cells[5, 0] := 'Status';
end;

procedure TfrmListaComercio.FormShow(Sender: TObject);
var
   i: Integer;
begin
rbPor.Text := '';
rbOperador.Text := '';
   With dmGeral.qryGeral do
      begin
         Close;
         Sql.Clear;
         Sql.Add('SELECT * FROM ALCOMERCIO c');
         Sql.Add('LEFT JOIN ALCONTRATO a');
         Sql.Add('on (c.IDCOM = a.IDCOM_CONTRATO)');
         Sql.Add(vListaFiltro);
         Sql.Add('ORDER BY a.LETRACONTRATO DESC, a.DTFIMCONTRATO ASC');
         Open;
         Try
            for i := 0 to RecordCount do
               begin
                  grdLista.RowCount := i + 1;
                  if  FieldByName('LETRACONTRATO').AsString = '' then
                     grdLista.Cells[0, i + 1] := '' else
                     grdLista.Cells[0, i + 1] := FormatFloaT('0000',FieldByName('IDCONTRATO').AsInteger) + '/' +
                                                 FieldByName('LETRACONTRATO').AsString;

                     grdLista.Cells[1, i + 1] := FormatFloat('0000',FieldByName('IDCOM').AsInteger);
                     grdLista.Cells[2, i + 1] := FieldByName('RAZAOCOM').AsString;
                     if not FieldByName('DTINICONTRATO').IsNull then
                        grdLista.Cells[3, i + 1] := PintarStatus(FieldByName('STATUSCONTRATO').AsString)+ DateToStr(FieldByName('DTINICONTRATO').AsDateTime) + '</s></font>' else
                        grdLista.Cells[3, i + 1] := '';//PintarStatus(FieldByName('STATUSCONTRATO').AsString)+ DateToStr(FieldByName('DTINICONTRATO').AsDateTime) + '</s></font>';

                     if not FieldByName('DTFIMCONTRATO').IsNull then
                        grdLista.Cells[4, i + 1] := PintarStatus(FieldByName('STATUSCONTRATO').AsString)+ DateToStr(FieldByName('DTFIMCONTRATO').AsDateTime) + '</s></font>' else
                        grdLista.Cells[4, i + 1] := '';//PintarStatus(FieldByName('STATUSCONTRATO').AsString)+ DateToStr(FieldByName('DTFIMCONTRATO').AsDateTime) + '</s></font>';

                     if FieldByName('STATUSCONTRATO').AsString = '' then
                        begin
                           grdLista.Cells[5, i + 1] := PintarStatus('NOVO')+ 'NOVO' + '</font>';
                           grdLista.AddBitmapFile(5, i + 1, gPathArquivos + '\Icones\' + 'NOVO.png');
                        end
                     else
                        begin
                           grdLista.Cells[5, i + 1] := PintarStatus(FieldByName('STATUSCONTRATO').AsString)+ FieldByName('STATUSCONTRATO').AsString + '</font>';
                           grdLista.AddBitmapFile(5, i + 1, gPathArquivos + '\Icones\' + FieldByName('STATUSCONTRATO').AsString + '.png');
                        end;
                     Next;
               end;
         Except

         End;
      end;
end;

procedure TfrmListaComercio.Image2Click(Sender: TObject);
begin
Try
   vIdContrato := Copy(grdLista.Cells[0,grdLista.Selected],0,4).ToInteger;
Except
   fMsg(Self,'','Selecione um cliente na lista!',fIconExclamation,fBtnOK);
   Exit;
End;
if (ExtractText(grdLista.Cells[5, grdLista.Selected], gCorStNovo, '</font>') = 'NOVO') or
   (ExtractText(grdLista.Cells[5, grdLista.Selected], gCorStFinalizado, '</font>') = 'FINALIZADO') or
   (ExtractText(grdLista.Cells[5, grdLista.Selected], gCorStCancelado, '</font>') = 'CANCELADO') then
   begin
      fMsg(Self, '', 'Não é possivel cancelar um contrato '+NomeStatus(grdLista.Cells[5, grdLista.Selected])+'!',
            fIconInformation, fBtnOK);
      Exit;
   end
else
   begin
      fMsg(Self,'','Tem certeza que deseja cancelar este contrato!'+#13+
                   'Este procedimento não pode ser desfeito,'+#13+
                   'Deseja continuar?',fIconInterrogation, fbtnYesNo);
      Self.Tag := 0;
   end;
end;

procedure TfrmListaComercio.Image3Click(Sender: TObject);
var
i : Integer;
begin
if recPesquisa.Height = 0 then
   begin
      recPesquisa.Height := 90;
      edtPesquisa.Text := '';
      vListaFiltro := '';
      recFiltro.Visible := False;
      if recFiltro.Visible = False then
         begin
            for i := 0 to Self.ComponentCount - 1 do
               begin
                  if Components[i] is TCheckBox then
                     begin
                        if TCheckBox(frmListaComercio.Components[i]).IsChecked then
                           TCheckBox(frmListaComercio.Components[i]).IsChecked := False;
                     end;
               end;
         end;
   end
else
   begin
      recPesquisa.Height := 0;
      FormShow(Self);
   end;
end;

procedure TfrmListaComercio.Image4Click(Sender: TObject);
var
   S: String;
begin
Try
   gIdContrato := Copy(grdLista.Cells[0,grdLista.Selected],0,4).ToInteger;
Except
   fMsg(Self,'','Selecione um cliente na lista!',fIconExclamation,fBtnOK);
   Exit;
End;
   if ExtractText(grdLista.Cells[5, grdLista.Selected], '<font color="claDarkGreen">', '</font>') <> 'OFFLINE' then
      begin
         fMsg(Self, '', 'O status '+ExtractText(grdLista.Cells[5, grdLista.Selected],
              '<font color="claDarkGreen">', '</font>')+' não permite a edição do contrato!',fIconInformation, fBtnOK);
         Exit;
      end
   else
      begin
         frmCadastroContrato.lblCliente.Text := grdLista.Cells[2, grdLista.Selected];
         gIdComercio := grdLista.Cells[1, grdLista.Selected].ToInteger;
         gLetra := Copy(grdLista.Cells[0, grdLista.Selected],5,1);
         With dmGeral.qryGeral do
            begin
               Close;
               Sql.Clear;
               Sql.Add('SELECT * FROM ALCOMERCIO c');
               Sql.Add('INNER JOIN ALCONTRATO a');
               Sql.Add('on (c.IDCOM = a.IDCOM_CONTRATO)');
               Sql.Add('WHERE c.IDCOM = :IDCOM');
               Params[0].AsInteger := gIdComercio;
               Open;
               frmCadastroContrato.pnlPause.Visible := True;
               if FieldByName('STATUSCONTRATO').AsString = 'PAUSADO' then
                  frmCadastroContrato.chkPause.IsChecked := True
               else
                  frmCadastroContrato.chkPause.IsChecked := False;

               //gIdContrato := FieldByName('IDCONTRATO').AsInteger;
               frmCadastroContrato.edtDiasCortesia.Text := FieldByName('DIASCORTESIACONTRATO').AsString;
               frmCadastroContrato.edtPeriodo.Text      := FieldByName('PERIODOCONTRATO').AsString;
               frmCadastroContrato.edtInicio.Date       := FieldByName('DTINICONTRATO').AsDateTime;
               frmCadastroContrato.edtTermino.Date      := FieldByName('DTFIMCONTRATO').AsDateTime;
               frmCadastroContrato.edtValorMensal.Text  := FieldByName('VALORCONTRATO').AsString;
               frmCadastroContrato.edtMotivoPause.Text  := FieldByName('MOTIVOPAUSACONTRATO').AsString;
               if FieldByName('PRIMEIROPAGTOCONTRATO').AsString = '1' then
                  frmCadastroContrato.chkPagto.IsChecked := True else
                  frmCadastroContrato.chkPagto.IsChecked := False;
               gUpdate := False;
               frmCadastroContrato.chkPagto.Enabled := False;

               if FieldByName('IMGDESTAQUEHOMECONTRATO').AsString <> '' then
                  begin
                     frmCadastroContrato.chkHome.IsChecked := True;
                     gImgHome := FieldByName('IMGDESTAQUEHOMECONTRATO').AsString;
                     frmCadastroContrato.imgHome.Bitmap.LoadFromFile(gPathArquivos + '\Fotos\' + gImgHome);
                     frmCadastroContrato.pnlHome.Height := 225;
                  end
               else
                  begin
                     gImgHome := '';
                     frmCadastroContrato.chkHome.IsChecked := False;
                     frmCadastroContrato.pnlHome.Height := 25;
                     frmCadastroContrato.imgHome.Bitmap := nil;
                  end;
               if FieldByName('IMGDESTAQUESESSAOCONTRATO').AsString <> '' then
                  begin
                     frmCadastroContrato.chkSecao.IsChecked := True;
                     gImgSecao := FieldByName('IMGDESTAQUESESSAOCONTRATO').AsString;
                     frmCadastroContrato.imgSecao.Bitmap.LoadFromFile(gPathArquivos + '\Fotos\' + gImgSecao);
                     frmCadastroContrato.pnlSecao.Height := 225;
                  end
               else
                  begin
                     gImgSecao := '';
                     frmCadastroContrato.pnlSecao.Height := 25;
                     frmCadastroContrato.imgSecao.Bitmap := nil;
                     frmCadastroContrato.chkSecao.IsChecked := False;
                  end;

            end;
         gUpdate := True;
         frmCadastroContrato.Tag := 2;
         frmCadastroContrato.ShowModal;
      end;
end;

procedure TfrmListaComercio.Image5Click(Sender: TObject);
var
   i: Integer;
begin
   recFiltro.Visible := not recFiltro.Visible;
   recPesquisa.Height := 0;
   edtPesquisa.Text := '';
   vListaFiltro := '';
   if recFiltro.Visible = False then
      begin
         for i := 0 to Self.ComponentCount - 1 do
            begin
               if Components[i] is TCheckBox then
                  begin
                     if TCheckBox(frmListaComercio.Components[i]).IsChecked then
                        TCheckBox(frmListaComercio.Components[i]).IsChecked := False;
                  end;
            end;
      end;
end;

procedure TfrmListaComercio.sbtnNaoClick(Sender: TObject);
begin
recModal.Visible := False;
end;

procedure TfrmListaComercio.sbtnOKClick(Sender: TObject);
begin
   recModal.Visible := False;
end;

procedure TfrmListaComercio.sbtnPesquisarClick(Sender: TObject);
var
i : Integer;
vBusca, vOperador : String;
begin
if Length(Trim(edtPesquisa.Text)) <= 0 then
   begin
      fMsg(Self,'','O campo de pesquisa não ser nulo!',fIconExclamation,fBtnOK);
      Exit;
   end
else
   begin
      if rbPor.ItemIndex = 0 then vBusca := 'c.RAZAOCOM';
      if rbPor.ItemIndex = 1 then vBusca := 'c.CNPJCOM';

      if rbOperador.ItemIndex = 0 then vOperador := '''' + edtPesquisa.Text + '%'+'''';
      if rbOperador.ItemIndex = 1 then vOperador := '''' + '%' + edtPesquisa.Text + '%'+'''';

      vListaFiltro := 'WHERE ' + vBusca + ' Like '+vOperador;

      FormShow(Self);
   end;
end;


procedure TfrmListaComercio.sbtnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmListaComercio.sbtnSimClick(Sender: TObject);
var
vLetra : String;
begin
//Cancelar Contrato
vLetra := Copy(grdLista.Cells[0,grdLista.Selected],6,1);
With dmGeral.qryGeral do
   begin
      Close;
      Sql.Clear;
      Sql.Add('UPDATE ALCONTRATO SET');
      Sql.Add('DATACANCELACONTRATO = :DATA,');
      Sql.Add('STATUSCONTRATO = :STATUS');
      Sql.Add('WHERE (IDCONTRATO = :IDCONTRATO) AND');
      Sql.Add('(LETRACONTRATO = :LETRA)');
      Params[0].AsDate := DataAtual;
      Params[1].AsString := 'CANCELADO';
      Params[2].AsInteger := vIdContrato;
      Params[3].AsString := vLetra;
      ExecSql;
      Close;
      Sql.Clear;
      Sql.Add('DELETE FROM CONTARECEBER');
      Sql.Add('WHERE (IDCONTRATO_CR = :IDCONTRATO) AND');
      Sql.Add('(LETRACR = :LETRACR) AND (PAGTOCR IS NULL)');
      Params[0].AsInteger := vIdContrato;
      Params[1].AsString  := vLetra;
      ExecSql;
      FormShow(Self);
      fMsg(Self,'','Contrato cancelado com sucesso!',fIconInformation,fBtnOK);
   end;
end;

end.
