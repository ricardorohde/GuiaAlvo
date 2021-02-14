unit untLoginDmGeral;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Phys.IBDef, FireDAC.Phys.FBDef,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.IB, FireDAC.FMXUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.IBBase;

type
  TdmLoginGeral = class(TDataModule)
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    Conexao: TFDConnection;
    fdqryUsuarios: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmLoginGeral: TdmLoginGeral;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
