unit unt_Conexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB, FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.IBBase, FireDAC.Comp.UI, FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBin, FireDAC.Phys.FB, FireDAC.Phys.FBDef;

type
  TdmConexao = class(TDataModule)
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    fdqryAuxiliar: TFDQuery;
    fdqryStatus: TFDQuery;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    fdConexao: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmConexao: TdmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}



procedure TdmConexao.DataModuleCreate(Sender: TObject);
begin

fdConexao.Params.Database := 'E:\MSSoftware\Projetos\GuiaAlvo\trunk\Servidor\Win32\Dados\BDALVO.FDB';//ExtractFileDir(GetCurrentDir) + '\Dados\BDALVO.FDB';

end;

end.
