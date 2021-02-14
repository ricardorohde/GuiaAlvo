unit Server.Controller.Conexao;

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
dataSetConverter4D.Util;

procedure Conecta;
procedure Registry(App : THorse);

var
FCon : TFDConnection;

implementation

uses
  System.SysUtils, Server.Controller.Comercio;

procedure Registry(App : THorse);
begin

     App.Get('/comercio/:id', GetID);

end;


procedure Conecta;
var
   FPhysFd : TFDPhysFBDriverLink;

begin

    FCon := TFDConnection.Create(nil);

    FPhysFd := TFDPhysFBDriverLink.Create(nil);
    FPhysFd.VendorHome := 'C:\Program Files (x86)\Firebird\Firebird_2_5';
    FPhysFd.VendorLib := 'fbclient.dll';

    FCon.Params.DriverID := 'FB' ;
    FCon.Params.Database := 'E:\Projetos\Guia Alvo\trunk\Servidor\Win32\Dados\BDALVO.FDB';
    FCon.Params.UserName := 'SYSDBA';
    FCon.Params.Password := 'masterkey';
    FCon.Connected;

end;


end.
