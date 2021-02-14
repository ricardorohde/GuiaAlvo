unit GuiaAlvo.Model.Comercio;

interface

uses GuiaAlvo.Model.Delivery, GuiaAlvo.Model.RedesSociais;

type

    TComercio = class

    private
    FFContato: String;
    FFCelular: String;
    FFCnpj: String;
    FFFantasia: String;
    FFNumeroLog: Integer;
    FFComplLog: String;
    FFCep: String;
    FFIE: String;
    FFRazaoSocial: String;
    FFSenha: String;
    FRedesSociais: TRedeSocial;
    FDelivery: TDelivery;
    procedure SetFCelular(const Value: String);
    procedure SetFCep(const Value: String);
    procedure SetFCnpj(const Value: String);
    procedure SetFComplLog(const Value: String);
    procedure SetFContato(const Value: String);
    procedure SetFFantasia(const Value: String);
    procedure SetFIE(const Value: String);
    procedure SetFNumeroLog(const Value: Integer);
    procedure SetFRazaoSocial(const Value: String);
    procedure SetFSenha(const Value: String);
    procedure SetDelivery(const Value: TDelivery);
    procedure SetRedesSociais(const Value: TRedeSocial);


    public
    constructor Create;

    property FFantasia: String read FFFantasia write SetFFantasia;
    property FCnpj: String read FFCnpj write SetFCnpj;
    property FComplLog: String read FFComplLog write SetFComplLog;
    property FNumeroLog: Integer read FFNumeroLog write SetFNumeroLog;
    property FCep: String read FFCep write SetFCep;
    property FIE: String read FFIE write SetFIE;
    property FRazaoSocial: String read FFRazaoSocial write SetFRazaoSocial;
    property FSenha: String read FFSenha write SetFSenha;
    property FContato: String read FFContato write SetFContato;
    property FCelular: String read FFCelular write SetFCelular;
    property Delivery : TDelivery read FDelivery write SetDelivery;
    property RedesSociais : TRedeSocial read FRedesSociais write SetRedesSociais;

    end;

implementation


{ TComercio }

constructor TComercio.Create;
begin
  FRedesSociais := TRedeSocial.Create;
  FDelivery := TDelivery.Create;

end;

procedure TComercio.SetDelivery(const Value: TDelivery);
begin
  FDelivery := Value;
end;

procedure TComercio.SetFCelular(const Value: String);
begin
  FFCelular := Value;
end;

procedure TComercio.SetFCep(const Value: String);
begin
  FFCep := Value;
end;

procedure TComercio.SetFCnpj(const Value: String);
begin
  FFCnpj := Value;
end;

procedure TComercio.SetFComplLog(const Value: String);
begin
  FFComplLog := Value;
end;

procedure TComercio.SetFContato(const Value: String);
begin
  FFContato := Value;
end;

procedure TComercio.SetFFantasia(const Value: String);
begin
  FFFantasia := Value;
end;

procedure TComercio.SetFIE(const Value: String);
begin
  FFIE := Value;
end;

procedure TComercio.SetFNumeroLog(const Value: Integer);
begin
  FFNumeroLog := Value;
end;

procedure TComercio.SetFRazaoSocial(const Value: String);
begin
  FFRazaoSocial := Value;
end;

procedure TComercio.SetFSenha(const Value: String);
begin
  FFSenha := Value;
end;

procedure TComercio.SetRedesSociais(const Value: TRedeSocial);
begin
  FRedesSociais := Value;
end;

end.
