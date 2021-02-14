unit GuiaAlvo.Model.RedesSociais;

interface


type

    TRedeSocial = class

    private
    FAPPLECOM: String;
    FTUBECOM: String;
    FGOOGLECOM: String;
    FUBEREATSCOM: String;
    FAPPCOM: String;
    FTWITERCOM: String;
    FINSTACOM: String;
    FEMAILCOM: String;
    FSITECOM: String;
    FFACECOM: String;
    procedure SetAPPCOM(const Value: String);
    procedure SetAPPLECOM(const Value: String);
    procedure SetEMAILCOM(const Value: String);
    procedure SetFACECOM(const Value: String);
    procedure SetGOOGLECOM(const Value: String);
    procedure SetINSTACOM(const Value: String);
    procedure SetSITECOM(const Value: String);
    procedure SetTUBECOM(const Value: String);
    procedure SetTWITERCOM(const Value: String);
    procedure SetUBEREATSCOM(const Value: String);

    public
    property SITECOM     : String read FSITECOM write SetSITECOM;
    property EMAILCOM    : String read FEMAILCOM write SetEMAILCOM;
    property FACECOM     : String read FFACECOM write SetFACECOM;
    property INSTACOM    : String read FINSTACOM write SetINSTACOM;
    property TWITERCOM   : String read FTWITERCOM write SetTWITERCOM;
    property GOOGLECOM   : String read FGOOGLECOM write SetGOOGLECOM;
    property TUBECOM     : String read FTUBECOM write SetTUBECOM;
    property APPCOM      : String read FAPPCOM write SetAPPCOM;
    property UBEREATSCOM : String read FUBEREATSCOM write SetUBEREATSCOM;
    property APPLECOM    : String read FAPPLECOM write SetAPPLECOM;
    end;

implementation



{ TRedeSocial }

procedure TRedeSocial.SetAPPCOM(const Value: String);
begin
  FAPPCOM := Value;
end;

procedure TRedeSocial.SetAPPLECOM(const Value: String);
begin
  FAPPLECOM := Value;
end;

procedure TRedeSocial.SetEMAILCOM(const Value: String);
begin
  FEMAILCOM := Value;
end;

procedure TRedeSocial.SetFACECOM(const Value: String);
begin
  FFACECOM := Value;
end;

procedure TRedeSocial.SetGOOGLECOM(const Value: String);
begin
  FGOOGLECOM := Value;
end;

procedure TRedeSocial.SetINSTACOM(const Value: String);
begin
  FINSTACOM := Value;
end;

procedure TRedeSocial.SetSITECOM(const Value: String);
begin
  FSITECOM := Value;
end;

procedure TRedeSocial.SetTUBECOM(const Value: String);
begin
  FTUBECOM := Value;
end;

procedure TRedeSocial.SetTWITERCOM(const Value: String);
begin
  FTWITERCOM := Value;
end;

procedure TRedeSocial.SetUBEREATSCOM(const Value: String);
begin
  FUBEREATSCOM := Value;
end;

end.
