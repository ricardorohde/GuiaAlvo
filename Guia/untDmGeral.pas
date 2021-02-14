unit untDmGeral;

interface

uses
   System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
   FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
   FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
   FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.SQLite,
   FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait,
   FireDAC.Stan.StorageBin, FireDAC.Comp.UI, Data.DB, FireDAC.Comp.Client,
   FireDAC.Comp.DataSet, FireDAC.Phys.IB, FireDAC.Phys.IBDef,
   FireDAC.Phys.IBBase,
   FireDAC.Phys.FBDef, FireDAC.Phys.FB, IdBaseComponent, IdComponent,
   IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdFTP,
   Data.FireDACJSONReflect, REST.Types, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, REST.Response.Adapter;

type
   TdmGeral = class(TDataModule)
      qryGeral: TFDQuery;
    qryFiles: TFDQuery;
    qryCheckList: TFDQuery;
    qryCategoria: TFDQuery;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    RESTResponse1: TRESTResponse;
    restCEP: TRESTRequest;
    RESTClient1: TRESTClient;
    fdmemCep: TFDMemTable;
    fdmemCepcep: TWideStringField;
    fdmemCeplogradouro: TWideStringField;
    fdmemCepbairro: TWideStringField;
    fdmemCeplocalidade: TWideStringField;
    fdmemCepuf: TWideStringField;
    restLogradouro: TRESTRequest;
    Conexao: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    procedure DataModuleCreate(Sender: TObject);
    procedure ConsultaCep(ACep: String);
    procedure ConsultaLogradouro(AUF, ACidade, ALogradouro : String; AContenha : Boolean = False);
   private


      { Private declarations }
   public
      { Public declarations }
   end;

var
   dmGeral: TdmGeral;
   gDataBase: String;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses untGlobal, untCM;

{$R *.dfm}

procedure TdmGeral.ConsultaCep(ACep : String);
begin

     fdmemCep.Close;

     restCEP.Params.ParameterByName('pCEP').Value := ACep;
     restCEP.Execute;

end;

procedure TdmGeral.ConsultaLogradouro(AUF, ACidade, ALogradouro : String; AContenha : Boolean = False);
begin

     fdmemCep.Close;

     restLogradouro.Params.ParameterByName('rEstado').Value         := AUF;
     restLogradouro.Params.ParameterByName('rCidade').Value     := ACidade;

     if AContenha = True then
          ALogradouro := StringReplace(ALogradouro,' ','+',[rfReplaceAll,rfIgnoreCase]);

     restLogradouro.Params.ParameterByName('rLogradouro').Value := ALogradouro;

     restLogradouro.Execute;

end;

procedure TdmGeral.DataModuleCreate(Sender: TObject);
begin
   gPathArquivos := ExtractFilePath(ParamStr(0)) + 'Arquivos\';
   gLimiteFindCep := 100;
   gDiasStatus := 15;
   gDiasVencto := 5;
   if not DirectoryExists(gPathArquivos) then
      CreateDir(gPathArquivos);
   { gDataBase := ExtractFilePath(ParamStr(0))+'bd\BDALVOLESTE.FDB';
     Conexao.Params.Database := gDataBase;
     Conexao.Params.UserName := 'SYSDBA';
     Conexao.Params.Password := 'masterkey'; }
end;

end.
