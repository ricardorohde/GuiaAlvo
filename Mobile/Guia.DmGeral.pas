unit Guia.DmGeral;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.FMXUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.IB, FireDAC.Phys.IBDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteDef, FireDAC.Stan.StorageBin,
  FireDAC.Phys.SQLite,Data.FireDACJSONReflect, FMX.Types, FMX.VirtualKeyboard,
  FMX.Platform, System.IOUtils, REST.Types, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, REST.Response.Adapter, Guia.untClientmodule;

type
  TdmGeral = class(TDataModule)
    memCategorias: TFDMemTable;
    memContrato: TFDMemTable;
    memComCategorias: TFDMemTable;
    memSubCategorias: TFDMemTable;
    memComercio: TFDMemTable;
    memFotosComercio: TFDMemTable;
    memCheckList: TFDMemTable;
    memTelefones: TFDMemTable;
    memAvaliacoes: TFDMemTable;
    memUsuarios: TFDMemTable;
    memFotosPorSecao: TFDMemTable;
    memCelularUsuario: TFDMemTable;
    memDestaques: TFDMemTable;
    memControle: TFDMemTable;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    RESTResponse1: TRESTResponse;
    restCEP: TRESTRequest;
    RESTClient1: TRESTClient;
    memCep: TFDMemTable;
    memCepcep: TWideStringField;
    memCeplogradouro: TWideStringField;
    memCepbairro: TWideStringField;
    memCeplocalidade: TWideStringField;
    memCepuf: TWideStringField;
    memAuxiliar: TFDMemTable;
    memNotificacao: TFDMemTable;
    memAnuncios: TFDMemTable;
  private
    { Private declarations }
  public

    procedure LoadDestaquePrincipal(AIdPush : String);
    procedure LoadComercioCategoria(AIdPush : String; IdCategoria, IdSubCategoria : Integer);
    procedure LoadCategorias(AIdPush : String);
    procedure LoadSubCategoria(AIdPush : String; IdCategoria: Integer);
    procedure LoadFotosPorSecao(vIdCat: Integer; APesquisa, AIdPush : String);
    procedure LoadComercioPesquisa(AIdPush, FPesquisa : String);
    procedure LoadDestaqueFavorito(AIdPush : String; vIdUsu : Integer);

    function getNotificacoes(AIdUsu: Integer): TFDJSONDataSets;
    procedure LoadComercio(idComercio: Integer);
    procedure LoadAvaliacoes(idComercio, nStart: Integer);
    function CelularDuplicado(vCelular: String) : Boolean;
    procedure DownloadIdUsuario(vCelular : String);
    procedure DownloadUsuario(vCelular : String);
    procedure DownloadUsuarioId(fIdUsu: Integer);
    function KeyboradShowing:boolean;
    procedure KeyboradHide;
    procedure KeyboradShow(const AControl: TFmxObject);
    procedure RegistrarDispositivo(ADeviceToken : String; AIdUsu: Integer);
    procedure ConsultaCep(ACep : String);
    procedure getControle;
    procedure getAvaliacaoCompleta(AIdAvaliacao : Integer);
    procedure getAnuncios(AIdCom : Integer);

    { Public declarations }
  end;

var
  dmGeral: TdmGeral;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses untGlobal;




{$R *.dfm}

procedure TdmGeral.ConsultaCep(ACep : String);
begin

     memCep.Close;

     restCEP.Params.ParameterByName('pCEP').Value := ACep;
     restCEP.Execute;

end;

function TdmGeral.KeyboradShowing:boolean; // teclado visivel ou não
{ uses FMX.VirtualKeyboard }
var
  Keyboard: IFMXVirtualKeyboardService;
begin
  TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService,
    IInterface(Keyboard));
  if (Keyboard <> nil) then
    result:= TVirtualKeyBoardState.Visible in Keyboard.GetVirtualKeyBoardState;
end;

procedure TdmGeral.DownloadIdUsuario(vCelular: String);
var
  DownloadIdUsuario : TFDJSONDataSets;
begin
  //memUsuarios := TFDMemTable.Create(nil);
  DownloadIdUsuario  := cm.ServerMethodsClient.DownloadIdUsuario(vCelular);
  Assert(TFDJSONDataSetsReader.GetListCount(DownloadIdUsuario) = 1);
  memUsuarios.Active := False;
  memUsuarios.AppendData(TFDJSONDataSetsReader.GetListValue(DownloadIdUsuario, 0));
  memUsuarios.Active := True;
end;

procedure TdmGeral.DownloadUsuario(vCelular: String);
var
  DownloadUsuario : TFDJSONDataSets;
begin
  //memUsuarios := TFDMemTable.Create(nil);
  DownloadUsuario  := cm.ServerMethodsClient.DownloadUsuario(vCelular);
  Assert(TFDJSONDataSetsReader.GetListCount(DownloadUsuario) = 1);
  memUsuarios.Active := False;
  memUsuarios.AppendData(TFDJSONDataSetsReader.GetListValue(DownloadUsuario, 0));
  memUsuarios.Active := True;
end;

procedure TdmGeral.DownloadUsuarioId(fIdUsu: Integer);
var
  DownloadUsuarioId : TFDJSONDataSets;
begin
  memUsuarios := TFDMemTable.Create(nil);
  DownloadUsuarioId  := cm.ServerMethodsClient.DownloadUsuarioId(fIdUsu);
  Assert(TFDJSONDataSetsReader.GetListCount(DownloadUsuarioId) = 1);
  memUsuarios.Active := False;
  memUsuarios.AppendData(TFDJSONDataSetsReader.GetListValue(DownloadUsuarioId, 0));
  memUsuarios.Active := True;
end;

procedure TdmGeral.getAnuncios(AIdCom: Integer);
var
  dsAnuncios : TFDJSONDataSets;
begin

  //memAnuncios := TFDMemTable.Create(nil);
  dsAnuncios  := cm.ServerMethodsClient.getAnuncios(AIdCom);
  Assert(TFDJSONDataSetsReader.GetListCount(dsAnuncios) = 1);
  memAnuncios.Active := False;
  memAnuncios.AppendData(TFDJSONDataSetsReader.GetListValue(dsAnuncios, 0));
  memAnuncios.Active := True;

end;

procedure TdmGeral.getAvaliacaoCompleta(AIdAvaliacao: Integer);
var
  dsAvaliacoes : TFDJSONDataSets;
begin

  //memAuxiliar := TFDMemTable.Create(nil);
  dsAvaliacoes  := cm.ServerMethodsClient.getAvaliacaoCompleta(AIdAvaliacao);
  Assert(TFDJSONDataSetsReader.GetListCount(dsAvaliacoes) = 1);
  memAuxiliar.Active := False;
  memAuxiliar.AppendData(TFDJSONDataSetsReader.GetListValue(dsAvaliacoes, 0));
  memAuxiliar.Active := True;

end;

procedure TdmGeral.getControle;
var
  dsControle : TFDJSONDataSets;
begin

  //memControle := TFDMemTable.Create(nil);
  dsControle  := cm.ServerMethodsClient.getControle;
  Assert(TFDJSONDataSetsReader.GetListCount(dsControle) = 1);
  memControle.Active := False;
  memControle.AppendData(TFDJSONDataSetsReader.GetListValue(dsControle, 0));
  memControle.Active := True;

end;

procedure TdmGeral.KeyboradHide; // esconde teclado
{ uses FMX.VirtualKeyboard }
var
  Keyboard: IFMXVirtualKeyboardService;
begin
  TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService,
    IInterface(Keyboard));
  if (Keyboard <> nil) then
    Keyboard.HideVirtualKeyboard;
end;

procedure TdmGeral.KeyboradShow(const AControl: TFmxObject); // mostra teclado
{ uses FMX.VirtualKeyboard }
var
  Keyboard: IFMXVirtualKeyboardService;
begin
  TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService,
    IInterface(Keyboard));
  if (Keyboard <> nil) then
    Keyboard.ShowVirtualKeyboard(AControl);
end;

procedure TdmGeral.LoadAvaliacoes(idComercio, nStart: Integer);
var
  dsAvaliacoes : TFDJSONDataSets;
begin
  //memAvaliacoes := TFDMemTable.Create(nil);
  dsAvaliacoes  := cm.ServerMethodsClient.LoadAvaliacoes(idComercio, nStart);
  Assert(TFDJSONDataSetsReader.GetListCount(dsAvaliacoes) = 1);
  memAvaliacoes.Active := False;
  memAvaliacoes.AppendData(TFDJSONDataSetsReader.GetListValue(dsAvaliacoes, 0));
  memAvaliacoes.Active := True;
end;

procedure TdmGeral.LoadCategorias(AIdPush : String);
var
  dsCategorias : TFDJSONDataSets;
begin
  //memCategorias := TFDMemTable.Create(nil);
  dsCategorias  := cm.ServerMethodsClient.LoadCategorias(AIdPush, gRaio);
  Assert(TFDJSONDataSetsReader.GetListCount(dsCategorias) = 1);
  memCategorias.Active := False;
  memCategorias.AppendData(TFDJSONDataSetsReader.GetListValue(dsCategorias, 0));
  memCategorias.Active := True;
end;

procedure TdmGeral.LoadComercio(idComercio: Integer);
var
   dsComercio,
   dsFotosComercio,
   dsCheckList,
   dsFone : TFDJSONDataSets;
begin
  //memComercio := TFDMemTable.Create(nil);
  dsComercio  := cm.ServerMethodsClient.LoadComercio(idComercio);
  memComercio.Active := False;
  memComercio.AppendData(TFDJSONDataSetsReader.GetListValue(dsComercio, 0));
  memComercio.Active := True;

  //memFotosComercio := TFDMemTable.Create(nil);
  dsFotosComercio  := cm.ServerMethodsClient.LoadComercio(idComercio);
  memFotosComercio.Active := False;
  memFotosComercio.AppendData(TFDJSONDataSetsReader.GetListValue(dsFotosComercio, 1));
  memFotosComercio.Active := True;

  //memCheckList := TFDMemTable.Create(nil);
  dsCheckList  := cm.ServerMethodsClient.LoadComercio(idComercio);
  memCheckList.Active := False;
  memCheckList.AppendData(TFDJSONDataSetsReader.GetListValue(dsCheckList, 2));
  memCheckList.Active := True;

  //memTelefones := TFDMemTable.Create(nil);
  dsFone  := cm.ServerMethodsClient.LoadComercio(idComercio);
  memTelefones.Active := False;
  memTelefones.AppendData(TFDJSONDataSetsReader.GetListValue(dsFone, 3));
  memTelefones.Active := True;

end;

procedure TdmGeral.LoadComercioCategoria(AIdPush : String; IdCategoria, IdSubCategoria : Integer);
var
  dsComCategoria : TFDJSONDataSets;
begin
  //memComCategorias := TFDMemTable.Create(nil);
  dsComCategoria  := cm.ServerMethodsClient.LoadComercioCategoria(AIdPush, gRaio, IdCategoria, IdSubCategoria);
  Assert(TFDJSONDataSetsReader.GetListCount(dsComCategoria) = 1);
  memComCategorias.Active := False;
  memComCategorias.AppendData(TFDJSONDataSetsReader.GetListValue(dsComCategoria, 0));
  memComCategorias.Active := True;
end;

procedure TdmGeral.LoadComercioPesquisa(AIdPush, FPesquisa : String);
var
  dsComercio : TFDJSONDataSets;
begin
  //memComCategorias := TFDMemTable.Create(nil);
  dsComercio  := cm.ServerMethodsClient.LoadComercioPesquisa(gRaio, FPesquisa, AIdPush);
  Assert(TFDJSONDataSetsReader.GetListCount(dsComercio) = 1);
  memComCategorias.Active := False;
  memComCategorias.AppendData(TFDJSONDataSetsReader.GetListValue(dsComercio, 0));
  memComCategorias.Active := True;
end;

procedure TdmGeral.LoadDestaquePrincipal(AIdPush : String);
var
  dsContrato : TFDJSONDataSets;
begin
  //memContrato := TFDMemTable.Create(nil);
  dsContrato  := cm.ServerMethodsClient.LoadDestaquePrincipal(AIdPush, gRaio);
  Assert(TFDJSONDataSetsReader.GetListCount(dsContrato) = 1);
  memContrato.Active := False;
  memContrato.AppendData(TFDJSONDataSetsReader.GetListValue(dsContrato, 0));
  memContrato.Active := True;
end;

procedure TdmGeral.LoadDestaqueFavorito(AIdPush : String; vIdUsu : Integer);
var
dsDestaque : TFDJSONDataSets;
begin

   //memDestaques := TFDMemTable.Create(nil);
   dsDestaque  := cm.ServerMethodsClient.LoadDestaqueFavorito(AIdPush, gRaio, vIdUsu);
   Assert(TFDJSONDataSetsReader.GetListCount(dsDestaque)=1);
   memDestaques.Active := False;
   memDestaques.AppendData(TFDJSONDataSetsReader.GetListValue(dsDestaque, 0));
   memDestaques.Active := True;

end;

function TdmGeral.getNotificacoes(AIdUsu : Integer) : TFDJSONDataSets;
var
dsNotificacao : TFDJSONDataSets;
begin

   dsNotificacao  := cm.ServerMethodsClient.getNotificacoes(AIdUsu);
   Assert(TFDJSONDataSetsReader.GetListCount(dsNotificacao)=1);
   memNotificacao.Active := False;
   memNotificacao.AppendData(TFDJSONDataSetsReader.GetListValue(dsNotificacao, 0));
   memNotificacao.Active := True;

end;



procedure TdmGeral.LoadFotosPorSecao(vIdCat: Integer; APesquisa, AIdPush : String);
var
  dsFotosPorSecao : TFDJSONDataSets;
begin
  //memFotosPorSecao := TFDMemTable.Create(nil);
  dsFotosPorSecao  := cm.ServerMethodsClient.LoadFotosPorSecao(gRaio,vIdCat, APesquisa, AIdPush);
  Assert(TFDJSONDataSetsReader.GetListCount(dsFotosPorSecao) = 1);
  memFotosPorSecao.Active := False;
  memFotosPorSecao.AppendData(TFDJSONDataSetsReader.GetListValue(dsFotosPorSecao, 0));
  memFotosPorSecao.Active := True;
end;

procedure TdmGeral.LoadSubCategoria(AIdPush : String; IdCategoria: Integer);
var
  dsSubCategoria : TFDJSONDataSets;
begin
  //memSubCategorias := TFDMemTable.Create(nil);
  dsSubCategoria  := cm.ServerMethodsClient.LoadSubCategoria(AIdPush, gRaio,idCategoria);
  Assert(TFDJSONDataSetsReader.GetListCount(dsSubCategoria) = 1);
  memSubCategorias.Active := False;
  memSubCategorias.AppendData(TFDJSONDataSetsReader.GetListValue(dsSubCategoria, 0));
  memSubCategorias.Active := True;
end;


procedure TdmGeral.RegistrarDispositivo(ADeviceToken: String; AIdUsu: Integer);
begin

     cm.ServerMethodsClient.RegistrarDispositivo(ADeviceToken, AIdUsu);

end;

function TdmGeral.CelularDuplicado(vCelular: String) : Boolean;
var
  dsCelularUsuario : TFDJSONDataSets;
begin
  //memCelularUsuario := TFDMemTable.Create(nil);
  dsCelularUsuario  := cm.ServerMethodsClient.VerificaCelularDuplicado(vCelular);
  Assert(TFDJSONDataSetsReader.GetListCount(dsCelularUsuario) = 1);
  memCelularUsuario.Active := False;
  memCelularUsuario.AppendData(TFDJSONDataSetsReader.GetListValue(dsCelularUsuario, 0));
  memCelularUsuario.Active := True;

  memCelularUsuario.First;
  if memCelularUsuario.RecordCount > 0 then
     Result := True else Result := False;
end;

end.
