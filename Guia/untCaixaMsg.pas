unit untCaixaMsg;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.Effects,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FMX.ScrollBox, FMX.Memo;

type
  TfrmCaixaMsg = class(TForm)
    recMsg: TRectangle;
    Layout1: TLayout;
    Line10: TLine;
    Image7: TImage;
    lblCaption: TLabel;
    Layout2: TLayout;
    imgIcoMsg: TImage;
    lblMensagem: TLabel;
    sbtnSim: TSpeedButton;
    sbtnNao: TSpeedButton;
    sbtnOK: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure sbtnSimClick(Sender: TObject);
    procedure sbtnNaoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCaixaMsg: TfrmCaixaMsg;

implementation

{$R *.fmx}

uses untCategorias, untComercio, untGlobal, untDmGeral, FMX.ListBox,
  untMensagens, FMX.DateTimeCtrls;

procedure TfrmCaixaMsg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
frmMensagens.Close;
end;

procedure TfrmCaixaMsg.FormCreate(Sender: TObject);
begin
Self.ClientHeight := 180;
Self.ClientWidth  := 430;
end;

procedure TfrmCaixaMsg.sbtnNaoClick(Sender: TObject);
begin
Close;
end;

procedure TfrmCaixaMsg.sbtnOKClick(Sender: TObject);
const
ADiasSemana : Array[1..7] of String = ('Seg','Ter','Qua','Qui','Sex','Sab','Dom');
begin
frmComercio.LimpaComercio;
FormCreate(Self);
frmComercio.SpeedButton4Click(frmComercio);
frmComercio.SpeedButton3Click(frmComercio);

for var i := 1 to 7 do
    begin
        TTimeEdit(frmComercio.FindComponent('edtAbre'  + ADiasSemana[i])).Text := '0';
        TTimeEdit(frmComercio.FindComponent('edtPara'  + ADiasSemana[i])).Text := '0';
        TTimeEdit(frmComercio.FindComponent('edtVolta' + ADiasSemana[i])).Text := '0';
        TTimeEdit(frmComercio.FindComponent('edtFecha' + ADiasSemana[i])).Text := '0';
    end;

frmComercio.mmTagCom.Lines.Clear;

vNextImage := 1;
frmComercio.sbtnSalvar.Visible    := False;
frmComercio.sbtnContinuar.Visible := True;
Close;
end;

function ParametrosAvaliacao(AQuery : TFDQuery) : Integer;
var
ATotalAvaliacao : Integer;
AParametro : Integer;
const ACheckbox : Array[1..5] of String = ('chkAvaliaAmbiente',
                                           'chkAvaliaAtendimento',
                                           'chkAvaliaLimpeza',
                                           'chkAvaliaLocalizacao',
                                           'chkAvaliaPrecos');
begin

ATotalAvaliacao := 0;
AParametro      := 31;

for var i := 1 to 5 do
    begin
         case TCheckBox(frmComercio.FindComponent(ACheckBox[i])).IsChecked of

            True : begin
                      ATotalAvaliacao := ATotalAvaliacao + 1;
                      AQuery.Params[AParametro].AsString := 'T';
                   end;
           False : begin
                      AQuery.Params[AParametro].AsString := 'F';
                   end;
         end;
         AParametro := AParametro + 1;
    end;

Result := ATotalAvaliacao;

end;

procedure TfrmCaixaMsg.sbtnSimClick(Sender: TObject);
var
i : Integer;
vlbi : TListBoxItem;
vFileTxt, vEndereco : String;
vLat, vLong, vR : String;
vFotoDestaque : String;
begin
With frmComercio do
   begin
      vEndereco := edtLogradouro.Text+','+edtNrLog.Text+'-'+
      edtBairro.Text+'-'+edtCidade.Text+'-'+edtUF.Text;
   end;
vR := CarregaPosicaoMapa(vEndereco);
vLat  := Trim(Copy(vR,1,Pos('|',vR) - 1));
vLong := Trim(Copy(vR,Pos('|',vR) + 1, Length(vR)));
{$REGION 'TAG1 = INCLUSAO'}
   With dmGeral.qryGeral do
      begin
         Close;
         Sql.Clear;
         Sql.Add('SELECT GEN_ID(GEN_ALCOMERCIO_ID,0) AS IDCOMERCIO FROM RDB$DATABASE');
         Open;

         gIdComercio :=  FieldByName('IDCOMERCIO').AsInteger + 1;

         Close;
         Sql.Clear;
         Sql.Add('INSERT INTO ALCOMERCIO ');
         Sql.Add('(IDCAT_COM,CNPJCOM,RAZAOCOM,FANTASIACOM,CEPLOG_COM,');
         Sql.Add('NRLOGCOM,COMPLCOM,SITECOM,EMAILCOM,FACECOM,');
         Sql.Add('INSTACOM,TWITERCOM,GOOGLECOM,TUBECOM,HRSEGCOM,HRTERCOM,');
         Sql.Add('HRQUACOM,HRQUICOM,HRSEXCOM,HRSABCOM,HRDOMCOM,');
         Sql.Add('ICOCOM, SLOGAMCOM, SOBRECOM, TITULOCOM, APPCOM, TAGCOM,');
         Sql.Add('MEDIAAVALIA, MEDIATOTALAVALIA, LATCOM, LONGCOM,');
         Sql.Add('AVALIAAMBIENTECOM, AVALIAATENDIMENTOCOM, AVALIALIMPEZACOM,');
         Sql.Add('AVALIALOCALCOM, AVALIAPRECOCOM, IMGDESTAQUEVIEWCOM,');
         Sql.Add('UBEREATSCOM, IFOODCOM, RAPPICOM) VALUES');

         Sql.Add('(:IDCAT_COM,:CNPJCOM,:RAZAOCOM,:FANTASIACOM,:CEPLOG_COM,');
         Sql.Add(':NRLOGCOM,:COMPLCOM,:SITECOM,:EMAILCOM,:FACECOM,');
         Sql.Add(':INSTACOM,:TWITERCOM,:GOOGLECOM,:TUBECOM,:HRSEGCOM,:HRTERCOM,');
         Sql.Add(':HRQUACOM,:HRQUICOM,:HRSEXCOM,:HRSABCOM,:HRDOMCOM,');
         Sql.Add(':ICOCOM,:SLOGAMCOM,:SOBRECOM, :TITULOCOM, :APPCOM, :TAGCOM,');
         Sql.Add(':MEDIAAVALIA, :MEDIATOTALAVALIA, :LATCOM, :LONGCOM,');
         Sql.Add(':AVALIAAMBIENTECOM, :AVALIAATENDIMENTOCOM, :AVALIALIMPEZACOM,');
         Sql.Add(':AVALIALOCALCOM, :AVALIAPRECOCOM, :IMGDESTAQUEVIEWCOM,');
         Sql.Add(':UBEREATSCOM, :IFOODCOM, :RAPPICOM)');
         Params[0].AsInteger := Integer(TObject(frmComercio.lstCategoria.Items.Objects[frmComercio.lstCategoria.ItemIndex]));
         Params[1].AsString  := formataCNPJCEP(frmComercio.edtCNPJ.Text, ffmtEnter);
         Params[2].AsString  := frmComercio.edtRazao.Text;
         Params[3].AsString  := frmComercio.edtFantasia.Text;
         Params[4].AsString  := frmComercio.edtCEP.Text;
         Params[5].AsInteger := frmComercio.edtNrLog.Text.ToInteger;
         Params[6].AsString  := frmComercio.edtComplemento.Text;
         Params[7].AsString  := frmComercio.edtSite.Text;
         Params[8].AsString  := frmComercio.edtEmail.Text;
         Params[9].AsString  := frmComercio.edtFace.Text;
         Params[10].AsString := frmComercio.edtInsta.Text;
         Params[11].AsString := frmComercio.edtTwiter.Text;
         Params[12].AsString := frmComercio.edtGoogle.Text;
         Params[13].AsString := frmComercio.edtYoutube.Text;
         Params[14].AsString := frmComercio.getHorarios(frmComercio,'Seg');
         Params[15].AsString := frmComercio.getHorarios(frmComercio,'Ter');
         Params[16].AsString := frmComercio.getHorarios(frmComercio,'Qua');
         Params[17].AsString := frmComercio.getHorarios(frmComercio,'Qui');
         Params[18].AsString := frmComercio.getHorarios(frmComercio,'Sex');
         Params[19].AsString := frmComercio.getHorarios(frmComercio,'Sab');
         Params[20].AsString := frmComercio.getHorarios(frmComercio,'Dom');

         pNameFile := 'LGO'+GeraNameFile+'.png';
         frmComercio.imgLogo.Bitmap.SaveToFile(gPathArquivos+'\Logos\'+pNameFile);

         Params[21].AsString := pNameFile;
         Params[22].AsString := frmComercio.edtSlogam.Text;
         vFileTxt := 'TXT'+GeraNameFile+'.txt';
         frmComercio.mmDescricao.Lines.SaveToFile(gPathArquivos+'\Textos\'+vFileTxt, TEncoding.UTF8);
         Params[23].AsString := vFileTxt;
         Params[24].AsString := frmComercio.edtTitulo.Text;
         Params[25].AsString := frmComercio.edtGooglePlay.Text;
         Params[26].AsString := LowerCase(frmComercio.mmTagCom.Text);
         Params[27].AsFloat  := 0;
         Params[28].AsInteger:= 0;
         Params[29].AsString := StringReplace(vLat,',','',[rfReplaceAll]);
         Params[30].AsString := StringReplace(vLong,',','',[rfReplaceAll]);

         Params[31].AsString := BoolToStrValue(frmComercio.chkAvaliaAmbiente.IsChecked);
         Params[32].AsString := BoolToStrValue(frmComercio.chkAvaliaAtendimento.IsChecked);
         Params[33].AsString := BoolToStrValue(frmComercio.chkAvaliaLimpeza.IsChecked);
         Params[34].AsString := BoolToStrValue(frmComercio.chkAvaliaLocalizacao.IsChecked);
         Params[35].AsString := BoolToStrValue(frmComercio.chkAvaliaPrecos.IsChecked);

         vFotoDestaque := 'FTO' +  GeraNameFile + '.jpg';
         Params[36].AsString := vFotoDestaque;
         Params[37].AsString := frmComercio.edtUberEats.Text;
         Params[38].AsString := frmComercio.edtIfood.Text;
         Params[39].AsString := frmComercio.edtRappi.Text;

         frmComercio.imgDestaqueView.Bitmap.SaveToFile(gPathArquivos+'\Fotos\'+vFotoDestaque);

         ExecSql;
//==>Telefones
         for i := 0 to frmComercio.sgrdTelefones.RowCount - 1 do
            begin
               Close;
               Sql.Clear;
               Sql.Add('INSERT INTO ALFONE');
               Sql.Add('(IDCOM_FONE, DDDFONE, TELFONE,');
               Sql.Add('ZAPFONE, CONTATOFONE, INTFONE) VALUES ');
               Sql.Add('(:IDCOM_FONE, :DDDFONE, :TELFONE,');
               Sql.Add(':ZAPFONE, :CONTATOFONE, :INTFONE)');
               Params[0].AsInteger := gIdComercio;
               Params[1].AsString  := frmComercio.sgrdTelefones.Cells[0,i];//DDD
               Params[2].AsString  := frmComercio.sgrdTelefones.Cells[1,i];//Telefone

               if frmComercio.sgrdTelefones.Cells[3,i] = '●' then
                  Params[3].AsString  := '1'
               else
                  Params[3].AsString := '0';//Zap

               Params[4].AsString  := frmComercio.sgrdTelefones.Cells[2,i];//Contato

               if frmComercio.sgrdTelefones.Cells[4,i] = '●' then
                  Params[5].AsString  := '1'
               else
                  Params[5].AsString := '0';//AL

               ExecSql;
            end;
//==>CheckList
         for i := 0 to frmComercio.lstCheckListSel.Count - 1 do
            begin
               Close;
               Sql.Clear;
               Sql.Add('INSERT INTO ALCHECKCOM');
               Sql.Add('(IDCOM_CHECKCOM, IDCHECK_CHEKCOM) VALUES ');
               Sql.Add('(:IDCOM_CHECKCOM, (SELECT IDCHECK FROM ALCHECKLIST WHERE '+
                        'DESCRCHECK = '+QuotedStr(frmComercio.lstCheckListSel.Items[i])+'))');
               Params[0].AsInteger := gIdComercio;
               ExecSql;
            end;
//==>Categoria
         for i := 0 to frmComercio.lstSubCategoria.Items.Count - 1 do
            begin
               vlbi := TListBoxItem(frmComercio.lstSubCategoria.ListItems[i]);
               if vlbi.IsChecked = True then
                  begin
                     Close;
                     Sql.Clear;
                     Sql.Add('INSERT INTO ALSUBCATCOM');
                     Sql.Add('(ID_COM, ID_SUBCAT, ID_CAT) VALUES ');
                     Sql.Add('(:ID_COM, :ID_SUBCAT, :ID_CAT)');
                     Params[0].AsInteger := gIdComercio;
                     Params[1].AsInteger := Integer(frmComercio.lstSubCategoria.Items.Objects[i]);
                     Params[2].AsInteger := Integer(frmComercio.lstCategoria.Items.Objects[frmComercio.lstCategoria.ItemIndex]);
                     ExecSql;
                  end;
            end;
//==> Imagens
               Close;
               Sql.Clear;
               Sql.Add('INSERT INTO ALFILES');
               Sql.Add('(NOMEFILES, IDCOM_FILES) VALUES ');
               Sql.Add('(:NOMEFILES, :IDCOM_FILES)');
         for I := 1 to vNextImage - 1 do
            begin
               pNameFile := 'FTO'+GeraNameFile+'.jpg';
               TImage(frmComercio.FindComponent('imgCom'+i.ToString)).Bitmap.SaveToFile(gPathArquivos+'\Fotos\'+pNameFile);
               Params[0].AsString  := pNameFile;
               Params[1].AsInteger := gIdComercio;
               ExecSql;
            end;
               Params[0].AsString  := vFotoDestaque;
               Params[1].AsInteger := 0;
               ExecSql;

      end;//With
With frmCaixaMsg do
   begin
      Tag := 1;
      lblMensagem.Text := 'Comércio cadastrado com sucesso!';
      pLoadImage(imgIcoMsg,fIconInformation);
      frmComercio.tabCadastro.ActiveTab := frmComercio.tbInfoBasicas;
      sbtnSim.Visible := False;
      sbtnNao.Visible := False;
      sbtnOK.Visible  := True;
   end;
{$ENDREGION}

end;

end.
