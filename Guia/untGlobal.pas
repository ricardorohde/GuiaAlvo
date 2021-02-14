unit untGlobal;

interface

uses
  FMX.Objects, FMX.Forms, System.Classes, FireDAC.Comp.Client, IdFtp, System.NetEncoding, IdHTTP,
  IdSSLOpenSSL, Guia.Controle, System.Net.HttpClient;

function formataCNPJCEP(vDoc,vAcao : String) : String;
function SizeImgPx(fImagem : String) : String;
function GeraNameFile : String;
procedure pLoadImage(pImage : TImage; pImagem : String);
procedure fMsg(vForm:TForm; vCaption, vMensagem, vNameImg, vButtons: String);
function QueryToLog(Q: TFDQuery): string;
function preencheCEP(vCep : String; vForm: TForm) : Boolean;
function formataDDD(vDDD: String): String;
function FormataFone(vFone, vAcao: String): String;
function ExtractText(aText, OpenTag, CloseTag : String) : String;
function PintarStatus(S : String) : String;
function NomeStatus(S : String) : String;
function FinalSemana(vData : TDate) : Boolean;
function isNumeric(S : String) : Boolean;
procedure LimpaEdit(fForm : TForm);
//function ConvertFileToBase64(AInFileName: String): String;
function SendFileFtp(File_From, File_To, Dir_To: string) : Boolean;
function ReceiveFileFtp(File_From, File_To, Dir_Ftp: string) : Boolean;
function SendSMS(vCelular,vMsg : String) : Boolean;
function ValidaCelular : String;
function GeraSenha : String;
function DeleteFileFtp(vDirFtp,vFile: string) : Boolean;
function CarregaPosicaoMapa(fEndereco : String) : String;
function ApenasNumeros(S: String): String;
function StrToBoolValue(AValue, ATrue, AFalse : String) : Boolean;
function BoolToStrValue(AValue : Boolean) : String;
function EnviarPush(ATokenCelular, ATitulo, AMensagem, AImagem, AAnuncio, AIdComercio, ANomeComercio : String) : Integer;
function DataAtual: TDateTime;


var
gPathArquivos : String;
vListaErros : TStringList;
gIdComercio, gIdContrato : Integer;
pNewFile, pOldFile, pNameFile: String;
gUpdate : Boolean = False;
gLetra, gImgHome, gImgSecao : String;
gLimiteFindCep : Integer;
gDiasStatus : Integer;
gDiasVencto : Integer;
gAutorizado : Boolean;

gIdUsu      : Integer;
ALog : TStringlist;
const

   gSenhaSMS         : String = 'MFnW289S5pv3XZs';

   fIconExclamation   : String = 'fIconExclamation';
   fIconInterrogation : String = 'fIconInterrogation';
   fIconError         : String = 'fIconError';
   fIconInformation   : String = 'fIconInformation';
   fIconMais          : String = 'fIconMais';
   fbtnYesNo          : String = 'fbtnYesNo';
   fBtnOK             : String = 'fBtnOK';
   ffmtEnter          : String = 'fmtEnter';
   ffmtExit           : String = 'fmtExit';
   gEstados           : String = 'AC,AL,AP,AM,BA,CE,DF,ES,GO,MA,MT,MS,MG,PA,PB,PR,PE,PI,RJ,RN,RS,RO,RR,SC,SP,SE,TO';
   gLetras            : String = 'ABCDEFGHIJKLMNOPQRSTUVXWYZ';

   gCorStOnLine       : String = '<font color="claMidnightBlue">';
   gCorStOffLine      : String = '<font color="claDarkGreen">';
   gCorStAtrasado     : String = '<font color="claFireBrick">';
   gCorStPausado      : String = '<font color="claGold">';
   gCorStFinalizado   : String = '<font color="clared"><S>';
   gCorStCancelado    : String = '<font color="claDimGray"><S>';
   gCorStNovo         : String = '<font color="claBlack">';
   gCorStVencer       : String = '<font color="claGoldenrod">';

   gCorStPago         : String = '<font color="claSeaGreen">';
   gCorStVencido      : String = '<font color="claRed">';
   gCorStAVencer      : String = '<font color="claGoldenrod">';

implementation

uses
  FMX.Graphics, System.SysUtils, untDmGeral, System.Types, FMX.StdCtrls,
  Data.DB, System.AnsiStrings, FMX.Edit, FMX.Memo, FMX.Grid, IdFTPCommon,
  System.JSON;

function getCamposJsonString(json,value:String): String;
var
   LJSONObject: TJSONObject;
   function TrataObjeto(jObj:TJSONObject):string;
   var i:integer;
       jPar: TJSONPair;
   begin
        result := '';
        for i := 0 to jObj.Size - 1 do
        begin
             jPar := jObj.Get(i);
             if jPar.JsonValue Is TJSONObject then
                result := TrataObjeto((jPar.JsonValue As TJSONObject)) else
             if sametext(trim(jPar.JsonString.Value),value) then
             begin
                  Result := jPar.JsonValue.Value;
                  break;
             end;
             if result <> '' then
                break;
        end;
   end;
begin
   try
      LJSONObject := nil;
      LJSONObject := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(json),0) as TJSONObject;
      result := TrataObjeto(LJSONObject);
   finally
      LJSONObject.Free;
   end;
end;


function DataAtual: TDateTime;
var
fQueryTmp : TFDQuery;
fTSAgora : String;
begin

   Try
      fQueryTmp := TFDQuery.Create(nil);
      fQueryTmp.Connection := dmGeral.Conexao;
      fQueryTmp.Close;
      fQueryTmp.SQL.Clear;
      fQueryTmp.SQL.Add('select current_time as hora, current_date as data from rdb$database');
      fQueryTmp.Open;
      fTSAgora := fQueryTmp.FieldByName('data').AsString + ' ' + fQueryTmp.FieldByName('hora').AsString;
      Result := StrToDateTime(fTSAgora);
   Finally
      fQueryTmp.DisposeOf;
   End;

end;


function EnviarPush(ATokenCelular, ATitulo, AMensagem, AImagem, AAnuncio, AIdComercio, ANomeComercio : String) : Integer;
var
        client : THTTPClient;
        v_json : TJSONObject;
        v_jsondata : TJSONObject;
        v_data : TStringStream;
        v_response : TStringStream;
        url_google : string;

begin

     url_google := 'https://fcm.googleapis.com/fcm/send';

     //--------------------------------

     v_json := TJSONObject.Create;
     v_json.AddPair('to', ATokenCelular);

     v_jsondata := TJSONObject.Create;
     v_jsondata.AddPair('body', AMensagem);
     v_jsondata.AddPair('title', ATitulo);


     v_json.AddPair('notification', v_jsondata);


     v_jsondata := TJSONObject.Create;
     v_jsondata.AddPair('Mensagem'     ,AMensagem);
     v_jsondata.AddPair('Titulo'       ,ATitulo);
     v_jsondata.AddPair('Imagem'       ,AImagem);
     v_jsondata.AddPair('Anuncio'      ,AAnuncio);
     v_jsondata.AddPair('IdComercio'   ,AIdComercio);
     v_jsondata.AddPair('NomeComercio' ,ANomeComercio);


     v_json.AddPair('data', v_jsondata);

     client := THTTPClient.Create;
     client.ContentType := 'application/json';
     client.CustomHeaders['Authorization'] := 'key=' + ctrKEYPUSH;

     v_data := TStringStream.Create(v_json.ToString, TEncoding.UTF8);
     V_data.Position := 0;

     v_response := TStringStream.Create;

     client.Post(url_google, v_data, v_response);
     v_response.Position := 0;

     Result := getCamposJsonString(v_response.DataString,'failure').ToInteger;

end;

procedure ConectaFTP(gFTP: TIdFtp);
begin
   if not gFTP.Connected then
      begin

         gFTP.Disconnect;
         gFTP.host     := ctrHOSTFTP; // Endereço do servidor FTP
         gFTP.port     := ctrPORTAFTP;
         gFTP.username := ctrUSUARIOFTP; // Parametro nome usuario servidor FTP
         gFTP.password := ctrSENHAFTP; // Parametro senha servidor FTP
         gFTP.Connect();
         AssErt(gFTP.Connected);

      end;
end;

procedure pLoadImage(pImage : TImage; pImagem : String);
var
InStream: TResourceStream;
begin

   InStream := TResourceStream.Create(HInstance, pImagem, RT_RCDATA);
   try
      pImage.Bitmap.LoadFromStream(InStream);
   finally
      InStream.Free;
   end;

end;

function ApenasNumeros(S: String): String;
var
   vText: PChar;
begin
   vText := PChar(S);
   Result := '';

   while (vText^ <> #0) do
   begin
{$IFDEF UNICODE}
      if CharInSet(vText^, ['0' .. '9']) then
{$ELSE}
      if vText^ in ['0' .. '9'] then
{$ENDIF}
         Result := Result + vText^;

      Inc(vText);
   end;
end;

function CarregaPosicaoMapa(fEndereco : String) : String;
var
xTemp: TStringList;
vLat, vLong, S : String;
i,j : Integer;
vMemo : TMemo;
vIdSSL : TIdSSLIOHandlerSocketOpenSSL;
vIdHttp : TIdHTTP;
AKey : String;
begin
   AKey := 'AIzaSyBEmEFZcMSPDszUa7E-SfDLZPQDVc7XZHE';
  vIdSSL  := TIdSSLIOHandlerSocketOpenSSL.Create(Application);
  vIdHttp := TIdHTTP.Create(Application);
  vMemo   := TMemo.Create(Application);

  vIdSSL.SSLOptions.Method := sslvTLSv1;
  vIdSSL.SSLOptions.Mode   := sslmUnassigned;
  vIdHttp.IOHandler := vIdSSL;
  xTemp:= TStringList.Create;

  vIdHttp.Request.Accept := 'text/html, */*';
  vIdHttp.Request.UserAgent := 'Mozilla/3.0 (compatible; IndyLibrary)';
  vIdHttp.Request.ContentType := 'application/x-www-form-urlencoded';
  vIdHttp.HandleRedirects := True;
  S := StringReplace(fEndereco,' ','%20',[rfReplaceAll]);
  xTemp.Text := UTF8Decode(vIdHttp.Get('https://maps.google.com/maps/api/geocode/json?sensor=false&address={'+S+'}&key='+AKey));

  vMemo.Lines.Clear;
  for i := 0 to xTemp.Count - 1 do
     begin
        vMemo.Lines.Add('Linha: '+FormatFloat('000',i)+'   '+ xTemp.Strings[i]);
        if Pos('"location"',xTemp.Strings[i]) > 0 then j := i;

     end;
  vLat := Copy(Trim(xTemp.Strings[j+1]),8,12);
  vLong := Copy(Trim(xTemp.Strings[j+2]),8,12);

  Result := vLat+'|'+vLong;
end;

function ValidaCelular : String;
begin
Randomize;
Result := FormatFloat('000000',Random(999999));
end;

function GeraSenha : String;
var
R: String;
const
 vChars : String = 'AB0CD1EF2GH3IJ4KL5MN6OP7QR8ST9UVXWYZ';
begin
Randomize;
R := '';
While Length(R) < 6 do
   R := Trim(R + vChars[Random(36)]);
Result := R;
end;

function SendSMS(vCelular, vMsg: String): Boolean;
var
   vLista: TStringList;
   vIdHTTP: TIdHTTP;
begin
   Result := True;
   vLista := TStringList.Create;
   vIdHTTP := TIdHTTP.Create(nil);
   Try
      Try
         vLista.Add('metodo=envio');
         vLista.Add('usuario=souza@vikmar.com.br');
         vLista.Add('senha=Mjs19770');
         vLista.Add('celular=' + vCelular);
         vLista.Add('mensagem=' + vMsg);
         vIdHTTP.Post
           ('http://www.iagentesms.com.br/webservices/http.php', vLista);
      Except
         Result := False;
      end;
   Finally
      FreeAndNil(vIdHTTP);
   end;
end;


function FinalSemana(vData : TDate) : Boolean;
begin
if (DayOfWeek(vData) = 7) or (DayOfWeek(vData) = 1) then
   Result := True else Result := False;
end;

function SendFileFtp(File_From, File_To, Dir_To: string) : Boolean;
var
   ftp: TIdFTP;
   ms: TMemoryStream;
   image : TBitmap;
   TextMemo : TMemo;
begin
   Result := False;
   image := TBitmap.Create;
   TextMemo := TMemo.Create(Application);
   ftp := TIdFTP.Create(Application);
   ms := TMemoryStream.Create;
   try
      try
         if Pos('.txt', File_From) = 0 then
            begin
               image.LoadFromFile(File_From);
               image.SaveToStream(ms);
               ms.Position := 0;
            end
         else
            begin
               TextMemo.Lines.LoadFromFile(File_From);
               TextMemo.Lines.SaveToStream(ms);
               ms.Position := 0;
            end;

            ConectaFTP(ftp);
            ftp.ChangeDir(Dir_To); // Definir a pasta no servidor
            ftp.TransferType := ftBinary;
            ftp.Put(ms, File_To);
            Result := True;

      finally
         ms.Free;
         image.Free;
         ftp.Free;
      end;
   except
      Result := false;
   end;
end;

function DeleteFileFtp(vDirFtp,vFile: string) : Boolean;
var
   ftp: TIdFTP;
begin
   Result := False;
   ftp := TIdFTP.Create(Application);
   try
      try
         ConectaFTP(ftp);
         ftp.ChangeDir(vDirFtp); // Definir a pasta no servidor
         ftp.TransferType := ftBinary;
         ftp.Delete(vFile);
         Result := True;
      finally
         ftp.Free;
      end;
   except
      Result := false;
   end;
end;

function ReceiveFileFtp(File_From, File_To, Dir_Ftp: string) : Boolean;
var
   ftp: TIdFTP;
begin
   Result := False;
   ftp := TIdFTP.Create(Application);
   try
      try
         ConectaFTP(ftp);
         ftp.ChangeDir(Dir_Ftp); // Definir a pasta no servidor
         ftp.TransferType := ftBinary;
         ftp.Get(File_From, File_To,True);
         Result := True;
      finally
         ftp.Free;
      end;
   except
      Result := false;
   end;
end;

function StrToBoolValue(AValue, ATrue, AFalse : String) : Boolean;
begin

    If AValue = ATrue  then Result := True;
    If AValue = AFalse then Result := False;

end;

function BoolToStrValue(AValue : Boolean) : String;
begin

    case AValue of
        True : Result := 'T';
       False : Result := 'F';
    end;

end;

{function ConvertFileToBase64(AInFileName: String): String;
var
   inStream: TStream;
   outStream: TStream;
   vFile: String;
   vStringList: TStringList;
   vPathFile : String;
begin
   vPathFile := gPathArquivos;
   AInFileName := vPathFile + AInFileName;
   inStream := TFileStream.Create(AInFileName, fmOpenRead);
   vStringList := TStringList.Create;
   try
      vFile := FormatDateTime('hhmmss', Now);
      outStream := TFileStream.Create(vFile, fmCreate);
      try
         TNetEncoding.Base64.Encode(inStream, outStream);
      finally
         outStream.Free;
      end;

      vStringList.LoadFromFile(vFile);

      Result := vStringList.Text;
   finally
      DeleteFile(Pchar(vFile));
      inStream.Free;
   end;
end;

procedure ConvertBase64ToFile(Base64, FileName: string);
var
   inStream: TStream;
   outStream: TStream;
   vFiletmp: String;
   vStringList: TStringList;
   vDestino : String;
begin
   vStringList := TStringList.Create;
   try
      vFiletmp := FormatDateTime('hhmmss', Now);
      vStringList.Add(Base64);
      vStringList.SaveToFile(gPathArquivos+'\Tmp\' + vFiletmp);
      inStream := TFileStream.Create(gPathArquivos+'\Tmp\' + vFiletmp, fmOpenRead);

      try
         vDestino := gPathArquivos;
         outStream := TFileStream.Create(vDestino, fmCreate);
         try
            TNetEncoding.Base64.Decode(inStream, outStream);
         finally
            outStream.Free;
         end;
      finally
         inStream.Free;
      end;
   finally
      DeleteFile(gPathArquivos+'\Tmp\' + vFiletmp);
      FreeAndNil(vStringList);
   end;
end;  }


function PintarStatus(S : String) : String;
begin
//Status Contrato
if S = 'ONLINE'     then Result := gCorStOnLine;
if S = 'OFFLINE'    then Result := gCorStOffLine;
if S = 'ATRASADO'   then Result := gCorStAtrasado;
if S = 'PAUSADO'    then Result := gCorStPausado;
if S = 'FINALIZADO' then Result := gCorStFinalizado;
if S = 'CANCELADO'  then Result := gCorStCancelado;
//Status Pagamentos
if S = 'VENCER'     then Result := gCorStVencer;
if S = 'PAGO'       then Result := gCorStPago;
if S = 'VENCIDO'    then Result := gCorStVencido;
if S = 'AVENCER'    then Result := gCorStAVencer;
end;

function NomeStatus(S : String) : String;
begin
//Status Contrato
if Pos('ONLINE',S)     > 0 then Result := 'ONLINE';
if Pos('OFFLINE',S)    > 0 then Result := 'OFFLINE';
if Pos('ATRASADO',S)   > 0 then Result := 'ATRASADO';
if Pos('PAUSADO',S)    > 0 then Result := 'PAUSADO';
if Pos('FINALIZADO',S) > 0 then Result := 'FINALIZADO';
if Pos('CANCELADO',S)  > 0 then Result := 'CANCELADO';
if Pos('NOVO',S)       > 0 then Result := 'NOVO';
//Status Pagamentos
if Pos('VENCER',S)     > 0 then Result := 'VENCER';
if Pos('PAGO',S)       > 0 then Result := 'PAGO';
if Pos('VENCIDO',S)    > 0 then Result := 'VENCIDO';
if Pos('AVENCER',S)    > 0 then Result := 'AVENCER';
end;

function ExtractText(aText, OpenTag, CloseTag : String) : String;
var
  iAux, kAux : Integer;
begin
Result := '';
if Pos('/',aText) > 0 then
   begin
      if (Pos(CloseTag, aText) <> 0) and (Pos(OpenTag, aText) <> 0) then
         begin
            iAux := Pos(OpenTag, aText) + Length(OpenTag);
            kAux := Pos(CloseTag, aText);
            Result := Copy(aText, iAux, kAux-iAux);
         end;
   end
else
   begin
      Result := aText;
   end;
end;

function FormataFone(vFone, vAcao: String): String;
// vAcao  1 = Ao entrar , 2 Ao sair
var
   vRes: String;
begin
   if vAcao = 'ffEnter' then
      begin
         if Length(vFone) = 9 then
            vRes := Copy(vFone, 1, 4) + Copy(vFone, 6, 4);
         if (Length(vFone) = 10) and (Pos('-', vFone) > 0) then
            vRes := Copy(vFone, 1, 5) + Copy(vFone, 7, 4);
      end
   else
      begin
         if Length(vFone) = 8 then
            vRes := Copy(vFone, 1, 4) + '-' + Copy(vFone, 5, 4);
         if (Length(vFone) = 9) and (Pos('-', vFone) = 0) then
            vRes := Copy(vFone, 1, 5) + '-' + Copy(vFone, 6, 4);
      end;
   if Length(vRes) > 0 then
      Result := vRes
   else
      Result := vFone;
end;

function formataDDD(vDDD: String): String;
begin
   if Length(vDDD) = 2 then
      Result := '0' + vDDD
   else
      Result := vDDD;
end;

procedure LimpaEdit(fForm : TForm);
var
i : Integer;
begin
for i := 0 to fForm.ComponentCount - 1 do
   if fForm.Components[i] is TEdit then TEdit(fForm.Components[i]).Text := '';
end;

function preencheCEP(vCep : String; vForm: TForm) : Boolean;
begin

   dmGeral.ConsultaCep(vCep);

   if dmGeral.fdmemCep.RecordCount > 0 then
      begin
         TEdit(vForm.FindComponent('edtLogradouro')).Text := dmGeral.fdmemCeplogradouro.Text;
         TEdit(vForm.FindComponent('edtBairro')).Text     := dmGeral.fdmemCepbairro.Text;
         TEdit(vForm.FindComponent('edtCidade')).Text     := dmGeral.fdmemCeplocalidade.Text;
         TEdit(vForm.FindComponent('edtUF')).Text         := dmGeral.fdmemCepuf.Text;
         Result := True;
      end
   else
      begin
         Result := False;
      end;
end;

function isNumeric(S : String) : Boolean;
begin
Result := True;
   Try
      StrToInt(S);
   Except
      Result := False;
   end;
end;

function QueryToLog(Q: TFDQuery): string;
var
  i: Integer;
  r: string;
begin
  Result := Q.SQL.Text;
  for i := 0 to Q.Params.Count - 1 do
  begin
    case Q.Params.Items[i].DataType of
      ftString, ftDate, ftDateTime: r := QuotedStr(Q.Params[i].AsString);
    else
      r := Q.Params[i].AsString;
    end;
    Result := ReplaceText(Result, ':' + Q.Params.Items[i].Name, r);
  end;
end;

procedure fMsg(vForm:TForm; vCaption, vMensagem, vNameImg, vButtons: String);
begin
   With vForm do
      begin
         if Length(Trim(vCaption)) > 0 then
            TLabel(vForm.FindComponent('lblCaption')).Text := vCaption;

         TLabel(vForm.FindComponent('lblMensagem')).Text := vMensagem;
         pLoadImage(TImage(vForm.FindComponent('imgIcoMsg')), vNameImg);
         if vButtons = fbtnYesNo then
            begin
               TSpeedButton(vForm.FindComponent('sbtnSim')).Visible := True;
               TSpeedButton(vForm.FindComponent('sbtnNao')).Visible := True;
               TSpeedButton(vForm.FindComponent('sbtnOK')).Visible := False;
            end
         else
            begin
               TSpeedButton(vForm.FindComponent('sbtnSim')).Visible := False;
               TSpeedButton(vForm.FindComponent('sbtnNao')).Visible := False;
               TSpeedButton(vForm.FindComponent('sbtnOK')).Visible := True;
            end;
         TRectangle(vForm.FindComponent('recModal')).Visible := True;
      end;
end;


function SizeImgPx(fImagem : String) : String;
var
vImagem : TBitmap;
vLargura, vAltura : Integer;
begin
vImagem := TBitmap.Create();
vImagem.LoadFromFile(fImagem);
vAltura := vImagem.Height;
vLargura  := vImagem.Width;

Result := vLargura.ToString+'x'+vAltura.ToString;
end;

function GeraNameFile : String;
var
R: String;
fQueryTmp : TFDQuery;
Repetido : Boolean;
const
 vChars : String = 'AB0CD1EF2GH3IJ4KL5MN6OP7QR8ST9UVXWYZ';
begin
fQueryTmp := TFDQuery.Create(nil);
fQueryTmp.Connection := dmGeral.Conexao;
Randomize;
Repetido := True;
While Repetido do
   begin
      R := '';
      While Length(R) < 12 do
         R := Trim(R + vChars[Random(36)]);
   With fQueryTmp do
      begin
         Close;
         Sql.Clear;
         Sql.Add('SELECT * FROM ALFILES');
         Sql.Add('WHERE NOMEFILES LIKE '+''''+R+'%'+'''');
         Open;
         if RecordCount = 0 then Repetido := False else Repetido := True;
      end;
   end;
FreeAndNil(fQueryTmp);
Result := R;
end;

function formataCNPJCEP(vDoc,vAcao : String) : String;
var
vRes : String;
begin
//Ao entrar
if vAcao = ffmtEnter then
   begin
      //Copia as informações sem os pontos, traços ou barras
      if Length(vDoc) = 9 then
         vRes := Copy(vDoc,1,5) + Copy(vDoc,7,3);
      if Length(vDoc) = 14 then
         vRes := Copy(vDoc,1,3) + Copy(vDoc,5,3) + Copy(vDoc,9,3) + Copy(vDoc,13,2);
      if Length(vDoc) = 18 then
         vRes := Copy(vDoc,1,2) + Copy(vDoc,4,3) + Copy(vDoc,8,3) + Copy(vDoc,12,4) + Copy(vDoc,17,2);
   end
else
   begin
      //Acrescenta os traçoes, barras ou pontos onde necessário
      if Length(vDoc) = 8 then
         vRes := Copy(vDoc,1,5) +'-'+ Copy(vDoc,6,3);
      if Length(vDoc) = 11 then
         vRes := Copy(vDoc,1,3) +'.'+ Copy(vDoc,4,3) +'.'+ Copy(vDoc,7,3) +'-'+ Copy(vDoc,10,2);
      if Length(vDoc) = 14 then
         vRes := Copy(vDoc,1,2) +'.'+ Copy(vDoc,3,3) +'.'+ Copy(vDoc,6,3) +'/'+ Copy(vDoc,9,4) +'-'+ Copy(vDoc,13,2);
   end;
if Length(vRes) > 0 then
   Result := vRes
else
   Result := vDoc;
end;

end.
