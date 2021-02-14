unit GuiaAlvo.Model.Contrato;

interface

uses GuiaAlvo.Model.Comercio;


type
//    TTipoContrato = (tcBasico, tcPlus, tcFotosI, tcFotosII, tcAnuncioI, tcAnuncioII, tcFull);

    TContrato = class

    private
    FFVISIVELPESQUISAS: BOOLEAN;
    FFANUNCIOSECAO: BOOLEAN;
    FFQTDEFOTOS: INTEGER;
    FFGRAFICOESTATISTICA: BOOLEAN;
    FFANUNCIODESTAQUE: BOOLEAN;
    FFVISIVELSECOES: BOOLEAN;
    FFIDPLANO: INTEGER;
    FFQTDEANUNCIOPUSH: INTEGER;
    FFQTDEPUSHANUNCIO: INTEGER;
    FFPUSHALTERACAO: BOOLEAN;
    FFREDESSOCIAIS: BOOLEAN;
    FFANUNCIOPRINCIPAL: BOOLEAN;
    FFLINKAPP: BOOLEAN;
    FFPUSHINCLUSAO: BOOLEAN;
    FFPUSHINFORMATIVO: INTEGER;
    FFNOMEPLANO: STRING;
    FFDELIVERYS: BOOLEAN;
    FFCRIACAOARTE: BOOLEAN;
    FFRESPOSTAAVALIACAO: BOOLEAN;
    procedure SetFANUNCIODESTAQUE(const Value: BOOLEAN);
    procedure SetFANUNCIOPRINCIPAL(const Value: BOOLEAN);
    procedure SetFANUNCIOSECAO(const Value: BOOLEAN);
    procedure SetFCRIACAOARTE(const Value: BOOLEAN);
    procedure SetFDELIVERYS(const Value: BOOLEAN);
    procedure SetFGRAFICOESTATISTICA(const Value: BOOLEAN);
    procedure SetFIDPLANO(const Value: INTEGER);
    procedure SetFLINKAPP(const Value: BOOLEAN);
    procedure SetFNOMEPLANO(const Value: STRING);
    procedure SetFPUSHALTERACAO(const Value: BOOLEAN);
    procedure SetFPUSHINCLUSAO(const Value: BOOLEAN);
    procedure SetFPUSHINFORMATIVO(const Value: INTEGER);
    procedure SetFQTDEANUNCIOPUSH(const Value: INTEGER);
    procedure SetFQTDEFOTOS(const Value: INTEGER);
    procedure SetFQTDEPUSHANUNCIO(const Value: INTEGER);
    procedure SetFREDESSOCIAIS(const Value: BOOLEAN);
    procedure SetFRESPOSTAAVALIACAO(const Value: BOOLEAN);
    procedure SetFVISIVELPESQUISAS(const Value: BOOLEAN);
    procedure SetFVISIVELSECOES(const Value: BOOLEAN);

    public

    property FPUSHALTERACAO: BOOLEAN read FFPUSHALTERACAO write SetFPUSHALTERACAO;
    property FREDESSOCIAIS: BOOLEAN read FFREDESSOCIAIS write SetFREDESSOCIAIS;
    property FANUNCIOPRINCIPAL: BOOLEAN read FFANUNCIOPRINCIPAL write SetFANUNCIOPRINCIPAL;
    property FPUSHINCLUSAO: BOOLEAN read FFPUSHINCLUSAO write SetFPUSHINCLUSAO;
    property FLINKAPP: BOOLEAN read FFLINKAPP write SetFLINKAPP;
    property FPUSHINFORMATIVO: INTEGER read FFPUSHINFORMATIVO write SetFPUSHINFORMATIVO;
    property FNOMEPLANO: STRING read FFNOMEPLANO write SetFNOMEPLANO;
    property FDELIVERYS: BOOLEAN read FFDELIVERYS write SetFDELIVERYS;
    property FCRIACAOARTE: BOOLEAN read FFCRIACAOARTE write SetFCRIACAOARTE;
    property FRESPOSTAAVALIACAO: BOOLEAN read FFRESPOSTAAVALIACAO write SetFRESPOSTAAVALIACAO;
    property FANUNCIOSECAO: BOOLEAN read FFANUNCIOSECAO write SetFANUNCIOSECAO;
    property FVISIVELPESQUISAS: BOOLEAN read FFVISIVELPESQUISAS write SetFVISIVELPESQUISAS;
    property FQTDEFOTOS: INTEGER read FFQTDEFOTOS write SetFQTDEFOTOS;
    property FGRAFICOESTATISTICA: BOOLEAN read FFGRAFICOESTATISTICA write SetFGRAFICOESTATISTICA;
    property FANUNCIODESTAQUE: BOOLEAN read FFANUNCIODESTAQUE write SetFANUNCIODESTAQUE;
    property FVISIVELSECOES: BOOLEAN read FFVISIVELSECOES write SetFVISIVELSECOES;
    property FQTDEPUSHANUNCIO: INTEGER read FFQTDEPUSHANUNCIO write SetFQTDEPUSHANUNCIO;
    property FQTDEANUNCIOPUSH: INTEGER read FFQTDEANUNCIOPUSH write SetFQTDEANUNCIOPUSH;
    property FIDPLANO: INTEGER read FFIDPLANO write SetFIDPLANO;


    end;

implementation





{ TContrato }

procedure TContrato.SetFANUNCIODESTAQUE(const Value: BOOLEAN);
begin
  FFANUNCIODESTAQUE := Value;
end;

procedure TContrato.SetFANUNCIOPRINCIPAL(const Value: BOOLEAN);
begin
  FFANUNCIOPRINCIPAL := Value;
end;

procedure TContrato.SetFANUNCIOSECAO(const Value: BOOLEAN);
begin
  FFANUNCIOSECAO := Value;
end;

procedure TContrato.SetFCRIACAOARTE(const Value: BOOLEAN);
begin
  FFCRIACAOARTE := Value;
end;

procedure TContrato.SetFDELIVERYS(const Value: BOOLEAN);
begin
  FFDELIVERYS := Value;
end;

procedure TContrato.SetFGRAFICOESTATISTICA(const Value: BOOLEAN);
begin
  FFGRAFICOESTATISTICA := Value;
end;

procedure TContrato.SetFIDPLANO(const Value: INTEGER);
begin
  FFIDPLANO := Value;
end;

procedure TContrato.SetFLINKAPP(const Value: BOOLEAN);
begin
  FFLINKAPP := Value;
end;

procedure TContrato.SetFNOMEPLANO(const Value: STRING);
begin
  FFNOMEPLANO := Value;
end;

procedure TContrato.SetFPUSHALTERACAO(const Value: BOOLEAN);
begin
  FFPUSHALTERACAO := Value;
end;

procedure TContrato.SetFPUSHINCLUSAO(const Value: BOOLEAN);
begin
  FFPUSHINCLUSAO := Value;
end;

procedure TContrato.SetFPUSHINFORMATIVO(const Value: INTEGER);
begin
  FFPUSHINFORMATIVO := Value;
end;

procedure TContrato.SetFQTDEANUNCIOPUSH(const Value: INTEGER);
begin
  FFQTDEANUNCIOPUSH := Value;
end;

procedure TContrato.SetFQTDEFOTOS(const Value: INTEGER);
begin
  FFQTDEFOTOS := Value;
end;

procedure TContrato.SetFQTDEPUSHANUNCIO(const Value: INTEGER);
begin
  FFQTDEPUSHANUNCIO := Value;
end;

procedure TContrato.SetFREDESSOCIAIS(const Value: BOOLEAN);
begin
  FFREDESSOCIAIS := Value;
end;

procedure TContrato.SetFRESPOSTAAVALIACAO(const Value: BOOLEAN);
begin
  FFRESPOSTAAVALIACAO := Value;
end;

procedure TContrato.SetFVISIVELPESQUISAS(const Value: BOOLEAN);
begin
  FFVISIVELPESQUISAS := Value;
end;

procedure TContrato.SetFVISIVELSECOES(const Value: BOOLEAN);
begin
  FFVISIVELSECOES := Value;
end;

end.
