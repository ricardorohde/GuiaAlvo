unit untCadastroContrato;

interface

uses
   System.SysUtils, System.Types, System.UITypes, System.Classes,
   System.Variants,
   FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
   FMX.StdCtrls, FMX.Controls.Presentation, FMX.DateTimeCtrls,
   FMX.TMSCustomEdit,
   FMX.TMSEdit, FMX.Layouts, FMX.Edit, FMX.ListBox, FireDAC.Stan.Param, Guia.Controle;

type
   TfrmCadastroContrato = class(TForm)
      Panel1: TPanel;
      sbtnSair: TSpeedButton;
      Label2: TLabel;
      Line1: TLine;
      lblCliente: TLabel;
      edtDiasCortesia: TTMSFMXEdit;
      edtPeriodo: TTMSFMXEdit;
      edtInicio: TDateEdit;
      edtTermino: TDateEdit;
      edtValorMensal: TTMSFMXEdit;
      Label1: TLabel;
      Label3: TLabel;
      Label4: TLabel;
      Label5: TLabel;
      Label6: TLabel;
      Label7: TLabel;
      Line2: TLine;
      Line3: TLine;
      Rectangle1: TRectangle;
      pnlHome: TPanel;
      pnlSecao: TPanel;
      Panel4: TPanel;
      chkHome: TCheckBox;
      Panel5: TPanel;
      chkSecao: TCheckBox;
      imgHome: TImage;
      imgSecao: TImage;
      OpenDialog: TOpenDialog;
      sbtnSalvar: TSpeedButton;
    pnlPause: TPanel;
    chkPause: TCheckBox;
    edtMotivoPause: TEdit;
    Label8: TLabel;
    chkPagto: TCheckBox;
    Label9: TLabel;
    Layout3: TLayout;
    chkEnviarAnuncios: TCheckBox;
    edtQtdeAnuncios: TTMSFMXEdit;
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
    Label10: TLabel;
      procedure chkHomeChange(Sender: TObject);
      procedure sbtnOKClick(Sender: TObject);
      procedure chkSecaoChange(Sender: TObject);
      procedure sbtnSairClick(Sender: TObject);
      procedure edtDiasCortesiaChange(Sender: TObject);
      procedure edtInicioChange(Sender: TObject);
      procedure edtPeriodoChange(Sender: TObject);
      procedure sbtnSalvarClick(Sender: TObject);
      procedure sbtnSimClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnNaoClick(Sender: TObject);
    procedure chkEnviarAnunciosChange(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   frmCadastroContrato: TfrmCadastroContrato;
   vLetra, vStatus: String;

implementation

{$R *.fmx}

uses untDmGeral, untGlobal, System.DateUtils, untListaComercio, Data.DB;

procedure TfrmCadastroContrato.chkEnviarAnunciosChange(Sender: TObject);
begin

     edtQtdeAnuncios.Visible := chkEnviarAnuncios.IsChecked;

     if chkEnviarAnuncios.IsChecked then
        edtQtdeAnuncios.Text := '1' else edtQtdeAnuncios.Text := '0';

end;

procedure TfrmCadastroContrato.chkHomeChange(Sender: TObject);
begin
   if gUpdate = True then
      begin
         if chkHome.IsChecked = True then
            begin
               if OpenDialog.Execute then
                  begin
                     if SizeImgPx(OpenDialog.FileName) <> ctrSIZEIMGDESTAKE then
                        begin
                           chkHome.IsChecked := False;
                           fMsg(Self, '',
                              'O destaque deve ser no formato de '+ctrSIZEIMGDESTAKE+' px!',
                              fIconError, fBtnOK);
                           Exit;
                        end
                     else
                        begin
                           imgHome.Bitmap.LoadFromFile(OpenDialog.FileName);
                           pnlHome.Height := 225;
                        end;
                  end
               else
                  begin
                     chkHome.IsChecked := False;
                  end;
            end
         else
            begin
               imgHome.Bitmap := nil;
               pnlHome.Height := 25;
            end;
      end;
end;

procedure TfrmCadastroContrato.chkSecaoChange(Sender: TObject);
begin
   if gUpdate = True then
      begin
         if chkSecao.IsChecked = True then
            begin
               if OpenDialog.Execute then
                  begin
                     if SizeImgPx(OpenDialog.FileName) <> ctrSIZEIMGDESTAKE then
                        begin
                           chkSecao.IsChecked := False;
                           fMsg(Self, '',
                              'O destaque deve ser no formato de '+ctrSIZEIMGDESTAKE+' px!',
                              fIconError, fBtnOK);
                           Exit;
                        end
                     else
                        begin
                           imgSecao.Bitmap.LoadFromFile(OpenDialog.FileName);
                           pnlSecao.Height := 225;
                        end;
                  end
               else
                  begin
                     chkSecao.IsChecked := False;
                  end;
            end
         else
            begin
               imgSecao.Bitmap := nil;
               pnlSecao.Height := 25;
            end;
      end;
end;

procedure TfrmCadastroContrato.edtDiasCortesiaChange(Sender: TObject);
begin
   Try
      edtTermino.Date := IncDay(edtTermino.Date,
         edtDiasCortesia.Text.ToInteger);
   Except

   End;
end;

procedure TfrmCadastroContrato.edtInicioChange(Sender: TObject);
begin
   edtPeriodoChange(Sender);
   edtDiasCortesiaChange(Sender);
end;

procedure TfrmCadastroContrato.edtPeriodoChange(Sender: TObject);
begin
   Try
      edtTermino.Date := IncMonth(edtInicio.Date, edtPeriodo.Text.ToInteger);
      edtTermino.Date := IncDay(edtTermino.Date,
         edtDiasCortesia.Text.ToInteger);
   Except

   End;
end;

procedure TfrmCadastroContrato.FormClose(Sender: TObject;
   var Action: TCloseAction);
begin
   lblCliente.Text := '';
   edtDiasCortesia.Text := '0';
   edtPeriodo.Text := '1';
   edtInicio.Date := DataAtual;
   edtTermino.Date := IncMonth(edtInicio.Date, 1);

end;

procedure TfrmCadastroContrato.sbtnNaoClick(Sender: TObject);
begin
recModal.Visible := False;
end;

procedure TfrmCadastroContrato.sbtnOKClick(Sender: TObject);
begin
   recModal.Visible := False;
end;

procedure TfrmCadastroContrato.sbtnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmCadastroContrato.sbtnSalvarClick(Sender: TObject);
begin
   if Self.Tag = 1 then
      vStatus := 'inclusão'
   else
      vStatus := 'alteração';

   if (chkEnviarAnuncios.IsChecked) and (not isNumeric(edtQtdeAnuncios.Text)) or (chkEnviarAnuncios.IsChecked) and (edtQtdeAnuncios.Text = '0') then
      begin
         fMsg(Self, '', 'A quantidade de anúncios é inválida!', fIconExclamation, fBtnOK);
         Exit;
      end;

   if edtValorMensal.Text <= '0,00' then
      begin
         fMsg(Self, '', 'O valor da mensalidade não pode ser zero!',
            fIconExclamation, fBtnOK);
         Exit;
      end
   else if edtTermino.Date < IncMonth(edtInicio.Date, 1) then
      begin
         fMsg(Self, '',
            'A data final deve no minimo 30 dias maior que a data inicial!',
            fIconExclamation, fBtnOK);
         Exit;
      end
   else
      fMsg(Self, '', 'Confirma a ' + vStatus + ' deste contrato?',
         fIconInterrogation, fbtnYesNo);
end;

procedure TfrmCadastroContrato.sbtnSimClick(Sender: TObject);
var
   fLetra, fNameFileHome, fNameFileSecao: String;
   i : Integer;
   fDtVencto : TDate;
begin
   if Self.Tag = 1 then
      begin
         With dmGeral.qryGeral do
            begin
               //Inclusão do contrato
               Close;
               Sql.Clear;
               Sql.Add('SELECT * FROM ALCONTRATO');
               Sql.Add('WHERE IDCOM_CONTRATO = :IDCOM');
               Params[0].AsInteger := gIdComercio;
               Open;
               if RecordCount = 0 then fLetra := 'A' else fLetra := gLetras[RecordCount + 1];

               Close;
               Sql.Clear;
               Sql.Add('INSERT INTO ALCONTRATO');
               Sql.Add('(IDCOM_CONTRATO,IMGDESTAQUEHOMECONTRATO,IMGDESTAQUESESSAOCONTRATO,');
               Sql.Add('VALORCONTRATO,DIASCORTESIACONTRATO,PERIODOCONTRATO,DTINICONTRATO,');
               Sql.Add('DTFIMCONTRATO,STATUSCONTRATO, LETRACONTRATO,PRIMEIROPAGTOCONTRATO,');
               Sql.Add('ENVIARPUSHANUNCIOCONTRATO, QTDEPUSHANUNCIO) VALUES ');
               Sql.Add('(:IDCOM_CONTRATO,:IMGDESTAQUEHOMECONTRATO,:IMGDESTAQUESESSAOCONTRATO,');
               Sql.Add(':VALORCONTRATO, :DIASCORTESIACONTRATO,:PERIODOCONTRATO,:DTINICONTRATO,');
               Sql.Add(':DTFIMCONTRATO, :STATUSCONTRATO, :LETRACONTRATO, :PRIMEIROPAGTOCONTRATO,');
               Sql.Add(':ENVIARPUSHANUNCIOCONTRATO, :QTDEPUSHANUNCIO)');
               Params[0].AsInteger := gIdComercio;
               if imgHome.Bitmap.IsEmpty then
                  begin
                     Params[1].AsString := '';
                  end
               else
                  begin
                     fNameFileHome := 'FTO' + GeraNameFile + '.jpg';
                     Params[1].AsString := fNameFileHome;
                  end;

               if imgSecao.Bitmap.IsEmpty then
                  begin
                     Params[2].AsString := '';
                  end
               else
                  begin
                     fNameFileSecao := 'FTO' + GeraNameFile + '.jpg';
                     Params[2].AsString := fNameFileSecao;
                  end;
               Params[3].AsFloat   := StrToFloatDef(edtValorMensal.Text, 0);
               Params[4].AsInteger := edtDiasCortesia.Text.ToInteger;
               Params[5].AsInteger := edtPeriodo.Text.ToInteger;
               Params[6].AsDate    := edtInicio.Date;
               Params[7].AsDate    := edtTermino.Date;

               if edtInicio.Date > Date then
                  Params[8].AsString  := 'OFFLINE' else Params[8].AsString  := 'ONLINE';

               Params[9].AsString := fLetra;
               if chkPagto.IsChecked then
                  Params[10].AsString := '1' else Params[10].AsString := '0';

               Params[11].AsString  := BoolToStrValue(chkEnviarAnuncios.IsChecked);
               Params[12].AsInteger := edtQtdeAnuncios.Text.ToInteger;

               ExecSql;

               if not imgHome.Bitmap.IsEmpty then
                  imgHome.Bitmap.SaveToFile(gPathArquivos + '\Fotos\' + fNameFileHome);
               if not imgSecao.Bitmap.IsEmpty then
                  imgSecao.Bitmap.SaveToFile(gPathArquivos + '\Fotos\' + fNameFileSecao);
               //Pega o Id do contrato
               Close;
               Sql.Clear;
               Sql.Add('SELECT GEN_ID(GEN_ALCONTRATO_ID,0) AS IDCONTRATO FROM RDB$DATABASE');
               Open;

               gIdContrato := FieldByName('IDCONTRATO').AsInteger;
               //Inclusão contas a receber

               Close;
               Sql.Clear;
               Sql.Add('INSERT INTO CONTARECEBER');
               Sql.Add('(IDCONTRATO_CR,IDCOM_CR,VENCTOCR,');
               Sql.Add('NRPARCELACR,VALORCR,LETRACR, PAGTOCR, STATUSCR) VALUES');
               Sql.Add('(:IDCONTRATO_CR,:IDCOM_CR,:VENCTOCR,');
               Sql.Add(':NRPARCELACR,:VALORCR,:LETRACR, :PAGTOCR, :STATUSCR)');
               for i := 1 to edtPeriodo.Text.ToInteger do
                  begin
                     Params[0].AsInteger  := gIdContrato;
                     Params[1].AsInteger  := gIdComercio;
                     fDtVencto := IncMonth(edtInicio.Date,i);

                     While FinalSemana(fDtVencto) = True do
                        fDtVencto := IncDay(fDtVencto,1);

                     Params[2].AsDate     := fDtVencto;
                     Params[3].AsInteger  := i;
                     Params[4].AsCurrency := StrToFloatDef(edtValorMensal.Text,0);
                     Params[5].AsString   := fLetra;
                     if (chkPagto.IsChecked) and (i = 1) then
                        begin
                           Params[6].AsDate := Date;
                           Params[7].AsString := 'PAGO';
                        end
                     else
                        begin
                           Params[6].DataType := ftDate;
                           Params[6].Clear;
                           Params[7].AsString := 'AVENCER'
                        end;
                     ExecSql;
                  end;
               recModal.Visible := False;
               frmListaComercio.FormShow(frmListaComercio);
               frmCadastroContrato.Close;
            end;
      end;
   if Self.Tag = 2 then
      begin
         With dmGeral.qryGeral do
            begin
               Close;
               Sql.Clear;
               Sql.Add('UPDATE ALCONTRATO SET');
               Sql.Add('IMGDESTAQUEHOMECONTRATO   = :IMGDESTAQUEHOMECONTRATO,');
               Sql.Add('IMGDESTAQUESESSAOCONTRATO = :IMGDESTAQUESESSAOCONTRATO,');
               Sql.Add('VALORCONTRATO             = :VALORCONTRATO,');
               Sql.Add('DIASCORTESIACONTRATO      = :DIASCORTESIACONTRATO,');
               Sql.Add('PERIODOCONTRATO           = :PERIODOCONTRATO,');
               Sql.Add('DTINICONTRATO             = :DTINICONTRATO,');
               Sql.Add('DTFIMCONTRATO             = :DTFIMCONTRATO,');
               Sql.Add('STATUSCONTRATO            = :STATUSCONTRATO,');
               Sql.Add('MOTIVOPAUSACONTRATO       = :MOTIVOPAUSACONTRATO,');
               Sql.Add('DATAPAUSACONTRATO         = :DATAPAUSACONTRATO,');
               Sql.Add('ENVIARPUSHANUNCIOCONTRATO = :ENVIARPUSHANUNCIOCONTRATO,');
               Sql.Add('QTDEPUSHANUNCIO           = :QTDEPUSHANUNCIO');
               Sql.Add('WHERE IDCONTRATO          = :IDCONTRATO');
               if imgHome.Bitmap.IsEmpty then
                  begin
                     Params[0].AsString := '';
                  end
               else
                  begin
                     if gImgHome = '' then
                        begin
                           gImgHome := GeraNameFile + '.jpg';
                           Params[0].AsString := gImgHome;
                        end
                     else
                        begin
                           Params[0].AsString := gImgHome;
                        end;
                  end;
               if imgSecao.Bitmap.IsEmpty then
                  Params[1].AsString := '' else
                  Params[1].AsString := gImgSecao;
               Params[2].AsFloat   := StrToFloatDef(edtValorMensal.Text, 0);
               Params[3].AsInteger := edtDiasCortesia.Text.ToInteger;
               Params[4].AsInteger := edtPeriodo.Text.ToInteger;
               Params[5].AsDate    := edtInicio.Date;
               Params[6].AsDate    := edtTermino.Date;
               if chkPause.IsChecked then
                  begin
                     Params[7].AsString  := 'PAUSADO';
                     Params[8].AsString  := edtMotivoPause.Text;
                  end
               else
                  begin
                     Params[7].AsString  := 'ONLINE';
                     Params[8].AsString  := '';
                  end;
               Params[9].AsDate     := DataAtual;
               Params[10].AsString  := BoolToStrValue(chkEnviarAnuncios.IsChecked);
               Params[11].AsInteger := edtQtdeAnuncios.Text.ToInteger;
               Params[12].AsInteger := gIdContrato;
               ExecSql;

               if not imgHome.Bitmap.IsEmpty then
                  imgHome.Bitmap.SaveToFile(gPathArquivos + '\Fotos\' + gImgHome);
               if not imgSecao.Bitmap.IsEmpty then
                  imgSecao.Bitmap.SaveToFile(gPathArquivos + '\Fotos\' + gImgSecao);

               Close;
               Sql.Clear;
               Sql.Add('DELETE FROM CONTARECEBER');
               Sql.Add('WHERE (IDCONTRATO_CR = :IDCONTRATO) AND');
               Sql.Add('(LETRACR = :LETRACR) AND (PAGTOCR IS NULL)');
               Params[0].AsInteger := gIdContrato;
               Params[1].AsString  := gLetra;
               ExecSql;

               Close;
               Sql.Clear;
               Sql.Add('INSERT INTO CONTARECEBER');
               Sql.Add('(IDCONTRATO_CR,IDCOM_CR,VENCTOCR,');
               Sql.Add('NRPARCELACR,VALORCR,LETRACR) VALUES');
               Sql.Add('(:IDCONTRATO_CR,:IDCOM_CR,:VENCTOCR,');
               Sql.Add(':NRPARCELACR,:VALORCR,:LETRACR)');
               for i := 1 to edtPeriodo.Text.ToInteger do
                  begin
                     Params[0].AsInteger  := gIdContrato;
                     Params[1].AsInteger  := gIdComercio;
                     fDtVencto := IncMonth(edtInicio.Date,i);
                     While FinalSemana(fDtVencto) = True do
                        fDtVencto := IncDay(fDtVencto,1);
                     Params[2].AsDate     := fDtVencto;
                     Params[3].AsInteger  := i;
                     Params[4].AsCurrency := StrToFloatDef(edtValorMensal.Text,0);
                     Params[5].AsString   := gLetra;
                     ExecSql;
                  end;
               recModal.Visible := False;


               recModal.Visible := False;
               frmListaComercio.FormShow(frmListaComercio);
               frmCadastroContrato.Close;
            end;
      end;
end;

end.
