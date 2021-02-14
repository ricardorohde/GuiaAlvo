unit Server.Controller.Comercio;

interface

uses

Horse,
System.JSON,
FireDAC.Stan.Intf,
FireDAC.Stan.Option,
FireDAC.Stan.Param,
FireDAC.Stan.Error,
FireDAC.DatS,
FireDAC.Phys.Intf,
FireDAC.DApt.Intf,
FireDAC.Stan.Async,
FireDAC.DApt,
FireDAC.UI.Intf,
FireDAC.Stan.Def,
FireDAC.Stan.Pool,
FireDAC.Phys,
FireDAC.VCLUI.Wait,
Data.DB,
FireDAC.Comp.Client,
FireDAC.Comp.DataSet,
FireDAC.Phys.FBDef,
FireDAC.Phys.IBBase,
FireDAC.Phys.FB,
dataSetConverter4D,
dataSetConverter4D.Impl,
dataSetConverter4D.Helper,
dataSetConverter4D.Util,
Server.Controller.Conexao, System.SysUtils;

procedure GetID(Req: THorseRequest; Res: THorseResponse; Next: TProc);

var
   AResposta : TJSONObject;

implementation

uses Server.Funcoes;

procedure PostComercio(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
   FQuery : TFDQuery;
begin

     FQuery := TFDQuery.Create(nil);

     try

     FQuery.Close;
     FQuery.SQL.Clear;
     FQuery.SQL.Add('INSERT INTO ALCOMERCIO');
     FQuery.SQL.Add('(CNPJCOM, IERGCOM, RAZAOCOM, FANTASIACOM, CEPLOG_COM, NRLOGCOM, COMPLCOM, EMAILCOM, PASSWORDCOM, LOGINFONE) VALUES');
     FQuery.SQL.Add('(:CNPJCOM, :IERGCOM, :RAZAOCOM, :FANTASIACOM, :CEPLOG_COM, :NRLOGCOM, :COMPLCOM, :EMAILCOM, :PASSWORDCOM, :LOGINFONE)');
     FQuery.ParamByName('CNPJCOM'    ).AsString  := ACNPJCPF;
     FQuery.ParamByName('IERGCOM'    ).AsString  := AIERG;
     FQuery.ParamByName('RAZAOCOM'   ).AsString  := ARazao;
     FQuery.ParamByName('FANTASIACOM').AsString  := AFantasia;
     FQuery.ParamByName('CEPLOG_COM' ).AsString  := ACep;
     FQuery.ParamByName('NRLOGCOM'   ).AsInteger := ANumero;
     FQuery.ParamByName('COMPLCOM'   ).AsString  := AComplemento;
     FQuery.ParamByName('EMAILCOM'   ).AsString  := AEmail;
     FQuery.ParamByName('PASSWORDCOM').AsString  := MD5(ASenha);
     FQuery.ParamByName('LOGINFONE'  ).AsString  := ALoginFone;
     FQuery.ExecSQL;
end;


procedure GetID(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
   FQuery : TFDQuery;
begin

     FQuery := TFDQuery.Create(nil);

     try
        Try
            FQuery.Connection := FCon;
            FQuery.SQL.Add('SELECT * FROM ALCOMERCIO');
            FQuery.SQL.Add('WHERE IDCOM = ' + Req.Params.Items['id']);
            FQuery.Open;
            AResposta := TJSONObject.Create;
            AResposta.AddPair('Erro', 'Registro não encontrado');
            if FQuery.RecordCount = 0 then
               Res.Send<TJSONObject>(AResposta) else
               Res.Send<TJSONObject>(FQuery.AsJSONObject);

        Except on E:Exception do
            Res.Send(TJSONObject.Create(TJSONPair.Create('Erro', E.Message)));
        End;

     finally
         FQuery.FreeOnRelease;
         AResposta.Free;
     end;

end;

end.
