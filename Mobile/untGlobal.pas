unit untGlobal;

interface

uses
idFtp, FMX.Objects, FMX.Memo, System.IOUtils, FMX.Forms, FireDAC.Comp.Client,
FMX.StdCtrls,
System.RegularExpressions,
System.Classes,
System.SysUtils,
System.Types,
System.StrUtils,
System.Math,
JSON,
System.Net.HttpClient,
IniFiles,
System.Net.HttpClientComponent,
Guia.Controle,
Guia.untClientmodule,
Guia.DmGeral
{$IFDEF ANDROID}
,Androidapi.JNI.App,
Androidapi.JNI.JavaTypes,
Androidapi.JNI.Telephony,
Androidapi.JNI.GraphicsContentViewText,
Androidapi.JNI.Net,
Androidapi.Helpers
{$ENDIF ANDROID}
;


function ReceiveFileFtp(APathImage, File_Receive: string; imgReceive : TImage; txtReceive : TLabel) : Boolean;
function fVerificaInternet : Boolean;
function StatusComercio(memTabela : TFDMemTable) : String;
function GetDistanceBetween(long1, lat1, long2, lat2 : Double) : Double;
function HorarioFuncionamento(memTabela : TFDMemTable; S : String) : String;
function IsNumeric(S : String) : Boolean;
function GetDistancia(LatOrigem, LongOrigem, LatDestino, LongDestino : Double) : String;
function IsValidCelular(aCelNumber: string): Boolean;
function SendSMS(vCelular,vMsg : String) : Boolean;
function FetchSms: TStringList;
function SendMsgWhats(vMsg : String):Boolean;
function ApenasNumeros(S: String): String;

procedure ConectaFTP(gFTP: TIdFtp);
procedure ReceiveFileFtpParams(gParametros: String);
function CaminhoArquivos(AFile : String) : String;
function BoolToStrValue(AValue : Boolean) : String;
function StrToBoolValue(AValue, ATrue, AFalse : String) : Boolean;
procedure pLoadImage(pImage : TImage; pImagem : String);
function VerificaUsuarioAvaliou(AIdUsu, AIdCom : Integer) : Boolean;
procedure SalvaAvaliacao(AIdCom, AIdUsu : Integer; AAmbiente, AAtendimento,
                         ALimpeza, ALocalizacao, APreco, AMedia : Single;
                         AComentario : String);
procedure DeletePush(AIdPush : Integer);
procedure AtivaPush(AAtiva : Boolean);
procedure NovoComercio(ACnpj, ARazao, AEmail, AFone, AContato : String);
function FormataFone(vFone : String): String;
function ValidaDOC(ADoc : String) : Boolean;
function FormataDOC(ADoc : String) : String;
function formataTelefone(fTelefone : String) : String;
function ComercioCadastrado(ACNPJ : String) : Boolean;
function ValidaEMail(const EMailIn: String): Boolean;
function RecebeNotificacao: Boolean;
function UsuarioConectado : Integer;
procedure GravaLoginIni(AIDLogin : Integer; ALogin, ASenha : String);

procedure GravaTutorial(AExecuta : Boolean);
function ExecutaTutorial : Boolean;
procedure UpdateUsuario(FNome, FCelular, FSenha : String; FID : Integer);
procedure ViewSenha(AImage : TImage; AView : Boolean);
function UpdateRaioUsuario(ARaio : Integer): Boolean;
procedure GravaUltimaPosicaoUsuario(ALatitude, ALongitude, ADeviceToken: String);


var

   gCodigo             : Word   = 155;
   gTempoReenvio       : TTime;
   uAction             : Char;
   gIdUsuConectado     : Integer = 0;
   gIdComSelecionado   : Integer = 0;
   gQtdeFavorito       : Integer = 0;
   gLogout             : Boolean = False;
   gDeviceToken,
   gDeviceID           : String;
   gTotalFotos         : ShortInt;
   gFotoAtual          : ShortInt;
   gPermissionLocal    : Boolean = False;
   gListaParamSecao    : TStringList;
   gListaParamSubSecao : TStringList;
   gListaParamLstCom   : TStringList;
   gListaParamComercio : TStringList;
   gListaParamAnuncio  : TStringList;
   gListaParamFavorito : TStringList;
   gListaParamGeral    : TStringList;

   gItensLista         : String;
   gRecebeNotificacao  : Boolean;
   gKeyPush            : String;

   gImgFundoSplash     : String;
   gImgTopoMenu        : String;
   gImgIconeMsg        : String;
   gImgLogoErroConexao : String;
   gImgLogoSplash      : String;

   gNomeUsuario        : String;
   gCelularUsuario     : String;
   gSenhaUsuario       : String;

   gRaio               : Integer;

   gExecutaTutorial    : Boolean = True;
   gExibeLoading       : Boolean = False;

const

   uANull        : Char   = 'N';
   uAAtivacao    : Char   = 'A';
   uARecuperacao : Char   = 'R';
   uAInclusao    : String = 'INS';
   uAExclusao    : String = 'EXC';
   uAFavoritos   : Char   = 'F';

   icoAView      : String = 'ViewSenha';
   icoAUnView    : String = 'UnViewSenha';

   gNomeApp      : String = 'Guia Alvo';
   gNomeFileIni  : String = 'GuiaComercio.ini';

   msgAvaliacao  : String = 'Diga a todos o que achou do %s.' + #13 +
                           'Você recomendaria? Porque?';
implementation

uses
  IdFTPCommon, IdTCPConnection, IdTCPClient,
 untMain, IdHTTP;

procedure GravaUltimaPosicaoUsuario(ALatitude, ALongitude, ADeviceToken: String);
begin

     cm.ServerMethodsClient.GravaUltimaPosicaoUsuario(ALatitude, ALongitude, ADeviceToken);

end;

function UpdateRaioUsuario(ARaio : Integer): Boolean;
begin

    Result := cm.ServerMethodsClient.UpdateRaioUsuario(gIdUsuConectado, ARaio);

end;

procedure UpdateUsuario(FNome, FCelular, FSenha : String; FID : Integer);
begin

     cm.ServerMethodsClient.UpdateUsuario(FNome, FCelular, FSenha, FID);

end;

procedure GravaLoginIni(AIDLogin : Integer; ALogin, ASenha : String);
var
AArqIni : TIniFile;
begin

     Try

        AArqIni := TIniFile.Create(CaminhoArquivos(gNomeFileIni));

        AArqIni.WriteInteger('LOGIN','IDLogin',AIDLogin);
        AArqIni.WriteString('LOGIN','Login',ALogin);
        AArqIni.WriteString('LOGIN','Senha',ASenha);

     Finally

        AArqIni.DisposeOf;

     end;

end;

procedure GravaTutorial(AExecuta : Boolean);
var
AArqIni : TIniFile;
begin

     Try

        AArqIni := TIniFile.Create(CaminhoArquivos('Tutorial.ini'));

        AArqIni.WriteString('TUTORIAL','Executa',BoolToStrValue(AExecuta));


     Finally

        AArqIni.DisposeOf;

     end;

end;

function ExecutaTutorial : Boolean;
var
AArqIni : TIniFile;
begin

     Try

        AArqIni := TIniFile.Create(CaminhoArquivos('Tutorial.ini'));

        Result := StrToBoolValue(AArqIni.ReadString('TUTORIAL','Executa',''),'T','F');


     Finally

        AArqIni.DisposeOf;

     end;

end;

procedure ViewSenha(AImage : TImage; AView : Boolean);
begin

     case AView of

          True : pLoadImage(AImage, icoAView);
         False : pLoadImage(AImage, icoAUnView);
     end;

end;

function UsuarioConectado : Integer;
var
AArqIni : TIniFile;
AResult : Integer;
AIdLogin, ALogin, ASenha, S : String;
begin

     Try

        if not FileExists(CaminhoArquivos(gNomeFileIni)) then
           begin
              AResult := 0;
           end
        else
           begin

              AArqIni := TIniFile.Create(CaminhoArquivos(gNomeFileIni));

              AIdLogin := AArqIni.ReadString('LOGIN','IDLogin',AIdLogin);
              ALogin   := AArqIni.ReadString('LOGIN','Login',ALogin);
              ASenha   := AArqIni.ReadString('LOGIN','Senha',ASenha);

              dmGeral.DownloadUsuario(ALogin);
              if dmGeral.memUsuarios.RecordCount > 0 then
                 begin

                     if dmGeral.memUsuarios.FieldByName('SENHAUSU').AsString = ASenha then
                         begin
                               gNomeUsuario    := dmGeral.memUsuarios.FieldByName('NOMEUSU').AsString;
                               gCelularUsuario := FormataTelefone(dmGeral.memUsuarios.FieldByName('CELULARUSU').AsString);
                               gSenhaUsuario   := dmGeral.memUsuarios.FieldByName('SENHAUSU').AsString;
                               gQtdeFavorito   := dmGeral.memUsuarios.FieldByName('QTDEFAVUSU').AsInteger;
                               AResult         := AIdLogin.ToInteger

                         end
                     else
                         begin

                              AResult := 0;

                         end;

                  end
               else
                  begin

                     AResult := 0;

                  end;

           end;

     Finally

            Result := AResult;
            AArqIni.DisposeOf;

     End;

end;

function ComercioCadastrado(ACNPJ : String) : Boolean;
begin

      Result := cm.ServerMethodsClient.ComercioCadastrado(ACNPJ);

end;

function RecebeNotificacao: Boolean;
begin

    Result := cm.ServerMethodsClient.RecebeNotificacao(gKeyPush);

end;

function formataTelefone(fTelefone : String) : String;
var
pValue : String;
begin

   pValue := ApenasNumeros(fTelefone);

   case Length(pValue) of
      8  : pValue := Copy(pValue,1,4) + '-' + (Copy(pValue,5,4));
      9  : pValue := Copy(pValue,1,5) + '-' + (Copy(pValue,6,4));
      10 : pValue := '(' + Copy(pValue,1,2) + ')' + Copy(pValue,3,4) + '-' + (Copy(pValue,7,4));
      11 : pValue := '(' + Copy(pValue,1,2) + ')' + Copy(pValue,3,5) + '-' + (Copy(pValue,8,4));
   end;

   Result := pValue;

end;

function FormataDOC(ADoc : String) : String;
begin
   ADoc := ApenasNumeros(ADoc);

   case Length(ADoc) of

      14 : Result := Copy(ADoc,1,2) + '.' + Copy(ADoc,3,3) + '.' + Copy(ADoc,6,3) + '/' + Copy(ADoc,9,4) + '-' + Copy(ADoc,13,2);
      11 : Result := Copy(ADoc,1,3) + '.' + Copy(ADoc,4,3) + '.' + Copy(ADoc,7,3) +'-' + Copy(ADoc,10,2);

   end;

end;


function ValidaCPF(CPF: string): Boolean;
var
  v: array[0..1] of Word;
  fcpf: array[0..10] of Byte;
  I: Byte;
  J, W : Integer;
  const
  fCaracter : Array [0..9] of char = ('0','1','2','3','4','5','6','7','8','9');
begin
for j := 0 to 9 do
   begin
      if CPF = StringOfChar(fCaracter[j], 11) then
         raise Exception.Create(CPF + ' CPF inválido!');
   end;

     w := 0;
     {$IFDEF MSWINDOWS}
     W := 1;
     {$ENDIF}

  try
    for I := 0 to 10 do
      fcpf[i] := StrToInt(CPF[i+w]);

       v[0] := 10*fcpf[0] + 9*fcpf[1] + 8*fcpf[2];
       v[0] := v[0] + 7*fcpf[3] + 6*fcpf[4] + 5*fcpf[5];
       v[0] := v[0] + 4*fcpf[6] + 3*fcpf[7] + 2*fcpf[8];
       v[0] := 11 - v[0] mod 11;
       v[0] := IfThen(v[0] >= 10, 0, v[0]);

       v[1] := 11*fcpf[0] + 10*fcpf[1] + 9*fcpf[2];
       v[1] := v[1] + 8*fcpf[3] +  7*fcpf[4] + 6*fcpf[5];
       v[1] := v[1] + 5*fcpf[6] +  4*fcpf[7] + 3*fcpf[8];
       v[1] := v[1] + 2*v[0];
       v[1] := 11 - v[1] mod 11;
       v[1] := IfThen(v[1] >= 10, 0, v[1]);
       //Nota: Verdadeiro se os dígitos de verificação são os esperados.
       if ((v[0] = fcpf[9]) and (v[1] = fcpf[10])) then
         Result := True else Result := False;
  except on E: Exception do
    Result := False;
  end;
end;

function ValidaCNPJ(numCNPJ: string): Boolean;
var
   cnpj: string;
   dg1, dg2: Integer;
   x, j, total: Integer;
   ret: Boolean;
   const
   fCaracter : Array[0..9] of char = ('0','1','2','3','4','5','6','7','8','9');
begin ret := False;
cnpj := '';

for j := 0 to 9 do
   begin
      if numCNPJ = StringOfChar(fCaracter[j],14) then
         raise Exception.Create(numCNPJ + ' CNPJ inválido!');
   end;

if Length(numCNPJ) = 18 then
   if (Copy(numCNPJ, 3, 1) + Copy(numCNPJ, 7, 1) + Copy(numCNPJ, 11, 1) +
     Copy(numCNPJ, 16, 1) = '../-') then
   begin
      cnpj := Copy(numCNPJ, 1, 2) + Copy(numCNPJ, 4, 3) + Copy(numCNPJ, 8, 3) +
        Copy(numCNPJ, 12, 4) + Copy(numCNPJ, 17, 2);
      ret := True;
   end;
if Length(numCNPJ) = 14 then
begin
   cnpj := numCNPJ;
   ret := True;
end;
if ret then
begin
   try
      total := 0;
      for x := 1 to 12 do
      begin
         if x < 5 then
            Inc(total, StrToInt(Copy(cnpj, x, 1)) * (6 - x))
         else
            Inc(total, StrToInt(Copy(cnpj, x, 1)) * (14 - x));
      end;
      dg1 := 11 - (total mod 11);
      if dg1 > 9 then
         dg1 := 0;
      total := 0;
      for x := 1 to 13 do
      begin
         if x < 6 then
            Inc(total, StrToInt(Copy(cnpj, x, 1)) * (7 - x))
         else
            Inc(total, StrToInt(Copy(cnpj, x, 1)) * (15 - x));
      end;
      dg2 := 11 - (total mod 11);
      if dg2 > 9 then
         dg2 := 0;
      if (dg1 = StrToInt(Copy(cnpj, 13, 1))) and
        (dg2 = StrToInt(Copy(cnpj, 14, 1))) then
         ret := True
      else
         ret := False;
   except
      ret := False;
   end;
   case AnsiIndexStr(cnpj, ['00000000000000', '11111111111111',
     '22222222222222', '33333333333333', '44444444444444', '55555555555555',
     '66666666666666', '77777777777777', '88888888888888', '99999999999999']) of
      0 .. 9:
         ret := False;
   end;
end;
ValidaCNPJ := ret;
end;

function ValidaDOC(ADoc : String) : Boolean;
begin

     case Length(ApenasNumeros(ADoc)) of

          14 : Result := ValidaCNPJ(ADoc);
          11 : Result := ValidaCPF(ADoc);

     end;

end;

function FormataFone(vFone : String): String;
var
   vRes: String;
begin
      if Length(vFone) = 11 then
         vRes := '(' + Copy(vFone,1,2) + ')' +
                 Copy(vFone, 3, 5) + '-' +
                 Copy(vFone, 8, 4);

      if Length(vFone) = 10 then
         vRes := '(' + Copy(vFone, 1, 2) + ')' +
                 Copy(vFone, 3, 4) + '-' +
                 Copy(vFone, 7, 4);

      Result := vRes;
end;

function ValidaEMail(const EMailIn: String): Boolean;
const
   CaraEsp: array [1 .. 41] of string = ('!', '#', '$', '%', '¨', '&', '*', '(',
      ')', '+', '=', '§', '¬', '¢', '¹', '²', '³', '£', '´', '`', 'ç', 'Ç', ',',
      ';', ':', '<', '>', '~', '^', '?', '/', '', '|', '[', ']', '{', '}', 'º',
      'ª', '°', ' ');
var
   I, cont: Integer;
   EMail: String;
begin
   EMail := EMailIn;
   Result := true;
   cont := 0;
   if EMail <> '' then
      if (Pos('@', EMail) <> 0) and (Pos('.', EMail) <> 0) then // existe @ .
      begin
         if (Pos('@', EMail) = 1) or (Pos('@', EMail) = Length(EMail)) or
            (Pos('.', EMail) = 1) or (Pos('.', EMail) = Length(EMail)) or
            (Pos(' ', EMail) <> 0) then
         begin
            Result := False;
            Exit;
         end
         else // @ seguido de . e vice-versa
            if (abs(Pos('@', EMail) - Pos('.', EMail)) = 1) then
            begin
               Result := False;
               Exit;
            end
            else
            begin
               for I := 1 to 40 do // se existe Caracter Especial
                  if Pos(CaraEsp[I], EMail) <> 0 then
                  begin
                     Result := False;
                     Exit;
                  end;
               for I := 1 to Length(EMail) do
               begin // se existe apenas 1 @
                  if EMail[I] = '@' then
                     cont := cont + 1; // . seguidos de .
                  if (EMail[I] = '.') and (EMail[I + 1] = '.') then
                  begin
                     Result := False;
                     Exit;
                  end;
               end;
               // . no f, 2ou+ @, . no i, - no i, _ no i
               if (cont >= 2) or (EMail[Length(EMail)] = '.') or
                  (EMail[1] = '.') or (EMail[1] = '_') or (EMail[1] = '-') then
               begin
                  Result := False;
                  Exit;
               end;
               // @ seguido de COM e vice-versa
               if (abs(Pos('@', EMail) - Pos('com', EMail)) = 1) then
               begin
                  Result := False;
                  Exit;
               end;
               // @ seguido de - e vice-versa
               if (abs(Pos('@', EMail) - Pos('-', EMail)) = 1) then
               begin
                  Result := False;
                  Exit;
               end;
               // @ seguido de _ e vice-versa
               if (abs(Pos('@', EMail) - Pos('_', EMail)) = 1) then
               begin
                  Result := False;
                  Exit;
               end;
               if Pos('.', EMail) = Length(EMail) then
               begin
                  Result := False;
                  Exit;
               end;

               if Pos('-', EMail) = Length(EMail) then
               begin
                  Result := False;
                  Exit;
               end;

               if Pos('_', EMail) = Length(EMail) then
               begin
                  Result := False;
                  Exit;
               end;

               if (Copy(EMail,Length(Email),1) = '.') or
                  (Copy(EMail,Length(Email),1) = '-') or
                  (Copy(EMail,Length(Email),1) = '_') then
               begin
                  Result := False;
                  Exit;
               end;
            end;
      end
   else
         Result := False;
end;

procedure NovoComercio(ACnpj, ARazao, AEmail, AFone, AContato : String);
begin

     cm.ServerMethodsClient.NovoComercio(ACnpj, ARazao, AEmail, AFone, AContato);

end;

procedure AtivaPush(AAtiva : Boolean);
begin

     cm.ServerMethodsClient.AtivaPush(gKeyPush, AAtiva);

end;

procedure DeletePush(AIdPush : Integer);
begin

    cm.ServerMethodsClient.DeletePush(gIdUsuConectado, AIdPush);

end;

procedure SalvaAvaliacao(AIdCom, AIdUsu : Integer; AAmbiente, AAtendimento,
                         ALimpeza, ALocalizacao, APreco, AMedia : Single;
                         AComentario : String);
begin

    cm.ServerMethodsClient.SalvaAvaliacao(AIdCom, AIdUsu, AAmbiente, AAtendimento,
                                         ALimpeza, ALocalizacao, APreco, AMedia, AComentario);

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

function VerificaUsuarioAvaliou(AIdUsu, AIdCom : Integer) : Boolean;
begin

    Result := cm.ServerMethodsClient.VerificaUsuarioAvaliou(AIdUsu, AIdCom);

end;

function CaminhoArquivos(AFile : String) : String;
begin

     {$IFDEF MSWINDOWS}

             Result := ExtractFileDir(GetCurrentDir) + '\' + AFile;

     {$ENDIF}

     {$IFDEF ANDROID OR IOS}

             Result := TPath.Combine(TPath.GetDocumentsPath,AFile);

     {$ENDIF}

end;

procedure SendMSG(vMsg, vCelular: String);
var
   GerenciadorSMS: JSmsManager;
begin
   GerenciadorSMS := TJSmsManager.JavaClass.getDefault;
   GerenciadorSMS.sendTextMessage(StringToJString(vCelular),nil,StringToJString(vMsg), nil, nil);
end;

function SendMsgWhats(vMsg : String):Boolean;
var
  IntentWhats : JIntent;
begin
  IntentWhats := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_SEND);
  IntentWhats.setType(StringToJString('text/plain'));
  IntentWhats.putExtra(TJIntent.JavaClass.EXTRA_TEXT,
      StringToJString(vMsg));
  IntentWhats.setPackage(StringToJString('com.whatsapp'));
  TAndroidHelper.Activity.startActivity(IntentWhats);

end;


function SendSMS(vCelular,vMsg : String) : Boolean;
var
vLista : TStringList;
vIdHTTP : TIdHTTP;
begin
Result := True;
vLista := TStringList.Create;
vIdHTTP := TIdHTTP.Create(nil);
   Try
      Try
         vLista.Add('metodo=envio');
         vLista.Add('usuario=souza@vikmar.com.br');
         vLista.Add('senha=Mjs19770');
         vLista.Add('celular='+vCelular);
         vLista.Add('mensagem='+vMsg);
         vIdHTTP.Post('http://www.iagentesms.com.br/webservices/http.php',vLista);
      Except
         Result := False;
      end;
   Finally
      FreeAndNil(vIdHTTP);
   end;
end;

function GetStrNumber(const S: string): string;
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

function IsValidCelular(aCelNumber: string): Boolean;
var
   ipRegExp, vFone: string;
begin
   Result := False;

   { Recuperando somente os numeros }
   vFone := GetStrNumber(aCelNumber);
   try
      ipRegExp := '^[1-9]{2}(?:[6-9]|9[1-9])[0-9]{3}[0-9]{4}$';
      if TRegEx.IsMatch(vFone, ipRegExp) then
         Result := true;
   except
      Result := False;
   end;
end;

function sgn(a: real): real;
begin
  if a < 0 then sgn := -1 else sgn := 1;
end;

function atan2(y, x: real): real;
begin
  if x > 0  then atan2 := arctan(y/x)
  else if x < 0  then atan2 := arctan(y/x) + pi
  else atan2 := pi/2 * sgn(y);
end;

function GetDistancia(LatOrigem, LongOrigem, LatDestino, LongDestino : Double) : String;
var
vRes,Val1, Val2, Long, Lat: Double;
begin
  LatOrigem := LatOrigem * pi / 180.0;
  LongOrigem := LongOrigem * pi / 180.0;
  LatDestino := LatDestino * pi / 180.0;
  longDestino := longDestino * pi / 180.0;

  Lat := LatDestino - LatOrigem;
  Long := longDestino - LongOrigem;

  Val1 := 6371.0;
  Val2 := sin(Lat / 2) * sin(Lat / 2) + cos(LatOrigem) * cos(LatDestino) * sin(Long / 2) * sin(Long / 2);
  Val2 := 2 * ATan2(sqrt(Val2), sqrt(1 - Val2));


  vRes := Val1 * Val2;

  //if Copy(FloatToStr(vRes),1,1) = '0' then
  //   Result := FloatToStrF((vRes * 1000),ffNumber,12,1)+'mt' else
     Result := FloatToStrF(vRes,ffNumber,12,1)+'km';

end;


function IsNumeric(S : String) : Boolean;
begin
Result := True;
   Try
      StrToInt(S);
   Finally
      Result := False;
   End;
end;


function HorarioFuncionamento(memTabela : TFDMemTable; S : String) : String;
var
vR : String;
begin


vR :=  Copy(memTabela.FieldByName(S).AsString,1,5)+' - '+
       Copy(memTabela.FieldByName(S).AsString,16,5);

if Copy(memTabela.FieldByName(S).AsString,
        Length(memTabela.FieldByName(S).AsString),1) = '1' then
   vR := 'Fechado';

Result := vR;
end;

function StatusComercio(memTabela : TFDMemTable) : String;
var
S, F, hrAbre, hrFecha : String;
begin
   case DayOfWeek (Now) of
      1: S := 'HRDOMCOM';
      2: S := 'HRSEGCOM';
      3: S := 'HRTERCOM';
      4: S := 'HRQUACOM';
      5: S := 'HRQUICOM';
      6: S := 'HRSEXCOM';
      7: S := 'HRSABCOM';
   end;

hrAbre  := Copy(memTabela.FieldByName(S).AsString,1,5);
hrFecha := Copy(memTabela.FieldByName(S).AsString,
                Length(memTabela.FieldByName(S).AsString)-5,5);
F       := Copy(memTabela.FieldByName(S).AsString,
                Length(memTabela.FieldByName(S).AsString),1);

if F = '1' then
   begin
      Result := 'Fechado';
      Exit;
   end
else
  begin
     if (Time > StrToTime(hrFecha)) or (Time < StrToTime(hrAbre)) then
        begin
           Result := 'Fechado';
           Exit;
        end
     else
        begin
           Result := 'Aberto';
        end;
  end;
end;

function fVerificaInternet : Boolean;
var
TCPClient : TIdTCPClient;
begin
TCPClient := TIdTCPClient.Create(Application);
   Try
      Try
         With TCPClient do
            begin
               ReadTimeout    := 2000;
               ConnectTimeout := 2000;
               Port           := cm.DSRestConnection1.Port ;
               Host           := cm.DSRestConnection1.Host;
               Connect;
               Result := True;
            end;
      except
         Result := False;
      end;
   Finally
      TCPClient.Disconnect;
      TCPClient.DisposeOf;
   End;
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

procedure ReceiveFileFtpParams(gParametros: String);
var
   ms: TMemoryStream;
   fFTP, fPathFilesFtp, fFileReceive, fimgReceive, fIdImgProd: String;
   pStringSeparada: TStringDynArray;
begin
   pStringSeparada := SplitString(gParametros, ' ');

   fFTP          := pStringSeparada[0];
   fPathFilesFtp := pStringSeparada[1];
   fFileReceive  := pStringSeparada[2];
   fimgReceive   := pStringSeparada[3];

   Try

         ms := TMemoryStream.Create;
         ms.Position := 0;

         TIdFtp(frmMain.FindComponent(fFTP)).ChangeDir(fPathFilesFtp);
         TIdFtp(frmMain.FindComponent(fFTP)).TransferType := ftBinary;
         TIdFtp(frmMain.FindComponent(fFTP)).Get(fFileReceive, ms);

         TImage(frmMain.FindComponent(fimgReceive)).Bitmap.LoadFromStream(ms);


   Finally

      ms.DisposeOf;
      ms := nil;

   end;

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

function ReceiveFileFtp(APathImage, File_Receive: string; imgReceive : TImage; txtReceive : TLabel) : Boolean;
var
   ms: TMemoryStream;
   pathtxt : String;
   ftp : TIdFtp;
   mMemo : TMemo;
begin

   mMemo := TMemo.Create(frmMain);
   ms := TMemoryStream.Create;
   ms.Position := 0;
   Try
      Try
         ftp := TIdFTP.Create(Application);
         ftp.host     := ctrHOSTFTP; // Endereço do servidor FTP
         ftp.port     := ctrPORTAFTP;
         ftp.username := ctrUSUARIOFTP; // Parametro nome usuario servidor FTP
         ftp.password := ctrSENHAFTP; // Parametro senha servidor FTP
         ftp.Connect();

         AssErt(ftp.Connected);

         ftp.ChangeDir(APathImage); // Definir a pasta no servidor
         ftp.TransferType := ftBinary;

         if Pos('.txt',File_Receive) = 0 then
            begin
               ftp.Get(File_Receive, ms);
               imgReceive.Bitmap.LoadFromStream(ms);
               Result := True;
            end
         else
            begin
               pathtxt := TPath.Combine(TPath.GetDocumentsPath, File_Receive);
               ftp.Get(AnsiToUtf8(File_Receive), AnsiToUtf8(pathtxt), True);
               mMemo.Lines.LoadFromFile(AnsiToUtf8(pathtxt));
               txtReceive.Text := mMemo.Text;
               Result := True;
            end;
      except
         Result := false;
      end;
   Finally
      ftp.Disconnect;
      mMemo.DisposeOf;
      ftp.DisposeOf;
      ms.DisposeOf;
   End;
end;

function GetDistanceBetween(long1, lat1, long2, lat2 : Double) : Double;
var
   F,G,L : Double;
   SF, SG, SL,
   CF, CG, CL : Double;
   W1, W2 : Double;
   S, C : Double;
   O,R,D : Double;
   H1, H2 : Double;
   ff : Double;
begin
   ff := 1 / 298.257;
   F := (lat1 + lat2) / 2;
   G := (lat1 - lat2) / 2;
   L := (long1 - long2) / 2;

   SF := Sin(F*Pi/180);
   SG := Sin(G*Pi/180);
   SL := Sin(L*Pi/180);
   CF := Cos(F*Pi/180);
   CG := Cos(G*Pi/180);
   CL := Cos(L*Pi/180);

   W1 := sqr(SG * CL);
   W2 := sqr(CF * SL);
   S := W1 + W2;

   W1 := sqr(CG * CL);
   W2 := sqr(SF * SL);
   C := W1 + W2;
   O := ArcTan(Sqrt(S/C));
   R := Sqrt(S*C) / O;
   D := 2 * O * 6378.14;

   H1 := (3*R-1) / (2*C);
   H2 := (3*R+1) / (2*S);

   W1 := sqr(SF * CG) * H1 * ff + 1;
   W2 := sqr(CF * SG) * H2 * ff;

   Result := D * (W1 - W2) * 1.609344; //em km
end;

function FetchSms: TStringList;
var
   cursor: JCursor;
   uri: Jnet_Uri;
   address, person, msgdatesent, protocol, msgread, msgstatus, msgtype, msgreplypathpresent,
     Subject, body, servicecenter, locked: string;
   // msgunixtimestampms: int64;
   addressidx, personidx, { msgdateidx } msgdatesentidx, protocolidx, msgreadidx, msgstatusidx,
     msgtypeidx, msgreplypathpresentidx, subjectidx, bodyidx, servicecenteridx, lockedidx: Integer;
   vLista: TStringList;
begin
   Try
      uri := StrToJURI('content://sms/inbox');
      cursor := TAndroidHelper.Activity.getContentResolver.query(uri, nil, nil, nil, nil);
      addressidx := cursor.getColumnIndex(StringToJString('address'));
      personidx := cursor.getColumnIndex(StringToJString('person'));
      // msgdateidx := cursor.getColumnIndex(StringToJstring('date'));
      msgdatesentidx := cursor.getColumnIndex(StringToJString('date_sent'));
      protocolidx := cursor.getColumnIndex(StringToJString('protocol'));
      msgreadidx := cursor.getColumnIndex(StringToJString('read'));
      msgstatusidx := cursor.getColumnIndex(StringToJString('status'));
      msgtypeidx := cursor.getColumnIndex(StringToJString('type'));
      msgreplypathpresentidx := cursor.getColumnIndex(StringToJString('reply_path_present'));
      subjectidx := cursor.getColumnIndex(StringToJString('subject'));
      bodyidx := cursor.getColumnIndex(StringToJString('body'));
      servicecenteridx := cursor.getColumnIndex(StringToJString('service_center'));
      lockedidx := cursor.getColumnIndex(StringToJString('locked'));
      vLista := TStringList.Create;
      while (cursor.moveToNext) do
         begin
            address := JStringToString(cursor.getString(addressidx));
            person := JStringToString(cursor.getString(personidx));
            // msgunixtimestampms := cursor.getLong(msgdateidx);
            msgdatesent         := JStringToString(cursor.getString(msgdatesentidx));
            protocol            := JStringToString(cursor.getString(protocolidx));
            msgread             := JStringToString(cursor.getString(msgreadidx));
            msgstatus           := JStringToString(cursor.getString(msgstatusidx));
            msgtype             := JStringToString(cursor.getString(msgtypeidx));
            msgreplypathpresent := JStringToString(cursor.getString(msgreplypathpresentidx));
            Subject             := JStringToString(cursor.getString(subjectidx));
            body := JStringToString(cursor.getString(bodyidx));
            servicecenter := JStringToString(cursor.getString(servicecenteridx));
            locked := JStringToString(cursor.getString(lockedidx));
            vLista.Add(address + ' ' + body);
            // IntToStr(trunc(msgunixtimestampms/1000))+' '+address+' '+body+#13#vLista;
         end;
      Result := vLista;
   Except

   End;
end;


end.



