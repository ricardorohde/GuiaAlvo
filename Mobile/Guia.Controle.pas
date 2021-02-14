unit Guia.Controle;

interface

uses
FireDAC.Comp.Client,
IdHashMessageDigest, System.UITypes;

procedure LoadControle(AQuery : TFDMemTable);
function MD5(const ASenha : String) : String;

var
ctrHOSTFTP              : String;
ctrSENHAFTP             : String;
ctrPORTAFTP             : Integer;
ctrUSUARIOFTP           : String;
ctrPATHRAIZFTP          : String;
ctrPATHFOTOSFTP         : String;
ctrPATHTEXTFTP          : String;
ctrPATHLOGOSFTP         : String;
ctrPATHICONESFTP        : String;
ctrSIZEIMGDESTAKE       : String;
ctrSIZEIMGSECOES        : String;
ctrSIZEIMGCHECKLIST     : String;
ctrSIZELOGOCOMERCIO     : String;
ctrFILTROPALAVRAS       : String;
ctrPATHPUSHFTP          : String;
ctrPATHANUNCIOSFTP      : String;
ctrSIZEANUNCIOCOMERCIO  : String;
ctrTEMPOEXIBICAOPUSH    : Integer;
ctrINDICEAVALIACAO      : Integer;
ctrTEMPOEXIBICAOANUNCIO : Integer;
ctrIDPROJETOPUSH        : String;
ctrKEYPUSH              : String;
ctrDIASAVALIACAO        : Integer;
ctrLINKLOJAAPP          : String;
ctrRAIOPADRAO           : Integer;
ctrRAIOMINIMO           : Integer;
ctrRAIOMAXIMO           : Integer;
ctrEMAILNOVOCHECKLIST   : String;
ctrPRECOBASE            : Currency;

cfgCinzaLogo            : TAlphaColor;
cfgAzulLogo             : TAlphaColor;
cfgCorErro              : TAlphaColor;

cfgValidacaoCelular     : String;
cfgValidacaoEmail       : String;

cfgEmailValidado        : Boolean = False;
cfgCelularValidado      : Boolean = False;

cfgIdComercio           : Integer ;
cfgIdCategoria          : Integer;
cfgQtdeAnuncio          : Integer;
cfgAlteraAvaliacao      : Boolean = True;
cfgPlanoSelecionado     : String = '{"Plano":-1,"Periodo":-1}';

implementation

uses
  System.SysUtils, System.UIConsts;

function MD5(const ASenha : String) : String;
var
   idmd5 : TIdHashMessageDigest5;
begin

  idmd5 := TIdHashMessageDigest5.Create;
  try

     Result := idmd5.HashStringAsHex(ASenha);

  finally

     idmd5.Free;

  end;

end;

function getValueControle(AQuery :TFDMemTable; AControle : String; ABlob : Boolean = False) : String;
begin

    AQuery.Filter := 'NOME_CONTROLE = ' + QuotedStr(AControle);
    AQuery.Filtered := True;

    if not ABlob then
       Result := AQuery.FieldByName('VALOR_CONTROLE').AsString else
       Result := AQuery.FieldByName('VALOR_BLOB').AsString

end;


procedure LoadControle(AQuery : TFDMemTable);
begin

ctrHOSTFTP              := getValueControle(AQuery, 'HOSTFTP');
ctrSENHAFTP             := getValueControle(AQuery, 'SENHAFTP');
ctrPORTAFTP             := getValueControle(AQuery, 'PORTAFTP').ToInteger;
ctrUSUARIOFTP           := getValueControle(AQuery, 'USUARIOFTP');
ctrPATHRAIZFTP          := getValueControle(AQuery, 'PATHRAIZFTP');
ctrPATHFOTOSFTP         := getValueControle(AQuery, 'PATHFOTOSFTP');
ctrPATHTEXTFTP          := getValueControle(AQuery, 'PATHTEXTFTP');
ctrPATHLOGOSFTP         := getValueControle(AQuery, 'PATHLOGOSFTP');
ctrPATHICONESFTP        := getValueControle(AQuery, 'PATHICONESFTP');
ctrSIZEIMGDESTAKE       := getValueControle(AQuery, 'SIZEIMGDESTAKE');
ctrSIZEIMGSECOES        := getValueControle(AQuery, 'SIZEIMGSECOES');
ctrSIZEIMGCHECKLIST     := getValueControle(AQuery, 'SIZEIMGCHECKLIST');
ctrSIZELOGOCOMERCIO     := getValueControle(AQuery, 'SIZELOGOCOMERCIO');
ctrSIZEANUNCIOCOMERCIO  := getValueControle(AQuery, 'SIZEANUNCIOCOMERCIO');
ctrFILTROPALAVRAS       := getValueControle(AQuery, 'FILTROPALAVRAS');
ctrINDICEAVALIACAO      := getValueControle(AQuery, 'INDICEAVALIACAO').ToInteger;
ctrPATHPUSHFTP          := getValueControle(AQuery, 'PATHPUSHFTP');
ctrTEMPOEXIBICAOPUSH    := getValueControle(AQuery, 'TEMPOEXIBICAOPUSH').ToInteger;
ctrPATHANUNCIOSFTP      := getValueControle(AQuery, 'PATHANUNCIOSFTP');
ctrTEMPOEXIBICAOANUNCIO := getValueControle(AQuery, 'TEMPOEXIBICAOANUNCIO').ToInteger;
ctrIDPROJETOPUSH        := getValueControle(AQuery, 'IDPROJETOPUSH');
ctrKEYPUSH              := getValueControle(AQuery, 'KEYPUSH', True);
ctrDIASAVALIACAO        := getValueControle(AQuery, 'DIASAVALIACAO').ToInteger;
ctrLINKLOJAAPP          := getValueControle(AQuery, 'LINKLOJAAPP');
ctrRAIOPADRAO           := getValueControle(AQuery, 'RAIOPADRAO').ToInteger;
ctrRAIOMINIMO           := getValueControle(AQuery, 'RAIOMINIMO').ToInteger;
ctrRAIOMAXIMO           := getValueControle(AQuery, 'RAIOMAXIMO').ToInteger;
ctrPRECOBASE            := StrToCurr(getValueControle(AQuery, 'PRECOBASE'));
cfgCinzaLogo            := StringToAlphaColor('#FF616161');
cfgAzulLogo             := StringToAlphaColor('#FF5693CE');
cfgCorErro              := StringToAlphaColor('#FFFFD3D3');
AQuery.Close;

end;

end.

