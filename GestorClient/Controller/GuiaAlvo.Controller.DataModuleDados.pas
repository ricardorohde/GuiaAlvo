unit GuiaAlvo.Controller.DataModuleDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, REST.Types, REST.Response.Adapter, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.StorageBin;

type
  TdmGeralClient = class(TDataModule)
    fdmemCep: TFDMemTable;
    fdmemCepcep: TWideStringField;
    fdmemCeplogradouro: TWideStringField;
    fdmemCepbairro: TWideStringField;
    fdmemCeplocalidade: TWideStringField;
    fdmemCepuf: TWideStringField;
    RESTClient1: TRESTClient;
    restCEP: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    memControle: TFDMemTable;
    memValidacao: TFDMemTable;
    memComercio: TFDMemTable;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    memTelefones: TFDMemTable;
    memCheckList: TFDMemTable;
    memCheckListSelected: TFDMemTable;
    memGrupo: TFDMemTable;
    memSubGrupo: TFDMemTable;
    memSubCatCom: TFDMemTable;
    memFichaComercio: TFDMemTable;
    memPlanos: TFDMemTable;
  private
    { Private declarations }
  public
    procedure ConsultaCep(ACep : String);
  end;

var
  dmGeralClient: TdmGeralClient;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}



procedure TdmGeralClient.ConsultaCep(ACep : String);
begin

     fdmemCep.Close;

     restCEP.Params.ParameterByName('pCEP').Value := ACep;
     restCEP.Execute;

end;

end.
