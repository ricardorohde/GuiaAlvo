//
// Created by the DataSnap proxy generator.
// 11/06/2019 16:41:02
//

unit Proxy;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.FireDACJSONReflect, Data.DBXJSONReflect;

type

  IDSRestCachedTFDJSONDataSets = interface;

  TMetodosGeraisClient = class(TDSAdminRestClient)
  private
    FInsComercioCommand: TDSRestCommand;
    FGetIDCommand: TDSRestCommand;
    FGetIDCommand_Cache: TDSRestCommand;
    FConvertBase64ToFileCommand: TDSRestCommand;
    FUpdateImagemCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function InsComercio(fId: Integer; fIdCat: Integer; fNrLog: Integer; fCnpj: string; fRazao: string; fFantasia: string; fCep: string; fCompl: string; fSite: string; fEmail: string; fFace: string; fInsta: string; fTwiter: string; fGoogle: string; fTube: string; fHrSeg: string; fHrTer: string; fHrQua: string; fHrQui: string; fHrSex: string; fHrSab: string; fHrDom: string; fSendFtp: string; fStatus: string; fSobre: string; fIco: string; fSlogam: string; fDataCad: string; const ARequestFilter: string = ''): Integer;
    function GetID(fTable: string; fCampoID: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetID_Cache(fTable: string; fCampoID: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    procedure ConvertBase64ToFile(Base64: string; FileName: string);
    function UpdateImagem(aJsonO: TJSONObject; const ARequestFilter: string = ''): Boolean;
  end;

  IDSRestCachedTFDJSONDataSets = interface(IDSRestCachedObject<TFDJSONDataSets>)
  end;

  TDSRestCachedTFDJSONDataSets = class(TDSRestCachedObject<TFDJSONDataSets>, IDSRestCachedTFDJSONDataSets, IDSRestCachedCommand)
  end;

const
  TMetodosGerais_InsComercio: array [0..28] of TDSRestParameterMetaData =
  (
    (Name: 'fId'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'fIdCat'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'fNrLog'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'fCnpj'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'fRazao'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'fFantasia'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'fCep'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'fCompl'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'fSite'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'fEmail'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'fFace'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'fInsta'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'fTwiter'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'fGoogle'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'fTube'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'fHrSeg'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'fHrTer'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'fHrQua'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'fHrQui'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'fHrSex'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'fHrSab'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'fHrDom'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'fSendFtp'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'fStatus'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'fSobre'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'fIco'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'fSlogam'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'fDataCad'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 6; TypeName: 'Integer')
  );

  TMetodosGerais_GetID: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'fTable'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'fCampoID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TMetodosGerais_GetID_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'fTable'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'fCampoID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TMetodosGerais_ConvertBase64ToFile: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Base64'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'FileName'; Direction: 1; DBXType: 26; TypeName: 'string')
  );

  TMetodosGerais_UpdateImagem: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'aJsonO'; Direction: 1; DBXType: 37; TypeName: 'TJSONObject'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

implementation

function TMetodosGeraisClient.InsComercio(fId: Integer; fIdCat: Integer; fNrLog: Integer; fCnpj: string; fRazao: string; fFantasia: string; fCep: string; fCompl: string; fSite: string; fEmail: string; fFace: string; fInsta: string; fTwiter: string; fGoogle: string; fTube: string; fHrSeg: string; fHrTer: string; fHrQua: string; fHrQui: string; fHrSex: string; fHrSab: string; fHrDom: string; fSendFtp: string; fStatus: string; fSobre: string; fIco: string; fSlogam: string; fDataCad: string; const ARequestFilter: string): Integer;
begin
  if FInsComercioCommand = nil then
  begin
    FInsComercioCommand := FConnection.CreateCommand;
    FInsComercioCommand.RequestType := 'GET';
    FInsComercioCommand.Text := 'TMetodosGerais.InsComercio';
    FInsComercioCommand.Prepare(TMetodosGerais_InsComercio);
  end;
  FInsComercioCommand.Parameters[0].Value.SetInt32(fId);
  FInsComercioCommand.Parameters[1].Value.SetInt32(fIdCat);
  FInsComercioCommand.Parameters[2].Value.SetInt32(fNrLog);
  FInsComercioCommand.Parameters[3].Value.SetWideString(fCnpj);
  FInsComercioCommand.Parameters[4].Value.SetWideString(fRazao);
  FInsComercioCommand.Parameters[5].Value.SetWideString(fFantasia);
  FInsComercioCommand.Parameters[6].Value.SetWideString(fCep);
  FInsComercioCommand.Parameters[7].Value.SetWideString(fCompl);
  FInsComercioCommand.Parameters[8].Value.SetWideString(fSite);
  FInsComercioCommand.Parameters[9].Value.SetWideString(fEmail);
  FInsComercioCommand.Parameters[10].Value.SetWideString(fFace);
  FInsComercioCommand.Parameters[11].Value.SetWideString(fInsta);
  FInsComercioCommand.Parameters[12].Value.SetWideString(fTwiter);
  FInsComercioCommand.Parameters[13].Value.SetWideString(fGoogle);
  FInsComercioCommand.Parameters[14].Value.SetWideString(fTube);
  FInsComercioCommand.Parameters[15].Value.SetWideString(fHrSeg);
  FInsComercioCommand.Parameters[16].Value.SetWideString(fHrTer);
  FInsComercioCommand.Parameters[17].Value.SetWideString(fHrQua);
  FInsComercioCommand.Parameters[18].Value.SetWideString(fHrQui);
  FInsComercioCommand.Parameters[19].Value.SetWideString(fHrSex);
  FInsComercioCommand.Parameters[20].Value.SetWideString(fHrSab);
  FInsComercioCommand.Parameters[21].Value.SetWideString(fHrDom);
  FInsComercioCommand.Parameters[22].Value.SetWideString(fSendFtp);
  FInsComercioCommand.Parameters[23].Value.SetWideString(fStatus);
  FInsComercioCommand.Parameters[24].Value.SetWideString(fSobre);
  FInsComercioCommand.Parameters[25].Value.SetWideString(fIco);
  FInsComercioCommand.Parameters[26].Value.SetWideString(fSlogam);
  FInsComercioCommand.Parameters[27].Value.SetWideString(fDataCad);
  FInsComercioCommand.Execute(ARequestFilter);
  Result := FInsComercioCommand.Parameters[28].Value.GetInt32;
end;

function TMetodosGeraisClient.GetID(fTable: string; fCampoID: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetIDCommand = nil then
  begin
    FGetIDCommand := FConnection.CreateCommand;
    FGetIDCommand.RequestType := 'GET';
    FGetIDCommand.Text := 'TMetodosGerais.GetID';
    FGetIDCommand.Prepare(TMetodosGerais_GetID);
  end;
  FGetIDCommand.Parameters[0].Value.SetWideString(fTable);
  FGetIDCommand.Parameters[1].Value.SetWideString(fCampoID);
  FGetIDCommand.Execute(ARequestFilter);
  if not FGetIDCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetIDCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetIDCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetIDCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TMetodosGeraisClient.GetID_Cache(fTable: string; fCampoID: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetIDCommand_Cache = nil then
  begin
    FGetIDCommand_Cache := FConnection.CreateCommand;
    FGetIDCommand_Cache.RequestType := 'GET';
    FGetIDCommand_Cache.Text := 'TMetodosGerais.GetID';
    FGetIDCommand_Cache.Prepare(TMetodosGerais_GetID_Cache);
  end;
  FGetIDCommand_Cache.Parameters[0].Value.SetWideString(fTable);
  FGetIDCommand_Cache.Parameters[1].Value.SetWideString(fCampoID);
  FGetIDCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetIDCommand_Cache.Parameters[2].Value.GetString);
end;

procedure TMetodosGeraisClient.ConvertBase64ToFile(Base64: string; FileName: string);
begin
  if FConvertBase64ToFileCommand = nil then
  begin
    FConvertBase64ToFileCommand := FConnection.CreateCommand;
    FConvertBase64ToFileCommand.RequestType := 'GET';
    FConvertBase64ToFileCommand.Text := 'TMetodosGerais.ConvertBase64ToFile';
    FConvertBase64ToFileCommand.Prepare(TMetodosGerais_ConvertBase64ToFile);
  end;
  FConvertBase64ToFileCommand.Parameters[0].Value.SetWideString(Base64);
  FConvertBase64ToFileCommand.Parameters[1].Value.SetWideString(FileName);
  FConvertBase64ToFileCommand.Execute;
end;

function TMetodosGeraisClient.UpdateImagem(aJsonO: TJSONObject; const ARequestFilter: string): Boolean;
begin
  if FUpdateImagemCommand = nil then
  begin
    FUpdateImagemCommand := FConnection.CreateCommand;
    FUpdateImagemCommand.RequestType := 'POST';
    FUpdateImagemCommand.Text := 'TMetodosGerais."UpdateImagem"';
    FUpdateImagemCommand.Prepare(TMetodosGerais_UpdateImagem);
  end;
  FUpdateImagemCommand.Parameters[0].Value.SetJSONValue(aJsonO, FInstanceOwner);
  FUpdateImagemCommand.Execute(ARequestFilter);
  Result := FUpdateImagemCommand.Parameters[1].Value.GetBoolean;
end;

constructor TMetodosGeraisClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TMetodosGeraisClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TMetodosGeraisClient.Destroy;
begin
  FInsComercioCommand.DisposeOf;
  FGetIDCommand.DisposeOf;
  FGetIDCommand_Cache.DisposeOf;
  FConvertBase64ToFileCommand.DisposeOf;
  FUpdateImagemCommand.DisposeOf;
  inherited;
end;

end.


