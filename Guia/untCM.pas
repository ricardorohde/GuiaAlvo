unit untCM;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSClientRest, Proxy;

type
  TCM = class(TDataModule)
    DSRestConnection1: TDSRestConnection;
  private
    FInstanceOwner: Boolean;
    FServerMethods1Client: TMetodosGeraisClient;
    function GetServerMethods1Client: TMetodosGeraisClient;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property ServerMethods1Client: TMetodosGeraisClient read GetServerMethods1Client write FServerMethods1Client;

end;

var
  CM: TCM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}


{$R *.dfm}

constructor TCM.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

destructor TCM.Destroy;
begin
  FServerMethods1Client.Free;
  inherited;
end;

function TCM.GetServerMethods1Client: TMetodosGeraisClient;
begin
  if FServerMethods1Client = nil then
    FServerMethods1Client:= TMetodosGeraisClient.Create(DSRestConnection1, FInstanceOwner);
  Result := FServerMethods1Client;
end;

end.
