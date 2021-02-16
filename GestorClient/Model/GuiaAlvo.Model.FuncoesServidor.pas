unit GuiaAlvo.Model.FuncoesServidor;

interface

uses Data.FireDACJSONReflect, uFuncoes, System.Classes, uFormat, FireDAC.Comp.Client, GuiaAlvo.Controller.DataModuleDados, GuiaAlvo.Controller.ClientModule, Guia.Controle;

function TelRepetido(ATelefone : String) : Integer;
function AddComercioNovo(ARazao, AFantasia, ACep, AComplemento, ACNPJCPF, AIERG, AEmail, ASenha, ALoginFone: String; ANumero: Integer) : Integer;
procedure AddTelefone(ATelefone, AContato, AZap, AInterno : String; AIdComFone : Integer; AIdFone : Integer = 0);
function DocRepetido(AField, ADoc: String): Boolean;
function getControle: TFDJSONDataSets;
procedure EnviarEmail(pCodigo, pAssunto, pNome, pEmail, pTipoEmail: string; pHtml : Boolean = True);
function getNovaSenha(ADoc : String) : Boolean;
function UpdateSenha(AIdCom : Integer; ASenha : String) : Boolean;
function getLogin(ADoc, ASenha : String) : Boolean;
procedure getTelefone(AIdCom: Integer);
procedure DeleteFone(AIdFone : Integer);
procedure LoadCheckList;
procedure LoadCheckListSelected(AIdComercio : Integer);
procedure AddCheckListCom(AIdCom, AIdCheck: Integer);
procedure AddCheckListNovo(ACheck : String; AIdCom : Integer);
procedure ListaPlanos;
procedure LoadGrupos(AIdCom : Integer; AStatus : String = 'F');
procedure UpdateGrupoCom(AIdCom, AIdGrupo: Integer);
procedure LoadSubGrupo(AIdGrupo : Integer);
procedure LoadSubCatCom(AIdCom : Integer);
procedure InsertSubCatCom(AIdCom, AIdGrupo, AIdSubGrupo : Integer);
procedure ClearSubCatCom(AIdCom : Integer);
function LoadGrupoSelected(AIdCom : Integer) : Integer;
procedure InsertCategoria(ACategoria, ADescricao : String);
function SolicitacoesNovaCategoria : Integer;
procedure InsertNewSubCategoria(AIdCategoria : Integer; ANomeSubCategoria : String);
procedure LoadFichaComercio(AIdComercio: Integer);
function gravaRedesSociais(AFace, AInsta, ATwitter, AYouTube, AGPlus,
                            ASite, AEmail, AGPlay, AStore : String) : Boolean;
function gravaCadastroAvaliacoes(AAmbiente, AAtendimento, ALimpeza, ALocal, APreco : Boolean) : Boolean;
function gravaDelivery(AUber, ARappi, AIfood: String) : Boolean;
procedure gravaSobre(ASobre, ASlogam, ATag : String);
function podeAlterarAvaliacao : Boolean;



implementation

uses
  FMX.Platform.Win, Winapi.Windows, GuiaAlvo.View.Login, GuiaAlvo.View.Principal, GuiaAlvo.Model.RedesSociais;

function podeAlterarAvaliacao : Boolean;
begin
     Result := ModelClientModule.ServerMethodsClient.podeAlterarAvaliacao(cfgIdComercio);
end;

procedure gravaSobre(ASobre, ASlogam, ATag : String);
begin
    ModelClientModule.ServerMethodsClient.gravaSobre(cfgIdComercio, ASobre, ASlogam, ATag);
end;

function gravaDelivery(AUber, ARappi, AIfood: String) : Boolean;
begin

     Result := ModelClientModule.ServerMethodsClient.gravaDelivery(cfgIdComercio ,AUber, ARappi, AIfood);

end;

function gravaRedesSociais(AFace, AInsta, ATwitter, AYouTube, AGPlus,
                            ASite, AEmail, AGPlay, AStore: String) : Boolean;
begin

       Result := ModelClientModule.ServerMethodsClient.gravaRedesSociais(cfgIdComercio, AFace, AInsta, ATwitter, AYouTube, AGPlus,
                               ASite, AEmail, AGPlay, AStore);

end;

function gravaCadastroAvaliacoes(AAmbiente, AAtendimento, ALimpeza, ALocal, APreco : Boolean) : Boolean;
begin

     Result := ModelClientModule.ServerMethodsClient.gravaCadastroAvaliacoes(cfgIdComercio, AAmbiente, AAtendimento, ALimpeza, ALocal, APreco);

end;


procedure LoadFichaComercio(AIdComercio: Integer);
var
   dsComercio : TFDJSONDataSets;
begin

    dsComercio  := ModelClientModule.ServerMethodsClient.LoadFichaComercio(AIdComercio);
    dmGeralClient.memFichaComercio.Active := False;
    dmGeralClient.memFichaComercio.AppendData(TFDJSONDataSetsReader.GetListValue(dsComercio, 0));
    dmGeralClient.memFichaComercio.Active := True;

    if not Assigned(frmGestorClient.FRedesSociais) then
       frmGestorClient.FRedesSociais := TRedeSocial.Create;

       with frmGestorClient do
            begin

                 FRedesSociais.SITECOM     := dmGeralClient.memFichaComercio.FieldByName('SITECOM').AsString;
                 FRedesSociais.EMAILCOM    := dmGeralClient.memFichaComercio.FieldByName('EMAILCOM').AsString;
                 FRedesSociais.FACECOM     := dmGeralClient.memFichaComercio.FieldByName('FACECOM').AsString;
                 FRedesSociais.INSTACOM    := dmGeralClient.memFichaComercio.FieldByName('INSTACOM').AsString;
                 FRedesSociais.TWITERCOM   := dmGeralClient.memFichaComercio.FieldByName('TWITERCOM').AsString;
                 FRedesSociais.GOOGLECOM   := dmGeralClient.memFichaComercio.FieldByName('GOOGLECOM').AsString;
                 FRedesSociais.TUBECOM     := dmGeralClient.memFichaComercio.FieldByName('TUBECOM').AsString;
                 FRedesSociais.APPCOM      := dmGeralClient.memFichaComercio.FieldByName('APPCOM').AsString;
                 FRedesSociais.APPLECOM    := dmGeralClient.memFichaComercio.FieldByName('APPLECOM').AsString;

                 edtLinkSite.Text          := FRedesSociais.SITECOM;
                 edtLinkEmail.Text         := FRedesSociais.EMAILCOM;
                 edtLinkFacebook.Text      := FRedesSociais.FACECOM;
                 edtLinkInstagran.Text     := FRedesSociais.INSTACOM;
                 edtLinkTwitter.Text       := FRedesSociais.TWITERCOM;
                 edtLinkGooglePlus.Text    := FRedesSociais.GOOGLECOM;
                 edtLinkYoutube.Text       := FRedesSociais.TUBECOM;
                 edtLinkGooglePlay.Text    := FRedesSociais.APPCOM;
                 edtLinkAppleStore.Text    := FRedesSociais.APPLECOM;

            end;

end;

procedure InsertNewSubCategoria(AIdCategoria: Integer; ANomeSubCategoria : String);
begin

     ModelClientModule.ServerMethodsClient.InsertNewSubCategoria(AIdCategoria, cfgIdComercio, ANomeSubCategoria);

end;

function SolicitacoesNovaCategoria : Integer;
begin

     Result := ModelClientModule.ServerMethodsClient.SolicitacoesNovaCategoria(cfgIdComercio);

end;

procedure InsertCategoria(ACategoria, ADescricao : String);
begin

       ModelClientModule.ServerMethodsClient.InsertCategoria(ACategoria, ADescricao, cfgIdComercio);

end;

function LoadGrupoSelected(AIdCom : Integer) : Integer;
begin

     ModelClientModule.ServerMethodsClient.LoadGrupoSelected(AIdCom);

end;

procedure LoadSubGrupo(AIdGrupo : Integer);
var
    dsSubGrupo : TFDJSONDataSets;
begin

    dsSubGrupo  := ModelClientModule.ServerMethodsClient.LoadSubGrupo(AIdGrupo, cfgIdComercio);
    dmGeralClient.memSubGrupo.Active := False;
    dmGeralClient.memSubGrupo.AppendData(TFDJSONDataSetsReader.GetListValue(dsSubGrupo, 0));
    dmGeralClient.memSubGrupo.Active := True;

end;

procedure LoadSubCatCom(AIdCom : Integer);
var
    dsSubCatCom : TFDJSONDataSets;
begin

    dsSubCatCom  := ModelClientModule.ServerMethodsClient.LoadSubCatCom(AIdCom);
    dmGeralClient.memSubCatCom.Active := False;
    dmGeralClient.memSubCatCom.AppendData(TFDJSONDataSetsReader.GetListValue(dsSubCatCom, 0));
    dmGeralClient.memSubCatCom.Active := True;

end;

procedure InsertSubCatCom(AIdCom, AIdGrupo, AIdSubGrupo : Integer);
begin

     ModelClientModule.ServerMethodsClient.InsertSubCatCom(AIdCom, AIdGrupo, AIdSubGrupo);

end;

procedure ClearSubCatCom(AIdCom : Integer);
begin

     ModelClientModule.ServerMethodsClient.ClearSubCatCom(AIdCom);

end;


procedure UpdateGrupoCom(AIdCom, AIdGrupo: Integer);
begin

     ModelClientModule.ServerMethodsClient.UpdateGrupoCom(AIdCom, AIdGrupo);

end;

procedure AddCheckListNovo(ACheck : String; AIdCom : Integer);
begin

     ModelClientModule.ServerMethodsClient.AddCheckListNovo(ACheck, AIdCom);

end;

procedure AddCheckListCom(AIdCom, AIdCheck: Integer);
begin

     ModelClientModule.ServerMethodsClient.AddCheckListCom(AIdCOm, AIdCheck);

end;

function UpdateSenha(AIdCom : Integer; ASenha : String) : Boolean;
begin

    Result := ModelClientModule.ServerMethodsClient.UpdateSenha(AIdCom, ASenha);

end;

procedure ListaPlanos;
var
    dsPlanos : TFDJSONDataSets;
begin

    dsPlanos  := ModelClientModule.ServerMethodsClient.ListaPlanos;
    dmGeralClient.memPlanos.Active := False;
    dmGeralClient.memPlanos.AppendData(TFDJSONDataSetsReader.GetListValue(dsPlanos, 0));
    dmGeralClient.memPlanos.Active := True;

end;

procedure LoadGrupos(AIdCom : Integer; AStatus : String = 'F');
var
    dsGrupo : TFDJSONDataSets;
begin

    dsGrupo  := ModelClientModule.ServerMethodsClient.LoadGrupos(AIdCom, AStatus);
    dmGeralClient.memGrupo.Active := False;
    dmGeralClient.memGrupo.AppendData(TFDJSONDataSetsReader.GetListValue(dsGrupo, 0));
    dmGeralClient.memGrupo.Active := True;

end;


procedure LoadCheckList;
var
    dsCheckList : TFDJSONDataSets;
begin

    dsCheckList  := ModelClientModule.ServerMethodsClient.LoadCheckList(cfgIdComercio);
    dmGeralClient.memCheckList.Active := False;
    dmGeralClient.memCheckList.AppendData(TFDJSONDataSetsReader.GetListValue(dsCheckList, 0));
    dmGeralClient.memCheckList.Active := True;

end;

procedure LoadCheckListSelected(AIdComercio : Integer);
var
    dsCheckList : TFDJSONDataSets;
begin

    dsCheckList  := ModelClientModule.ServerMethodsClient.LoadComercio(AIdComercio);
    dmGeralClient.memCheckListSelected.Active := False;
    dmGeralClient.memCheckListSelected.AppendData(TFDJSONDataSetsReader.GetListValue(dsCheckList, 1));
    dmGeralClient.memCheckListSelected.Active := True;

end;

procedure DeleteFone(AIdFone : Integer);
begin

    ModelClientModule.ServerMethodsClient.DeleteFone(AIdFone);

end;

procedure getTelefone(AIdCom: Integer);
var
dsTelefones : TFDJSONDataSets;
begin

    dsTelefones := ModelClientModule.ServerMethodsClient.getTelefone(AIdCom);
    Assert(TFDJSONDataSetsReader.GetListCount(dsTelefones) = 1);
    dmGeralClient.memTelefones.Active := False;
    dmGeralClient.memTelefones.AppendData(TFDJSONDataSetsReader.GetListValue(dsTelefones, 0));
    dmGeralClient.memTelefones.Active := True;

end;

function getNovaSenha(ADoc : String) : Boolean;
var
    dsValidacao : TFDJSONDataSets;
begin

    dsValidacao := ModelClientModule.ServerMethodsClient.getControle;
    Assert(TFDJSONDataSetsReader.GetListCount(dsValidacao) = 1);
    dmGeralClient.memValidacao.Active := False;
    dmGeralClient.memValidacao.AppendData(TFDJSONDataSetsReader.GetListValue(dsValidacao, 0));
    dmGeralClient.memValidacao.Active := True;

    if dmGeralClient.memValidacao.RecordCount = 0 then
         Result := False else Result := True;

end;


procedure EnviarEmail(pCodigo, pAssunto, pNome, pEmail, pTipoEmail: string; pHtml : Boolean = True);
begin
    ModelClientModule.ServerMethodsClient.EnviarEmail(pCodigo, pAssunto, pNome, pEmail, pTipoEmail, pHtml);
end;

function TelRepetido(ATelefone : String) : Integer;
begin

    Result := ModelClientModule.ServerMethodsClient.TelRepetido(ATelefone);

end;

function AddComercioNovo(ARazao, AFantasia, ACep, AComplemento, ACNPJCPF, AIERG, AEmail, ASenha, ALoginFone: String; ANumero: Integer) : Integer;
begin

    Result := ModelClientModule.ServerMethodsClient.AddComercioNovo(ARazao, AFantasia, ACep, AComplemento, ACNPJCPF, AIERG, AEmail, ASenha, ALoginFone, ANumero);

end;

procedure AddTelefone(ATelefone, AContato, AZap, AInterno : String; AIdComFone : Integer; AIdFone : Integer = 0);
begin

    ModelClientModule.ServerMethodsClient.AddTelefone(ATelefone, AContato, AZap, AInterno, AIdComFone, AIdFone);

end;

function DocRepetido(AField, ADoc: String): Boolean;
begin

    Result := ModelClientModule.ServerMethodsClient.DocRepetido(AField, ADoc);

end;

function getLogin(ADoc, ASenha : String) : Boolean;
var
    dsLogin : TFDJSONDataSets;
begin
    dsLogin := ModelClientModule.ServerMethodsClient.getLogin(ADoc);
    Assert(TFDJSONDataSetsReader.GetListCount(dsLogin) = 1);
    dmGeralClient.memComercio.Active := False;
    dmGeralClient.memComercio.AppendData(TFDJSONDataSetsReader.GetListValue(dsLogin, 0));
    dmGeralClient.memComercio.Active := True;

    if dmGeralClient.memComercio.RecordCount = 0 then
        begin

            Result := False;

        end
    else
        begin

            if ASenha <> dmGeralClient.memComercio.FieldByName('PASSWORDCOM').AsString then
                begin

                    MessageBox(WindowHandleToPlatform(frmLoginPrincipal.Handle).Wnd,
                               'Usuário e/ou senha inválidos, verifique!',
                               'Guia Alvo', MB_OK + MB_ICONERROR);
                    Result := False;
                end
            else
                begin
                    Result := True;
                end;

        end;
end;

function getControle: TFDJSONDataSets;
var
  dsControle : TFDJSONDataSets;
begin
  dsControle := ModelClientModule.ServerMethodsClient.getControle;
  Assert(TFDJSONDataSetsReader.GetListCount(dsControle) = 1);
  dmGeralClient.memControle.Active := False;
  dmGeralClient.memControle.AppendData(TFDJSONDataSetsReader.GetListValue(dsControle, 0));
  dmGeralClient.memControle.Active := True;
end;

end.
