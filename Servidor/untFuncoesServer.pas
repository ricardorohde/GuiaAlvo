unit untFuncoesServer;

interface

uses
FireDAC.Comp.Client,
unt_Conexao,
System.StrUtils,
Guia.Controle,
JSON,
system.net.httpclient,
System.Classes,
FMX.Maps,
System.Math,
FMX.StdCtrls,
ACBrMail;

type
TResultArray = array of string;

function QueryToLog(Q: TFDQuery): string;
function TextoFiltrado(ATexto : String) : String;
function DataAtual: TDateTime;
function IndiceCalculoAvaliacao(AIdCom : Integer) : Integer;
procedure LoadControleServer;
procedure EnviarPush(ATokenCelular, ATitulo, AMensagem, AImagem, AAnuncio : String; ALog : TStringList);
function GetDistancia(LatOrigem, LongOrigem, LatDestino, LongDestino : Double) : String;
function getSqlRaio(AIdPush, ASQL : String; ARaio : Integer; AParams : String = '') : String;
function ApenasNumeros(S: String): String;
function ValidaEMail(const EMailIn: String): Boolean;
function BoolToStrValue(AValue : Boolean) : String;
function StrToBoolValue(AValue, ATrue, AFalse : String) : Boolean;
procedure ConfigEmail(AACBrEmail : TACBrMail; AAssunto, ANomeFrom : String; AHtml : Boolean);
implementation

uses
  System.Types, Data.DB, System.SysUtils;

var
AQueryTmp : TFDQuery;
LatDestino, LongDestino : Double;



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

function getValueControle(AControle : String) : String;
var
AQuery : TFDQuery;
begin

    try

        AQuery := TFDQuery.Create(nil);
        AQuery.Connection := dmConexao.fdConexao;

        AQuery.Close;
        AQuery.SQL.Clear;
        AQuery.SQL.Add('SELECT VALOR_CONTROLE FROM ALCONTROLE');
        AQuery.SQL.Add('WHERE NOME_CONTROLE = ' + QuotedStr(AControle));
        AQuery.Open;

    finally

        Result := AQuery.FieldByName('VALOR_CONTROLE').AsString;
        AQuery.DisposeOf;

    end;

end;

procedure ConfigEmail(AACBrEmail : TACBrMail; AAssunto, ANomeFrom : String; AHtml : Boolean);
begin
    with AACBrEmail do
        begin
            Clear;
            Host                := getValueControle('EMAILSMTP'   );
            Port                := getValueControle('EMAILPORTA'  );
            Username            := getValueControle('EMAILUSUARIO');
            Password            := getValueControle('EMAILSENHA'  );
            From                := getValueControle('EMAILUSUARIO');
            Subject             := AAssunto;
            SetSSL              := StrToBoolValue(getValueControle('EMAIL_SSL'), '1','0');
            SetTLS              := StrToBoolValue(getValueControle('EMAIL_TSL'), '1','0');
            ReadingConfirmation := False;
            UseThread           := True ;
            IsHTML              := AHtml;
            FromName            := ANomeFrom;
        end;
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


function getPosUsuario(AIdPush : String) : TMapCoordinate;
var
AQueryTmpPos : TFDQuery;
begin
        FormatSettings.DecimalSeparator  := '.';
        FormatSettings.ThousandSeparator := ',';
        Try
            AQueryTmpPos := TFDQuery.Create(nil);
            AQueryTmpPos.Connection := dmConexao.fdConexao;

            AQueryTmpPos.Close;
            AQueryTmpPos.SQL.Clear;
            AQueryTmpPos.Sql.Add('SELECT ULTIMALATITUDE, ULTIMALONGITUDE FROM ALCHAVESPUSH');
            AQueryTmpPos.Sql.Add('WHERE KEYPUSH = ' + QuotedStr(AIdPush));
            AQueryTmpPos.Open;

            Result.Latitude  := StringReplace(AQueryTmpPos.FieldByName('ULTIMALATITUDE').AsString,',','.',[rfReplaceAll]).ToDouble;
            Result.Longitude := StringReplace(AQueryTmpPos.FieldByName('ULTIMALONGITUDE').AsString,',','.',[rfReplaceAll]).ToDouble;

        Finally
            AQueryTmpPos.DisposeOf;
            FormatSettings.DecimalSeparator  := ',';
            FormatSettings.ThousandSeparator := '.';
        End;

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

  Result := FloatToStrF(vRes,ffNumber,12,1);

end;

function getSqlRaio(AIdPush, ASQL : String; ARaio : Integer; AParams : String = '') : String;
var                                                                //{"parametro":IDCOM,"campo":"26"}
ARes : String;
ADistancia : String;
JSONObj : TJSONObject;
S, FCampo, FValor : String;
ACoordenada : TMapCoordinate;

begin

     Try

        if AParams <> '' then
            begin
                JSONObj := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(AParams), 0) as TJSONObject;
                FCampo  := TJSONObject(JSONObj).GetValue('campo').Value;
                FValor  := TJSONObject(JSONObj).GetValue('parametro').Value;
            end;

        AQueryTmp := TFDQuery.Create(nil);
        AQueryTmp.Connection := dmConexao.fdConexao;

        AQueryTmp.Close;
        AQueryTmp.SQL.Clear;
        AQueryTmp.Sql.Add(ASQL);
        if AParams <> '' then
            AQueryTmp.ParamByName(FCampo).AsString := FValor;

        S := QueryToLog(AQueryTmp);
        AQueryTmp.Open;

        AQueryTmp.First;

        while not AQueryTmp.Eof do
           begin
               FormatSettings.DecimalSeparator  := '.';
               LatDestino  := AQueryTmp.FieldByName('LATCOM' ).AsFloat;
               LongDestino := AQueryTmp.FieldByName('LONGCOM').AsFloat;

               ADistancia := GetDistancia(getPosUsuario(AIdPush).Latitude,
                                          getPosUsuario(AIdPush).Longitude,
                                          LatDestino,
                                          LongDestino);

               ADistancia := Copy(ADistancia, 1, Pos(',',ADistancia) - 1);

               if ADistancia.ToInteger <= ARaio then
                   begin
                       if Pos(AQueryTmp.FieldByName('IDCOM').AsString, ARes) <= 0 then
                            begin
                                ARes := ARes + AQueryTmp.FieldByName('IDCOM').AsString + ',';
                                AQueryTmp.Next;
                            end
                         else
                            begin
                                AQueryTmp.Next;
                            end;
                   end
                else
                   begin
                       AQueryTmp.Next;
                   end;

           end;
        if Copy(ARes, 1, Length(ARes) - 1) = '' then
            Result := '0' else
            Result := Copy(ARes, 1, Length(ARes) - 1);
     Finally
        FormatSettings.DecimalSeparator  := ',';
        AQueryTmp.DisposeOf;
     End;
end;

procedure EnviarPush(ATokenCelular, ATitulo, AMensagem, AImagem, AAnuncio : String; ALog : TStringList);
var
        client : THTTPClient;
        v_json : TJSONObject;
        v_jsondata : TJSONObject;
        v_data : TStringStream;
        v_response : TStringStream;
        url_google : string;

begin
    try
        url_google := 'https://fcm.googleapis.com/fcm/send';

        //--------------------------------

        v_json := TJSONObject.Create;
        v_json.AddPair('to', ATokenCelular);

        v_jsondata := TJSONObject.Create;
        v_jsondata.AddPair('body', AMensagem);
        v_jsondata.AddPair('title', ATitulo);


        v_json.AddPair('notification', v_jsondata);


        v_jsondata := TJSONObject.Create;
        v_jsondata.AddPair('Mensagem',AMensagem);
        v_jsondata.AddPair('Titulo'  ,ATitulo);
        v_jsondata.AddPair('Imagem'  ,AImagem);
        v_jsondata.AddPair('Anuncio' ,AAnuncio);


        v_json.AddPair('data', v_jsondata);

        client := THTTPClient.Create;
        client.ContentType := 'application/json';
        client.CustomHeaders['Authorization'] := 'key=' + ctrKEYPUSH;

        ALog.Add('JSON ENVIO ---------------------');
        ALog.Add(v_json.ToString);
        ALog.Add('');

        v_data := TStringStream.Create(v_json.ToString, TEncoding.UTF8);
        V_data.Position := 0;

        v_response := TStringStream.Create;

        client.Post(url_google, v_data, v_response);
        v_response.Position := 0;

        ALog.Add('RETORNO ---------------------');
        ALog.Add(v_response.DataString);
        ALog.Add('');

    except on e:exception do
        begin
            ALog.Add('ERRO ---------------------');
            ALog.Add(e.Message);
            ALog.Add('');
        end;
    end;
end;

procedure LoadControleServer;
var
SQueryTMP : TFDQuery;
AMemTable : TFDMemTable;
begin
    Try
        AMemTable := TFDMemTable.Create(nil);
        SQueryTMP := TFDQuery.Create(nil);
        SQueryTMP.Connection := dmConexao.fdConexao;
        SQueryTMP.Close;
        SQueryTMP.SQL.Clear;
        SQueryTMP.SQL.Add('SELECT * FROM ALCONTROLE');
        SQueryTMP.Open;

        AMemTable.CopyDataSet(SQueryTMP);

        LoadControle(AMemTable);
    Finally
        SQueryTMP.DisposeOf;
        AMemTable.DisposeOf;
    End;
end;

function DataAtual: TDateTime;
var
fQueryTmp : TFDQuery;
fTSAgora : String;
begin

   Try
      fQueryTmp := TFDQuery.Create(nil);
      fQueryTmp.Connection := dmConexao.fdConexao;
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

procedure SQLQuery(AQuery : TFDQuery; ASQL : String);
begin

    AQuery := TFDQuery.Create(nil);
    AQuery.Connection := dmConexao.fdConexao;
    AQuery.Close;
    AQuery.SQL.Clear;
    AQuery.SQL.Text := ASql;

end;

function FiltroPalavras : String;
var
AQueryTmp : TFDQuery;
begin

    Try

        AQueryTmp := TFDQuery.Create(nil);

        AQueryTmp.Connection := dmConexao.fdConexao;
        AQueryTmp.Close;
        AQueryTmp.SQL.Clear;
        AQueryTmp.SQL.Add('SELECT * FROM ALCONTROLE');
        AQueryTmp.SQL.Add('WHERE NOME_CONTROLE = ' + QuotedStr('FILTROPALAVRAS'));
        AQueryTmp.Open;

    Finally

        Result := AQueryTmp.FieldByName('VALOR_BLOB').AsString;
        AQueryTmp.DisposeOf;

    End;

end;

function CountPalavras(APalavras, ASeparador : String) : Integer;
var
ARes : Integer;
begin

    ARes := 0;
    for var i := 0 to Length(APalavras) - 1 do
        begin

            if APalavras[i] = ASeparador then
                    ARes := ARes + 1;

        end;

    Result := ARes + 1;

end;


function TextoFiltrado(ATexto : String) : String;
var
APalavras: TStringDynArray;
AFimPalavras : Boolean;
AIndex : Integer;
AResult : String;
ATotalPalavras : Integer;
begin

   AResult        := ATexto;
   APalavras      := SplitString(FiltroPalavras, ',');
   AFimPalavras   := False;
   AIndex         := 0;
   ATotalPalavras := CountPalavras(FiltroPalavras, ',');
     for AIndex := 0 to ATotalPalavras do

           begin

                if Pos(APalavras[AIndex], AResult) > 0 then
                    AResult := StringReplace(AResult, APalavras[AIndex], '@#$',[rfReplaceAll]);

           end;

    Result := AResult;

end;

function IndiceCalculoAvaliacao(AIdCom : Integer) : Integer;
var
ASQL : String;
AIndice : Integer;
var
AQueryTmp : TFDQuery;
begin

    Try

        AQueryTmp := TFDQuery.Create(nil);

        AQueryTmp.Connection := dmConexao.fdConexao;
        AQueryTmp.Close;
        AQueryTmp.SQL.Clear;
        AQueryTmp.SQL.Add('SELECT AVALIAAMBIENTECOM, AVALIAATENDIMENTOCOM, AVALIALIMPEZACOM, AVALIALOCALCOM, AVALIAPRECOCOM FROM ALCOMERCIO');
        AQueryTmp.SQL.Add('WHERE IDCOM = ' + QuotedStr(AIdCom.ToString));
        AQueryTmp.Open;

        AIndice := 0;

        if AQueryTmp.FieldByName('AVALIAAMBIENTECOM'   ).AsString = 'T' then AIndice := AIndice + 1;
        if AQueryTmp.FieldByName('AVALIAATENDIMENTOCOM').AsString = 'T' then AIndice := AIndice + 1;
        if AQueryTmp.FieldByName('AVALIALIMPEZACOM'    ).AsString = 'T' then AIndice := AIndice + 1;
        if AQueryTmp.FieldByName('AVALIALOCALCOM'      ).AsString = 'T' then AIndice := AIndice + 1;
        if AQueryTmp.FieldByName('AVALIAPRECOCOM'      ).AsString = 'T' then AIndice := AIndice + 1;

        Result := AIndice;

     Finally

        AQueryTmp.DisposeOf;

     End;

end;


end.
