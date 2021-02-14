//
// Created by the DataSnap proxy generator.
// 13/02/2021 21:15:58
//

unit GuiaAlvo.Model.Proxy;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.FireDACJSONReflect, Data.DBXJSONReflect;

type

  IDSRestCachedTFDJSONDataSets = interface;

  TServerMethodsClient = class(TDSAdminRestClient)
  private
    FDataModuleCreateCommand: TDSRestCommand;
    FListaPlanosCommand: TDSRestCommand;
    FListaPlanosCommand_Cache: TDSRestCommand;
    FgravaDeliveryCommand: TDSRestCommand;
    FgravaRedesSociaisCommand: TDSRestCommand;
    FgravaCadastroAvaliacoesCommand: TDSRestCommand;
    FLoadGruposCommand: TDSRestCommand;
    FLoadGruposCommand_Cache: TDSRestCommand;
    FUpdateGrupoComCommand: TDSRestCommand;
    FEnviarEmailCommand: TDSRestCommand;
    FTelRepetidoCommand: TDSRestCommand;
    FAddComercioNovoCommand: TDSRestCommand;
    FAddTelefoneCommand: TDSRestCommand;
    FDocRepetidoCommand: TDSRestCommand;
    FgetTelefoneCommand: TDSRestCommand;
    FgetTelefoneCommand_Cache: TDSRestCommand;
    FLoadCategoriasCommand: TDSRestCommand;
    FLoadCategoriasCommand_Cache: TDSRestCommand;
    FLoadDestaquePrincipalCommand: TDSRestCommand;
    FLoadDestaquePrincipalCommand_Cache: TDSRestCommand;
    FLoadComercioCategoriaCommand: TDSRestCommand;
    FLoadComercioCategoriaCommand_Cache: TDSRestCommand;
    FLoadSubCategoriaCommand: TDSRestCommand;
    FLoadSubCategoriaCommand_Cache: TDSRestCommand;
    FLoadFotosPorSecaoCommand: TDSRestCommand;
    FLoadFotosPorSecaoCommand_Cache: TDSRestCommand;
    FLoadComercioPesquisaCommand: TDSRestCommand;
    FLoadComercioPesquisaCommand_Cache: TDSRestCommand;
    FLoadDestaqueFavoritoCommand: TDSRestCommand;
    FLoadDestaqueFavoritoCommand_Cache: TDSRestCommand;
    FInsertNewSubCategoriaCommand: TDSRestCommand;
    FRecebeNotificacaoCommand: TDSRestCommand;
    FVerificaUsuarioAvaliouCommand: TDSRestCommand;
    FLoadFichaComercioCommand: TDSRestCommand;
    FLoadFichaComercioCommand_Cache: TDSRestCommand;
    FLoadComercioCommand: TDSRestCommand;
    FLoadComercioCommand_Cache: TDSRestCommand;
    FLoadAvaliacoesCommand: TDSRestCommand;
    FLoadAvaliacoesCommand_Cache: TDSRestCommand;
    FVerificaCelularDuplicadoCommand: TDSRestCommand;
    FVerificaCelularDuplicadoCommand_Cache: TDSRestCommand;
    FDownloadIdUsuarioCommand: TDSRestCommand;
    FDownloadIdUsuarioCommand_Cache: TDSRestCommand;
    FDownloadUsuarioCommand: TDSRestCommand;
    FDownloadUsuarioCommand_Cache: TDSRestCommand;
    FDownloadUsuarioIdCommand: TDSRestCommand;
    FDownloadUsuarioIdCommand_Cache: TDSRestCommand;
    FUpdateUsuarioCommand: TDSRestCommand;
    FInsertUsuarioCommand: TDSRestCommand;
    FControleFavoritoCommand: TDSRestCommand;
    FRegistrarDispositivoCommand: TDSRestCommand;
    FIsFavoritoCommand: TDSRestCommand;
    FSQLServerCommand: TDSRestCommand;
    FSQLServerCommand_Cache: TDSRestCommand;
    FUpdateAcessoUsuCommand: TDSRestCommand;
    FSalvaHistoricoUsuCommand: TDSRestCommand;
    FgetControleCommand: TDSRestCommand;
    FgetControleCommand_Cache: TDSRestCommand;
    FgetNotificacoesCommand: TDSRestCommand;
    FgetNotificacoesCommand_Cache: TDSRestCommand;
    FgetAvaliacaoCompletaCommand: TDSRestCommand;
    FgetAvaliacaoCompletaCommand_Cache: TDSRestCommand;
    FSalvaAvaliacaoCommand: TDSRestCommand;
    FDeletePushCommand: TDSRestCommand;
    FgetAnunciosCommand: TDSRestCommand;
    FgetAnunciosCommand_Cache: TDSRestCommand;
    FAtivaPushCommand: TDSRestCommand;
    FNovoComercioCommand: TDSRestCommand;
    FComercioCadastradoCommand: TDSRestCommand;
    FUpdateRaioUsuarioCommand: TDSRestCommand;
    FGravaUltimaPosicaoUsuarioCommand: TDSRestCommand;
    FgetNovaSenhaCommand: TDSRestCommand;
    FgetNovaSenhaCommand_Cache: TDSRestCommand;
    FUpdateSenhaCommand: TDSRestCommand;
    FgetLoginCommand: TDSRestCommand;
    FgetLoginCommand_Cache: TDSRestCommand;
    FDeleteFoneCommand: TDSRestCommand;
    FLoadCheckListCommand: TDSRestCommand;
    FLoadCheckListCommand_Cache: TDSRestCommand;
    FAddCheckListComCommand: TDSRestCommand;
    FAddCheckListNovoCommand: TDSRestCommand;
    FLoadSubGrupoCommand: TDSRestCommand;
    FLoadSubGrupoCommand_Cache: TDSRestCommand;
    FLoadSubCatComCommand: TDSRestCommand;
    FLoadSubCatComCommand_Cache: TDSRestCommand;
    FInsertSubCatComCommand: TDSRestCommand;
    FClearSubCatComCommand: TDSRestCommand;
    FLoadGrupoSelectedCommand: TDSRestCommand;
    FInsertCategoriaCommand: TDSRestCommand;
    FSolicitacoesNovaCategoriaCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DataModuleCreate(Sender: TObject);
    function ListaPlanos(const ARequestFilter: string = ''): TFDJSONDataSets;
    function ListaPlanos_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function gravaDelivery(AIdCom: Integer; AUber: string; ARappi: string; AIfood: string; const ARequestFilter: string = ''): Boolean;
    function gravaRedesSociais(AIdCom: Integer; AFace: string; AInsta: string; ATwitter: string; AYouTube: string; AGPlus: string; ASite: string; AEmail: string; AGPlay: string; AStore: string; const ARequestFilter: string = ''): Boolean;
    function gravaCadastroAvaliacoes(AIdCom: Integer; AAmbiente: Boolean; AAtendimento: Boolean; ALimpeza: Boolean; ALocal: Boolean; APreco: Boolean; const ARequestFilter: string = ''): Boolean;
    function LoadGrupos(AIdCom: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function LoadGrupos_Cache(AIdCom: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    procedure UpdateGrupoCom(AIdCom: Integer; AIdGrupo: Integer);
    procedure EnviarEmail(pCodigo: string; pAssunto: string; pNome: string; pEmail: string; pTipoEmail: string; pHtml: Boolean);
    function TelRepetido(ATelefone: string; const ARequestFilter: string = ''): Integer;
    function AddComercioNovo(ARazao: string; AFantasia: string; ACep: string; AComplemento: string; ACNPJCPF: string; AIERG: string; AEmail: string; ASenha: string; ALoginFone: string; ANumero: Integer; const ARequestFilter: string = ''): Integer;
    procedure AddTelefone(ATelefone: string; AContato: string; AZap: string; AInterno: string; AIdComFone: Integer; AIdFone: Integer);
    function DocRepetido(AField: string; ADoc: string; const ARequestFilter: string = ''): Boolean;
    function getTelefone(AIdCom: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function getTelefone_Cache(AIdCom: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function LoadCategorias(AIdPush: string; ARaio: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function LoadCategorias_Cache(AIdPush: string; ARaio: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function LoadDestaquePrincipal(AIdPush: string; ARaio: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function LoadDestaquePrincipal_Cache(AIdPush: string; ARaio: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function LoadComercioCategoria(AIdPush: string; ARaio: Integer; IdCategoria: Integer; IdSubCategoria: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function LoadComercioCategoria_Cache(AIdPush: string; ARaio: Integer; IdCategoria: Integer; IdSubCategoria: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function LoadSubCategoria(AIdPush: string; ARaio: Integer; IdCategoria: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function LoadSubCategoria_Cache(AIdPush: string; ARaio: Integer; IdCategoria: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function LoadFotosPorSecao(ARaio: Integer; vIdCat: Integer; APesquisa: string; AIdPush: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function LoadFotosPorSecao_Cache(ARaio: Integer; vIdCat: Integer; APesquisa: string; AIdPush: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function LoadComercioPesquisa(ARaio: Integer; FPesquisa: string; AIdPush: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function LoadComercioPesquisa_Cache(ARaio: Integer; FPesquisa: string; AIdPush: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function LoadDestaqueFavorito(AIdPush: string; ARaio: Integer; vIdUsu: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function LoadDestaqueFavorito_Cache(AIdPush: string; ARaio: Integer; vIdUsu: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    procedure InsertNewSubCategoria(AIdCategoria: Integer; AIdCom: Integer; ANomeSubCategoria: string);
    function RecebeNotificacao(AKeyPush: string; const ARequestFilter: string = ''): Boolean;
    function VerificaUsuarioAvaliou(AIdUsu: Integer; AIdCom: Integer; const ARequestFilter: string = ''): Boolean;
    function LoadFichaComercio(AIdComercio: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function LoadFichaComercio_Cache(AIdComercio: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function LoadComercio(idComercio: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function LoadComercio_Cache(idComercio: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function LoadAvaliacoes(idComercio: Integer; nStart: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function LoadAvaliacoes_Cache(idComercio: Integer; nStart: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function VerificaCelularDuplicado(vCelular: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function VerificaCelularDuplicado_Cache(vCelular: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function DownloadIdUsuario(vCelular: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function DownloadIdUsuario_Cache(vCelular: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function DownloadUsuario(vCelular: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function DownloadUsuario_Cache(vCelular: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function DownloadUsuarioId(fIdUsu: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function DownloadUsuarioId_Cache(fIdUsu: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function UpdateUsuario(FNome: string; FCelular: string; FSenha: string; FID: Integer; const ARequestFilter: string = ''): Boolean;
    function InsertUsuario(FNome: string; FCelular: string; FSenha: string; const ARequestFilter: string = ''): Boolean;
    procedure ControleFavorito(FIdUsu: Integer; FIdCom: Integer; FAction: string);
    procedure RegistrarDispositivo(ADeviceToken: string; AIdUsu: Integer);
    function IsFavorito(FIdUsu: Integer; FIdCom: Integer; const ARequestFilter: string = ''): Boolean;
    function SQLServer(cSql: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function SQLServer_Cache(cSql: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function UpdateAcessoUsu(vIdUsu: Integer; const ARequestFilter: string = ''): Boolean;
    function SalvaHistoricoUsu(hIdUsu: Integer; hIdCat: Integer; hIdSubCat: Integer; hIdCom: Integer; hPqsUsu: string; const ARequestFilter: string = ''): Boolean;
    function getControle(const ARequestFilter: string = ''): TFDJSONDataSets;
    function getControle_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function getNotificacoes(AIdUsu: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function getNotificacoes_Cache(AIdUsu: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function getAvaliacaoCompleta(AIdAvaliacao: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function getAvaliacaoCompleta_Cache(AIdAvaliacao: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    procedure SalvaAvaliacao(AIdCom: Integer; AIdUsu: Integer; AAmbiente: Single; AAtendimento: Single; ALimpeza: Single; ALocalizacao: Single; APreco: Single; AMedia: Single; AComentario: string);
    procedure DeletePush(AIdUsu: Integer; AIdPush: Integer);
    function getAnuncios(AIdCom: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function getAnuncios_Cache(AIdCom: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    procedure AtivaPush(AKeyPush: string; AAtiva: Boolean);
    procedure NovoComercio(ACnpj: string; ARazao: string; AEmail: string; AFone: string; AContato: string);
    function ComercioCadastrado(ACNPJ: string; const ARequestFilter: string = ''): Boolean;
    function UpdateRaioUsuario(AIdUsuario: Integer; ARaio: Integer; const ARequestFilter: string = ''): Boolean;
    procedure GravaUltimaPosicaoUsuario(ALatitude: string; ALongitude: string; ADeviceToken: string);
    function getNovaSenha(ADoc: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function getNovaSenha_Cache(ADoc: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function UpdateSenha(AIdCom: Integer; ASenha: string; const ARequestFilter: string = ''): Boolean;
    function getLogin(ADoc: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function getLogin_Cache(ADoc: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    procedure DeleteFone(AIdFone: Integer);
    function LoadCheckList(AIdCom: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function LoadCheckList_Cache(AIdCom: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    procedure AddCheckListCom(AIdCom: Integer; AIdCheck: Integer);
    procedure AddCheckListNovo(ACheck: string; AIdCom: Integer);
    function LoadSubGrupo(AIdGrupo: Integer; AIdCom: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function LoadSubGrupo_Cache(AIdGrupo: Integer; AIdCom: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function LoadSubCatCom(AIdCom: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function LoadSubCatCom_Cache(AIdCom: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    procedure InsertSubCatCom(AIdCom: Integer; AIdGrupo: Integer; AIdSubGrupo: Integer);
    procedure ClearSubCatCom(AIdCom: Integer);
    function LoadGrupoSelected(AIdCom: Integer; const ARequestFilter: string = ''): Integer;
    procedure InsertCategoria(ACategoria: string; ADescricao: string; AIdCom: Integer);
    function SolicitacoesNovaCategoria(AIdCom: Integer; const ARequestFilter: string = ''): Integer;
  end;

  IDSRestCachedTFDJSONDataSets = interface(IDSRestCachedObject<TFDJSONDataSets>)
  end;

  TDSRestCachedTFDJSONDataSets = class(TDSRestCachedObject<TFDJSONDataSets>, IDSRestCachedTFDJSONDataSets, IDSRestCachedCommand)
  end;

const
  TServerMethods_DataModuleCreate: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'Sender'; Direction: 1; DBXType: 37; TypeName: 'TObject')
  );

  TServerMethods_ListaPlanos: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods_ListaPlanos_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods_gravaDelivery: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'AIdCom'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'AUber'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ARappi'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIfood'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerMethods_gravaRedesSociais: array [0..10] of TDSRestParameterMetaData =
  (
    (Name: 'AIdCom'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'AFace'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AInsta'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ATwitter'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AYouTube'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AGPlus'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ASite'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AEmail'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AGPlay'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AStore'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerMethods_gravaCadastroAvaliacoes: array [0..6] of TDSRestParameterMetaData =
  (
    (Name: 'AIdCom'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'AAmbiente'; Direction: 1; DBXType: 4; TypeName: 'Boolean'),
    (Name: 'AAtendimento'; Direction: 1; DBXType: 4; TypeName: 'Boolean'),
    (Name: 'ALimpeza'; Direction: 1; DBXType: 4; TypeName: 'Boolean'),
    (Name: 'ALocal'; Direction: 1; DBXType: 4; TypeName: 'Boolean'),
    (Name: 'APreco'; Direction: 1; DBXType: 4; TypeName: 'Boolean'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerMethods_LoadGrupos: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AIdCom'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods_LoadGrupos_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AIdCom'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods_UpdateGrupoCom: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AIdCom'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'AIdGrupo'; Direction: 1; DBXType: 6; TypeName: 'Integer')
  );

  TServerMethods_EnviarEmail: array [0..5] of TDSRestParameterMetaData =
  (
    (Name: 'pCodigo'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'pAssunto'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'pNome'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'pEmail'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'pTipoEmail'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'pHtml'; Direction: 1; DBXType: 4; TypeName: 'Boolean')
  );

  TServerMethods_TelRepetido: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ATelefone'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 6; TypeName: 'Integer')
  );

  TServerMethods_AddComercioNovo: array [0..10] of TDSRestParameterMetaData =
  (
    (Name: 'ARazao'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AFantasia'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACep'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AComplemento'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ACNPJCPF'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIERG'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AEmail'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ASenha'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ALoginFone'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ANumero'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 6; TypeName: 'Integer')
  );

  TServerMethods_AddTelefone: array [0..5] of TDSRestParameterMetaData =
  (
    (Name: 'ATelefone'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AContato'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AZap'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AInterno'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIdComFone'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'AIdFone'; Direction: 1; DBXType: 6; TypeName: 'Integer')
  );

  TServerMethods_DocRepetido: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'AField'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ADoc'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerMethods_getTelefone: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AIdCom'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods_getTelefone_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AIdCom'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods_LoadCategorias: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'AIdPush'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ARaio'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods_LoadCategorias_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'AIdPush'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ARaio'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods_LoadDestaquePrincipal: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'AIdPush'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ARaio'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods_LoadDestaquePrincipal_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'AIdPush'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ARaio'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods_LoadComercioCategoria: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'AIdPush'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ARaio'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'IdCategoria'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'IdSubCategoria'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods_LoadComercioCategoria_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'AIdPush'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ARaio'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'IdCategoria'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'IdSubCategoria'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods_LoadSubCategoria: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'AIdPush'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ARaio'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'IdCategoria'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods_LoadSubCategoria_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'AIdPush'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ARaio'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'IdCategoria'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods_LoadFotosPorSecao: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'ARaio'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'vIdCat'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'APesquisa'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIdPush'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods_LoadFotosPorSecao_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'ARaio'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'vIdCat'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'APesquisa'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIdPush'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods_LoadComercioPesquisa: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ARaio'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'FPesquisa'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIdPush'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods_LoadComercioPesquisa_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'ARaio'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'FPesquisa'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIdPush'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods_LoadDestaqueFavorito: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'AIdPush'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ARaio'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'vIdUsu'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods_LoadDestaqueFavorito_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'AIdPush'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ARaio'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'vIdUsu'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods_InsertNewSubCategoria: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'AIdCategoria'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'AIdCom'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ANomeSubCategoria'; Direction: 1; DBXType: 26; TypeName: 'string')
  );

  TServerMethods_RecebeNotificacao: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AKeyPush'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerMethods_VerificaUsuarioAvaliou: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'AIdUsu'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'AIdCom'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerMethods_LoadFichaComercio: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AIdComercio'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods_LoadFichaComercio_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AIdComercio'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods_LoadComercio: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'idComercio'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods_LoadComercio_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'idComercio'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods_LoadAvaliacoes: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'idComercio'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'nStart'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods_LoadAvaliacoes_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'idComercio'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'nStart'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods_VerificaCelularDuplicado: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'vCelular'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods_VerificaCelularDuplicado_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'vCelular'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods_DownloadIdUsuario: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'vCelular'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods_DownloadIdUsuario_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'vCelular'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods_DownloadUsuario: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'vCelular'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods_DownloadUsuario_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'vCelular'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods_DownloadUsuarioId: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'fIdUsu'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods_DownloadUsuarioId_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'fIdUsu'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods_UpdateUsuario: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'FNome'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'FCelular'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'FSenha'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'FID'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerMethods_InsertUsuario: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'FNome'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'FCelular'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'FSenha'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerMethods_ControleFavorito: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'FIdUsu'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'FIdCom'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'FAction'; Direction: 1; DBXType: 26; TypeName: 'string')
  );

  TServerMethods_RegistrarDispositivo: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ADeviceToken'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIdUsu'; Direction: 1; DBXType: 6; TypeName: 'Integer')
  );

  TServerMethods_IsFavorito: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'FIdUsu'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'FIdCom'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerMethods_SQLServer: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'cSql'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods_SQLServer_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'cSql'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods_UpdateAcessoUsu: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'vIdUsu'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerMethods_SalvaHistoricoUsu: array [0..5] of TDSRestParameterMetaData =
  (
    (Name: 'hIdUsu'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'hIdCat'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'hIdSubCat'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'hIdCom'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'hPqsUsu'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerMethods_getControle: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods_getControle_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods_getNotificacoes: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AIdUsu'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods_getNotificacoes_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AIdUsu'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods_getAvaliacaoCompleta: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AIdAvaliacao'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods_getAvaliacaoCompleta_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AIdAvaliacao'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods_SalvaAvaliacao: array [0..8] of TDSRestParameterMetaData =
  (
    (Name: 'AIdCom'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'AIdUsu'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'AAmbiente'; Direction: 1; DBXType: 27; TypeName: 'Single'),
    (Name: 'AAtendimento'; Direction: 1; DBXType: 27; TypeName: 'Single'),
    (Name: 'ALimpeza'; Direction: 1; DBXType: 27; TypeName: 'Single'),
    (Name: 'ALocalizacao'; Direction: 1; DBXType: 27; TypeName: 'Single'),
    (Name: 'APreco'; Direction: 1; DBXType: 27; TypeName: 'Single'),
    (Name: 'AMedia'; Direction: 1; DBXType: 27; TypeName: 'Single'),
    (Name: 'AComentario'; Direction: 1; DBXType: 26; TypeName: 'string')
  );

  TServerMethods_DeletePush: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AIdUsu'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'AIdPush'; Direction: 1; DBXType: 6; TypeName: 'Integer')
  );

  TServerMethods_getAnuncios: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AIdCom'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods_getAnuncios_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AIdCom'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods_AtivaPush: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AKeyPush'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AAtiva'; Direction: 1; DBXType: 4; TypeName: 'Boolean')
  );

  TServerMethods_NovoComercio: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'ACnpj'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ARazao'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AEmail'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AFone'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AContato'; Direction: 1; DBXType: 26; TypeName: 'string')
  );

  TServerMethods_ComercioCadastrado: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ACNPJ'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerMethods_UpdateRaioUsuario: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'AIdUsuario'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ARaio'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerMethods_GravaUltimaPosicaoUsuario: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ALatitude'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ALongitude'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ADeviceToken'; Direction: 1; DBXType: 26; TypeName: 'string')
  );

  TServerMethods_getNovaSenha: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ADoc'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods_getNovaSenha_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ADoc'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods_UpdateSenha: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'AIdCom'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'ASenha'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerMethods_getLogin: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ADoc'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods_getLogin_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ADoc'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods_DeleteFone: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'AIdFone'; Direction: 1; DBXType: 6; TypeName: 'Integer')
  );

  TServerMethods_LoadCheckList: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AIdCom'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods_LoadCheckList_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AIdCom'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods_AddCheckListCom: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AIdCom'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'AIdCheck'; Direction: 1; DBXType: 6; TypeName: 'Integer')
  );

  TServerMethods_AddCheckListNovo: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ACheck'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIdCom'; Direction: 1; DBXType: 6; TypeName: 'Integer')
  );

  TServerMethods_LoadSubGrupo: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'AIdGrupo'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'AIdCom'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods_LoadSubGrupo_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'AIdGrupo'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'AIdCom'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods_LoadSubCatCom: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AIdCom'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods_LoadSubCatCom_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AIdCom'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods_InsertSubCatCom: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'AIdCom'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'AIdGrupo'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'AIdSubGrupo'; Direction: 1; DBXType: 6; TypeName: 'Integer')
  );

  TServerMethods_ClearSubCatCom: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'AIdCom'; Direction: 1; DBXType: 6; TypeName: 'Integer')
  );

  TServerMethods_LoadGrupoSelected: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AIdCom'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 6; TypeName: 'Integer')
  );

  TServerMethods_InsertCategoria: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ACategoria'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ADescricao'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AIdCom'; Direction: 1; DBXType: 6; TypeName: 'Integer')
  );

  TServerMethods_SolicitacoesNovaCategoria: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AIdCom'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 6; TypeName: 'Integer')
  );

implementation

procedure TServerMethodsClient.DataModuleCreate(Sender: TObject);
begin
  if FDataModuleCreateCommand = nil then
  begin
    FDataModuleCreateCommand := FConnection.CreateCommand;
    FDataModuleCreateCommand.RequestType := 'POST';
    FDataModuleCreateCommand.Text := 'TServerMethods."DataModuleCreate"';
    FDataModuleCreateCommand.Prepare(TServerMethods_DataModuleCreate);
  end;
  if not Assigned(Sender) then
    FDataModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDataModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDataModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDataModuleCreateCommand.Execute;
end;

function TServerMethodsClient.ListaPlanos(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FListaPlanosCommand = nil then
  begin
    FListaPlanosCommand := FConnection.CreateCommand;
    FListaPlanosCommand.RequestType := 'GET';
    FListaPlanosCommand.Text := 'TServerMethods.ListaPlanos';
    FListaPlanosCommand.Prepare(TServerMethods_ListaPlanos);
  end;
  FListaPlanosCommand.Execute(ARequestFilter);
  if not FListaPlanosCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FListaPlanosCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FListaPlanosCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FListaPlanosCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethodsClient.ListaPlanos_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FListaPlanosCommand_Cache = nil then
  begin
    FListaPlanosCommand_Cache := FConnection.CreateCommand;
    FListaPlanosCommand_Cache.RequestType := 'GET';
    FListaPlanosCommand_Cache.Text := 'TServerMethods.ListaPlanos';
    FListaPlanosCommand_Cache.Prepare(TServerMethods_ListaPlanos_Cache);
  end;
  FListaPlanosCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FListaPlanosCommand_Cache.Parameters[0].Value.GetString);
end;

function TServerMethodsClient.gravaDelivery(AIdCom: Integer; AUber: string; ARappi: string; AIfood: string; const ARequestFilter: string): Boolean;
begin
  if FgravaDeliveryCommand = nil then
  begin
    FgravaDeliveryCommand := FConnection.CreateCommand;
    FgravaDeliveryCommand.RequestType := 'GET';
    FgravaDeliveryCommand.Text := 'TServerMethods.gravaDelivery';
    FgravaDeliveryCommand.Prepare(TServerMethods_gravaDelivery);
  end;
  FgravaDeliveryCommand.Parameters[0].Value.SetInt32(AIdCom);
  FgravaDeliveryCommand.Parameters[1].Value.SetWideString(AUber);
  FgravaDeliveryCommand.Parameters[2].Value.SetWideString(ARappi);
  FgravaDeliveryCommand.Parameters[3].Value.SetWideString(AIfood);
  FgravaDeliveryCommand.Execute(ARequestFilter);
  Result := FgravaDeliveryCommand.Parameters[4].Value.GetBoolean;
end;

function TServerMethodsClient.gravaRedesSociais(AIdCom: Integer; AFace: string; AInsta: string; ATwitter: string; AYouTube: string; AGPlus: string; ASite: string; AEmail: string; AGPlay: string; AStore: string; const ARequestFilter: string): Boolean;
begin
  if FgravaRedesSociaisCommand = nil then
  begin
    FgravaRedesSociaisCommand := FConnection.CreateCommand;
    FgravaRedesSociaisCommand.RequestType := 'GET';
    FgravaRedesSociaisCommand.Text := 'TServerMethods.gravaRedesSociais';
    FgravaRedesSociaisCommand.Prepare(TServerMethods_gravaRedesSociais);
  end;
  FgravaRedesSociaisCommand.Parameters[0].Value.SetInt32(AIdCom);
  FgravaRedesSociaisCommand.Parameters[1].Value.SetWideString(AFace);
  FgravaRedesSociaisCommand.Parameters[2].Value.SetWideString(AInsta);
  FgravaRedesSociaisCommand.Parameters[3].Value.SetWideString(ATwitter);
  FgravaRedesSociaisCommand.Parameters[4].Value.SetWideString(AYouTube);
  FgravaRedesSociaisCommand.Parameters[5].Value.SetWideString(AGPlus);
  FgravaRedesSociaisCommand.Parameters[6].Value.SetWideString(ASite);
  FgravaRedesSociaisCommand.Parameters[7].Value.SetWideString(AEmail);
  FgravaRedesSociaisCommand.Parameters[8].Value.SetWideString(AGPlay);
  FgravaRedesSociaisCommand.Parameters[9].Value.SetWideString(AStore);
  FgravaRedesSociaisCommand.Execute(ARequestFilter);
  Result := FgravaRedesSociaisCommand.Parameters[10].Value.GetBoolean;
end;

function TServerMethodsClient.gravaCadastroAvaliacoes(AIdCom: Integer; AAmbiente: Boolean; AAtendimento: Boolean; ALimpeza: Boolean; ALocal: Boolean; APreco: Boolean; const ARequestFilter: string): Boolean;
begin
  if FgravaCadastroAvaliacoesCommand = nil then
  begin
    FgravaCadastroAvaliacoesCommand := FConnection.CreateCommand;
    FgravaCadastroAvaliacoesCommand.RequestType := 'GET';
    FgravaCadastroAvaliacoesCommand.Text := 'TServerMethods.gravaCadastroAvaliacoes';
    FgravaCadastroAvaliacoesCommand.Prepare(TServerMethods_gravaCadastroAvaliacoes);
  end;
  FgravaCadastroAvaliacoesCommand.Parameters[0].Value.SetInt32(AIdCom);
  FgravaCadastroAvaliacoesCommand.Parameters[1].Value.SetBoolean(AAmbiente);
  FgravaCadastroAvaliacoesCommand.Parameters[2].Value.SetBoolean(AAtendimento);
  FgravaCadastroAvaliacoesCommand.Parameters[3].Value.SetBoolean(ALimpeza);
  FgravaCadastroAvaliacoesCommand.Parameters[4].Value.SetBoolean(ALocal);
  FgravaCadastroAvaliacoesCommand.Parameters[5].Value.SetBoolean(APreco);
  FgravaCadastroAvaliacoesCommand.Execute(ARequestFilter);
  Result := FgravaCadastroAvaliacoesCommand.Parameters[6].Value.GetBoolean;
end;

function TServerMethodsClient.LoadGrupos(AIdCom: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FLoadGruposCommand = nil then
  begin
    FLoadGruposCommand := FConnection.CreateCommand;
    FLoadGruposCommand.RequestType := 'GET';
    FLoadGruposCommand.Text := 'TServerMethods.LoadGrupos';
    FLoadGruposCommand.Prepare(TServerMethods_LoadGrupos);
  end;
  FLoadGruposCommand.Parameters[0].Value.SetInt32(AIdCom);
  FLoadGruposCommand.Execute(ARequestFilter);
  if not FLoadGruposCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FLoadGruposCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FLoadGruposCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FLoadGruposCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethodsClient.LoadGrupos_Cache(AIdCom: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FLoadGruposCommand_Cache = nil then
  begin
    FLoadGruposCommand_Cache := FConnection.CreateCommand;
    FLoadGruposCommand_Cache.RequestType := 'GET';
    FLoadGruposCommand_Cache.Text := 'TServerMethods.LoadGrupos';
    FLoadGruposCommand_Cache.Prepare(TServerMethods_LoadGrupos_Cache);
  end;
  FLoadGruposCommand_Cache.Parameters[0].Value.SetInt32(AIdCom);
  FLoadGruposCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FLoadGruposCommand_Cache.Parameters[1].Value.GetString);
end;

procedure TServerMethodsClient.UpdateGrupoCom(AIdCom: Integer; AIdGrupo: Integer);
begin
  if FUpdateGrupoComCommand = nil then
  begin
    FUpdateGrupoComCommand := FConnection.CreateCommand;
    FUpdateGrupoComCommand.RequestType := 'GET';
    FUpdateGrupoComCommand.Text := 'TServerMethods.UpdateGrupoCom';
    FUpdateGrupoComCommand.Prepare(TServerMethods_UpdateGrupoCom);
  end;
  FUpdateGrupoComCommand.Parameters[0].Value.SetInt32(AIdCom);
  FUpdateGrupoComCommand.Parameters[1].Value.SetInt32(AIdGrupo);
  FUpdateGrupoComCommand.Execute;
end;

procedure TServerMethodsClient.EnviarEmail(pCodigo: string; pAssunto: string; pNome: string; pEmail: string; pTipoEmail: string; pHtml: Boolean);
begin
  if FEnviarEmailCommand = nil then
  begin
    FEnviarEmailCommand := FConnection.CreateCommand;
    FEnviarEmailCommand.RequestType := 'GET';
    FEnviarEmailCommand.Text := 'TServerMethods.EnviarEmail';
    FEnviarEmailCommand.Prepare(TServerMethods_EnviarEmail);
  end;
  FEnviarEmailCommand.Parameters[0].Value.SetWideString(pCodigo);
  FEnviarEmailCommand.Parameters[1].Value.SetWideString(pAssunto);
  FEnviarEmailCommand.Parameters[2].Value.SetWideString(pNome);
  FEnviarEmailCommand.Parameters[3].Value.SetWideString(pEmail);
  FEnviarEmailCommand.Parameters[4].Value.SetWideString(pTipoEmail);
  FEnviarEmailCommand.Parameters[5].Value.SetBoolean(pHtml);
  FEnviarEmailCommand.Execute;
end;

function TServerMethodsClient.TelRepetido(ATelefone: string; const ARequestFilter: string): Integer;
begin
  if FTelRepetidoCommand = nil then
  begin
    FTelRepetidoCommand := FConnection.CreateCommand;
    FTelRepetidoCommand.RequestType := 'GET';
    FTelRepetidoCommand.Text := 'TServerMethods.TelRepetido';
    FTelRepetidoCommand.Prepare(TServerMethods_TelRepetido);
  end;
  FTelRepetidoCommand.Parameters[0].Value.SetWideString(ATelefone);
  FTelRepetidoCommand.Execute(ARequestFilter);
  Result := FTelRepetidoCommand.Parameters[1].Value.GetInt32;
end;

function TServerMethodsClient.AddComercioNovo(ARazao: string; AFantasia: string; ACep: string; AComplemento: string; ACNPJCPF: string; AIERG: string; AEmail: string; ASenha: string; ALoginFone: string; ANumero: Integer; const ARequestFilter: string): Integer;
begin
  if FAddComercioNovoCommand = nil then
  begin
    FAddComercioNovoCommand := FConnection.CreateCommand;
    FAddComercioNovoCommand.RequestType := 'GET';
    FAddComercioNovoCommand.Text := 'TServerMethods.AddComercioNovo';
    FAddComercioNovoCommand.Prepare(TServerMethods_AddComercioNovo);
  end;
  FAddComercioNovoCommand.Parameters[0].Value.SetWideString(ARazao);
  FAddComercioNovoCommand.Parameters[1].Value.SetWideString(AFantasia);
  FAddComercioNovoCommand.Parameters[2].Value.SetWideString(ACep);
  FAddComercioNovoCommand.Parameters[3].Value.SetWideString(AComplemento);
  FAddComercioNovoCommand.Parameters[4].Value.SetWideString(ACNPJCPF);
  FAddComercioNovoCommand.Parameters[5].Value.SetWideString(AIERG);
  FAddComercioNovoCommand.Parameters[6].Value.SetWideString(AEmail);
  FAddComercioNovoCommand.Parameters[7].Value.SetWideString(ASenha);
  FAddComercioNovoCommand.Parameters[8].Value.SetWideString(ALoginFone);
  FAddComercioNovoCommand.Parameters[9].Value.SetInt32(ANumero);
  FAddComercioNovoCommand.Execute(ARequestFilter);
  Result := FAddComercioNovoCommand.Parameters[10].Value.GetInt32;
end;

procedure TServerMethodsClient.AddTelefone(ATelefone: string; AContato: string; AZap: string; AInterno: string; AIdComFone: Integer; AIdFone: Integer);
begin
  if FAddTelefoneCommand = nil then
  begin
    FAddTelefoneCommand := FConnection.CreateCommand;
    FAddTelefoneCommand.RequestType := 'GET';
    FAddTelefoneCommand.Text := 'TServerMethods.AddTelefone';
    FAddTelefoneCommand.Prepare(TServerMethods_AddTelefone);
  end;
  FAddTelefoneCommand.Parameters[0].Value.SetWideString(ATelefone);
  FAddTelefoneCommand.Parameters[1].Value.SetWideString(AContato);
  FAddTelefoneCommand.Parameters[2].Value.SetWideString(AZap);
  FAddTelefoneCommand.Parameters[3].Value.SetWideString(AInterno);
  FAddTelefoneCommand.Parameters[4].Value.SetInt32(AIdComFone);
  FAddTelefoneCommand.Parameters[5].Value.SetInt32(AIdFone);
  FAddTelefoneCommand.Execute;
end;

function TServerMethodsClient.DocRepetido(AField: string; ADoc: string; const ARequestFilter: string): Boolean;
begin
  if FDocRepetidoCommand = nil then
  begin
    FDocRepetidoCommand := FConnection.CreateCommand;
    FDocRepetidoCommand.RequestType := 'GET';
    FDocRepetidoCommand.Text := 'TServerMethods.DocRepetido';
    FDocRepetidoCommand.Prepare(TServerMethods_DocRepetido);
  end;
  FDocRepetidoCommand.Parameters[0].Value.SetWideString(AField);
  FDocRepetidoCommand.Parameters[1].Value.SetWideString(ADoc);
  FDocRepetidoCommand.Execute(ARequestFilter);
  Result := FDocRepetidoCommand.Parameters[2].Value.GetBoolean;
end;

function TServerMethodsClient.getTelefone(AIdCom: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FgetTelefoneCommand = nil then
  begin
    FgetTelefoneCommand := FConnection.CreateCommand;
    FgetTelefoneCommand.RequestType := 'GET';
    FgetTelefoneCommand.Text := 'TServerMethods.getTelefone';
    FgetTelefoneCommand.Prepare(TServerMethods_getTelefone);
  end;
  FgetTelefoneCommand.Parameters[0].Value.SetInt32(AIdCom);
  FgetTelefoneCommand.Execute(ARequestFilter);
  if not FgetTelefoneCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FgetTelefoneCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FgetTelefoneCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FgetTelefoneCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethodsClient.getTelefone_Cache(AIdCom: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FgetTelefoneCommand_Cache = nil then
  begin
    FgetTelefoneCommand_Cache := FConnection.CreateCommand;
    FgetTelefoneCommand_Cache.RequestType := 'GET';
    FgetTelefoneCommand_Cache.Text := 'TServerMethods.getTelefone';
    FgetTelefoneCommand_Cache.Prepare(TServerMethods_getTelefone_Cache);
  end;
  FgetTelefoneCommand_Cache.Parameters[0].Value.SetInt32(AIdCom);
  FgetTelefoneCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FgetTelefoneCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerMethodsClient.LoadCategorias(AIdPush: string; ARaio: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FLoadCategoriasCommand = nil then
  begin
    FLoadCategoriasCommand := FConnection.CreateCommand;
    FLoadCategoriasCommand.RequestType := 'GET';
    FLoadCategoriasCommand.Text := 'TServerMethods.LoadCategorias';
    FLoadCategoriasCommand.Prepare(TServerMethods_LoadCategorias);
  end;
  FLoadCategoriasCommand.Parameters[0].Value.SetWideString(AIdPush);
  FLoadCategoriasCommand.Parameters[1].Value.SetInt32(ARaio);
  FLoadCategoriasCommand.Execute(ARequestFilter);
  if not FLoadCategoriasCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FLoadCategoriasCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FLoadCategoriasCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FLoadCategoriasCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethodsClient.LoadCategorias_Cache(AIdPush: string; ARaio: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FLoadCategoriasCommand_Cache = nil then
  begin
    FLoadCategoriasCommand_Cache := FConnection.CreateCommand;
    FLoadCategoriasCommand_Cache.RequestType := 'GET';
    FLoadCategoriasCommand_Cache.Text := 'TServerMethods.LoadCategorias';
    FLoadCategoriasCommand_Cache.Prepare(TServerMethods_LoadCategorias_Cache);
  end;
  FLoadCategoriasCommand_Cache.Parameters[0].Value.SetWideString(AIdPush);
  FLoadCategoriasCommand_Cache.Parameters[1].Value.SetInt32(ARaio);
  FLoadCategoriasCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FLoadCategoriasCommand_Cache.Parameters[2].Value.GetString);
end;

function TServerMethodsClient.LoadDestaquePrincipal(AIdPush: string; ARaio: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FLoadDestaquePrincipalCommand = nil then
  begin
    FLoadDestaquePrincipalCommand := FConnection.CreateCommand;
    FLoadDestaquePrincipalCommand.RequestType := 'GET';
    FLoadDestaquePrincipalCommand.Text := 'TServerMethods.LoadDestaquePrincipal';
    FLoadDestaquePrincipalCommand.Prepare(TServerMethods_LoadDestaquePrincipal);
  end;
  FLoadDestaquePrincipalCommand.Parameters[0].Value.SetWideString(AIdPush);
  FLoadDestaquePrincipalCommand.Parameters[1].Value.SetInt32(ARaio);
  FLoadDestaquePrincipalCommand.Execute(ARequestFilter);
  if not FLoadDestaquePrincipalCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FLoadDestaquePrincipalCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FLoadDestaquePrincipalCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FLoadDestaquePrincipalCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethodsClient.LoadDestaquePrincipal_Cache(AIdPush: string; ARaio: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FLoadDestaquePrincipalCommand_Cache = nil then
  begin
    FLoadDestaquePrincipalCommand_Cache := FConnection.CreateCommand;
    FLoadDestaquePrincipalCommand_Cache.RequestType := 'GET';
    FLoadDestaquePrincipalCommand_Cache.Text := 'TServerMethods.LoadDestaquePrincipal';
    FLoadDestaquePrincipalCommand_Cache.Prepare(TServerMethods_LoadDestaquePrincipal_Cache);
  end;
  FLoadDestaquePrincipalCommand_Cache.Parameters[0].Value.SetWideString(AIdPush);
  FLoadDestaquePrincipalCommand_Cache.Parameters[1].Value.SetInt32(ARaio);
  FLoadDestaquePrincipalCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FLoadDestaquePrincipalCommand_Cache.Parameters[2].Value.GetString);
end;

function TServerMethodsClient.LoadComercioCategoria(AIdPush: string; ARaio: Integer; IdCategoria: Integer; IdSubCategoria: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FLoadComercioCategoriaCommand = nil then
  begin
    FLoadComercioCategoriaCommand := FConnection.CreateCommand;
    FLoadComercioCategoriaCommand.RequestType := 'GET';
    FLoadComercioCategoriaCommand.Text := 'TServerMethods.LoadComercioCategoria';
    FLoadComercioCategoriaCommand.Prepare(TServerMethods_LoadComercioCategoria);
  end;
  FLoadComercioCategoriaCommand.Parameters[0].Value.SetWideString(AIdPush);
  FLoadComercioCategoriaCommand.Parameters[1].Value.SetInt32(ARaio);
  FLoadComercioCategoriaCommand.Parameters[2].Value.SetInt32(IdCategoria);
  FLoadComercioCategoriaCommand.Parameters[3].Value.SetInt32(IdSubCategoria);
  FLoadComercioCategoriaCommand.Execute(ARequestFilter);
  if not FLoadComercioCategoriaCommand.Parameters[4].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FLoadComercioCategoriaCommand.Parameters[4].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FLoadComercioCategoriaCommand.Parameters[4].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FLoadComercioCategoriaCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethodsClient.LoadComercioCategoria_Cache(AIdPush: string; ARaio: Integer; IdCategoria: Integer; IdSubCategoria: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FLoadComercioCategoriaCommand_Cache = nil then
  begin
    FLoadComercioCategoriaCommand_Cache := FConnection.CreateCommand;
    FLoadComercioCategoriaCommand_Cache.RequestType := 'GET';
    FLoadComercioCategoriaCommand_Cache.Text := 'TServerMethods.LoadComercioCategoria';
    FLoadComercioCategoriaCommand_Cache.Prepare(TServerMethods_LoadComercioCategoria_Cache);
  end;
  FLoadComercioCategoriaCommand_Cache.Parameters[0].Value.SetWideString(AIdPush);
  FLoadComercioCategoriaCommand_Cache.Parameters[1].Value.SetInt32(ARaio);
  FLoadComercioCategoriaCommand_Cache.Parameters[2].Value.SetInt32(IdCategoria);
  FLoadComercioCategoriaCommand_Cache.Parameters[3].Value.SetInt32(IdSubCategoria);
  FLoadComercioCategoriaCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FLoadComercioCategoriaCommand_Cache.Parameters[4].Value.GetString);
end;

function TServerMethodsClient.LoadSubCategoria(AIdPush: string; ARaio: Integer; IdCategoria: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FLoadSubCategoriaCommand = nil then
  begin
    FLoadSubCategoriaCommand := FConnection.CreateCommand;
    FLoadSubCategoriaCommand.RequestType := 'GET';
    FLoadSubCategoriaCommand.Text := 'TServerMethods.LoadSubCategoria';
    FLoadSubCategoriaCommand.Prepare(TServerMethods_LoadSubCategoria);
  end;
  FLoadSubCategoriaCommand.Parameters[0].Value.SetWideString(AIdPush);
  FLoadSubCategoriaCommand.Parameters[1].Value.SetInt32(ARaio);
  FLoadSubCategoriaCommand.Parameters[2].Value.SetInt32(IdCategoria);
  FLoadSubCategoriaCommand.Execute(ARequestFilter);
  if not FLoadSubCategoriaCommand.Parameters[3].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FLoadSubCategoriaCommand.Parameters[3].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FLoadSubCategoriaCommand.Parameters[3].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FLoadSubCategoriaCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethodsClient.LoadSubCategoria_Cache(AIdPush: string; ARaio: Integer; IdCategoria: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FLoadSubCategoriaCommand_Cache = nil then
  begin
    FLoadSubCategoriaCommand_Cache := FConnection.CreateCommand;
    FLoadSubCategoriaCommand_Cache.RequestType := 'GET';
    FLoadSubCategoriaCommand_Cache.Text := 'TServerMethods.LoadSubCategoria';
    FLoadSubCategoriaCommand_Cache.Prepare(TServerMethods_LoadSubCategoria_Cache);
  end;
  FLoadSubCategoriaCommand_Cache.Parameters[0].Value.SetWideString(AIdPush);
  FLoadSubCategoriaCommand_Cache.Parameters[1].Value.SetInt32(ARaio);
  FLoadSubCategoriaCommand_Cache.Parameters[2].Value.SetInt32(IdCategoria);
  FLoadSubCategoriaCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FLoadSubCategoriaCommand_Cache.Parameters[3].Value.GetString);
end;

function TServerMethodsClient.LoadFotosPorSecao(ARaio: Integer; vIdCat: Integer; APesquisa: string; AIdPush: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FLoadFotosPorSecaoCommand = nil then
  begin
    FLoadFotosPorSecaoCommand := FConnection.CreateCommand;
    FLoadFotosPorSecaoCommand.RequestType := 'GET';
    FLoadFotosPorSecaoCommand.Text := 'TServerMethods.LoadFotosPorSecao';
    FLoadFotosPorSecaoCommand.Prepare(TServerMethods_LoadFotosPorSecao);
  end;
  FLoadFotosPorSecaoCommand.Parameters[0].Value.SetInt32(ARaio);
  FLoadFotosPorSecaoCommand.Parameters[1].Value.SetInt32(vIdCat);
  FLoadFotosPorSecaoCommand.Parameters[2].Value.SetWideString(APesquisa);
  FLoadFotosPorSecaoCommand.Parameters[3].Value.SetWideString(AIdPush);
  FLoadFotosPorSecaoCommand.Execute(ARequestFilter);
  if not FLoadFotosPorSecaoCommand.Parameters[4].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FLoadFotosPorSecaoCommand.Parameters[4].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FLoadFotosPorSecaoCommand.Parameters[4].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FLoadFotosPorSecaoCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethodsClient.LoadFotosPorSecao_Cache(ARaio: Integer; vIdCat: Integer; APesquisa: string; AIdPush: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FLoadFotosPorSecaoCommand_Cache = nil then
  begin
    FLoadFotosPorSecaoCommand_Cache := FConnection.CreateCommand;
    FLoadFotosPorSecaoCommand_Cache.RequestType := 'GET';
    FLoadFotosPorSecaoCommand_Cache.Text := 'TServerMethods.LoadFotosPorSecao';
    FLoadFotosPorSecaoCommand_Cache.Prepare(TServerMethods_LoadFotosPorSecao_Cache);
  end;
  FLoadFotosPorSecaoCommand_Cache.Parameters[0].Value.SetInt32(ARaio);
  FLoadFotosPorSecaoCommand_Cache.Parameters[1].Value.SetInt32(vIdCat);
  FLoadFotosPorSecaoCommand_Cache.Parameters[2].Value.SetWideString(APesquisa);
  FLoadFotosPorSecaoCommand_Cache.Parameters[3].Value.SetWideString(AIdPush);
  FLoadFotosPorSecaoCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FLoadFotosPorSecaoCommand_Cache.Parameters[4].Value.GetString);
end;

function TServerMethodsClient.LoadComercioPesquisa(ARaio: Integer; FPesquisa: string; AIdPush: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FLoadComercioPesquisaCommand = nil then
  begin
    FLoadComercioPesquisaCommand := FConnection.CreateCommand;
    FLoadComercioPesquisaCommand.RequestType := 'GET';
    FLoadComercioPesquisaCommand.Text := 'TServerMethods.LoadComercioPesquisa';
    FLoadComercioPesquisaCommand.Prepare(TServerMethods_LoadComercioPesquisa);
  end;
  FLoadComercioPesquisaCommand.Parameters[0].Value.SetInt32(ARaio);
  FLoadComercioPesquisaCommand.Parameters[1].Value.SetWideString(FPesquisa);
  FLoadComercioPesquisaCommand.Parameters[2].Value.SetWideString(AIdPush);
  FLoadComercioPesquisaCommand.Execute(ARequestFilter);
  if not FLoadComercioPesquisaCommand.Parameters[3].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FLoadComercioPesquisaCommand.Parameters[3].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FLoadComercioPesquisaCommand.Parameters[3].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FLoadComercioPesquisaCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethodsClient.LoadComercioPesquisa_Cache(ARaio: Integer; FPesquisa: string; AIdPush: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FLoadComercioPesquisaCommand_Cache = nil then
  begin
    FLoadComercioPesquisaCommand_Cache := FConnection.CreateCommand;
    FLoadComercioPesquisaCommand_Cache.RequestType := 'GET';
    FLoadComercioPesquisaCommand_Cache.Text := 'TServerMethods.LoadComercioPesquisa';
    FLoadComercioPesquisaCommand_Cache.Prepare(TServerMethods_LoadComercioPesquisa_Cache);
  end;
  FLoadComercioPesquisaCommand_Cache.Parameters[0].Value.SetInt32(ARaio);
  FLoadComercioPesquisaCommand_Cache.Parameters[1].Value.SetWideString(FPesquisa);
  FLoadComercioPesquisaCommand_Cache.Parameters[2].Value.SetWideString(AIdPush);
  FLoadComercioPesquisaCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FLoadComercioPesquisaCommand_Cache.Parameters[3].Value.GetString);
end;

function TServerMethodsClient.LoadDestaqueFavorito(AIdPush: string; ARaio: Integer; vIdUsu: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FLoadDestaqueFavoritoCommand = nil then
  begin
    FLoadDestaqueFavoritoCommand := FConnection.CreateCommand;
    FLoadDestaqueFavoritoCommand.RequestType := 'GET';
    FLoadDestaqueFavoritoCommand.Text := 'TServerMethods.LoadDestaqueFavorito';
    FLoadDestaqueFavoritoCommand.Prepare(TServerMethods_LoadDestaqueFavorito);
  end;
  FLoadDestaqueFavoritoCommand.Parameters[0].Value.SetWideString(AIdPush);
  FLoadDestaqueFavoritoCommand.Parameters[1].Value.SetInt32(ARaio);
  FLoadDestaqueFavoritoCommand.Parameters[2].Value.SetInt32(vIdUsu);
  FLoadDestaqueFavoritoCommand.Execute(ARequestFilter);
  if not FLoadDestaqueFavoritoCommand.Parameters[3].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FLoadDestaqueFavoritoCommand.Parameters[3].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FLoadDestaqueFavoritoCommand.Parameters[3].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FLoadDestaqueFavoritoCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethodsClient.LoadDestaqueFavorito_Cache(AIdPush: string; ARaio: Integer; vIdUsu: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FLoadDestaqueFavoritoCommand_Cache = nil then
  begin
    FLoadDestaqueFavoritoCommand_Cache := FConnection.CreateCommand;
    FLoadDestaqueFavoritoCommand_Cache.RequestType := 'GET';
    FLoadDestaqueFavoritoCommand_Cache.Text := 'TServerMethods.LoadDestaqueFavorito';
    FLoadDestaqueFavoritoCommand_Cache.Prepare(TServerMethods_LoadDestaqueFavorito_Cache);
  end;
  FLoadDestaqueFavoritoCommand_Cache.Parameters[0].Value.SetWideString(AIdPush);
  FLoadDestaqueFavoritoCommand_Cache.Parameters[1].Value.SetInt32(ARaio);
  FLoadDestaqueFavoritoCommand_Cache.Parameters[2].Value.SetInt32(vIdUsu);
  FLoadDestaqueFavoritoCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FLoadDestaqueFavoritoCommand_Cache.Parameters[3].Value.GetString);
end;

procedure TServerMethodsClient.InsertNewSubCategoria(AIdCategoria: Integer; AIdCom: Integer; ANomeSubCategoria: string);
begin
  if FInsertNewSubCategoriaCommand = nil then
  begin
    FInsertNewSubCategoriaCommand := FConnection.CreateCommand;
    FInsertNewSubCategoriaCommand.RequestType := 'GET';
    FInsertNewSubCategoriaCommand.Text := 'TServerMethods.InsertNewSubCategoria';
    FInsertNewSubCategoriaCommand.Prepare(TServerMethods_InsertNewSubCategoria);
  end;
  FInsertNewSubCategoriaCommand.Parameters[0].Value.SetInt32(AIdCategoria);
  FInsertNewSubCategoriaCommand.Parameters[1].Value.SetInt32(AIdCom);
  FInsertNewSubCategoriaCommand.Parameters[2].Value.SetWideString(ANomeSubCategoria);
  FInsertNewSubCategoriaCommand.Execute;
end;

function TServerMethodsClient.RecebeNotificacao(AKeyPush: string; const ARequestFilter: string): Boolean;
begin
  if FRecebeNotificacaoCommand = nil then
  begin
    FRecebeNotificacaoCommand := FConnection.CreateCommand;
    FRecebeNotificacaoCommand.RequestType := 'GET';
    FRecebeNotificacaoCommand.Text := 'TServerMethods.RecebeNotificacao';
    FRecebeNotificacaoCommand.Prepare(TServerMethods_RecebeNotificacao);
  end;
  FRecebeNotificacaoCommand.Parameters[0].Value.SetWideString(AKeyPush);
  FRecebeNotificacaoCommand.Execute(ARequestFilter);
  Result := FRecebeNotificacaoCommand.Parameters[1].Value.GetBoolean;
end;

function TServerMethodsClient.VerificaUsuarioAvaliou(AIdUsu: Integer; AIdCom: Integer; const ARequestFilter: string): Boolean;
begin
  if FVerificaUsuarioAvaliouCommand = nil then
  begin
    FVerificaUsuarioAvaliouCommand := FConnection.CreateCommand;
    FVerificaUsuarioAvaliouCommand.RequestType := 'GET';
    FVerificaUsuarioAvaliouCommand.Text := 'TServerMethods.VerificaUsuarioAvaliou';
    FVerificaUsuarioAvaliouCommand.Prepare(TServerMethods_VerificaUsuarioAvaliou);
  end;
  FVerificaUsuarioAvaliouCommand.Parameters[0].Value.SetInt32(AIdUsu);
  FVerificaUsuarioAvaliouCommand.Parameters[1].Value.SetInt32(AIdCom);
  FVerificaUsuarioAvaliouCommand.Execute(ARequestFilter);
  Result := FVerificaUsuarioAvaliouCommand.Parameters[2].Value.GetBoolean;
end;

function TServerMethodsClient.LoadFichaComercio(AIdComercio: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FLoadFichaComercioCommand = nil then
  begin
    FLoadFichaComercioCommand := FConnection.CreateCommand;
    FLoadFichaComercioCommand.RequestType := 'GET';
    FLoadFichaComercioCommand.Text := 'TServerMethods.LoadFichaComercio';
    FLoadFichaComercioCommand.Prepare(TServerMethods_LoadFichaComercio);
  end;
  FLoadFichaComercioCommand.Parameters[0].Value.SetInt32(AIdComercio);
  FLoadFichaComercioCommand.Execute(ARequestFilter);
  if not FLoadFichaComercioCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FLoadFichaComercioCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FLoadFichaComercioCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FLoadFichaComercioCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethodsClient.LoadFichaComercio_Cache(AIdComercio: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FLoadFichaComercioCommand_Cache = nil then
  begin
    FLoadFichaComercioCommand_Cache := FConnection.CreateCommand;
    FLoadFichaComercioCommand_Cache.RequestType := 'GET';
    FLoadFichaComercioCommand_Cache.Text := 'TServerMethods.LoadFichaComercio';
    FLoadFichaComercioCommand_Cache.Prepare(TServerMethods_LoadFichaComercio_Cache);
  end;
  FLoadFichaComercioCommand_Cache.Parameters[0].Value.SetInt32(AIdComercio);
  FLoadFichaComercioCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FLoadFichaComercioCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerMethodsClient.LoadComercio(idComercio: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FLoadComercioCommand = nil then
  begin
    FLoadComercioCommand := FConnection.CreateCommand;
    FLoadComercioCommand.RequestType := 'GET';
    FLoadComercioCommand.Text := 'TServerMethods.LoadComercio';
    FLoadComercioCommand.Prepare(TServerMethods_LoadComercio);
  end;
  FLoadComercioCommand.Parameters[0].Value.SetInt32(idComercio);
  FLoadComercioCommand.Execute(ARequestFilter);
  if not FLoadComercioCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FLoadComercioCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FLoadComercioCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FLoadComercioCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethodsClient.LoadComercio_Cache(idComercio: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FLoadComercioCommand_Cache = nil then
  begin
    FLoadComercioCommand_Cache := FConnection.CreateCommand;
    FLoadComercioCommand_Cache.RequestType := 'GET';
    FLoadComercioCommand_Cache.Text := 'TServerMethods.LoadComercio';
    FLoadComercioCommand_Cache.Prepare(TServerMethods_LoadComercio_Cache);
  end;
  FLoadComercioCommand_Cache.Parameters[0].Value.SetInt32(idComercio);
  FLoadComercioCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FLoadComercioCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerMethodsClient.LoadAvaliacoes(idComercio: Integer; nStart: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FLoadAvaliacoesCommand = nil then
  begin
    FLoadAvaliacoesCommand := FConnection.CreateCommand;
    FLoadAvaliacoesCommand.RequestType := 'GET';
    FLoadAvaliacoesCommand.Text := 'TServerMethods.LoadAvaliacoes';
    FLoadAvaliacoesCommand.Prepare(TServerMethods_LoadAvaliacoes);
  end;
  FLoadAvaliacoesCommand.Parameters[0].Value.SetInt32(idComercio);
  FLoadAvaliacoesCommand.Parameters[1].Value.SetInt32(nStart);
  FLoadAvaliacoesCommand.Execute(ARequestFilter);
  if not FLoadAvaliacoesCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FLoadAvaliacoesCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FLoadAvaliacoesCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FLoadAvaliacoesCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethodsClient.LoadAvaliacoes_Cache(idComercio: Integer; nStart: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FLoadAvaliacoesCommand_Cache = nil then
  begin
    FLoadAvaliacoesCommand_Cache := FConnection.CreateCommand;
    FLoadAvaliacoesCommand_Cache.RequestType := 'GET';
    FLoadAvaliacoesCommand_Cache.Text := 'TServerMethods.LoadAvaliacoes';
    FLoadAvaliacoesCommand_Cache.Prepare(TServerMethods_LoadAvaliacoes_Cache);
  end;
  FLoadAvaliacoesCommand_Cache.Parameters[0].Value.SetInt32(idComercio);
  FLoadAvaliacoesCommand_Cache.Parameters[1].Value.SetInt32(nStart);
  FLoadAvaliacoesCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FLoadAvaliacoesCommand_Cache.Parameters[2].Value.GetString);
end;

function TServerMethodsClient.VerificaCelularDuplicado(vCelular: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FVerificaCelularDuplicadoCommand = nil then
  begin
    FVerificaCelularDuplicadoCommand := FConnection.CreateCommand;
    FVerificaCelularDuplicadoCommand.RequestType := 'GET';
    FVerificaCelularDuplicadoCommand.Text := 'TServerMethods.VerificaCelularDuplicado';
    FVerificaCelularDuplicadoCommand.Prepare(TServerMethods_VerificaCelularDuplicado);
  end;
  FVerificaCelularDuplicadoCommand.Parameters[0].Value.SetWideString(vCelular);
  FVerificaCelularDuplicadoCommand.Execute(ARequestFilter);
  if not FVerificaCelularDuplicadoCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FVerificaCelularDuplicadoCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FVerificaCelularDuplicadoCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FVerificaCelularDuplicadoCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethodsClient.VerificaCelularDuplicado_Cache(vCelular: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FVerificaCelularDuplicadoCommand_Cache = nil then
  begin
    FVerificaCelularDuplicadoCommand_Cache := FConnection.CreateCommand;
    FVerificaCelularDuplicadoCommand_Cache.RequestType := 'GET';
    FVerificaCelularDuplicadoCommand_Cache.Text := 'TServerMethods.VerificaCelularDuplicado';
    FVerificaCelularDuplicadoCommand_Cache.Prepare(TServerMethods_VerificaCelularDuplicado_Cache);
  end;
  FVerificaCelularDuplicadoCommand_Cache.Parameters[0].Value.SetWideString(vCelular);
  FVerificaCelularDuplicadoCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FVerificaCelularDuplicadoCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerMethodsClient.DownloadIdUsuario(vCelular: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FDownloadIdUsuarioCommand = nil then
  begin
    FDownloadIdUsuarioCommand := FConnection.CreateCommand;
    FDownloadIdUsuarioCommand.RequestType := 'GET';
    FDownloadIdUsuarioCommand.Text := 'TServerMethods.DownloadIdUsuario';
    FDownloadIdUsuarioCommand.Prepare(TServerMethods_DownloadIdUsuario);
  end;
  FDownloadIdUsuarioCommand.Parameters[0].Value.SetWideString(vCelular);
  FDownloadIdUsuarioCommand.Execute(ARequestFilter);
  if not FDownloadIdUsuarioCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FDownloadIdUsuarioCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FDownloadIdUsuarioCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FDownloadIdUsuarioCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethodsClient.DownloadIdUsuario_Cache(vCelular: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FDownloadIdUsuarioCommand_Cache = nil then
  begin
    FDownloadIdUsuarioCommand_Cache := FConnection.CreateCommand;
    FDownloadIdUsuarioCommand_Cache.RequestType := 'GET';
    FDownloadIdUsuarioCommand_Cache.Text := 'TServerMethods.DownloadIdUsuario';
    FDownloadIdUsuarioCommand_Cache.Prepare(TServerMethods_DownloadIdUsuario_Cache);
  end;
  FDownloadIdUsuarioCommand_Cache.Parameters[0].Value.SetWideString(vCelular);
  FDownloadIdUsuarioCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FDownloadIdUsuarioCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerMethodsClient.DownloadUsuario(vCelular: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FDownloadUsuarioCommand = nil then
  begin
    FDownloadUsuarioCommand := FConnection.CreateCommand;
    FDownloadUsuarioCommand.RequestType := 'GET';
    FDownloadUsuarioCommand.Text := 'TServerMethods.DownloadUsuario';
    FDownloadUsuarioCommand.Prepare(TServerMethods_DownloadUsuario);
  end;
  FDownloadUsuarioCommand.Parameters[0].Value.SetWideString(vCelular);
  FDownloadUsuarioCommand.Execute(ARequestFilter);
  if not FDownloadUsuarioCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FDownloadUsuarioCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FDownloadUsuarioCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FDownloadUsuarioCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethodsClient.DownloadUsuario_Cache(vCelular: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FDownloadUsuarioCommand_Cache = nil then
  begin
    FDownloadUsuarioCommand_Cache := FConnection.CreateCommand;
    FDownloadUsuarioCommand_Cache.RequestType := 'GET';
    FDownloadUsuarioCommand_Cache.Text := 'TServerMethods.DownloadUsuario';
    FDownloadUsuarioCommand_Cache.Prepare(TServerMethods_DownloadUsuario_Cache);
  end;
  FDownloadUsuarioCommand_Cache.Parameters[0].Value.SetWideString(vCelular);
  FDownloadUsuarioCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FDownloadUsuarioCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerMethodsClient.DownloadUsuarioId(fIdUsu: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FDownloadUsuarioIdCommand = nil then
  begin
    FDownloadUsuarioIdCommand := FConnection.CreateCommand;
    FDownloadUsuarioIdCommand.RequestType := 'GET';
    FDownloadUsuarioIdCommand.Text := 'TServerMethods.DownloadUsuarioId';
    FDownloadUsuarioIdCommand.Prepare(TServerMethods_DownloadUsuarioId);
  end;
  FDownloadUsuarioIdCommand.Parameters[0].Value.SetInt32(fIdUsu);
  FDownloadUsuarioIdCommand.Execute(ARequestFilter);
  if not FDownloadUsuarioIdCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FDownloadUsuarioIdCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FDownloadUsuarioIdCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FDownloadUsuarioIdCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethodsClient.DownloadUsuarioId_Cache(fIdUsu: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FDownloadUsuarioIdCommand_Cache = nil then
  begin
    FDownloadUsuarioIdCommand_Cache := FConnection.CreateCommand;
    FDownloadUsuarioIdCommand_Cache.RequestType := 'GET';
    FDownloadUsuarioIdCommand_Cache.Text := 'TServerMethods.DownloadUsuarioId';
    FDownloadUsuarioIdCommand_Cache.Prepare(TServerMethods_DownloadUsuarioId_Cache);
  end;
  FDownloadUsuarioIdCommand_Cache.Parameters[0].Value.SetInt32(fIdUsu);
  FDownloadUsuarioIdCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FDownloadUsuarioIdCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerMethodsClient.UpdateUsuario(FNome: string; FCelular: string; FSenha: string; FID: Integer; const ARequestFilter: string): Boolean;
begin
  if FUpdateUsuarioCommand = nil then
  begin
    FUpdateUsuarioCommand := FConnection.CreateCommand;
    FUpdateUsuarioCommand.RequestType := 'GET';
    FUpdateUsuarioCommand.Text := 'TServerMethods.UpdateUsuario';
    FUpdateUsuarioCommand.Prepare(TServerMethods_UpdateUsuario);
  end;
  FUpdateUsuarioCommand.Parameters[0].Value.SetWideString(FNome);
  FUpdateUsuarioCommand.Parameters[1].Value.SetWideString(FCelular);
  FUpdateUsuarioCommand.Parameters[2].Value.SetWideString(FSenha);
  FUpdateUsuarioCommand.Parameters[3].Value.SetInt32(FID);
  FUpdateUsuarioCommand.Execute(ARequestFilter);
  Result := FUpdateUsuarioCommand.Parameters[4].Value.GetBoolean;
end;

function TServerMethodsClient.InsertUsuario(FNome: string; FCelular: string; FSenha: string; const ARequestFilter: string): Boolean;
begin
  if FInsertUsuarioCommand = nil then
  begin
    FInsertUsuarioCommand := FConnection.CreateCommand;
    FInsertUsuarioCommand.RequestType := 'GET';
    FInsertUsuarioCommand.Text := 'TServerMethods.InsertUsuario';
    FInsertUsuarioCommand.Prepare(TServerMethods_InsertUsuario);
  end;
  FInsertUsuarioCommand.Parameters[0].Value.SetWideString(FNome);
  FInsertUsuarioCommand.Parameters[1].Value.SetWideString(FCelular);
  FInsertUsuarioCommand.Parameters[2].Value.SetWideString(FSenha);
  FInsertUsuarioCommand.Execute(ARequestFilter);
  Result := FInsertUsuarioCommand.Parameters[3].Value.GetBoolean;
end;

procedure TServerMethodsClient.ControleFavorito(FIdUsu: Integer; FIdCom: Integer; FAction: string);
begin
  if FControleFavoritoCommand = nil then
  begin
    FControleFavoritoCommand := FConnection.CreateCommand;
    FControleFavoritoCommand.RequestType := 'GET';
    FControleFavoritoCommand.Text := 'TServerMethods.ControleFavorito';
    FControleFavoritoCommand.Prepare(TServerMethods_ControleFavorito);
  end;
  FControleFavoritoCommand.Parameters[0].Value.SetInt32(FIdUsu);
  FControleFavoritoCommand.Parameters[1].Value.SetInt32(FIdCom);
  FControleFavoritoCommand.Parameters[2].Value.SetWideString(FAction);
  FControleFavoritoCommand.Execute;
end;

procedure TServerMethodsClient.RegistrarDispositivo(ADeviceToken: string; AIdUsu: Integer);
begin
  if FRegistrarDispositivoCommand = nil then
  begin
    FRegistrarDispositivoCommand := FConnection.CreateCommand;
    FRegistrarDispositivoCommand.RequestType := 'GET';
    FRegistrarDispositivoCommand.Text := 'TServerMethods.RegistrarDispositivo';
    FRegistrarDispositivoCommand.Prepare(TServerMethods_RegistrarDispositivo);
  end;
  FRegistrarDispositivoCommand.Parameters[0].Value.SetWideString(ADeviceToken);
  FRegistrarDispositivoCommand.Parameters[1].Value.SetInt32(AIdUsu);
  FRegistrarDispositivoCommand.Execute;
end;

function TServerMethodsClient.IsFavorito(FIdUsu: Integer; FIdCom: Integer; const ARequestFilter: string): Boolean;
begin
  if FIsFavoritoCommand = nil then
  begin
    FIsFavoritoCommand := FConnection.CreateCommand;
    FIsFavoritoCommand.RequestType := 'GET';
    FIsFavoritoCommand.Text := 'TServerMethods.IsFavorito';
    FIsFavoritoCommand.Prepare(TServerMethods_IsFavorito);
  end;
  FIsFavoritoCommand.Parameters[0].Value.SetInt32(FIdUsu);
  FIsFavoritoCommand.Parameters[1].Value.SetInt32(FIdCom);
  FIsFavoritoCommand.Execute(ARequestFilter);
  Result := FIsFavoritoCommand.Parameters[2].Value.GetBoolean;
end;

function TServerMethodsClient.SQLServer(cSql: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FSQLServerCommand = nil then
  begin
    FSQLServerCommand := FConnection.CreateCommand;
    FSQLServerCommand.RequestType := 'GET';
    FSQLServerCommand.Text := 'TServerMethods.SQLServer';
    FSQLServerCommand.Prepare(TServerMethods_SQLServer);
  end;
  FSQLServerCommand.Parameters[0].Value.SetWideString(cSql);
  FSQLServerCommand.Execute(ARequestFilter);
  if not FSQLServerCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FSQLServerCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FSQLServerCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FSQLServerCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethodsClient.SQLServer_Cache(cSql: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FSQLServerCommand_Cache = nil then
  begin
    FSQLServerCommand_Cache := FConnection.CreateCommand;
    FSQLServerCommand_Cache.RequestType := 'GET';
    FSQLServerCommand_Cache.Text := 'TServerMethods.SQLServer';
    FSQLServerCommand_Cache.Prepare(TServerMethods_SQLServer_Cache);
  end;
  FSQLServerCommand_Cache.Parameters[0].Value.SetWideString(cSql);
  FSQLServerCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FSQLServerCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerMethodsClient.UpdateAcessoUsu(vIdUsu: Integer; const ARequestFilter: string): Boolean;
begin
  if FUpdateAcessoUsuCommand = nil then
  begin
    FUpdateAcessoUsuCommand := FConnection.CreateCommand;
    FUpdateAcessoUsuCommand.RequestType := 'GET';
    FUpdateAcessoUsuCommand.Text := 'TServerMethods.UpdateAcessoUsu';
    FUpdateAcessoUsuCommand.Prepare(TServerMethods_UpdateAcessoUsu);
  end;
  FUpdateAcessoUsuCommand.Parameters[0].Value.SetInt32(vIdUsu);
  FUpdateAcessoUsuCommand.Execute(ARequestFilter);
  Result := FUpdateAcessoUsuCommand.Parameters[1].Value.GetBoolean;
end;

function TServerMethodsClient.SalvaHistoricoUsu(hIdUsu: Integer; hIdCat: Integer; hIdSubCat: Integer; hIdCom: Integer; hPqsUsu: string; const ARequestFilter: string): Boolean;
begin
  if FSalvaHistoricoUsuCommand = nil then
  begin
    FSalvaHistoricoUsuCommand := FConnection.CreateCommand;
    FSalvaHistoricoUsuCommand.RequestType := 'GET';
    FSalvaHistoricoUsuCommand.Text := 'TServerMethods.SalvaHistoricoUsu';
    FSalvaHistoricoUsuCommand.Prepare(TServerMethods_SalvaHistoricoUsu);
  end;
  FSalvaHistoricoUsuCommand.Parameters[0].Value.SetInt32(hIdUsu);
  FSalvaHistoricoUsuCommand.Parameters[1].Value.SetInt32(hIdCat);
  FSalvaHistoricoUsuCommand.Parameters[2].Value.SetInt32(hIdSubCat);
  FSalvaHistoricoUsuCommand.Parameters[3].Value.SetInt32(hIdCom);
  FSalvaHistoricoUsuCommand.Parameters[4].Value.SetWideString(hPqsUsu);
  FSalvaHistoricoUsuCommand.Execute(ARequestFilter);
  Result := FSalvaHistoricoUsuCommand.Parameters[5].Value.GetBoolean;
end;

function TServerMethodsClient.getControle(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FgetControleCommand = nil then
  begin
    FgetControleCommand := FConnection.CreateCommand;
    FgetControleCommand.RequestType := 'GET';
    FgetControleCommand.Text := 'TServerMethods.getControle';
    FgetControleCommand.Prepare(TServerMethods_getControle);
  end;
  FgetControleCommand.Execute(ARequestFilter);
  if not FgetControleCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FgetControleCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FgetControleCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FgetControleCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethodsClient.getControle_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FgetControleCommand_Cache = nil then
  begin
    FgetControleCommand_Cache := FConnection.CreateCommand;
    FgetControleCommand_Cache.RequestType := 'GET';
    FgetControleCommand_Cache.Text := 'TServerMethods.getControle';
    FgetControleCommand_Cache.Prepare(TServerMethods_getControle_Cache);
  end;
  FgetControleCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FgetControleCommand_Cache.Parameters[0].Value.GetString);
end;

function TServerMethodsClient.getNotificacoes(AIdUsu: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FgetNotificacoesCommand = nil then
  begin
    FgetNotificacoesCommand := FConnection.CreateCommand;
    FgetNotificacoesCommand.RequestType := 'GET';
    FgetNotificacoesCommand.Text := 'TServerMethods.getNotificacoes';
    FgetNotificacoesCommand.Prepare(TServerMethods_getNotificacoes);
  end;
  FgetNotificacoesCommand.Parameters[0].Value.SetInt32(AIdUsu);
  FgetNotificacoesCommand.Execute(ARequestFilter);
  if not FgetNotificacoesCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FgetNotificacoesCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FgetNotificacoesCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FgetNotificacoesCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethodsClient.getNotificacoes_Cache(AIdUsu: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FgetNotificacoesCommand_Cache = nil then
  begin
    FgetNotificacoesCommand_Cache := FConnection.CreateCommand;
    FgetNotificacoesCommand_Cache.RequestType := 'GET';
    FgetNotificacoesCommand_Cache.Text := 'TServerMethods.getNotificacoes';
    FgetNotificacoesCommand_Cache.Prepare(TServerMethods_getNotificacoes_Cache);
  end;
  FgetNotificacoesCommand_Cache.Parameters[0].Value.SetInt32(AIdUsu);
  FgetNotificacoesCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FgetNotificacoesCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerMethodsClient.getAvaliacaoCompleta(AIdAvaliacao: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FgetAvaliacaoCompletaCommand = nil then
  begin
    FgetAvaliacaoCompletaCommand := FConnection.CreateCommand;
    FgetAvaliacaoCompletaCommand.RequestType := 'GET';
    FgetAvaliacaoCompletaCommand.Text := 'TServerMethods.getAvaliacaoCompleta';
    FgetAvaliacaoCompletaCommand.Prepare(TServerMethods_getAvaliacaoCompleta);
  end;
  FgetAvaliacaoCompletaCommand.Parameters[0].Value.SetInt32(AIdAvaliacao);
  FgetAvaliacaoCompletaCommand.Execute(ARequestFilter);
  if not FgetAvaliacaoCompletaCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FgetAvaliacaoCompletaCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FgetAvaliacaoCompletaCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FgetAvaliacaoCompletaCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethodsClient.getAvaliacaoCompleta_Cache(AIdAvaliacao: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FgetAvaliacaoCompletaCommand_Cache = nil then
  begin
    FgetAvaliacaoCompletaCommand_Cache := FConnection.CreateCommand;
    FgetAvaliacaoCompletaCommand_Cache.RequestType := 'GET';
    FgetAvaliacaoCompletaCommand_Cache.Text := 'TServerMethods.getAvaliacaoCompleta';
    FgetAvaliacaoCompletaCommand_Cache.Prepare(TServerMethods_getAvaliacaoCompleta_Cache);
  end;
  FgetAvaliacaoCompletaCommand_Cache.Parameters[0].Value.SetInt32(AIdAvaliacao);
  FgetAvaliacaoCompletaCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FgetAvaliacaoCompletaCommand_Cache.Parameters[1].Value.GetString);
end;

procedure TServerMethodsClient.SalvaAvaliacao(AIdCom: Integer; AIdUsu: Integer; AAmbiente: Single; AAtendimento: Single; ALimpeza: Single; ALocalizacao: Single; APreco: Single; AMedia: Single; AComentario: string);
begin
  if FSalvaAvaliacaoCommand = nil then
  begin
    FSalvaAvaliacaoCommand := FConnection.CreateCommand;
    FSalvaAvaliacaoCommand.RequestType := 'GET';
    FSalvaAvaliacaoCommand.Text := 'TServerMethods.SalvaAvaliacao';
    FSalvaAvaliacaoCommand.Prepare(TServerMethods_SalvaAvaliacao);
  end;
  FSalvaAvaliacaoCommand.Parameters[0].Value.SetInt32(AIdCom);
  FSalvaAvaliacaoCommand.Parameters[1].Value.SetInt32(AIdUsu);
  FSalvaAvaliacaoCommand.Parameters[2].Value.SetSingle(AAmbiente);
  FSalvaAvaliacaoCommand.Parameters[3].Value.SetSingle(AAtendimento);
  FSalvaAvaliacaoCommand.Parameters[4].Value.SetSingle(ALimpeza);
  FSalvaAvaliacaoCommand.Parameters[5].Value.SetSingle(ALocalizacao);
  FSalvaAvaliacaoCommand.Parameters[6].Value.SetSingle(APreco);
  FSalvaAvaliacaoCommand.Parameters[7].Value.SetSingle(AMedia);
  FSalvaAvaliacaoCommand.Parameters[8].Value.SetWideString(AComentario);
  FSalvaAvaliacaoCommand.Execute;
end;

procedure TServerMethodsClient.DeletePush(AIdUsu: Integer; AIdPush: Integer);
begin
  if FDeletePushCommand = nil then
  begin
    FDeletePushCommand := FConnection.CreateCommand;
    FDeletePushCommand.RequestType := 'GET';
    FDeletePushCommand.Text := 'TServerMethods.DeletePush';
    FDeletePushCommand.Prepare(TServerMethods_DeletePush);
  end;
  FDeletePushCommand.Parameters[0].Value.SetInt32(AIdUsu);
  FDeletePushCommand.Parameters[1].Value.SetInt32(AIdPush);
  FDeletePushCommand.Execute;
end;

function TServerMethodsClient.getAnuncios(AIdCom: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FgetAnunciosCommand = nil then
  begin
    FgetAnunciosCommand := FConnection.CreateCommand;
    FgetAnunciosCommand.RequestType := 'GET';
    FgetAnunciosCommand.Text := 'TServerMethods.getAnuncios';
    FgetAnunciosCommand.Prepare(TServerMethods_getAnuncios);
  end;
  FgetAnunciosCommand.Parameters[0].Value.SetInt32(AIdCom);
  FgetAnunciosCommand.Execute(ARequestFilter);
  if not FgetAnunciosCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FgetAnunciosCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FgetAnunciosCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FgetAnunciosCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethodsClient.getAnuncios_Cache(AIdCom: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FgetAnunciosCommand_Cache = nil then
  begin
    FgetAnunciosCommand_Cache := FConnection.CreateCommand;
    FgetAnunciosCommand_Cache.RequestType := 'GET';
    FgetAnunciosCommand_Cache.Text := 'TServerMethods.getAnuncios';
    FgetAnunciosCommand_Cache.Prepare(TServerMethods_getAnuncios_Cache);
  end;
  FgetAnunciosCommand_Cache.Parameters[0].Value.SetInt32(AIdCom);
  FgetAnunciosCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FgetAnunciosCommand_Cache.Parameters[1].Value.GetString);
end;

procedure TServerMethodsClient.AtivaPush(AKeyPush: string; AAtiva: Boolean);
begin
  if FAtivaPushCommand = nil then
  begin
    FAtivaPushCommand := FConnection.CreateCommand;
    FAtivaPushCommand.RequestType := 'GET';
    FAtivaPushCommand.Text := 'TServerMethods.AtivaPush';
    FAtivaPushCommand.Prepare(TServerMethods_AtivaPush);
  end;
  FAtivaPushCommand.Parameters[0].Value.SetWideString(AKeyPush);
  FAtivaPushCommand.Parameters[1].Value.SetBoolean(AAtiva);
  FAtivaPushCommand.Execute;
end;

procedure TServerMethodsClient.NovoComercio(ACnpj: string; ARazao: string; AEmail: string; AFone: string; AContato: string);
begin
  if FNovoComercioCommand = nil then
  begin
    FNovoComercioCommand := FConnection.CreateCommand;
    FNovoComercioCommand.RequestType := 'GET';
    FNovoComercioCommand.Text := 'TServerMethods.NovoComercio';
    FNovoComercioCommand.Prepare(TServerMethods_NovoComercio);
  end;
  FNovoComercioCommand.Parameters[0].Value.SetWideString(ACnpj);
  FNovoComercioCommand.Parameters[1].Value.SetWideString(ARazao);
  FNovoComercioCommand.Parameters[2].Value.SetWideString(AEmail);
  FNovoComercioCommand.Parameters[3].Value.SetWideString(AFone);
  FNovoComercioCommand.Parameters[4].Value.SetWideString(AContato);
  FNovoComercioCommand.Execute;
end;

function TServerMethodsClient.ComercioCadastrado(ACNPJ: string; const ARequestFilter: string): Boolean;
begin
  if FComercioCadastradoCommand = nil then
  begin
    FComercioCadastradoCommand := FConnection.CreateCommand;
    FComercioCadastradoCommand.RequestType := 'GET';
    FComercioCadastradoCommand.Text := 'TServerMethods.ComercioCadastrado';
    FComercioCadastradoCommand.Prepare(TServerMethods_ComercioCadastrado);
  end;
  FComercioCadastradoCommand.Parameters[0].Value.SetWideString(ACNPJ);
  FComercioCadastradoCommand.Execute(ARequestFilter);
  Result := FComercioCadastradoCommand.Parameters[1].Value.GetBoolean;
end;

function TServerMethodsClient.UpdateRaioUsuario(AIdUsuario: Integer; ARaio: Integer; const ARequestFilter: string): Boolean;
begin
  if FUpdateRaioUsuarioCommand = nil then
  begin
    FUpdateRaioUsuarioCommand := FConnection.CreateCommand;
    FUpdateRaioUsuarioCommand.RequestType := 'GET';
    FUpdateRaioUsuarioCommand.Text := 'TServerMethods.UpdateRaioUsuario';
    FUpdateRaioUsuarioCommand.Prepare(TServerMethods_UpdateRaioUsuario);
  end;
  FUpdateRaioUsuarioCommand.Parameters[0].Value.SetInt32(AIdUsuario);
  FUpdateRaioUsuarioCommand.Parameters[1].Value.SetInt32(ARaio);
  FUpdateRaioUsuarioCommand.Execute(ARequestFilter);
  Result := FUpdateRaioUsuarioCommand.Parameters[2].Value.GetBoolean;
end;

procedure TServerMethodsClient.GravaUltimaPosicaoUsuario(ALatitude: string; ALongitude: string; ADeviceToken: string);
begin
  if FGravaUltimaPosicaoUsuarioCommand = nil then
  begin
    FGravaUltimaPosicaoUsuarioCommand := FConnection.CreateCommand;
    FGravaUltimaPosicaoUsuarioCommand.RequestType := 'GET';
    FGravaUltimaPosicaoUsuarioCommand.Text := 'TServerMethods.GravaUltimaPosicaoUsuario';
    FGravaUltimaPosicaoUsuarioCommand.Prepare(TServerMethods_GravaUltimaPosicaoUsuario);
  end;
  FGravaUltimaPosicaoUsuarioCommand.Parameters[0].Value.SetWideString(ALatitude);
  FGravaUltimaPosicaoUsuarioCommand.Parameters[1].Value.SetWideString(ALongitude);
  FGravaUltimaPosicaoUsuarioCommand.Parameters[2].Value.SetWideString(ADeviceToken);
  FGravaUltimaPosicaoUsuarioCommand.Execute;
end;

function TServerMethodsClient.getNovaSenha(ADoc: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FgetNovaSenhaCommand = nil then
  begin
    FgetNovaSenhaCommand := FConnection.CreateCommand;
    FgetNovaSenhaCommand.RequestType := 'GET';
    FgetNovaSenhaCommand.Text := 'TServerMethods.getNovaSenha';
    FgetNovaSenhaCommand.Prepare(TServerMethods_getNovaSenha);
  end;
  FgetNovaSenhaCommand.Parameters[0].Value.SetWideString(ADoc);
  FgetNovaSenhaCommand.Execute(ARequestFilter);
  if not FgetNovaSenhaCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FgetNovaSenhaCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FgetNovaSenhaCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FgetNovaSenhaCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethodsClient.getNovaSenha_Cache(ADoc: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FgetNovaSenhaCommand_Cache = nil then
  begin
    FgetNovaSenhaCommand_Cache := FConnection.CreateCommand;
    FgetNovaSenhaCommand_Cache.RequestType := 'GET';
    FgetNovaSenhaCommand_Cache.Text := 'TServerMethods.getNovaSenha';
    FgetNovaSenhaCommand_Cache.Prepare(TServerMethods_getNovaSenha_Cache);
  end;
  FgetNovaSenhaCommand_Cache.Parameters[0].Value.SetWideString(ADoc);
  FgetNovaSenhaCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FgetNovaSenhaCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerMethodsClient.UpdateSenha(AIdCom: Integer; ASenha: string; const ARequestFilter: string): Boolean;
begin
  if FUpdateSenhaCommand = nil then
  begin
    FUpdateSenhaCommand := FConnection.CreateCommand;
    FUpdateSenhaCommand.RequestType := 'GET';
    FUpdateSenhaCommand.Text := 'TServerMethods.UpdateSenha';
    FUpdateSenhaCommand.Prepare(TServerMethods_UpdateSenha);
  end;
  FUpdateSenhaCommand.Parameters[0].Value.SetInt32(AIdCom);
  FUpdateSenhaCommand.Parameters[1].Value.SetWideString(ASenha);
  FUpdateSenhaCommand.Execute(ARequestFilter);
  Result := FUpdateSenhaCommand.Parameters[2].Value.GetBoolean;
end;

function TServerMethodsClient.getLogin(ADoc: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FgetLoginCommand = nil then
  begin
    FgetLoginCommand := FConnection.CreateCommand;
    FgetLoginCommand.RequestType := 'GET';
    FgetLoginCommand.Text := 'TServerMethods.getLogin';
    FgetLoginCommand.Prepare(TServerMethods_getLogin);
  end;
  FgetLoginCommand.Parameters[0].Value.SetWideString(ADoc);
  FgetLoginCommand.Execute(ARequestFilter);
  if not FgetLoginCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FgetLoginCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FgetLoginCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FgetLoginCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethodsClient.getLogin_Cache(ADoc: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FgetLoginCommand_Cache = nil then
  begin
    FgetLoginCommand_Cache := FConnection.CreateCommand;
    FgetLoginCommand_Cache.RequestType := 'GET';
    FgetLoginCommand_Cache.Text := 'TServerMethods.getLogin';
    FgetLoginCommand_Cache.Prepare(TServerMethods_getLogin_Cache);
  end;
  FgetLoginCommand_Cache.Parameters[0].Value.SetWideString(ADoc);
  FgetLoginCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FgetLoginCommand_Cache.Parameters[1].Value.GetString);
end;

procedure TServerMethodsClient.DeleteFone(AIdFone: Integer);
begin
  if FDeleteFoneCommand = nil then
  begin
    FDeleteFoneCommand := FConnection.CreateCommand;
    FDeleteFoneCommand.RequestType := 'GET';
    FDeleteFoneCommand.Text := 'TServerMethods.DeleteFone';
    FDeleteFoneCommand.Prepare(TServerMethods_DeleteFone);
  end;
  FDeleteFoneCommand.Parameters[0].Value.SetInt32(AIdFone);
  FDeleteFoneCommand.Execute;
end;

function TServerMethodsClient.LoadCheckList(AIdCom: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FLoadCheckListCommand = nil then
  begin
    FLoadCheckListCommand := FConnection.CreateCommand;
    FLoadCheckListCommand.RequestType := 'GET';
    FLoadCheckListCommand.Text := 'TServerMethods.LoadCheckList';
    FLoadCheckListCommand.Prepare(TServerMethods_LoadCheckList);
  end;
  FLoadCheckListCommand.Parameters[0].Value.SetInt32(AIdCom);
  FLoadCheckListCommand.Execute(ARequestFilter);
  if not FLoadCheckListCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FLoadCheckListCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FLoadCheckListCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FLoadCheckListCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethodsClient.LoadCheckList_Cache(AIdCom: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FLoadCheckListCommand_Cache = nil then
  begin
    FLoadCheckListCommand_Cache := FConnection.CreateCommand;
    FLoadCheckListCommand_Cache.RequestType := 'GET';
    FLoadCheckListCommand_Cache.Text := 'TServerMethods.LoadCheckList';
    FLoadCheckListCommand_Cache.Prepare(TServerMethods_LoadCheckList_Cache);
  end;
  FLoadCheckListCommand_Cache.Parameters[0].Value.SetInt32(AIdCom);
  FLoadCheckListCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FLoadCheckListCommand_Cache.Parameters[1].Value.GetString);
end;

procedure TServerMethodsClient.AddCheckListCom(AIdCom: Integer; AIdCheck: Integer);
begin
  if FAddCheckListComCommand = nil then
  begin
    FAddCheckListComCommand := FConnection.CreateCommand;
    FAddCheckListComCommand.RequestType := 'GET';
    FAddCheckListComCommand.Text := 'TServerMethods.AddCheckListCom';
    FAddCheckListComCommand.Prepare(TServerMethods_AddCheckListCom);
  end;
  FAddCheckListComCommand.Parameters[0].Value.SetInt32(AIdCom);
  FAddCheckListComCommand.Parameters[1].Value.SetInt32(AIdCheck);
  FAddCheckListComCommand.Execute;
end;

procedure TServerMethodsClient.AddCheckListNovo(ACheck: string; AIdCom: Integer);
begin
  if FAddCheckListNovoCommand = nil then
  begin
    FAddCheckListNovoCommand := FConnection.CreateCommand;
    FAddCheckListNovoCommand.RequestType := 'GET';
    FAddCheckListNovoCommand.Text := 'TServerMethods.AddCheckListNovo';
    FAddCheckListNovoCommand.Prepare(TServerMethods_AddCheckListNovo);
  end;
  FAddCheckListNovoCommand.Parameters[0].Value.SetWideString(ACheck);
  FAddCheckListNovoCommand.Parameters[1].Value.SetInt32(AIdCom);
  FAddCheckListNovoCommand.Execute;
end;

function TServerMethodsClient.LoadSubGrupo(AIdGrupo: Integer; AIdCom: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FLoadSubGrupoCommand = nil then
  begin
    FLoadSubGrupoCommand := FConnection.CreateCommand;
    FLoadSubGrupoCommand.RequestType := 'GET';
    FLoadSubGrupoCommand.Text := 'TServerMethods.LoadSubGrupo';
    FLoadSubGrupoCommand.Prepare(TServerMethods_LoadSubGrupo);
  end;
  FLoadSubGrupoCommand.Parameters[0].Value.SetInt32(AIdGrupo);
  FLoadSubGrupoCommand.Parameters[1].Value.SetInt32(AIdCom);
  FLoadSubGrupoCommand.Execute(ARequestFilter);
  if not FLoadSubGrupoCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FLoadSubGrupoCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FLoadSubGrupoCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FLoadSubGrupoCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethodsClient.LoadSubGrupo_Cache(AIdGrupo: Integer; AIdCom: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FLoadSubGrupoCommand_Cache = nil then
  begin
    FLoadSubGrupoCommand_Cache := FConnection.CreateCommand;
    FLoadSubGrupoCommand_Cache.RequestType := 'GET';
    FLoadSubGrupoCommand_Cache.Text := 'TServerMethods.LoadSubGrupo';
    FLoadSubGrupoCommand_Cache.Prepare(TServerMethods_LoadSubGrupo_Cache);
  end;
  FLoadSubGrupoCommand_Cache.Parameters[0].Value.SetInt32(AIdGrupo);
  FLoadSubGrupoCommand_Cache.Parameters[1].Value.SetInt32(AIdCom);
  FLoadSubGrupoCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FLoadSubGrupoCommand_Cache.Parameters[2].Value.GetString);
end;

function TServerMethodsClient.LoadSubCatCom(AIdCom: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FLoadSubCatComCommand = nil then
  begin
    FLoadSubCatComCommand := FConnection.CreateCommand;
    FLoadSubCatComCommand.RequestType := 'GET';
    FLoadSubCatComCommand.Text := 'TServerMethods.LoadSubCatCom';
    FLoadSubCatComCommand.Prepare(TServerMethods_LoadSubCatCom);
  end;
  FLoadSubCatComCommand.Parameters[0].Value.SetInt32(AIdCom);
  FLoadSubCatComCommand.Execute(ARequestFilter);
  if not FLoadSubCatComCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FLoadSubCatComCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FLoadSubCatComCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FLoadSubCatComCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethodsClient.LoadSubCatCom_Cache(AIdCom: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FLoadSubCatComCommand_Cache = nil then
  begin
    FLoadSubCatComCommand_Cache := FConnection.CreateCommand;
    FLoadSubCatComCommand_Cache.RequestType := 'GET';
    FLoadSubCatComCommand_Cache.Text := 'TServerMethods.LoadSubCatCom';
    FLoadSubCatComCommand_Cache.Prepare(TServerMethods_LoadSubCatCom_Cache);
  end;
  FLoadSubCatComCommand_Cache.Parameters[0].Value.SetInt32(AIdCom);
  FLoadSubCatComCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FLoadSubCatComCommand_Cache.Parameters[1].Value.GetString);
end;

procedure TServerMethodsClient.InsertSubCatCom(AIdCom: Integer; AIdGrupo: Integer; AIdSubGrupo: Integer);
begin
  if FInsertSubCatComCommand = nil then
  begin
    FInsertSubCatComCommand := FConnection.CreateCommand;
    FInsertSubCatComCommand.RequestType := 'GET';
    FInsertSubCatComCommand.Text := 'TServerMethods.InsertSubCatCom';
    FInsertSubCatComCommand.Prepare(TServerMethods_InsertSubCatCom);
  end;
  FInsertSubCatComCommand.Parameters[0].Value.SetInt32(AIdCom);
  FInsertSubCatComCommand.Parameters[1].Value.SetInt32(AIdGrupo);
  FInsertSubCatComCommand.Parameters[2].Value.SetInt32(AIdSubGrupo);
  FInsertSubCatComCommand.Execute;
end;

procedure TServerMethodsClient.ClearSubCatCom(AIdCom: Integer);
begin
  if FClearSubCatComCommand = nil then
  begin
    FClearSubCatComCommand := FConnection.CreateCommand;
    FClearSubCatComCommand.RequestType := 'GET';
    FClearSubCatComCommand.Text := 'TServerMethods.ClearSubCatCom';
    FClearSubCatComCommand.Prepare(TServerMethods_ClearSubCatCom);
  end;
  FClearSubCatComCommand.Parameters[0].Value.SetInt32(AIdCom);
  FClearSubCatComCommand.Execute;
end;

function TServerMethodsClient.LoadGrupoSelected(AIdCom: Integer; const ARequestFilter: string): Integer;
begin
  if FLoadGrupoSelectedCommand = nil then
  begin
    FLoadGrupoSelectedCommand := FConnection.CreateCommand;
    FLoadGrupoSelectedCommand.RequestType := 'GET';
    FLoadGrupoSelectedCommand.Text := 'TServerMethods.LoadGrupoSelected';
    FLoadGrupoSelectedCommand.Prepare(TServerMethods_LoadGrupoSelected);
  end;
  FLoadGrupoSelectedCommand.Parameters[0].Value.SetInt32(AIdCom);
  FLoadGrupoSelectedCommand.Execute(ARequestFilter);
  Result := FLoadGrupoSelectedCommand.Parameters[1].Value.GetInt32;
end;

procedure TServerMethodsClient.InsertCategoria(ACategoria: string; ADescricao: string; AIdCom: Integer);
begin
  if FInsertCategoriaCommand = nil then
  begin
    FInsertCategoriaCommand := FConnection.CreateCommand;
    FInsertCategoriaCommand.RequestType := 'GET';
    FInsertCategoriaCommand.Text := 'TServerMethods.InsertCategoria';
    FInsertCategoriaCommand.Prepare(TServerMethods_InsertCategoria);
  end;
  FInsertCategoriaCommand.Parameters[0].Value.SetWideString(ACategoria);
  FInsertCategoriaCommand.Parameters[1].Value.SetWideString(ADescricao);
  FInsertCategoriaCommand.Parameters[2].Value.SetInt32(AIdCom);
  FInsertCategoriaCommand.Execute;
end;

function TServerMethodsClient.SolicitacoesNovaCategoria(AIdCom: Integer; const ARequestFilter: string): Integer;
begin
  if FSolicitacoesNovaCategoriaCommand = nil then
  begin
    FSolicitacoesNovaCategoriaCommand := FConnection.CreateCommand;
    FSolicitacoesNovaCategoriaCommand.RequestType := 'GET';
    FSolicitacoesNovaCategoriaCommand.Text := 'TServerMethods.SolicitacoesNovaCategoria';
    FSolicitacoesNovaCategoriaCommand.Prepare(TServerMethods_SolicitacoesNovaCategoria);
  end;
  FSolicitacoesNovaCategoriaCommand.Parameters[0].Value.SetInt32(AIdCom);
  FSolicitacoesNovaCategoriaCommand.Execute(ARequestFilter);
  Result := FSolicitacoesNovaCategoriaCommand.Parameters[1].Value.GetInt32;
end;

constructor TServerMethodsClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerMethodsClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerMethodsClient.Destroy;
begin
  FDataModuleCreateCommand.DisposeOf;
  FListaPlanosCommand.DisposeOf;
  FListaPlanosCommand_Cache.DisposeOf;
  FgravaDeliveryCommand.DisposeOf;
  FgravaRedesSociaisCommand.DisposeOf;
  FgravaCadastroAvaliacoesCommand.DisposeOf;
  FLoadGruposCommand.DisposeOf;
  FLoadGruposCommand_Cache.DisposeOf;
  FUpdateGrupoComCommand.DisposeOf;
  FEnviarEmailCommand.DisposeOf;
  FTelRepetidoCommand.DisposeOf;
  FAddComercioNovoCommand.DisposeOf;
  FAddTelefoneCommand.DisposeOf;
  FDocRepetidoCommand.DisposeOf;
  FgetTelefoneCommand.DisposeOf;
  FgetTelefoneCommand_Cache.DisposeOf;
  FLoadCategoriasCommand.DisposeOf;
  FLoadCategoriasCommand_Cache.DisposeOf;
  FLoadDestaquePrincipalCommand.DisposeOf;
  FLoadDestaquePrincipalCommand_Cache.DisposeOf;
  FLoadComercioCategoriaCommand.DisposeOf;
  FLoadComercioCategoriaCommand_Cache.DisposeOf;
  FLoadSubCategoriaCommand.DisposeOf;
  FLoadSubCategoriaCommand_Cache.DisposeOf;
  FLoadFotosPorSecaoCommand.DisposeOf;
  FLoadFotosPorSecaoCommand_Cache.DisposeOf;
  FLoadComercioPesquisaCommand.DisposeOf;
  FLoadComercioPesquisaCommand_Cache.DisposeOf;
  FLoadDestaqueFavoritoCommand.DisposeOf;
  FLoadDestaqueFavoritoCommand_Cache.DisposeOf;
  FInsertNewSubCategoriaCommand.DisposeOf;
  FRecebeNotificacaoCommand.DisposeOf;
  FVerificaUsuarioAvaliouCommand.DisposeOf;
  FLoadFichaComercioCommand.DisposeOf;
  FLoadFichaComercioCommand_Cache.DisposeOf;
  FLoadComercioCommand.DisposeOf;
  FLoadComercioCommand_Cache.DisposeOf;
  FLoadAvaliacoesCommand.DisposeOf;
  FLoadAvaliacoesCommand_Cache.DisposeOf;
  FVerificaCelularDuplicadoCommand.DisposeOf;
  FVerificaCelularDuplicadoCommand_Cache.DisposeOf;
  FDownloadIdUsuarioCommand.DisposeOf;
  FDownloadIdUsuarioCommand_Cache.DisposeOf;
  FDownloadUsuarioCommand.DisposeOf;
  FDownloadUsuarioCommand_Cache.DisposeOf;
  FDownloadUsuarioIdCommand.DisposeOf;
  FDownloadUsuarioIdCommand_Cache.DisposeOf;
  FUpdateUsuarioCommand.DisposeOf;
  FInsertUsuarioCommand.DisposeOf;
  FControleFavoritoCommand.DisposeOf;
  FRegistrarDispositivoCommand.DisposeOf;
  FIsFavoritoCommand.DisposeOf;
  FSQLServerCommand.DisposeOf;
  FSQLServerCommand_Cache.DisposeOf;
  FUpdateAcessoUsuCommand.DisposeOf;
  FSalvaHistoricoUsuCommand.DisposeOf;
  FgetControleCommand.DisposeOf;
  FgetControleCommand_Cache.DisposeOf;
  FgetNotificacoesCommand.DisposeOf;
  FgetNotificacoesCommand_Cache.DisposeOf;
  FgetAvaliacaoCompletaCommand.DisposeOf;
  FgetAvaliacaoCompletaCommand_Cache.DisposeOf;
  FSalvaAvaliacaoCommand.DisposeOf;
  FDeletePushCommand.DisposeOf;
  FgetAnunciosCommand.DisposeOf;
  FgetAnunciosCommand_Cache.DisposeOf;
  FAtivaPushCommand.DisposeOf;
  FNovoComercioCommand.DisposeOf;
  FComercioCadastradoCommand.DisposeOf;
  FUpdateRaioUsuarioCommand.DisposeOf;
  FGravaUltimaPosicaoUsuarioCommand.DisposeOf;
  FgetNovaSenhaCommand.DisposeOf;
  FgetNovaSenhaCommand_Cache.DisposeOf;
  FUpdateSenhaCommand.DisposeOf;
  FgetLoginCommand.DisposeOf;
  FgetLoginCommand_Cache.DisposeOf;
  FDeleteFoneCommand.DisposeOf;
  FLoadCheckListCommand.DisposeOf;
  FLoadCheckListCommand_Cache.DisposeOf;
  FAddCheckListComCommand.DisposeOf;
  FAddCheckListNovoCommand.DisposeOf;
  FLoadSubGrupoCommand.DisposeOf;
  FLoadSubGrupoCommand_Cache.DisposeOf;
  FLoadSubCatComCommand.DisposeOf;
  FLoadSubCatComCommand_Cache.DisposeOf;
  FInsertSubCatComCommand.DisposeOf;
  FClearSubCatComCommand.DisposeOf;
  FLoadGrupoSelectedCommand.DisposeOf;
  FInsertCategoriaCommand.DisposeOf;
  FSolicitacoesNovaCategoriaCommand.DisposeOf;
  inherited;
end;

end.

