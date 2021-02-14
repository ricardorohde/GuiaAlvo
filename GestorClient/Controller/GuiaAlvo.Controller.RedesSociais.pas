unit GuiaAlvo.Controller.RedesSociais;

interface

uses GuiaAlvo.Model.RedesSociais, GuiaAlvo.Model.FuncoesServidor;

type
TControllerRedesSociais = class

    private
    protected

    public

          function SalvaRedesSociais(AValores : TRedeSocial) : Boolean;

    end;


implementation

uses
  System.SysUtils;

{ TControllerRedesSociais }

function TControllerRedesSociais.SalvaRedesSociais(AValores: TRedeSocial) : Boolean;
begin

     Result := gravaRedesSociais(AValores.FACECOM, AValores.INSTACOM, AValores.TWITERCOM, AValores.TUBECOM, AValores.GOOGLECOM,
                                 AValores.SITECOM, AValores.EMAILCOM, AValores.APPCOM, AValores.APPLECOM);

end;

end.
