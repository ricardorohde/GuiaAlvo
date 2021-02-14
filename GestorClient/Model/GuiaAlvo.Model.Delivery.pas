unit GuiaAlvo.Model.Delivery;

interface


type

    TDelivery = class

    private
    FAPPLECOM: String;
    FRAPPICOM: String;
    FIFOODCOM: String;
    procedure SetAPPLECOM(const Value: String);
    procedure SetIFOODCOM(const Value: String);
    procedure SetRAPPICOM(const Value: String);

    public

    property RAPPICOM    : String read FRAPPICOM write SetRAPPICOM;
    property IFOODCOM    : String read FIFOODCOM write SetIFOODCOM;
    property APPLECOM    : String read FAPPLECOM write SetAPPLECOM;

    End;

implementation


{ TDelivery }

procedure TDelivery.SetAPPLECOM(const Value: String);
begin
  FAPPLECOM := Value;
end;

procedure TDelivery.SetIFOODCOM(const Value: String);
begin
  FIFOODCOM := Value;
end;

procedure TDelivery.SetRAPPICOM(const Value: String);
begin
  FRAPPICOM := Value;
end;

end.
