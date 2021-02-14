unit Guia.untClientmodule;

interface

uses
  System.SysUtils, System.Classes,  Datasnap.DSClientRest, Guia.Proxy;

type
  Tcm = class(TDataModule)
    DSRestConnection1: TDSRestConnection;
  private
    FInstanceOwner: Boolean;
    FServerMethodsClient: TServerMethodsClient;
    function GetServerMethodsClient: TServerMethodsClient;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property ServerMethodsClient: TServerMethodsClient read GetServerMethodsClient write FServerMethodsClient;

end;

var
  cm: Tcm;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

constructor Tcm.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

destructor Tcm.Destroy;
begin
  FServerMethodsClient.Free;
  inherited;
end;

function Tcm.GetServerMethodsClient: TServerMethodsClient;
begin
  if FServerMethodsClient = nil then
    FServerMethodsClient:= TServerMethodsClient.Create(DSRestConnection1, FInstanceOwner);
  Result := FServerMethodsClient;
end;

end.
