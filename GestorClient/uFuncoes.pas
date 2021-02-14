unit uFuncoes;

interface

uses
  FMX.Edit, FMX.Forms, FMX.Objects, IdHTTP, IdFTPCommon, IdTCPConnection, IdTCPClient, IdFTP, FMX.DateTimeCtrls, GuiaAlvo.Controller.DataModuleDados, Guia.Controle;

function preencheCEP(vCep : String; vForm: TForm) : Boolean;
procedure pLoadImage(pImage : TImage; pImagem : String);
procedure ViewSenha(AImage : TImage; AView : Boolean);
function SendSMS(vCelular, vMsg: String): Boolean;
function ApenasNumeros(S: String): String;
function ValidaEMail(const Value: string): Boolean;
procedure Loading(AMsg : String; AExibe : Boolean = True);
function GeraCodigo : String;
function ValidarCelular(ACel : String) : Boolean;
function StrToBoolValue(AValue, ATrue, AFalse : String) : Boolean;
function BoolToStrValue(AValue : Boolean) : String;
procedure NextField(Key : Word; ANext : TEdit);
procedure IsImageChecked(AChkImage : TImage) ;
procedure ConectaFTP(gFTP: TIdFtp);
procedure ReplicaHoras(Sender: TObject);
function PreencheHoras : Boolean;
function SizeImgPx(fImagem : String) : String;
function RemoveAcento(const pText: string): string;

const

  fIconViewSenha   : String = 'ViewSenha';
  fIconUnViewSenha : String = 'UnViewSenha';

  smSemana : Array[1..7] of String = ('Seg','Ter','Qua','Qui','Sex','Sab','Dom');
  smStatusHr : Array[1..5] of String = ('edtAbre','edtPara','edtVolta','edtFecha','chkFechado');

  ASem : Array [1..6] of String = ('Ter','Qua','Qui','Sex','Sab','Dom');

implementation

uses
  System.Classes, System.Types, System.SysUtils, FMX.StdCtrls, FMX.Ani,
  System.UITypes, FMX.Graphics, GuiaAlvo.View.Principal;

function RemoveAcento(const pText: string): string;
type
    USAscii20127 = type AnsiString(20127);
begin
    Result := String(USAscii20127(pText));
end;

procedure SeparaHoras(AValor, pSem : String);
var
i, j, AIndex : Integer;
begin
     AIndex := 1;
     for i := 1 to 5 do //Conta os Campos
         begin

              if i = 5 then //Verifica se é o ultimo valor
                  begin
                       if Copy(AValor,Length(AValor),1) = '0' then
                           begin
                                TImage(frmGestorClient.FindComponent(smStatusHr[i] + pSem)).Bitmap := frmGestorClient.imgchbUnchecked.Bitmap;
                                TImage(frmGestorClient.FindComponent(smStatusHr[i] + pSem)).Tag := 0;
                           end
                       else
                           begin
                                TImage(frmGestorClient.FindComponent(smStatusHr[i] + pSem)).Bitmap := frmGestorClient.imgchbChecked.Bitmap;
                                TImage(frmGestorClient.FindComponent(smStatusHr[i] + pSem)).Tag := 1;
                           end;
                  end
              else
                  begin
                       TTimeEdit(frmGestorClient.FindComponent(smStatusHr[i] + pSem)).Time := StrToTime(Copy(AValor, AIndex, 5));
                       AIndex := AIndex + 5;
                  end;

         end;
end;

function PreencheHoras : Boolean;
var
i : Integer;
ACampo, AHora : String;
ARes : Integer;
begin

     ARes := 0;
     ACampo := 'HR%sCOM';

     for i := 1 to 7 do
         begin
              AHora := dmGeralClient.memFichaComercio.FieldByName('HR' + UpperCase(smSemana[i]) + 'COM').AsString;
              if Copy(AHora,1,Length(AHora) - 1) = '00:0000:0000:0000:00' then
                 ARes := ARes + 1;

              SeparaHoras(dmGeralClient.memFichaComercio.FieldByName('HR' + UpperCase(smSemana[i]) + 'COM').AsString, smSemana[i]);
         end;

    if ARes = 7 then
       Result := False else
       Result := True;

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

procedure ReplicaHoras(Sender: TObject);
var
i : Integer;
ACampo : String;
AValor : TTime;
begin

    ACampo := Copy(TSpeedButton(Sender).Name,5,Length(TSpeedButton(Sender).Name));
    AValor := TTimeEdit(frmGestorClient.FindComponent('edt' + ACampo + 'Seg')).Time;

    for i := 1 to 6 do
        TTimeEdit(frmGestorClient.FindComponent('edt' + ACampo + ASem[i])).Time := AValor;

end;

procedure IsImageChecked(AChkImage : TImage); 
begin

    case AChkImage.Tag of
        0 : begin
                AChkImage.Tag := 1;
                AChkimage.Bitmap := frmGestorClient.imgchbChecked.Bitmap;
            end;
        1 : begin
                AChkImage.Tag := 0;
                AChkimage.Bitmap := frmGestorClient.imgchbUnchecked.Bitmap;
            end;          
    end;      

end;


procedure NextField(Key : Word; ANext : TEdit);
begin

    if Key = vkReturn then ANext.SetFocus;

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

function ValidarCelular(ACel : String) : Boolean;
var
AAuxCel : String;
begin
    AAuxCel := ApenasNumeros(ACel);

    if Length(AAuxCel) = 11 then
        AAuxCel := Copy(AAuxCel,3,Length(AAuxCel));
    if (Length(AAuxCel) <> 9) or (Length(AAuxCel) <> 11) then
        begin
            Result := False;
            Exit;
        end
    else
       begin
            if Copy(AAuxCel,1,1) > '5' then
                Result := True else
                Result := False;
        end;
end;

function GeraCodigo : String;
begin

    Randomize;
    Result := FormatFloat('000000',Random(999999));

end;

procedure Loading(AMsg : String; AExibe : Boolean = True);
begin

    TLabel(Screen.ActiveForm.FindComponent('lblMsgLoading')).Text          := AMsg;
    TFloatAnimation(Screen.ActiveForm.FindComponent('faArcAzul')).Enabled  := AExibe;
    TFloatAnimation(Screen.ActiveForm.FindComponent('faArcCinza')).Enabled := AExibe;
    TRectangle(Screen.ActiveForm.FindComponent('recmodal')).Visible        := AExibe;
    TRectangle(Screen.ActiveForm.FindComponent('recloading')).Visible      := AExibe;

end;

function ValidaEmail(const Value: string): Boolean;
    function CheckAllowed(const s: string): Boolean;
    var
    i: Integer;
    begin
       Result := False;
       for i := 1 to Length(s) do
           if not(s[i] in ['a' .. 'z', 'A' .. 'Z', '0' .. '9', '_', '-', '.']) then
               Exit;
        Result := true;
    end;
var
    i: Integer;
    NamePart, ServerPart: string;
begin
    Result := False;
    i := Pos('@', Value);
    if i = 0 then
        Exit;
    NamePart := Copy(Value, 1, i - 1);
    ServerPart := Copy(Value, i + 1, Length(Value));
    if (Length(NamePart) = 0) or ((Length(ServerPart) < 5)) then
        Exit;
    i := Pos('.', ServerPart);
    if (i = 0) or (i > (Length(ServerPart) - 2)) then
        Exit;
    Result := CheckAllowed(NamePart) and CheckAllowed(ServerPart);
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

function preencheCEP(vCep : String; vForm: TForm) : Boolean;
begin

   dmGeralClient.ConsultaCep(vCep);

   if dmGeralClient.fdmemCep.RecordCount > 0 then
      begin
         TEdit(vForm.FindComponent('edtLogradouro')).Text := dmGeralClient.fdmemCeplogradouro.Text;
         TEdit(vForm.FindComponent('edtBairro')).Text     := dmGeralClient.fdmemCepbairro.Text;
         TEdit(vForm.FindComponent('edtCidade')).Text     := dmGeralClient.fdmemCeplocalidade.Text;
         TEdit(vForm.FindComponent('edtUF')).Text         := dmGeralClient.fdmemCepuf.Text;
         Result := True;
      end
   else
      begin
         Result := False;
      end;
end;

procedure ViewSenha(AImage : TImage; AView : Boolean);
begin

     case AView of
          True : pLoadImage(AImage, fIconViewSenha);
         False : pLoadImage(AImage, fIconUnViewSenha);
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

end.
