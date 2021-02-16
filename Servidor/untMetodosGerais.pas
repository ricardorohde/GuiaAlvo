unit untMetodosGerais;

interface

uses System.SysUtils, System.Classes, System.Json,
    Datasnap.DSServer, Datasnap.DSAuth, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Stan.StorageJSON,
  FireDAC.Stan.StorageBin, FireDAC.Phys.IBBase, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Data.FireDACJSONReflect, System.DateUtils, Vcl.ExtCtrls,
  System.Net.HttpClient, untFuncoesServer, Guia.Controle, FMX.Maps, FireDAC.Phys.FBDef, FireDAC.Phys.FB, ACBrBase, ACBrMail,
  ACBrValidador, untPrincipal;


type
{$METHODINFO ON}
  TServerMethods = class(TDataModule)
    fdqryCategorias: TFDQuery;
    fdqryContrato: TFDQuery;
    fdqryComercioSecoes: TFDQuery;
    fdqrySubCategoria: TFDQuery;
    fdqryComercio: TFDQuery;
    fdqryFotosComercio: TFDQuery;
    fdqryCheckList: TFDQuery;
    fdqryFone: TFDQuery;
    fdqryAvaliacao: TFDQuery;
    fdqryUsuarios: TFDQuery;
    fdqryDispositivos: TFDQuery;
    fdqryFavoritos: TFDQuery;
    fdqryFotosSecao: TFDQuery;
    qryNotificacoes: TFDQuery;
    fdqryGeral: TFDQuery;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    fdConexao: TFDConnection;
    ACBrMail: TACBrMail;
    ACBrValidador: TACBrValidador;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure CalculaAvaliacoes(AIdCom: Integer);

    { Private declarations }
  public
    procedure gravaSobre(AIdComercio : Integer; ASobre, ASlogem, ATag: String);
    function ListaPlanos: TFDJSONDataSets;
    function gravaDelivery(AIdCom: Integer; AUber, ARappi, AIfood: String) : Boolean;
    function gravaRedesSociais(AIdCom : Integer; AFace, AInsta, ATwitter, AYouTube, AGPlus,
                                ASite, AEmail, AGPlay, AStore: String) : Boolean;
    function gravaCadastroAvaliacoes(AIdCom : Integer; AAmbiente, AAtendimento, ALimpeza, ALocal,
      APreco: Boolean) : Boolean;
    function LoadGrupos(AIdCom : Integer): TFDJSONDataSets;
    procedure UpdateGrupoCom(AIdCom, AIdGrupo: Integer);
    procedure EnviarEmail(pCodigo, pAssunto, pNome, pEmail, pTipoEmail: string; pHtml : Boolean = True);
    function TelRepetido(ATelefone : String) : Integer;
    function AddComercioNovo(ARazao, AFantasia, ACep, AComplemento, ACNPJCPF, AIERG, AEmail, ASenha, ALoginFone: String; ANumero: Integer) : Integer;
    procedure AddTelefone(ATelefone, AContato, AZap, AInterno : String; AIdComFone, AIdFone : Integer);
    function DocRepetido(AField, ADoc: String): Boolean;
    function getTelefone(AIdCom : Integer) : TFDJSONDataSets;

    function LoadCategorias(AIdPush : String; ARaio : Integer) : TFDJSONDataSets;
    function LoadDestaquePrincipal(AIdPush : String; ARaio : Integer) : TFDJSONDataSets;
    function LoadComercioCategoria(AIdPush : String; ARaio, IdCategoria, IdSubCategoria : Integer) : TFDJSONDataSets;
    function LoadSubCategoria(AIdPush : String; ARaio, IdCategoria: Integer): TFDJSONDataSets;
    function LoadFotosPorSecao(ARaio, vIdCat: Integer; APesquisa, AIdPush : String): TFDJSONDataSets;
    function LoadComercioPesquisa(ARaio : Integer; FPesquisa, AIdPush : String): TFDJSONDataSets;
    function LoadDestaqueFavorito(AIdPush : String; ARaio, vIdUsu : Integer): TFDJSONDataSets;
    procedure InsertNewSubCategoria(AIdCategoria, AIdCom : Integer; ANomeSubCategoria : String);

    function RecebeNotificacao(AKeyPush: String): Boolean;
    function VerificaUsuarioAvaliou(AIdUsu, AIdCom: Integer): Boolean;
    function LoadFichaComercio(AIdComercio: Integer): TFDJSONDataSets;
    function LoadComercio(idComercio : Integer) : TFDJSONDataSets;
    function LoadAvaliacoes(idComercio, nStart : Integer) : TFDJSONDataSets;
    function VerificaCelularDuplicado(vCelular : String) : TFDJSONDataSets;
    function DownloadIdUsuario(vCelular : String) : TFDJSONDataSets;
    function DownloadUsuario(vCelular : String) : TFDJSONDataSets;
    function DownloadUsuarioId(fIdUsu : Integer) : TFDJSONDataSets;
    function UpdateUsuario(FNome, FCelular, FSenha : String; FID : Integer) : Boolean;
    function InsertUsuario(FNome, FCelular, FSenha : String) : Boolean;
    procedure ControleFavorito(FIdUsu, FIdCom : Integer; FAction : String);
    procedure RegistrarDispositivo(ADeviceToken : String; AIdUsu: Integer);
    function IsFavorito(FIdUsu, FIdCom : Integer) : Boolean;
    function SQLServer(cSql : String) : TFDJSONDataSets;
    function UpdateAcessoUsu(vIdUsu : Integer) : Boolean;
    function SalvaHistoricoUsu(hIdUsu, hIdCat, hIdSubCat, hIdCom : Integer; hPqsUsu :String) : Boolean;
    function getControle : TFDJSONDataSets;
    function getNotificacoes(AIdUsu : Integer) : TFDJSONDataSets;
    function getAvaliacaoCompleta(AIdAvaliacao : Integer) : TFDJSONDataSets;
    procedure SalvaAvaliacao(AIdCom, AIdUsu : Integer; AAmbiente, AAtendimento,
                             ALimpeza, ALocalizacao, APreco, AMedia : Single;
                             AComentario : String);
    procedure DeletePush(AIdUsu, AIdPush : Integer);
    function getAnuncios(AIdCom : Integer) : TFDJSONDataSets;
    procedure AtivaPush(AKeyPush: String; AAtiva : Boolean);
    procedure NovoComercio(ACnpj, ARazao, AEmail, AFone, AContato : String);
    function ComercioCadastrado(ACNPJ : String) : Boolean;
    function UpdateRaioUsuario(AIdUsuario, ARaio : Integer): Boolean;
    procedure GravaUltimaPosicaoUsuario(ALatitude, ALongitude, ADeviceToken: String);
    function getNovaSenha(ADoc : String) : TFDJsonDataSets;
    function UpdateSenha(AIdCom : Integer; ASenha : String) : Boolean;
    function getLogin(ADoc : String) : TFDJSONDataSets;
    procedure DeleteFone(AIdFone : Integer);
    function LoadCheckList(AIdCom : Integer) : TFDJSONDataSets;
    procedure AddCheckListCom(AIdCom, AIdCheck : Integer);
    procedure AddCheckListNovo(ACheck : String; AIdCom : Integer);
    function LoadSubGrupo(AIdGrupo, AIdCom : Integer) : TFDJSONDataSets;
    function LoadSubCatCom(AIdCom : Integer) : TFDJSONDataSets;
    procedure InsertSubCatCom(AIdCom, AIdGrupo, AIdSubGrupo : Integer);
    procedure ClearSubCatCom(AIdCom : Integer);
    function LoadGrupoSelected(AIdCom : Integer) : Integer;
    procedure InsertCategoria(ACategoria, ADescricao : String; AIdCom : Integer);
    function SolicitacoesNovaCategoria(AIdCom : Integer) : Integer;

    function podeAlterarAvaliacao(AIdComercio : Integer) : Boolean;

  end;
{$METHODINFO OFF}

implementation

var
SQueryTMP : TFDQuery;
lcPosComercio : TMapCoordinate;
lcIDCom : Integer;

{$R *.dfm}

function TServerMethods.podeAlterarAvaliacao(AIdComercio : Integer) : Boolean;
begin

     fdqryGeral.Close;
     fdqryGeral.SQL.Clear;
     fdqryGeral.Open('SELECT * FROM ALAVALIA WHERE IDCOM_AVALIA = ' + AIdComercio.ToString);
     if fdqryGeral.RecordCount > 0 then
        Result := False else
        Result := True;

end;

function TServerMethods.ListaPlanos : TFDJSONDataSets;
begin

     try
         fdqryGeral.Close;
         fdqryGeral.SQL.Clear;
         fdqryGeral.SQL.Add('SELECT * FROM ALPLANOS p');
         fdqryGeral.SQL.Add('INNER JOIN ALPRECOSPLANOS a');
         fdqryGeral.SQL.Add('ON (a.IDPLANO = p.IDPLANO)');
         fdqryGeral.SQL.Add('ORDER BY ORDEMPLANO');

         Result := TFDJSONDataSets.Create;
         TFDJSONDataSetsWriter.ListAdd(Result, fdqryGeral);
         fdqryGeral.Active := True;
     finally
         fdqryGeral.Close;
     end;

end;

procedure TServerMethods.gravaSobre(AIdComercio : Integer;ASobre, ASlogem, ATag : String);
begin

   fdqryGeral.Close;
   fdqryGeral.SQL.Clear;
   fdqryGeral.SQL.Add('INSERT INTO ALCOMERCIO SET');
   fdqryGeral.SQL.Add('SLOGAMCOM   = :SLOGAMCOM,');
   fdqryGeral.SQL.Add('SOBRECOM    = :SOBRECOM,');
   fdqryGeral.SQL.Add('TAGCOM      = :TAGCOM');
   fdqryGeral.SQL.Add('WHERE IDCOM = :IDCOM');
   fdqryGeral.ParamByName('SLOGAMCOM').AsString  := ASlogem;
   fdqryGeral.ParamByName('SOBRECOM' ).AsString  := ASobre;
   fdqryGeral.ParamByName('TAGCOM'   ).AsString  := ATag;
   fdqryGeral.ParamByName('IDCOM'    ).AsInteger := AIdComercio;
   fdqryGeral.ExecSQL;

end;

procedure TServerMethods.AddCheckListNovo(ACheck : String; AIdCom : Integer);
begin

   fdqryGeral.Close;
   fdqryGeral.SQL.Clear;
   fdqryGeral.SQL.Add('INSERT INTO ALCHECKLIST');
   fdqryGeral.SQL.Add('(DESCRCHECK, IDCOMCHECKNOVO) VALUES');
   fdqryGeral.SQL.Add('(:DESCRCHECK, :IDCOMCHECKNOVO)');
   fdqryGeral.ParamByName('DESCRCHECK').AsString      := ACheck;
   fdqryGeral.ParamByName('IDCOMCHECKNOVO').AsInteger := AIdCom;
   fdqryGeral.ExecSQL;

end;

function TServerMethods.UpdateSenha(AIdCom : Integer; ASenha : String) : Boolean;
begin

    try

        fdqryGeral.Close;
        fdqryGeral.SQL.Clear;
        fdqryGeral.SQL.Add('UPDATE ALCOMERCIO SET');
        fdqryGeral.SQL.Add('PASSWORDCOM = ' + QuotedStr(ASenha));
        fdqryGeral.SQL.Add('WHERE IDCOM = ' + AIdCom.ToString);
        fdqryGeral.ExecSQL;
        Result := True;

    except

        Result := False;

    end;

end;

function TServerMethods.getLogin(ADoc : String) : TFDJSONDataSets;
begin

    fdqryGeral.SQL.Clear;
    fdqryGeral.SQL.Add('SELECT *  FROM ALCOMERCIO');

    if (Length(ApenasNumeros(ADoc)) = 11) or
       (Length(ApenasNumeros(ADoc)) = 14) then

        fdqryGeral.SQL.Add('WHERE CNPJCOM = ' + QuotedStr(ApenasNumeros(ADoc))) else
        fdqryGeral.SQL.Add('WHERE EMAILCOM = ' + QuotedStr(ADoc));

    Result := TFDJSONDataSets.Create;
    TFDJSONDataSetsWriter.ListAdd(Result, fdqryGeral);
    fdqryGeral.Active := True;

end;

function TServerMethods.getNovaSenha(ADoc : String) : TFDJsonDataSets;
begin

    fdqryGeral.Close;
    fdqryGeral.SQL.Clear;
    fdqryGeral.SQL.Add('SELECT f.*, c.IDCOM, c.EMAILVALIDADOCOM, c.CELULARVALIDADOCOM, c.CNPJCOM, c.EMAILCOM FROM ALCOMERCIO c');
    fdqryGeral.SQL.Add('LEFT JOIN ALFONE f');
    fdqryGeral.SQL.Add('ON (f.IDCOM_FONE = c.IDCOM) AND (f.LOGINFONE = ' + QuotedStr('T') + ')');
    if (Length(ApenasNumeros(ADoc)) = 14) or (Length(ApenasNumeros(ADoc)) = 11) then
        fdqryGeral.SQL.Add('AND (CNPJCOM = '+ QuotedStr(ADoc) + ')') else
        fdqryGeral.SQL.Add('AND (EMAILCOM = '+ QuotedStr(ADoc) + ')');

    Result := TFDJSONDataSets.Create;
    TFDJSONDataSetsWriter.ListAdd(Result, fdqryGeral);
    fdqryGeral.Active := True;

end;

function TServerMethods.getTelefone(AIdCom: Integer): TFDJSONDataSets;
begin

    fdqryGeral.Close;
    fdqryGeral.SQL.Clear;
    fdqryGeral.SQL.Add('SELECT * FROM ALFONE');
    fdqryGeral.SQL.Add('WHERE IDCOM_FONE = ' + AIdCom.ToString);

    Result := TFDJSONDataSets.Create;
    TFDJSONDataSetsWriter.ListAdd(Result, fdqryGeral);
    fdqryGeral.Active := True;

end;

function TServerMethods.getAnuncios(AIdCom : Integer) : TFDJSONDataSets;
begin

    fdqryGeral.Close;
    fdqryGeral.SQL.Clear;
    fdqryGeral.SQL.Add('SELECT * FROM ALANUNCIOS');
    fdqryGeral.SQL.Add('WHERE IDCOM_ANUNCIO = :IDCOM_ANUNCIO');
    fdqryGeral.ParamByName('IDCOM_ANUNCIO').AsInteger := AIdCom;

    Result := TFDJSONDataSets.Create;
    TFDJSONDataSetsWriter.ListAdd(Result, fdqryGeral);
    fdqryGeral.Active := True;

end;

function TServerMethods.DocRepetido(AField, ADoc : String) : Boolean;
begin

     fdqryGeral.Close;
     fdqryGeral.SQL.Clear;
     fdqryGeral.SQL.Add('SELECT ' + AField + ' FROM ALCOMERCIO');
     fdqryGeral.SQL.Add('WHERE ' + AField + ' = ' + QuotedStr(ADoc));
     fdqryGeral.Open;

     if fdqryGeral.RecordCount > 0 then
        Result := True else Result := False;

end;

function TServerMethods.TelRepetido(ATelefone : String) : Integer;
begin

    fdqryGeral.Close;
    fdqryGeral.SQL.Clear;
    fdqryGeral.SQL.Add('SELECT TELFONE FROM ALFONE');
    fdqryGeral.SQL.Add('WHERE TELFONE = ' + QuotedStr(ATelefone));
    fdqryGeral.Open;

    Result := fdqryGeral.RecordCount;

end;


procedure TServerMethods.AddTelefone(ATelefone, AContato, AZap, AInterno : String; AIdComFone, AIdFone : Integer);
begin

    if AIdFone = 0 then
        begin
            fdqryGeral.Close;
            fdqryGeral.SQL.Clear;
            fdqryGeral.SQL.Add('INSERT INTO ALFONE');
            fdqryGeral.SQL.Add('(IDCOM_FONE, TELFONE, CONTATOFONE, ZAPFONE, INTFONE) VALUES');
            fdqryGeral.SQL.Add('(:IDCOM_FONE, :TELFONE, :CONTATOFONE, :ZAPFONE, :INTFONE)');
            fdqryGeral.ParamByName('IDCOM_FONE' ).AsInteger := AIdComFone;
        end
    else
        begin
            fdqryGeral.Close;
            fdqryGeral.SQL.Clear;
            fdqryGeral.SQL.Add('UPDATE ALFONE SET');
            fdqryGeral.SQL.Add('TELFONE      = :TELFONE,');
            fdqryGeral.SQL.Add('CONTATOFONE  = :CONTATOFONE,');
            fdqryGeral.SQL.Add('ZAPFONE      = :ZAPFONE,');
            fdqryGeral.SQL.Add('INTFONE      = :INTFONE');
            fdqryGeral.SQL.Add('WHERE IDFONE = :IDFONE');

            fdqryGeral.ParamByName('IDFONE' ).AsInteger := AIdFone;
        end;

    fdqryGeral.ParamByName('TELFONE'    ).AsString  := ATelefone;
    fdqryGeral.ParamByName('CONTATOFONE').AsString  := AContato;
    fdqryGeral.ParamByName('ZAPFONE'    ).AsString  := AZap;
    fdqryGeral.ParamByName('INTFONE'    ).AsString  := AInterno;
    fdqryGeral.ExecSQL;

end;

procedure TServerMethods.DataModuleCreate(Sender: TObject);
begin
fdConexao.Params.Database := ExtractFileDir(GetCurrentDir) + '\Dados\BDALVO.FDB';
Form1.Label3.Caption := fdConexao.Params.Database;
end;

procedure TServerMethods.DeleteFone(AIdFone : Integer);
begin

    fdqryGeral.Close;
    fdqryGeral.SQL.Clear;
    fdqryGeral.SQL.Add('DELETE FROM ALFONE');
    fdqryGeral.SQL.Add('WHERE IDFONE = ' + AIdFone.ToString);
    fdqryGeral.ExecSQL;

end;


procedure TServerMethods.EnviarEmail(pCodigo, pAssunto, pNome, pEmail, pTipoEmail: string; pHtml : Boolean = True);
begin

     fdqryGeral.Close;
     fdqryGeral.SQL.Clear;
     fdqryGeral.SQL.Add('select valor_blob from alcontrole');
     fdqryGeral.SQL.Add('where nome_controle = ' + QuotedStr(pTipoEmail));
     fdqryGeral.Open;

     var AEmailHtml  := fdqryGeral.FieldByName('valor_blob').AsString;

     ConfigEmail(ACBrMail, pAssunto, pNome, pHtml);

     var htmlCodigo := format(AEmailHtml,[pCodigo]);


     ACBrMail.Body.Add(htmlCodigo);
     ACBrMail.AddAddress(pEmail,'');
     ACBrMail.Send;

end;


procedure TServerMethods.AddCheckListCom(AIdCom, AIdCheck: Integer);
begin

     fdqryGeral.Close;
     fdqryGeral.SQL.Clear;
     fdqryGeral.SQL.Add('SELECT * FROM ALCHECKCOM');
     fdqryGeral.SQL.Add('WHERE (IDCOM_CHECKCOM = :IDCOM_CHECKCOM) AND');
     fdqryGeral.SQL.Add('(IDCHECK_CHEKCOM = :IDCHECK_CHEKCOM)');
     fdqryGeral.ParamByName('IDCOM_CHECKCOM').AsInteger := AIdCom;
     fdqryGeral.ParamByName('IDCHECK_CHEKCOM').AsInteger := AIdCheck;
     fdqryGeral.Open;

     if fdqryGeral.RecordCount = 0 then
        begin
           fdqryGeral.Close;
           fdqryGeral.SQL.Clear;
           fdqryGeral.SQL.Add('INSERT INTO ALCHECKCOM');
           fdqryGeral.SQL.Add('(IDCOM_CHECKCOM, IDCHECK_CHEKCOM) VALUES');
           fdqryGeral.SQL.Add('(:IDCOM_CHECKCOM, :IDCHECK_CHEKCOM)');
           fdqryGeral.ParamByName('IDCOM_CHECKCOM').AsInteger := AIdCom;
           fdqryGeral.ParamByName('IDCHECK_CHEKCOM').AsInteger := AIdCheck;
           fdqryGeral.ExecSQL;
        end
     else
        begin
           fdqryGeral.Close;
           fdqryGeral.SQL.Clear;
           fdqryGeral.SQL.Add('DELETE FROM ALCHECKCOM');
           fdqryGeral.SQL.Add('WHERE (IDCOM_CHECKCOM = :IDCOM_CHECKCOM) AND');
           fdqryGeral.SQL.Add('(IDCHECK_CHEKCOM = :IDCHECK_CHEKCOM)');
           fdqryGeral.ParamByName('IDCOM_CHECKCOM').AsInteger := AIdCom;
           fdqryGeral.ParamByName('IDCHECK_CHEKCOM').AsInteger := AIdCheck;
           fdqryGeral.ExecSQL;
        end;

end;

function TServerMethods.AddComercioNovo(ARazao, AFantasia, ACep, AComplemento, ACNPJCPF,
                                        AIERG, AEmail, ASenha, ALoginFone : String; ANumero : Integer) : Integer;
begin

     fdqryGeral.Close;
     fdqryGeral.SQL.Clear;
     fdqryGeral.SQL.Add('INSERT INTO ALCOMERCIO');
     fdqryGeral.SQL.Add('(CNPJCOM, IERGCOM, RAZAOCOM, FANTASIACOM, CEPLOG_COM, NRLOGCOM, COMPLCOM, EMAILCOM, PASSWORDCOM, LOGINFONE) VALUES');
     fdqryGeral.SQL.Add('(:CNPJCOM, :IERGCOM, :RAZAOCOM, :FANTASIACOM, :CEPLOG_COM, :NRLOGCOM, :COMPLCOM, :EMAILCOM, :PASSWORDCOM, :LOGINFONE)');
     fdqryGeral.ParamByName('CNPJCOM'    ).AsString  := ACNPJCPF;
     fdqryGeral.ParamByName('IERGCOM'    ).AsString  := AIERG;
     fdqryGeral.ParamByName('RAZAOCOM'   ).AsString  := ARazao;
     fdqryGeral.ParamByName('FANTASIACOM').AsString  := AFantasia;
     fdqryGeral.ParamByName('CEPLOG_COM' ).AsString  := ACep;
     fdqryGeral.ParamByName('NRLOGCOM'   ).AsInteger := ANumero;
     fdqryGeral.ParamByName('COMPLCOM'   ).AsString  := AComplemento;
     fdqryGeral.ParamByName('EMAILCOM'   ).AsString  := AEmail;
     fdqryGeral.ParamByName('PASSWORDCOM').AsString  := MD5(ASenha);
     fdqryGeral.ParamByName('LOGINFONE'  ).AsString  := ALoginFone;
     fdqryGeral.ExecSQL;

     fdqryGeral.Close;
     fdqryGeral.SQL.Clear;
     fdqryGeral.SQL.Add('SELECT MAX(IDCOM) AS IDCOMERCIO FROM ALCOMERCIO');
     fdqryGeral.Open;

     Result := fdqryGeral.FieldByName('IDCOMERCIO').AsInteger;

end;

procedure TServerMethods.AtivaPush(AKeyPush: String; AAtiva : Boolean);
begin

     fdqryGeral.Close;
     fdqryGeral.SQL.Clear;
     fdqryGeral.SQL.Add('UPDATE ALCHAVESPUSH SET');
     fdqryGeral.SQL.Add('NOTIFICACAOUSU = :NOTIFICACAOUSU');
     fdqryGeral.SQL.Add('WHERE KEYPUSH = :KEYPUSH');
     fdqryGeral.ParamByName('NOTIFICACAOUSU').AsBoolean := AAtiva;
     fdqryGeral.ParamByName('KEYPUSH').AsString         := AKeyPush;
     fdqryGeral.ExecSQL;

end;

procedure TServerMethods.DeletePush(AIdUsu, AIdPush : Integer);
begin

    fdqryGeral.Close;
    fdqryGeral.SQL.Clear;
    fdqryGeral.SQL.Add('DELETE FROM ALNOTIFICACOES');
    fdqryGeral.SQL.Add('WHERE (IDUSU_PUSH = :IDUSU_PUSH) AND');
    fdqryGeral.SQL.Add('(ID_PUSH = :ID_PUSH)');
    fdqryGeral.ParamByName('IDUSU_PUSH').AsInteger := AIdUsu;
    fdqryGeral.ParamByName('ID_PUSH').AsInteger    := AIdPush;
    fdqryGeral.ExecSQL;

end;

function TServerMethods.RecebeNotificacao(AKeyPush : String) : Boolean;
begin

     fdqryGeral.Close;
     fdqryGeral.SQL.Clear;
     fdqryGeral.SQL.Add('SELECT NOTIFICACAOUSU FROM ALCHAVESPUSH');
     fdqryGeral.SQL.Add('WHERE KEYPUSH = :KEYPUSH');
     fdqryGeral.ParamByName('KEYPUSH').AsString := AKeyPush;
     fdqryGeral.Open;

     if fdqryGeral.RecordCount > 0 then
        Result := True else Result := False;

end;


procedure TServerMethods.SalvaAvaliacao(AIdCom, AIdUsu : Integer; AAmbiente, AAtendimento,
                                        ALimpeza, ALocalizacao, APreco, AMedia : Single;
                                        AComentario : String);
begin

    fdqryGeral.Close;
    fdqryGeral.SQL.Clear;
    fdqryGeral.SQL.Add('INSERT INTO ALAVALIA');
    fdqryGeral.SQL.Add('(IDCOM_AVALIA, IDUSU_AVALIA, AMBIENTE_AVALIA, ATENDIMENTO_AVALIA,');
    fdqryGeral.SQL.Add('LIMPEZA_AVALIA, LOCAL_AVALIA, PRECO_AVALIA, DATAAVALIA, COMENTARIOAVALIA, MEDIAAVALIA) VALUES');
    fdqryGeral.SQL.Add('(:IDCOM_AVALIA, :IDUSU_AVALIA, :AMBIENTE_AVALIA, :ATENDIMENTO_AVALIA,');
    fdqryGeral.SQL.Add(':LIMPEZA_AVALIA, :LOCAL_AVALIA, :PRECO_AVALIA, :DATAAVALIA, :COMENTARIOAVALIA, :MEDIAAVALIA)');

    fdqryGeral.ParamByName('IDCOM_AVALIA'      ).AsInteger  := AIdCom;
    fdqryGeral.ParamByName('IDUSU_AVALIA'      ).AsInteger  := AIdUsu;
    fdqryGeral.ParamByName('AMBIENTE_AVALIA'   ).AsSingle   := AAmbiente;
    fdqryGeral.ParamByName('ATENDIMENTO_AVALIA').AsSingle   := AAtendimento;
    fdqryGeral.ParamByName('LIMPEZA_AVALIA'    ).AsSingle   := ALimpeza;
    fdqryGeral.ParamByName('LOCAL_AVALIA'      ).AsSingle   := ALocalizacao;
    fdqryGeral.ParamByName('PRECO_AVALIA'      ).AsSingle   := APreco;
    fdqryGeral.ParamByName('DATAAVALIA'        ).AsDateTime := DataAtual;
    fdqryGeral.ParamByName('COMENTARIOAVALIA'  ).AsString   := TextoFiltrado(AComentario);
    fdqryGeral.ParamByName('MEDIAAVALIA'       ).AsSingle   := AMedia;

    fdqryGeral.ExecSQL;

    CalculaAvaliacoes(AIdCom);

end;

procedure TServerMethods.CalculaAvaliacoes(AIdCom : Integer);
var
AAmbiente,
AAtendimento,
ALimpeza,
ALocalizacao,
APreco,
AMediaTotal : Single;
ATotal, AIndiceTotal : Integer;
begin

     AIndiceTotal := IndiceCalculoAvaliacao(AIdCom);

     fdqryGeral.Close;
     fdqryGeral.SQL.Clear;
     fdqryGeral.SQL.Add('SELECT COUNT(IDAVALIA) AS TOTAL,');
     fdqryGeral.SQL.Add('SUM(AMBIENTE_AVALIA) AS AMBIENTE,');
     fdqryGeral.SQL.Add('SUM(ATENDIMENTO_AVALIA) AS ATENDIMENTO,');
     fdqryGeral.SQL.Add('SUM(LIMPEZA_AVALIA) AS LIMPEZA,');
     fdqryGeral.SQL.Add('SUM(LOCAL_AVALIA) AS LOCALIZACAO,');
     fdqryGeral.SQL.Add('SUM(PRECO_AVALIA) AS PRECO');
     fdqryGeral.SQL.Add('FROM ALAVALIA');
     fdqryGeral.SQL.Add('WHERE IDCOM_AVALIA = ' + QuotedStr(AIdCom.ToString));
     fdqryGeral.Open;

     ATotal       := fdqryGeral.FieldByName('TOTAL').AsInteger;

     AAmbiente    := (fdqryGeral.FieldByName('AMBIENTE'   ).AsSingle / ATotal);
     AAtendimento := (fdqryGeral.FieldByName('ATENDIMENTO').AsSingle / ATotal);
     ALimpeza     := (fdqryGeral.FieldByName('LIMPEZA'    ).AsSingle / ATotal);
     ALocalizacao := (fdqryGeral.FieldByName('LOCALIZACAO').AsSingle / ATotal);
     APreco       := (fdqryGeral.FieldByName('PRECO'      ).AsSingle / ATotal);

     LoadControleServer;

     if AIndiceTotal >= ctrINDICEAVALIACAO then
        begin

             AMediaTotal := AAmbiente + AAtendimento + ALimpeza + ALocalizacao + APreco;


             fdqryGeral.Close;
             fdqryGeral.SQL.Clear;
             fdqryGeral.SQL.Add('UPDATE ALCOMERCIO SET');
             fdqryGeral.SQL.Add('AMBIENTEAVALIAMEDIACOM    = :AMBIENTE,');
             fdqryGeral.SQL.Add('ATENDIMENTOAVALIAMEDIACOM = :ATENDIMENTO,');
             fdqryGeral.SQL.Add('LIMPEZAAVALIAMEDIACOM     = :LIMPEZA,');
             fdqryGeral.SQL.Add('LOCALAVALIAMEDIACOM       = :LOCALIZACAO,');
             fdqryGeral.SQL.Add('PRECOAVALIAMEDIACOM       = :PRECO,');
             fdqryGeral.SQL.Add('MEDIATOTALAVALIA          = :MEDIATOTAL');
             fdqryGeral.SQL.Add('WHERE IDCOM               = :IDCOM');

             fdqryGeral.ParamByName('AMBIENTE'   ).AsSingle := AAmbiente;
             fdqryGeral.ParamByName('ATENDIMENTO').AsSingle := AAtendimento;
             fdqryGeral.ParamByName('LIMPEZA'    ).AsSingle := ALimpeza;
             fdqryGeral.ParamByName('LOCALIZACAO').AsSingle := ALocalizacao;
             fdqryGeral.ParamByName('PRECO'      ).AsSingle := APreco;
             fdqryGeral.ParamByName('MEDIATOTAL' ).AsSingle := AMediaTotal / AIndiceTotal;
             fdqryGeral.ParamByName('IDCOM'      ).AsSingle := AIdCom;

             fdqryGeral.ExecSQL;
        end;

end;

procedure TServerMethods.ControleFavorito(FIdUsu, FIdCom: Integer; FAction: String);
const
vSqlIns : String = ('INSERT INTO ALFAVORITOS'+
                    '(IDUSUFAV, IDCOMFAV) VALUES'+
                    '(:IDUSUFAV, :IDCOMFAV)');

vSqlDel : String = ('DELETE FROM ALFAVORITOS '+
                    'WHERE (IDUSUFAV = :IDUSUFAV) AND '+
                    '(IDCOMFAV = :IDCOMFAV)');

begin

   fdqryFavoritos.Close;
   fdqryFavoritos.Sql.Clear;

   if FAction = 'INS' then
      fdqryFavoritos.Sql.Add(vSqlIns) else
      fdqryFavoritos.Sql.Add(vSqlDel);

   fdqryFavoritos.ParamByName('IDUSUFAV').AsInteger := FIdUsu;
   fdqryFavoritos.ParamByName('IDCOMFAV').AsInteger := FIdCom;

   fdqryFavoritos.ExecSQL;

end;

function TServerMethods.DownloadIdUsuario(vCelular: String): TFDJSONDataSets;
begin
   With fdqryUsuarios do
      begin
         Close;
         SQL.Clear;
         SQL.Add('SELECT IDUSU, CELULARUSU FROM ALUSUARIOSAPP');
         SQL.Add('WHERE CELULARUSU = :CELULARUSU');
         ParamByName('CELULARUSU').AsString := vCelular;
         Result := TFDJSONDataSets.Create;
         TFDJSONDataSetsWriter.ListAdd(Result, fdqryUsuarios);
         Active := True;
      end;
end;

function TServerMethods.DownloadUsuario(vCelular: String): TFDJSONDataSets;
begin

   With fdqryUsuarios do
      begin
         Close;
         Sql.Clear;
         Sql.Add('SELECT * FROM ALUSUARIOSAPP');
         Sql.Add('WHERE CELULARUSU = :CELULAR');
         ParamByName('CELULAR').AsString := vCelular;

         Result := TFDJSONDataSets.Create;
         TFDJSONDataSetsWriter.ListAdd(Result, fdqryUsuarios);
         Active := True;
      end;

end;

function TServerMethods.getNotificacoes(AIdUsu : Integer) : TFDJSONDataSets;
begin

        qryNotificacoes.Close;
        qryNotificacoes.SQL.Clear;
        qryNotificacoes.SQL.Add('SELECT * FROM ALNOTIFICACOES n');
        qryNotificacoes.SQL.Add('LEFT JOIN ALCOMERCIO c');
        qryNotificacoes.SQL.Add('ON (n.IDCOM_PUSH = C.IDCOM)');
        qryNotificacoes.SQL.Add('WHERE n.IDUSU_PUSH = ' + QuotedStr(AIdUsu.ToString));

        Result := TFDJSONDataSets.Create;
        TFDJSONDataSetsWriter.ListAdd(Result, qryNotificacoes);
        qryNotificacoes.Active := True;

end;

function TServerMethods.gravaDelivery(AIdCom : Integer; AUber, ARappi, AIfood: String) : Boolean;
begin

    Result := True;

    Try
        fdqryGeral.Close;
        fdqryGeral.SQL.Clear;
        fdqryGeral.SQL.Add('update alcomercio set');
        fdqryGeral.SQL.Add('ubereatscom = :ubereatscom,');
        fdqryGeral.SQL.Add('rappicom    = :rappicom,');
        fdqryGeral.SQL.Add('ifoodcom    = :ifoodcom');
        fdqryGeral.SQL.Add('where idcom = :idcom');

        fdqryGeral.ParamByName('ubereatscom').AsString  := AUber;
        fdqryGeral.ParamByName('rappicom'   ).AsString  := ARappi;
        fdqryGeral.ParamByName('ifoodcom'   ).AsString  := AIfood;
        fdqryGeral.ParamByName('idcom'      ).AsInteger := AIdCom;

        fdqryGeral.ExecSQL;
    Except
          Result := False;
    End;

end;

function TServerMethods.gravaRedesSociais(AIdCom : Integer; AFace, AInsta, ATwitter, AYouTube, AGPlus,
                                           ASite, AEmail, AGPlay, AStore: String) : Boolean;
begin

    Result := True;

    Try
        fdqryGeral.Close;
        fdqryGeral.SQL.Clear;
        fdqryGeral.SQL.Add('update alcomercio set');
        fdqryGeral.SQL.Add('facecom     = :facecom,');
        fdqryGeral.SQL.Add('instacom    = :instacom,');
        fdqryGeral.SQL.Add('twitercom   = :twitercom,');
        fdqryGeral.SQL.Add('tubecom     = :tubecom,');
        fdqryGeral.SQL.Add('googlecom   = :googlecom,');
        fdqryGeral.SQL.Add('sitecom     = :sitecom,');
        fdqryGeral.SQL.Add('emailcom    = :emailcom,');
        fdqryGeral.SQL.Add('appcom      = :AppCom,');
        fdqryGeral.SQL.Add('applecom    = :applecom');
        fdqryGeral.SQL.Add('where idcom = :idcom');

        fdqryGeral.ParamByName('facecom'    ).AsString  := AFace;
        fdqryGeral.ParamByName('instacom'   ).AsString  := AInsta;
        fdqryGeral.ParamByName('twitercom'  ).AsString  := ATwitter;
        fdqryGeral.ParamByName('tubecom'    ).AsString  := AYouTube;
        fdqryGeral.ParamByName('googlecom'  ).AsString  := AGPlus;
        fdqryGeral.ParamByName('sitecom'    ).AsString  := ASite;
        fdqryGeral.ParamByName('emailcom'   ).AsString  := AEmail;
        fdqryGeral.ParamByName('appcom'     ).AsString  := AGPlay;
        fdqryGeral.ParamByName('applecom'   ).AsString  := AStore;
        fdqryGeral.ParamByName('idcom'      ).AsInteger := AIdCom;

        fdqryGeral.ExecSQL;
    Except
        Result := False;
    End;

end;

function TServerMethods.gravaCadastroAvaliacoes(AIdCom : Integer; AAmbiente, AAtendimento, ALimpeza, ALocal, APreco : Boolean) : Boolean;
begin

    Result := True;

    Try
        fdqryGeral.Close;
        fdqryGeral.SQL.Clear;
        fdqryGeral.SQL.Add('update alcomercio set');
        fdqryGeral.SQL.Add('avaliaambientecom     = :avaliaambientecom,');
        fdqryGeral.SQL.Add('avaliaatendimentocom  = :avaliaatendimentocom,');
        fdqryGeral.SQL.Add('avalialimpezacom      = :avalialimpezacom,');
        fdqryGeral.SQL.Add('avalialocalcom        = :avalialocalcom,');
        fdqryGeral.SQL.Add('avaliaprecocom        = :avaliaprecocom,');
        fdqryGeral.SQL.Add('avaliacaobloqueada    = ' + QuotedStr('T'));
        fdqryGeral.SQL.Add('where idcom           = :idcom');

        fdqryGeral.ParamByName('avaliaambientecom').AsString    := BoolToStrValue(AAmbiente);
        fdqryGeral.ParamByName('avaliaatendimentocom').AsString := BoolToStrValue(AAtendimento);
        fdqryGeral.ParamByName('avalialimpezacom').AsString     := BoolToStrValue(ALimpeza);
        fdqryGeral.ParamByName('avalialocalcom').AsString       := BoolToStrValue(ALocal);
        fdqryGeral.ParamByName('avaliaprecocom').AsString       := BoolToStrValue(APreco);
        fdqryGeral.ParamByName('idcom').AsInteger               := AIdCom;

        fdqryGeral.ExecSQL;
    Except
         Result := False;
    End;

end;


function TServerMethods.getAvaliacaoCompleta(AIdAvaliacao : Integer) : TFDJSONDataSets;
begin

   fdqryGeral.Close;
   fdqryGeral.SQL.Clear;
   fdqryGeral.Sql.Add('select u.nomeusu, a.*, c.avaliaambientecom, c.avaliaatendimentocom, c.avalialimpezacom, c.avalialocalcom, c.avaliaprecocom');
   fdqryGeral.Sql.Add('from alavalia a');
   fdqryGeral.Sql.Add('inner join alcomercio c');
   fdqryGeral.Sql.Add('on (a.idcom_avalia = c.idcom)');
   fdqryGeral.Sql.Add('inner join alusuariosapp u');
   fdqryGeral.Sql.Add('on (a.idusu_avalia = u.idusu)');
   fdqryGeral.Sql.Add('where a.idavalia = :idavalia');

   fdqryGeral.ParamByName('idavalia').AsInteger := AIdAvaliacao;

   Result := TFDJSONDataSets.Create;
   TFDJSONDataSetsWriter.ListAdd(Result, fdqryGeral);
   fdqryGeral.Active := True;

end;

function TServerMethods.DownloadUsuarioId(fIdUsu: Integer): TFDJSONDataSets;
begin
   With fdqryUsuarios do
      begin
         Close;
         Sql.Clear;
         Sql.Add('SELECT * FROM ALUSUARIOSAPP');
         Sql.Add('WHERE IDUSU = :IDUSU');
         ParamByName('IDUSU').AsInteger := fIdUsu;

         Result := TFDJSONDataSets.Create;
         TFDJSONDataSetsWriter.ListAdd(Result, fdqryUsuarios);
         Active := True;
      end;
end;


function TServerMethods.getControle: TFDJSONDataSets;
begin

   fdqryGeral.Close;
   fdqryGeral.SQL.Clear;
   fdqryGeral.SQL.Add('SELECT * FROM ALCONTROLE');

   Result := TFDJSONDataSets.Create;
   TFDJSONDataSetsWriter.ListAdd(Result, fdqryGeral);
   fdqryGeral.Active := True;

end;

function TServerMethods.InsertUsuario(FNome, FCelular, FSenha: String): Boolean;
begin
With fdqryUsuarios do
      begin
         Close;
         SQL.Clear;
         SQL.Add('INSERT INTO ALUSUARIOSAPP');
         SQL.Add('(NOMEUSU, CELULARUSU, SENHAUSU) VALUES');
         SQL.Add('(:NOMEUSU, :CELULARUSU, :SENHAUSU)');
         ParamByName('NOMEUSU').AsString    := FNome;
         ParamByName('CELULARUSU').AsString := FCelular;
         ParamByName('SENHAUSU').AsString   := FSenha;
         ExecSql;
      end;
   Result := True
end;

function TServerMethods.IsFavorito(FIdUsu, FIdCom: Integer): Boolean;
begin

  fdqryGeral.Close;
  fdqryGeral.Sql.Clear;
  fdqryGeral.Sql.Add('SELECT * FROM ALFAVORITOS');
  fdqryGeral.Sql.Add('WHERE (IDUSUFAV = :IDUSUFAV) AND');
  fdqryGeral.Sql.Add('(IDCOMFAV = :IDCOMFAV)');
  fdqryGeral.ParamByName('IDUSUFAV').AsInteger := FIdUsu;
  fdqryGeral.ParamByName('IDCOMFAV').AsInteger := FIdCom;
  fdqryGeral.Active := True;

  if fdqryGeral.IsEmpty then
     Result := False else Result := True;

end;

procedure TServerMethods.GravaUltimaPosicaoUsuario(ALatitude, ALongitude, ADeviceToken: String);
begin

     fdqryDispositivos.Close;
     fdqryDispositivos.Sql.Clear;
     fdqryDispositivos.Sql.Add('UPDATE ALCHAVESPUSH SET');
     fdqryDispositivos.Sql.Add('ULTIMALATITUDE  = :LATITUDE,');
     fdqryDispositivos.Sql.Add('ULTIMALONGITUDE = :LONGITUDE');
     fdqryDispositivos.Sql.Add('WHERE KEYPUSH   = :KEYPUSH');
     fdqryDispositivos.ParamByName('LATITUDE' ).AsString := ALatitude;
     fdqryDispositivos.ParamByName('LONGITUDE').AsString := ALongitude;
     fdqryDispositivos.ParamByName('KEYPUSH'  ).AsString := ADeviceToken;
     fdqryDispositivos.ExecSQL;

end;


procedure TServerMethods.RegistrarDispositivo(ADeviceToken : String; AIdUsu: Integer);
begin

        fdqryDispositivos.Close;
        fdqryDispositivos.Sql.Clear;

        fdqryDispositivos.SQL.Add('SELECT * FROM ALCHAVESPUSH');
        fdqryDispositivos.SQL.Add('WHERE KEYPUSH = :KEYPUSH');
        fdqryDispositivos.ParamByName('KEYPUSH').AsString := ADeviceToken;
        fdqryDispositivos.Open;

        if fdqryDispositivos.RecordCount > 0 then
           begin
              fdqryDispositivos.Close;
              fdqryDispositivos.SQL.Clear;
              fdqryDispositivos.Sql.Add('UPDATE ALCHAVESPUSH SET');
              fdqryDispositivos.Sql.Add('ULTIMOACESSO  = :ULTIMOACESSO');
              fdqryDispositivos.Sql.Add('WHERE KEYPUSH = :KEYPUSH');
              fdqryDispositivos.ParamByName('KEYPUSH').AsString    := ADeviceToken;
              fdqryDispositivos.ParamByName('ULTIMOACESSO').AsDate := DataAtual;
              fdqryDispositivos.ExecSQL;

           end
        else
           begin
              fdqryDispositivos.Close;
              fdqryDispositivos.SQL.Clear;
              fdqryDispositivos.Sql.Add('INSERT INTO ALCHAVESPUSH');
              fdqryDispositivos.Sql.Add('(ULTIMOACESSO, KEYPUSH, IDUSU) VALUES');
              fdqryDispositivos.Sql.Add('(:ULTIMOACESSO, :KEYPUSH, :IDUSU)');
              fdqryDispositivos.ParamByName('KEYPUSH').AsString    := ADeviceToken;
              fdqryDispositivos.ParamByName('ULTIMOACESSO').AsDate := DataAtual;
              fdqryDispositivos.ParamByName('IDUSU').AsInteger     := AIdUsu;
              fdqryDispositivos.ExecSQL;

           end;

end;


function TServerMethods.SalvaHistoricoUsu(hIdUsu, hIdCat, hIdSubCat, hIdCom : Integer; hPqsUsu: String): Boolean;
begin

   fdqryGeral.Close;
   fdqryGeral.Sql.Clear;
   fdqryGeral.Sql.Add('INSERT INTO ALHISTORICO');
   fdqryGeral.Sql.Add('(IDUSU_HIST, IDCAT_HIST, IDSUBCAT_HIST, IDCOM_HIST, PQSUSU_HIST) VALUES');
   fdqryGeral.Sql.Add('(:IDUSU_HIST, :IDCAT_HIST, :IDSUBCAT_HIST, :IDCOM_HIST, :PQSUSU_HIST)');
   fdqryGeral.ParamByName('IDUSU_HIST').AsInteger    := hIdUsu;
   fdqryGeral.ParamByName('IDCAT_HIST').AsInteger    := hIdCat;
   fdqryGeral.ParamByName('IDSUBCAT_HIST').AsInteger := hIdSubCat;
   fdqryGeral.ParamByName('IDCOM_HIST').AsInteger    := hIdCom;
   fdqryGeral.ParamByName('PQSUSU_HIST').AsString    := hPqsUsu;
   fdqryGeral.ExecSQL;

   Result := True;

end;

function TServerMethods.SQLServer(cSql: String): TFDJSONDataSets;
begin

   fdqryComercioSecoes.Close;
   fdqryComercioSecoes.SQL.Clear;
   fdqryComercioSecoes.SQL.Add(cSql);

   Result := TFDJSONDataSets.Create;
   TFDJSONDataSetsWriter.ListAdd(Result, fdqryComercioSecoes);
   fdqryComercioSecoes.Active := True;

end;

function TServerMethods.ComercioCadastrado(ACNPJ : String) : Boolean;
begin

    fdqryGeral.Close;
    fdqryGeral.SQL.Clear;
    fdqryGeral.SQL.Add('SELECT CNPJ_NOVO FROM ALCONTATONOVO');
    fdqryGeral.SQL.Add('WHERE CNPJ_NOVO = :CNPJ_NOVO');
    fdqryGeral.ParamByName('CNPJ_NOVO').AsString := ACNPJ;
    fdqryGeral.Open;

    if fdqryGeral.RecordCount > 0 then
       Result := True else Result := False;

end;


procedure TServerMethods.NovoComercio(ACnpj, ARazao, AEmail, AFone, AContato : String);
begin

    fdqryGeral.Close;
    fdqryGeral.SQL.Clear;
    fdqryGeral.SQL.Add('INSERT INTO ALCONTATONOVO');
    fdqryGeral.SQL.Add('(CNPJ_NOVO, RAZAO_NOVO, EMAIL_NOVO, TELEFONE_NOVO, CONTATO_NOVO, DATA_NOVO) VALUES');
    fdqryGeral.SQL.Add('(:CNPJ_NOVO, :RAZAO_NOVO, :EMAIL_NOVO, :TELEFONE_NOVO, :CONTATO_NOVO, :DATA_NOVO)');
    fdqryGeral.ParamByName('CNPJ_NOVO'    ).AsString := ACnpj;
    fdqryGeral.ParamByName('RAZAO_NOVO'   ).AsString := ARazao;
    fdqryGeral.ParamByName('EMAIL_NOVO'   ).AsString := AEmail;
    fdqryGeral.ParamByName('TELEFONE_NOVO').AsString := AFone;
    fdqryGeral.ParamByName('CONTATO_NOVO' ).AsString := AContato;
    fdqryGeral.ParamByName('DATA_NOVO'    ).AsDate   := DataAtual;
    fdqryGeral.ExecSQL;

end;


function TServerMethods.UpdateAcessoUsu(vIdUsu : Integer): Boolean;
begin

   fdqryUsuarios.Close;
   fdqryUsuarios.SQL.Clear;
   fdqryUsuarios.SQL.Add('UPDATE ALUSUARIOSAPP SET');
   fdqryUsuarios.SQL.Add('DTULTIMOACESSOUSU = :DATA');
   fdqryUsuarios.SQL.Add('WHERE IDUSU = :IDUSU');
   fdqryUsuarios.ParamByName('DATA').AsDate := Now;
   fdqryUsuarios.ParamByName('IDUSU').AsInteger := vIdUsu;
   fdqryUsuarios.ExecSql;

   Result := True;

end;

procedure TServerMethods.UpdateGrupoCom(AIdCom, AIdGrupo: Integer);
begin

     fdqryGeral.Close;
     fdqryGeral.SQL.Clear;
     fdqryGeral.SQL.Add('SELECT * FROM ALSUBCATCOM');
     fdqryGeral.SQL.Add('WHERE (ID_CAT = ' + AIdGrupo.ToString + ')');
     fdqryGeral.SQL.Add('AND (ID_COM = ' + IntToStr(AIdCom) + ')');
     fdqryGeral.Open;
     if fdqryGeral.RecordCount = 0 then
        begin
            ClearSubCatCom(AIdCom);
            fdqryGeral.Close;
            fdqryGeral.SQL.Clear;
            fdqryGeral.SQL.Add('UPDATE ALCOMERCIO SET');
            fdqryGeral.SQL.Add('IDCAT_COM = ' + AIdGrupo.ToString);
            fdqryGeral.SQL.Add('WHERE IDCOM = ' + AIdCom.ToString);
            fdqryGeral.ExecSQL;
        end;

end;

function TServerMethods.UpdateRaioUsuario(AIdUsuario, ARaio : Integer): Boolean;
begin
    fdqryUsuarios.Close;
    fdqryUsuarios.SQL.Clear;
    fdqryUsuarios.SQL.Add('UPDATE ALUSUARIOSAPP SET');
    fdqryUsuarios.SQL.Add('RAIOUSU     = :RAIO');
    fdqryUsuarios.SQL.Add('WHERE IDUSU = :IDUSU');
    fdqryUsuarios.ParamByName('RAIO').AsInteger   := ARaio;
    fdqryUsuarios.ParamByName('IDUSU').AsInteger  := AIdUsuario;
    fdqryUsuarios.ExecSql;

    Result := True
end;

function TServerMethods.UpdateUsuario(FNome, FCelular, FSenha : String; FID : Integer): Boolean;
begin
   With fdqryUsuarios do
      begin
         Close;
         SQL.Clear;
         SQL.Add('UPDATE ALUSUARIOSAPP SET');
         SQL.Add('NOMEUSU        = :NOME,');
         SQL.Add('CELULARUSU     = :CELULAR,');
         SQL.Add('SENHAUSU       = :SENHA');
         SQL.Add('WHERE IDUSU    = :IDUSU');
         ParamByName('NOME').AsString    := FNome;
         ParamByName('CELULAR').AsString := FCelular;
         ParamByName('SENHA').AsString   := FSenha;
         ParamByName('IDUSU').AsInteger  := FID;
         ExecSql;
      end;
   Result := True
end;

function TServerMethods.VerificaCelularDuplicado(
  vCelular: String): TFDJSONDataSets;
begin
   With fdqryUsuarios do
      begin
         Close;
         SQL.Clear;
         SQL.Add('SELECT CELULARUSU FROM ALUSUARIOSAPP');
         SQL.Add('WHERE CELULARUSU = :CELULARUSU');
         ParamByName('CELULARUSU').AsString := vCelular;
         Result := TFDJSONDataSets.Create;
         TFDJSONDataSetsWriter.ListAdd(Result, fdqryUsuarios);
         Active := True;
      end;
end;

function TServerMethods.LoadAvaliacoes(idComercio, nStart: Integer): TFDJSONDataSets;
begin

   fdqryAvaliacao.Close;

   fdqryAvaliacao.ParamByName('START').AsInteger       := nStart;
   fdqryAvaliacao.ParamByName('IDCOMAVALIA').AsInteger := idComercio;

   Result := TFDJSONDataSets.Create;
   TFDJSONDataSetsWriter.ListAdd(Result, fdqryAvaliacao);
end;

function TServerMethods.LoadCategorias(AIdPush : String; ARaio : Integer) : TFDJSONDataSets;
const
ASqlRaio : String = 'SELECT u.IDCOM, u.LATCOM, u.LONGCOM, e.* FROM ALCATEGORIA e' + #13 +
                    'INNER JOIN ALCOMERCIO u' + #13 +
                    'ON (u.IDCAT_COM = e.IDCAT)' + #13 +
                    'WHERE IDCAT IN (SELECT c.IDCAT_COM FROM ALCOMERCIO c' + #13 +
                    'INNER JOIN ALCONTRATO p' + #13 +
                    'ON (p.IDCOM_CONTRATO = c.IDCOM) AND (p.STATUSCONTRATO = ''ONLINE''))';


                    {'SELECT c.IDCOM, c.LATCOM, c.LONGCOM FROM ALCOMERCIO c ' + #13 +
                    'INNER JOIN ALCONTRATO p ' + #13 +
                    'ON (p.IDCOM_CONTRATO = c.IDCOM) ' + #13 +
                    'WHERE p.STATUSCONTRATO = ''ONLINE''';}
var
FSql : String;
begin

     FSql := getSqlRaio(AIdPush, ASqlRaio, ARaio);

     fdqryCategorias.Close;
     fdqryCategorias.SQL.Clear;
     fdqryCategorias.SQL.Add('SELECT * FROM ALCATEGORIA');
     fdqryCategorias.SQL.Add('WHERE IDCAT IN (SELECT c.IDCAT_COM FROM ALCOMERCIO c');
     fdqryCategorias.SQL.Add('INNER JOIN ALCONTRATO p');
     fdqryCategorias.SQL.Add('ON (p.IDCOM_CONTRATO = c.IDCOM)');
     fdqryCategorias.SQL.Add('WHERE (c.IDCOM IN (' + FSql + ')) AND (p.STATUSCONTRATO = ' + QuotedStr('ONLINE') + '))');

     Result := TFDJSONDataSets.Create;
     TFDJSONDataSetsWriter.ListAdd(Result, fdqryCategorias);
     fdqryCategorias.Active := True;

end;

function TServerMethods.LoadGrupoSelected(AIdCom : Integer) : Integer;
begin

     fdqryGeral.Close;
     fdqryGeral.SQL.Clear;
     fdqryGeral.SQL.Add('select a.idcat, a.nomecat, c.idcom,  c.idcat_com from alcomercio c');
     fdqryGeral.SQL.Add('inner join alcategoria a');
     fdqryGeral.SQL.Add('on (a.idcat = c.idcat_com)');
     fdqryGeral.Open;

     if fdqryGeral.RecordCount = 0 then
        Result := 0 else
        Result := fdqryGeral.FieldByName('IDCAT').AsInteger;

end;

function TServerMethods.LoadGrupos(AIdCom : Integer) : TFDJSONDataSets;
begin

     fdqryGeral.Close;
     fdqryGeral.SQL.Clear;
     fdqryGeral.SQL.Add('SELECT * FROM ALCATEGORIA');
     fdqryGeral.SQL.Add('WHERE (IDCOMCATNOVO IS NULL) OR (IDCOMCATNOVO = ' + QuotedStr(AIdCom.ToString) + ')');

     Result := TFDJSONDataSets.Create;
     TFDJSONDataSetsWriter.ListAdd(Result, fdqryGeral);
     fdqryGeral.Active := True;

end;

function TServerMethods.LoadCheckList(AIdCom : Integer) : TFDJSONDataSets;
begin

    fdqryGeral.Close;
    fdqryGeral.SQL.Clear;
    fdqryGeral.SQL.Add('SELECT * FROM ALCHECKLIST');
    fdqryGeral.SQL.Add('WHERE (IDCOMCHECKNOVO = ' + AIdCom.ToString + ') OR');
    fdqryGeral.SQL.Add('(IDCOMCHECKNOVO IS NULL)');

    Result := TFDJSONDataSets.Create;

    TFDJSONDataSetsWriter.ListAdd(Result, fdqryGeral);

end;

function TServerMethods.LoadFichaComercio(AIdComercio: Integer): TFDJSONDataSets;
begin

     fdqryGeral.Close;
     fdqryGeral.SQL.Clear;
     fdqryGeral.SQL.Add('SELECT * FROM ALCOMERCIO');
     fdqryGeral.SQL.Add('WHERE IDCOM = ' + AIdComercio.ToString);

     Result := TFDJSONDataSets.Create;
     TFDJSONDataSetsWriter.ListAdd(Result, fdqryGeral);
     fdqryGeral.Active := True;

end;

function TServerMethods.LoadComercio(idComercio: Integer): TFDJSONDataSets;
begin
   fdqryComercio.Close;
   fdqryFotosComercio.Close;
   fdqryCheckList.Close;
   fdqryFone.Close;

   fdqryComercio.ParamByName('IDCOM').AsInteger           := idComercio;
   //fdqryFotosComercio.ParamByName('IDCOMFILES').AsInteger := idComercio;
   fdqryCheckList.ParamByName('IDCHECKCOM').AsInteger     := idComercio;
   fdqryFone.ParamByName('IDCOM').AsInteger               := idComercio;

   Result := TFDJSONDataSets.Create;

   TFDJSONDataSetsWriter.ListAdd(Result, fdqryComercio);
   //TFDJSONDataSetsWriter.ListAdd(Result, fdqryFotosComercio);
   TFDJSONDataSetsWriter.ListAdd(Result, fdqryCheckList);
   TFDJSONDataSetsWriter.ListAdd(Result, fdqryFone);
end;

function TServerMethods.LoadComercioCategoria(AIdPush : String; ARaio, IdCategoria, IdSubCategoria : Integer) : TFDJSONDataSets;
var
ASqlRaio : String;
FResSql,S  : String;
begin
ASqlRaio := 'select a.*, e.latcom, e.longcom, e.mediatotalavalia, e.titulocom, e.slogamcom, e.icocom, e.idcom,' + #13 +
            'e.hrsegcom,e.hrtercom,e.hrquacom,e.hrquicom,e.hrsexcom,e.hrsabcom,e.hrdomcom' + #13 +
            'from alsubcatcom a' + #13 +
            'left join  alcategoria b' + #13 +
            'on (a.id_cat = b.idcat)' + #13 +
            'inner join alsubcategoria c' + #13 +
            'on (a.id_subcat = c.idsubcat)' + #13 +
            'left join alavalia d' + #13 +
            'on (a.id_com = d.idcom_avalia)' + #13 +
            'inner join alcomercio e' + #13 +
            'on (a.id_com = e.idcom)' + #13 +
            'inner join alcontrato p' + #13 +
            'on (a.id_com = p.idcom_contrato)' + #13 +
            'where (a.id_cat = ' + IdCategoria.ToString + ') and' + #13 +
            '(a.id_subcat = ' + IdSubCategoria.ToString + ') and' + #13 +
            '(p.statuscontrato = ''ONLINE'')';

    FResSql := getSqlRaio(AIdPush, ASqlRaio, ARaio);

    fdqryComercioSecoes.Close;
    fdqryComercioSecoes.Sql.Clear;
    fdqryComercioSecoes.Sql.Add('select a.id_com, a.id_subcat, a.id_cat, a.updatesubcatcom, e.latcom, e.longcom,');
    fdqryComercioSecoes.Sql.Add('e.mediatotalavalia, e.titulocom, e.slogamcom, e.icocom, e.idcom,');
    fdqryComercioSecoes.Sql.Add('e.hrsegcom,e.hrtercom,e.hrquacom,e.hrquicom,e.hrsexcom,e.hrsabcom,e.hrdomcom');
    fdqryComercioSecoes.Sql.Add('from alsubcatcom a');
    fdqryComercioSecoes.Sql.Add('left join  alcategoria b');
    fdqryComercioSecoes.Sql.Add('on (a.id_cat = b.idcat)');
    fdqryComercioSecoes.Sql.Add('inner join alsubcategoria c');
    fdqryComercioSecoes.Sql.Add('on (a.id_subcat = c.idsubcat)');
    fdqryComercioSecoes.Sql.Add('left join alavalia d');
    fdqryComercioSecoes.Sql.Add('on (a.id_com = d.idcom_avalia)');
    fdqryComercioSecoes.Sql.Add('inner join alcomercio e');
    fdqryComercioSecoes.Sql.Add('on (a.id_com = e.idcom)');
    fdqryComercioSecoes.Sql.Add('inner join alcontrato p');
    fdqryComercioSecoes.Sql.Add('on (a.id_com = p.idcom_contrato)');
    fdqryComercioSecoes.Sql.Add('where (a.id_cat = :idcat) and (a.id_subcat = :idsubcat)');
    fdqryComercioSecoes.Sql.Add('and (p.statuscontrato = :status) and (e.idcom in (' + FResSql + '))');
    fdqryComercioSecoes.Sql.Add('group by  a.id_com, a.id_subcat, a.id_cat, a.updatesubcatcom, e.latcom, e.longcom,');
    fdqryComercioSecoes.Sql.Add('e.mediatotalavalia, e.titulocom, e.slogamcom, e.icocom, e.idcom,');
    fdqryComercioSecoes.Sql.Add('e.hrsegcom,e.hrtercom,e.hrquacom,e.hrquicom,e.hrsexcom,e.hrsabcom,e.hrdomcom');
    fdqryComercioSecoes.ParamByName('IDCAT').AsInteger    := IdCategoria;
    fdqryComercioSecoes.ParamByName('IDSUBCAT').AsInteger := IdSubCategoria;
    fdqryComercioSecoes.ParamByName('STATUS').AsString    := 'ONLINE';

    Result := TFDJSONDataSets.Create;
    TFDJSONDataSetsWriter.ListAdd(Result, fdqryComercioSecoes);
    fdqryComercioSecoes.Active := True;

end;

function TServerMethods.LoadComercioPesquisa(ARaio : Integer; FPesquisa, AIdPush : String): TFDJSONDataSets;
var
FSqlRaio, FResSql : String;
begin
FSqlRaio := 'select e.mediatotalavalia, e.titulocom, e.slogamcom, e.icocom, e.idcom,' + #13 +
            'e.hrsegcom,e.hrtercom,e.hrquacom,e.hrquicom,e.hrsexcom,e.hrsabcom,e.hrdomcom,' + #13 +
            'e.latcom, e.longcom' + #13 +
            'from alsubcatcom a' + #13 +
            'left join  alcategoria b' + #13 +
            'on (a.id_cat = b.idcat)' + #13 +
            'inner join alsubcategoria c' + #13 +
            'on (a.id_subcat = c.idsubcat)' + #13 +
            'left join alavalia d' + #13 +
            'on (a.id_com = d.idcom_avalia)' + #13 +
            'inner join alcomercio e' + #13 +
            'on (a.id_com = e.idcom)' + #13 +
            'inner join alcontrato p' + #13 +
            'on (a.id_com = p.idcom_contrato)' + #13 +
            'where e.tagcom containing  ' + QuotedStr(FPesquisa) + #13 +
            'and p.statuscontrato = ''ONLINE''' + #13 +
            'group by e.mediatotalavalia, e.titulocom, e.slogamcom, e.icocom, e.idcom,' + #13 +
            'e.hrsegcom,e.hrtercom,e.hrquacom,e.hrquicom,e.hrsexcom,e.hrsabcom,e.hrdomcom,' + #13 +
            'e.latcom, e.longcom';

    FResSql := getSqlRaio(AIdPush, FSqlRaio, ARaio);

    fdqryComercioSecoes.Close;
    fdqryComercioSecoes.Sql.Clear;
    fdqryComercioSecoes.SQL.Add('select e.mediatotalavalia, e.titulocom, e.slogamcom, e.icocom, e.idcom,');
    fdqryComercioSecoes.SQL.Add('e.hrsegcom,e.hrtercom,e.hrquacom,e.hrquicom,e.hrsexcom,e.hrsabcom,e.hrdomcom,');
    fdqryComercioSecoes.SQL.Add('e.latcom, e.longcom');
    fdqryComercioSecoes.SQL.Add('from alsubcatcom a');
    fdqryComercioSecoes.SQL.Add('left join  alcategoria b');
    fdqryComercioSecoes.SQL.Add('on (a.id_cat = b.idcat)');
    fdqryComercioSecoes.SQL.Add('inner join alsubcategoria c');
    fdqryComercioSecoes.SQL.Add('on (a.id_subcat = c.idsubcat)');
    fdqryComercioSecoes.SQL.Add('left join alavalia d');
    fdqryComercioSecoes.SQL.Add('on (a.id_com = d.idcom_avalia)');
    fdqryComercioSecoes.SQL.Add('inner join alcomercio e');
    fdqryComercioSecoes.SQL.Add('on (a.id_com = e.idcom)');
    fdqryComercioSecoes.SQL.Add('inner join alcontrato p');
    fdqryComercioSecoes.SQL.Add('on (a.id_com = p.idcom_contrato)');
    fdqryComercioSecoes.Sql.Add('where (e.tagcom containing ' + QuotedStr(FPesquisa) + ')');
    fdqryComercioSecoes.Sql.Add('and (p.statuscontrato = ' + QuotedStr('ONLINE') + ')');
    fdqryComercioSecoes.Sql.Add('and (e.idcom in (' + FResSql + '))');
    fdqryComercioSecoes.SQL.Add('group by e.mediatotalavalia, e.titulocom, e.slogamcom, e.icocom, e.idcom,');
    fdqryComercioSecoes.SQL.Add('e.hrsegcom,e.hrtercom,e.hrquacom,e.hrquicom,e.hrsexcom,e.hrsabcom,e.hrdomcom,');
    fdqryComercioSecoes.SQL.Add('e.latcom, e.longcom');
    Result := TFDJSONDataSets.Create;
    TFDJSONDataSetsWriter.ListAdd(Result, fdqryComercioSecoes);
    fdqryComercioSecoes.Active := True;

end;


function TServerMethods.LoadDestaquePrincipal(AIdPush : String; ARaio : Integer): TFDJSONDataSets;
const
ASqlRaio : String = 'SELECT e.IDCOM, e.LATCOM, e.LONGCOM FROM ALCONTRATO c ' + #13 +
                    'INNER JOIN ALCOMERCIO e ' + #13 +
                    'ON (e.IDCOM = c.IDCOM_CONTRATO) ' + #13 +
                    'WHERE (c.DATACANCELACONTRATO IS NULL) AND (c.STATUSCONTRATO = ''ONLINE'')';
var
FSQL : String;
begin

         FSQL := getSqlRaio(AIdPush,ASqlRaio, ARaio);

         fdqryGeral.Close;
         fdqryGeral.SQL.Clear;
         fdqryGeral.SQL.Add('SELECT e.IDCOM, c.* FROM ALCONTRATO c');
         fdqryGeral.SQL.Add('INNER JOIN ALCOMERCIO e');
         fdqryGeral.SQL.Add('ON (e.IDCOM = c.IDCOM_CONTRATO)');
         fdqryGeral.SQL.Add('WHERE (c.DATACANCELACONTRATO IS NULL) AND (c.STATUSCONTRATO = '+QuotedStr('ONLINE')+')');
         fdqryGeral.SQL.Add('AND (c.IDCOM_CONTRATO IN (' + FSQL + '))');

         Result := TFDJSONDataSets.Create;
         TFDJSONDataSetsWriter.ListAdd(Result, fdqryGeral);
         fdqryGeral.Open;

end;

function TServerMethods.LoadDestaqueFavorito(AIdPush : String; ARaio, vIdUsu : Integer): TFDJSONDataSets;
var
FSqlRaio, AResSql : String;
begin
   if vIdUsu <= 0 then
      begin
         {Itens Destaque}
         FSqlRaio := 'select c.latcom, c.longcom, c.idcom, c.icocom, c.titulocom, c.mediatotalavalia, c.distanciacom from alcomercio c' + #13 +
                     'inner join alcontrato x' + #13 +
                     'on (x.idcom_contrato = c.idcom)' + #13 +
                     'where (x.imgdestaquehomecontrato > '') or' + #13 +
                     '(x.imgdestaquesessaocontrato > '') and' + #13 +
                     '(x.statuscontrato containing ' + QuotedStr('ONLINE')+')';

         AResSql := getSqlRaio(AIdPush, FSqlRaio,ARaio);

         fdqryGeral.Close;
         fdqryGeral.SQL.Clear;
         fdqryGeral.SQL.Add('select c.latcom, c.longcom, c.idcom, c.icocom, c.titulocom, c.mediatotalavalia, c.distanciacom from alcomercio c');
         fdqryGeral.SQL.Add('inner join alcontrato x');
         fdqryGeral.SQL.Add('on (x.idcom_contrato = c.idcom)');
         fdqryGeral.SQL.Add('where (x.imgdestaquehomecontrato > '') or');
         fdqryGeral.SQL.Add('(x.imgdestaquesessaocontrato > '') and');
         fdqryGeral.SQL.Add('(x.statuscontrato containing ' + QuotedStr('ONLINE')+') and');
         fdqryGeral.SQL.Add('(c.idcom in (' + AResSql + '))');

      end
   else
      begin
         {Itens Favoritos}

         {FSqlRaio := 'select f.idusufav, f.idcomfav, c.latcom, c.longcom, c.idcom, c.icocom, c.titulocom, c.mediatotalavalia from alfavoritos f' + #13 +
                     'inner join alcomercio c' + #13 +
                     'on (c.idcom = f.idcomfav)' + #13 +
                     'inner join alcontrato a' + #13 +
                     'on (c.idcom = a.idcom_contrato)' + #13 +
                     'where (f.idusufav = ' + vIdUsu.ToString +') and' + #13 +
                     '(a.statuscontrato = ''ONLINE'')';


         AResSql := getSqlRaio(ALatitude, ALongitude, FSqlRaio,ARaio);}

         fdqryGeral.Close;
         fdqryGeral.SQL.Clear;
         fdqryGeral.SQL.Add('select f.idusufav, f.idcomfav, c.latcom, c.longcom, c.idcom, c.icocom, c.titulocom, c.mediatotalavalia from alfavoritos f');
         fdqryGeral.SQL.Add('inner join alcomercio c');
         fdqryGeral.SQL.Add('on (c.idcom = f.idcomfav)');
         fdqryGeral.SQL.Add('inner join alcontrato a');
         fdqryGeral.SQL.Add('on (c.idcom = a.idcom_contrato)');
         fdqryGeral.SQL.Add('where (f.idusufav = :idusufav) and');
         fdqryGeral.SQL.Add('(a.statuscontrato = ' + QuotedStr('ONLINE')+')');
         fdqryGeral.ParamByName('idusufav').AsInteger := vIdUsu;
      end;

   Result := TFDJSONDataSets.Create;
   TFDJSONDataSetsWriter.ListAdd(Result, fdqryGeral);
   fdqryGeral.Active := True;

end;

function TServerMethods.LoadFotosPorSecao(ARaio, vIdCat: Integer; APesquisa, AIdPush : String): TFDJSONDataSets;
const
FSqlRaio    : String = 'select u.idcom, u.latcom, u.longcom, s.id_com, s.id_cat, c.imgdestaquesessaocontrato from alsubcatcom s' + #13 +
                       'inner join alcontrato c' + #13 +
                       'on (c.idcom_contrato = s.id_com)' + #13 +
                       'inner join alcomercio u' + #13 +
                       'on (u.idcom = s.id_com)' + #13 +
                       'where (s.id_cat = :idcat) and' + #13 +
                       '(c.imgdestaquesessaocontrato is not null)' + #13 +
                       'group by u.idcom, u.latcom, u.longcom, s.id_com, s.id_cat, c.imgdestaquesessaocontrato';


FSqlRaioPqs : String = 'select b.idcom, b.latcom, b.longcom, s.id_com, s.id_cat, c.imgdestaquesessaocontrato from alsubcatcom s' + #13 +
                       'inner join alcontrato c' + #13 +
                       'on (c.idcom_contrato > s.id_com)' + #13 +
                       'inner join alcomercio b' + #13 +
                       'on (c.idcom_contrato = b.idcom)' + #13 +
                       'where c.imgdestaquesessaocontrato is not null and b.tagcom like :pesquisa' + #13 +
                       'group by b.idcom, b.latcom, b.longcom, c.imgdestaquesessaocontrato, s.id_com, s.id_cat';

var
AJson, FResSql : String;
begin
   if vIdCat > 0 then
      begin

         AJson   := Format('{"parametro": "%d","campo":"%s"}', [vIdCat,'idcat']);
         FResSql := getSqlRaio(AIdPush, FSqlRaio, ARaio, AJson);

         fdqryFotosSecao.Close;
         fdqryFotosSecao.SQL.Clear;
         fdqryFotosSecao.SQL.Add('select s.id_com, s.id_cat, c.imgdestaquesessaocontrato from alsubcatcom s');
         fdqryFotosSecao.SQL.Add('inner join alcontrato c');
         fdqryFotosSecao.SQL.Add('on (c.idcom_contrato = s.id_com)');
         fdqryFotosSecao.SQL.Add('where (s.id_cat = :idcat) and ');
         fdqryFotosSecao.SQL.Add('(c.imgdestaquesessaocontrato is not null) and ');
         fdqryFotosSecao.SQL.Add('(s.id_com in (' + FResSql + '))');
         fdqryFotosSecao.SQL.Add('group by s.id_com, s.id_cat, c.imgdestaquesessaocontrato');
         fdqryFotosSecao.ParamByName('idcat').Value := vIdCat;

      end
   else
      begin
         AJson   := Format('{"parametro": "%s","campo":"%s"}', ['%' + APesquisa + '%','Pesquisa']);
         FResSql := getSqlRaio(AIdPush, FSqlRaioPqs, ARaio, AJson);

         fdqryFotosSecao.Close;
         fdqryFotosSecao.SQL.Clear;
         fdqryFotosSecao.SQL.Add('select s.id_com, s.id_cat, c.imgdestaquesessaocontrato from alsubcatcom s');
         fdqryFotosSecao.SQL.Add('inner join alcontrato c');
         fdqryFotosSecao.SQL.Add('on (c.idcom_contrato > s.id_com)');
         fdqryFotosSecao.SQL.Add('inner join alcomercio b');
         fdqryFotosSecao.SQL.Add('on (c.idcom_contrato = b.idcom)');
         fdqryFotosSecao.SQL.Add('where (c.imgdestaquesessaocontrato is not null) and (b.tagcom like :Pesquisa) and');
         fdqryFotosSecao.SQL.Add('(s.id_com in (' + FResSql + '))');
         fdqryFotosSecao.SQL.Add('group by c.imgdestaquesessaocontrato, s.id_com, s.id_cat');
         fdqryFotosSecao.ParamByName('Pesquisa').AsString := '%' + APesquisa + '%';

      end;

   Result := TFDJSONDataSets.Create;
   TFDJSONDataSetsWriter .ListAdd(Result, fdqryFotosSecao);
   fdqryFotosSecao.Active := True;
end;

function TServerMethods.VerificaUsuarioAvaliou(AIdUsu, AIdCom : Integer) : Boolean;
var
ADataAvaliacao : TDate;
begin

    ctrDIASAVALIACAO := ctrDIASAVALIACAO * -1;
    ADataAvaliacao   := IncDay(DataAtual, ctrDIASAVALIACAO);
    fdqryGeral.Close;
    fdqryGeral.SQL.Clear;
    fdqryGeral.Sql.Add('select a.dataavalia, c.idcom, u.idusu from alavalia a');
    fdqryGeral.Sql.Add('inner join alusuariosapp u');
    fdqryGeral.Sql.Add('on (a.idusu_avalia = u.idusu)');
    fdqryGeral.Sql.Add('inner join alcomercio c');
    fdqryGeral.Sql.Add('on (a.idcom_avalia = c.idcom)');
    fdqryGeral.Sql.Add('where (a.dataavalia > :Data) and');
    fdqryGeral.SQL.Add('(u.idusu = :idusu) and (c.idcom = :idcom)');
    fdqryGeral.ParamByName('idusu').AsInteger := AIdUsu;
    fdqryGeral.ParamByName('idcom').AsInteger := AIdCom;
    fdqryGeral.ParamByName('Data').AsDate     := ADataAvaliacao;
    fdqryGeral.Open;

    if fdqryGeral.RecordCount > 0 then
        Result := True else Result := False;

end;

procedure TServerMethods.InsertNewSubCategoria(AIdCategoria, AIdCom : Integer; ANomeSubCategoria : String);
begin

      fdqryGeral.Close;
      fdqryGeral.SQL.Clear;
      fdqryGeral.SQL.Add('INSERT INTO ALSUBCATEGORIA');
      fdqryGeral.SQL.Add('(IDCAT_SUBCAT, NOMESUBCAT, IDCOMSUBCATNOVO) VALUES');
      fdqryGeral.SQL.Add('(:IDCAT_SUBCAT, :NOMESUBCAT,:IDCOMSUBCATNOVO)');

      fdqryGeral.ParamByName('IDCAT_SUBCAT').AsInteger    := AIdCategoria;
      fdqryGeral.ParamByName('NOMESUBCAT').AsString       := ANomeSubCategoria;
      fdqryGeral.ParamByName('IDCOMSUBCATNOVO').AsInteger := AIdCom;

      fdqryGeral.ExecSql;

end;

function TServerMethods.LoadSubCategoria(AIdPush : String; ARaio, IdCategoria: Integer): TFDJSONDataSets;
const
FSqlRaio : String =  'SELECT u.IDCOM, u.LATCOM, u.LONGCOM, s.NOMESUBCAT, s.IDSUBCAT, c.IDCAT FROM ALSUBCATEGORIA s' + #13 +
                     'INNER JOIN ALCATEGORIA c' + #13 +
                     'ON (s.IDCAT_SUBCAT = c.IDCAT)' + #13 +
                     'INNER JOIN ALCOMERCIO u' + #13 +
                     'ON (u.IDCAT_COM = c.IDCAT)' + #13 +
                     'WHERE (c.IDCAT = :IDCAT) AND' + #13 +
                     '(s.IDSUBCAT IN' + #13 +
                     '(SELECT ID_SUBCAT FROM ALSUBCATEGORIA s' + #13 +
                     'INNER JOIN ALSUBCATCOM a' + #13 +
                     'ON (s.IDSUBCAT = a.ID_SUBCAT)' + #13 +
                     'INNER JOIN ALCOMERCIO c' + #13 +
                     'ON (a.ID_COM = c.IDCOM)' + #13 +
                     'INNER JOIN ALCONTRATO p' + #13 +
                     'ON (p.IDCOM_CONTRATO = c.IDCOM)' + #13 +
                     'WHERE p.STATUSCONTRATO = ''ONLINE''))';

var
AJson, S, FResSql : String;
begin
     AJson := Format('{"parametro": "%d","campo":"%s"}', [IdCategoria,'IDCAT']);
     FResSql := getSqlRaio(AIdPush, FSqlRaio, ARaio, AJson);

     fdqrySubCategoria.Close;
     fdqrySubCategoria.Sql.Clear;
     fdqrySubCategoria.Sql.Add('SELECT s.NOMESUBCAT, s.IDSUBCAT, c.IDCAT FROM ALSUBCATEGORIA s');
     fdqrySubCategoria.Sql.Add('INNER JOIN ALCATEGORIA c');
     fdqrySubCategoria.Sql.Add('ON (s.IDCAT_SUBCAT = c.IDCAT)');
     fdqrySubCategoria.Sql.Add('WHERE (c.IDCAT = :IDCAT) AND');
     fdqrySubCategoria.Sql.Add('(s.IDSUBCAT IN');
     fdqrySubCategoria.Sql.Add('(SELECT ID_SUBCAT FROM ALSUBCATEGORIA s');
     fdqrySubCategoria.Sql.Add('INNER JOIN ALSUBCATCOM a');
     fdqrySubCategoria.Sql.Add('ON (s.IDSUBCAT = a.ID_SUBCAT)');
     fdqrySubCategoria.Sql.Add('INNER JOIN ALCOMERCIO c');
     fdqrySubCategoria.Sql.Add('ON (a.ID_COM = c.IDCOM)');
     fdqrySubCategoria.Sql.Add('INNER JOIN ALCONTRATO p');
     fdqrySubCategoria.Sql.Add('ON (p.IDCOM_CONTRATO = c.IDCOM)');
     fdqrySubCategoria.Sql.Add('WHERE p.STATUSCONTRATO = ''ONLINE'' AND ');
     fdqrySubCategoria.Sql.Add('c.IDCOM IN (' + FResSql + ')))');
     fdqrySubCategoria.ParamByName('IDCAT').AsInteger := IdCategoria;

     S := QueryToLog(fdqrySubCategoria);
     Result := TFDJSONDataSets.Create;
     TFDJSONDataSetsWriter.ListAdd(Result,fdqrySubCategoria);
     fdqrySubCategoria.Active := True;

end;

function TServerMethods.LoadSubGrupo(AIdGrupo, AIdCom : Integer): TFDJSONDataSets;
begin

     fdqryGeral.Close;
     fdqryGeral.SQL.Clear;
     fdqryGeral.SQL.Add('SELECT * FROM ALSUBCATEGORIA');
     fdqryGeral.SQL.Add('WHERE (IDCAT_SUBCAT = ' + AIdGrupo.ToString + ') OR');
     fdqryGeral.SQL.Add('(IDCOMSUBCATNOVO = ' + AIdCom.ToString + ') AND');
     fdqryGeral.SQL.Add('(IDCAT_SUBCAT = ' + AIdGrupo.ToString + ')');

     Result := TFDJSONDataSets.Create;
     TFDJSONDataSetsWriter.ListAdd(Result, fdqryGeral);
     fdqryGeral.Active := True;

end;

function TServerMethods.SolicitacoesNovaCategoria(AIdCom : Integer) : Integer;
begin

     fdqryGeral.Close;
     fdqryGeral.SQL.Clear;
     fdqryGeral.SQL.Add('SELECT * FROM ALCATEGORIA');
     fdqryGeral.SQL.Add('WHERE IDCOMCATNOVO = :IDCOMCATNOVO');
     fdqryGeral.ParamByName('IDCOMCATNOVO').AsInteger := AIdCom;
     fdqryGeral.Open;

     Result := fdqryGeral.RecordCount;

end;

procedure TServerMethods.InsertCategoria(ACategoria, ADescricao : String; AIdCom : Integer);
begin

     fdqryGeral.Close;
     fdqryGeral.SQL.Clear;
     fdqryGeral.SQL.Add('INSERT INTO ALCATEGORIA');
     fdqryGeral.SQL.Add('(NOMECAT, DETALHECAT, IDCOMCATNOVO) VALUES');
     fdqryGeral.SQL.Add('(:NOMECAT, :DETALHECAT, :IDCOMCATNOVO)');
     fdqryGeral.ParamByName('NOMECAT').AsString       := ACategoria;
     fdqryGeral.ParamByName('DETALHECAT').AsString    := ADescricao;
     fdqryGeral.ParamByName('IDCOMCATNOVO').AsInteger := AIdCom;
     fdqryGeral.ExecSQL;

end;

function TServerMethods.LoadSubCatCom(AIdCom : Integer) : TFDJSONDataSets;
begin

     fdqryGeral.Close;
     fdqryGeral.SQL.Clear;
     fdqryGeral.SQL.Add('SELECT * FROM ALSUBCATCOM');
     fdqryGeral.SQL.Add('WHERE ID_COM = ' + AIdCom.ToString);

     Result := TFDJSONDataSets.Create;
     TFDJSONDataSetsWriter.ListAdd(Result, fdqryGeral);
     fdqryGeral.Active := True;

end;

procedure TServerMethods.ClearSubCatCom(AIdCom : Integer);
begin

     fdqryGeral.Close;
     fdqryGeral.SQL.Clear;
     fdqryGeral.SQL.Add('DELETE FROM ALSUBCATCOM');
     fdqryGeral.SQL.Add('WHERE ID_COM = ' + AIdCom.ToString);
     fdqryGeral.ExecSQL;

end;

procedure TServerMethods.InsertSubCatCom(AIdCom, AIdGrupo, AIdSubGrupo : Integer);
begin


     fdqryGeral.Close;
     fdqryGeral.SQL.Clear;
     fdqryGeral.SQL.Add('SELECT * FROM ALSUBCATCOM');
     fdqryGeral.SQL.Add('WHERE (ID_COM = ' + AIdCom.ToString + ') AND');
     fdqryGeral.SQL.Add('(ID_SUBCAT = ' + AIdSubGrupo.ToString + ')');
     fdqryGeral.Open;

     if fdqryGeral.RecordCount > 0 then
        begin

            fdqryGeral.Close;
            fdqryGeral.SQL.Clear;
            fdqryGeral.SQL.Add('DELETE FROM ALSUBCATCOM');
            fdqryGeral.SQL.Add('WHERE (ID_COM = ' + AIdCom.ToString + ') AND');
            fdqryGeral.SQL.Add('(ID_SUBCAT = ' + AIdSubGrupo.ToString + ')');
            fdqryGeral.ExecSQL;

        end
    else
        begin

            fdqryGeral.Close;
            fdqryGeral.SQL.Clear;
            fdqryGeral.SQL.Add('INSERT INTO ALSUBCATCOM');
            fdqryGeral.SQL.Add('(ID_COM, ID_SUBCAT, ID_CAT) VALUES');
            fdqryGeral.SQL.Add('(:ID_COM, :ID_SUBCAT, :IDCAT)');
            fdqryGeral.ParamByName('ID_COM').AsInteger    := AIdCom;
            fdqryGeral.ParamByName('ID_SUBCAT').AsInteger := AIdSubGrupo;
            fdqryGeral.ParamByName('IDCAT').AsInteger     := AIdGrupo;
            fdqryGeral.ExecSQL;

        end;

end;

end.

