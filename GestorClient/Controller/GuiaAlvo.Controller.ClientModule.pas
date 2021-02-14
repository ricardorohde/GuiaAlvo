unit GuiaAlvo.Controller.ClientModule;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSClientRest, GuiaAlvo.Model.Proxy;

type
  TModelClientModule = class(TDataModule)
    DSRestConnection: TDSRestConnection;
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
  ModelClientModule: TModelClientModule;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}


{$R *.dfm}

constructor TModelClientModule.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

destructor TModelClientModule.Destroy;
begin
  FServerMethodsClient.Free;
  inherited;
end;

function TModelClientModule.GetServerMethodsClient: TServerMethodsClient;
begin
  if FServerMethodsClient = nil then
    FServerMethodsClient:= TServerMethodsClient.Create(DSRestConnection, FInstanceOwner);
  Result := FServerMethodsClient;
end;

end.
