unit GuiaAlvo.View.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls, FMX.WebBrowser,
  FMX.Objects, FMX.Layouts, FMX.TabControl, FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, FMX.Effects,
  FMX.DateTimeCtrls, FMX.ScrollBox, FMX.Memo, FMX.TMSListEditor, System.Actions, FMX.ActnList, uFormat, uFuncoes,
  FMX.Ani, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdFTP, System.Rtti, FMX.Grid.Style,
  FMX.Grid, FMX.TMSListView, IdFTPCommon, FMX.ListBox,  System.SyncObjs, FMX.Filter.Effects,
  FMX.TMSBaseControl, FMX.TMSRating, GuiaAlvo.Model.FuncoesServidor, GuiaAlvo.Controller.RedesSociais, GuiaAlvo.Model.RedesSociais;

type
   TMyThread = class(TThread)
   private
        FUrlFtp, FFileFtp : String;
        FImage : TListItemImage;
        FimgImage : TImage;
        FAniLoading : TAniIndicator;
        Fms: TMemoryStream;
   public

        procedure LoadingImages(APathFtp, ANomeImage : String; AImage : TImage; AListImage : TListItemImage; ALoading : TAniIndicator);

   protected
        procedure Execute; override;
        constructor create;
   end;

  TfrmGestorClient = class(TForm)
    recMenuLateral: TRectangle;
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    Layout4: TLayout;
    Circle1: TCircle;
    Circle2: TCircle;
    Label1: TLabel;
    Layout5: TLayout;
    Layout6: TLayout;
    Layout7: TLayout;
    Label2: TLabel;
    Circle3: TCircle;
    Label3: TLabel;
    Label4: TLabel;
    Line1: TLine;
    VertScrollBox1: TVertScrollBox;
    recMenu1: TRectangle;
    Layout8: TLayout;
    Layout9: TLayout;
    Label5: TLabel;
    recMenu10: TRectangle;
    Layout10: TLayout;
    Layout11: TLayout;
    Label6: TLabel;
    recMenu8: TRectangle;
    Layout12: TLayout;
    Layout13: TLayout;
    Label7: TLabel;
    recMenu7: TRectangle;
    Layout14: TLayout;
    Layout15: TLayout;
    Label8: TLabel;
    recMenu6: TRectangle;
    Layout16: TLayout;
    Layout17: TLayout;
    Label9: TLabel;
    recMenu4: TRectangle;
    Layout20: TLayout;
    Layout21: TLayout;
    Label11: TLabel;
    recMenu3: TRectangle;
    Layout22: TLayout;
    Layout23: TLayout;
    Label12: TLabel;
    recMenu2: TRectangle;
    Layout24: TLayout;
    Layout25: TLayout;
    Label13: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    tabMenu: TTabControl;
    tbiCadastro: TTabItem;
    StyleBook1: TStyleBook;
    tbiAvaliacoes: TTabItem;
    Rectangle1: TRectangle;
    Layout26: TLayout;
    Image10: TImage;
    Layout27: TLayout;
    Label14: TLabel;
    Rectangle2: TRectangle;
    Layout28: TLayout;
    Image11: TImage;
    Layout29: TLayout;
    Label15: TLabel;
    lytView: TLayout;
    Layout31: TLayout;
    Image12: TImage;
    imgchbChecked: TImage;
    imgchbUnchecked: TImage;
    imgNull: TImage;
    recModal: TRectangle;
    recAddCheckList: TRectangle;
    ShadowEffect1: TShadowEffect;
    Layout36: TLayout;
    Image31: TImage;
    Layout37: TLayout;
    Label33: TLabel;
    Rectangle20: TRectangle;
    Label35: TLabel;
    Rectangle21: TRectangle;
    Label36: TLabel;
    Rectangle22: TRectangle;
    Label37: TLabel;
    tbcGuiaAlvo: TTabControl;
    tbiRedesSociais: TTabItem;
    tbiDeliverys: TTabItem;
    Layout33: TLayout;
    Line4: TLine;
    Line5: TLine;
    Image23: TImage;
    Label17: TLabel;
    Label18: TLabel;
    Image24: TImage;
    Image25: TImage;
    Image26: TImage;
    Rectangle12: TRectangle;
    edtIFood: TEdit;
    Rectangle13: TRectangle;
    edtUberEats: TEdit;
    Rectangle14: TRectangle;
    edtRappi: TEdit;
    tbiTelefones: TTabItem;
    Layout34: TLayout;
    Line6: TLine;
    Line7: TLine;
    Image27: TImage;
    Label19: TLabel;
    Label21: TLabel;
    Rectangle15: TRectangle;
    edtTelefone: TEdit;
    Rectangle16: TRectangle;
    edtContato: TEdit;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    chkZap: TImage;
    chkInterno: TImage;
    imgWhatsApp: TImage;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Rectangle17: TRectangle;
    Label29: TLabel;
    tbiCheckList: TTabItem;
    Layout35: TLayout;
    Line8: TLine;
    Line9: TLine;
    Image30: TImage;
    Label30: TLabel;
    Label31: TLabel;
    tbiGrupo: TTabItem;
    tbiImagens: TTabItem;
    tbiSobre: TTabItem;
    tbiAvaliacao: TTabItem;
    Rectangle23: TRectangle;
    Label32: TLabel;
    Layout38: TLayout;
    Line10: TLine;
    Line11: TLine;
    Image29: TImage;
    Label38: TLabel;
    Label39: TLabel;
    Rectangle24: TRectangle;
    Rectangle25: TRectangle;
    Rectangle26: TRectangle;
    Rectangle27: TRectangle;
    lstvSubGrupo: TListView;
    Label40: TLabel;
    Label41: TLabel;
    Rectangle28: TRectangle;
    Label42: TLabel;
    lstvGrupo: TListView;
    Layout39: TLayout;
    Line12: TLine;
    Line13: TLine;
    Image32: TImage;
    Label44: TLabel;
    Label45: TLabel;
    recLogo: TRectangle;
    recAnuncioPrincipal: TRectangle;
    GridLayout: TGridLayout;
    Line14: TLine;
    imgLixeiraFoto: TImage;
    tbiFuncionamento: TTabItem;
    Layout56: TLayout;
    Line15: TLine;
    Line16: TLine;
    Image57: TImage;
    Label51: TLabel;
    Label52: TLabel;
    edtAbreSeg: TTimeEdit;
    Rectangle58: TRectangle;
    Rectangle59: TRectangle;
    edtParaSeg: TTimeEdit;
    Rectangle60: TRectangle;
    edtFechaSeg: TTimeEdit;
    Rectangle61: TRectangle;
    edtVoltaSeg: TTimeEdit;
    Rectangle62: TRectangle;
    edtParaTer: TTimeEdit;
    Rectangle63: TRectangle;
    edtAbreTer: TTimeEdit;
    Rectangle64: TRectangle;
    edtFechaQui: TTimeEdit;
    Rectangle65: TRectangle;
    edtVoltaTer: TTimeEdit;
    Rectangle66: TRectangle;
    edtVoltaQui: TTimeEdit;
    Rectangle67: TRectangle;
    edtFechaTer: TTimeEdit;
    Rectangle68: TRectangle;
    edtParaQui: TTimeEdit;
    Rectangle69: TRectangle;
    edtAbreQui: TTimeEdit;
    Rectangle70: TRectangle;
    edtAbreQua: TTimeEdit;
    Rectangle71: TRectangle;
    edtParaQua: TTimeEdit;
    Rectangle72: TRectangle;
    edtVoltaQua: TTimeEdit;
    Rectangle73: TRectangle;
    edtFechaQua: TTimeEdit;
    Rectangle74: TRectangle;
    edtVoltaSex: TTimeEdit;
    Rectangle75: TRectangle;
    edtFechaSex: TTimeEdit;
    Rectangle76: TRectangle;
    edtParaSex: TTimeEdit;
    Rectangle77: TRectangle;
    edtAbreSex: TTimeEdit;
    Rectangle78: TRectangle;
    edtAbreSab: TTimeEdit;
    Rectangle79: TRectangle;
    edtParaSab: TTimeEdit;
    Rectangle80: TRectangle;
    edtVoltaSab: TTimeEdit;
    Rectangle81: TRectangle;
    edtFechaSab: TTimeEdit;
    Rectangle82: TRectangle;
    edtVoltaDom: TTimeEdit;
    Rectangle83: TRectangle;
    edtFechaDom: TTimeEdit;
    Rectangle84: TRectangle;
    edtParaDom: TTimeEdit;
    Rectangle85: TRectangle;
    edtAbreDom: TTimeEdit;
    chkFechadoSeg: TImage;
    chkFechadoTer: TImage;
    chkFechadoQui: TImage;
    chkFechadoQua: TImage;
    chkFechadoSab: TImage;
    chkFechadoSex: TImage;
    chkFechadoDom: TImage;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label53: TLabel;
    Rectangle86: TRectangle;
    Rectangle87: TRectangle;
    Rectangle88: TRectangle;
    Label61: TLabel;
    sbtnFecha: TSpeedButton;
    sbtnVolta: TSpeedButton;
    sbtnPara: TSpeedButton;
    sbtnAbre: TSpeedButton;
    imgrbChecked: TImage;
    imgrbUnchecked: TImage;
    lblMsgFormatoFoto: TLabel;
    Layout32: TLayout;
    Line2: TLine;
    Line3: TLine;
    Image22: TImage;
    Label16: TLabel;
    Label20: TLabel;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    Image16: TImage;
    Image19: TImage;
    Image21: TImage;
    Image20: TImage;
    Image18: TImage;
    Image17: TImage;
    Rectangle11: TRectangle;
    edtLinkAppleStore: TEdit;
    Rectangle9: TRectangle;
    edtLinkGooglePlay: TEdit;
    Rectangle10: TRectangle;
    edtLinkEmail: TEdit;
    Rectangle7: TRectangle;
    edtLinkSite: TEdit;
    Rectangle8: TRectangle;
    edtLinkGooglePlus: TEdit;
    Rectangle5: TRectangle;
    edtLinkYoutube: TEdit;
    Rectangle6: TRectangle;
    edtLinkTwitter: TEdit;
    Rectangle4: TRectangle;
    edtLinkInstagran: TEdit;
    Rectangle3: TRectangle;
    edtLinkFacebook: TEdit;
    Rectangle33: TRectangle;
    Layout40: TLayout;
    Line17: TLine;
    Line18: TLine;
    Image28: TImage;
    Label62: TLabel;
    Label63: TLabel;
    Rectangle34: TRectangle;
    edtSlogam: TEdit;
    mmDescricao: TMemo;
    Label64: TLabel;
    mmTag: TTMSFMXListEditor;
    Rectangle35: TRectangle;
    Label65: TLabel;
    Layout41: TLayout;
    Line19: TLine;
    Line20: TLine;
    Image33: TImage;
    Label66: TLabel;
    Label67: TLabel;
    Layout60: TLayout;
    recMenuTopo1: TRectangle;
    imgMenu1: TImage;
    recMenuTopo5: TRectangle;
    imgMenu5: TImage;
    recMenuTopo3: TRectangle;
    imgMenu3: TImage;
    recMenuTopo4: TRectangle;
    recMenuTopo2: TRectangle;
    imgMenu2: TImage;
    recMenu9: TRectangle;
    Layout61: TLayout;
    Image47: TImage;
    Layout62: TLayout;
    Label79: TLabel;
    imgMenu4: TImage;
    tbiContrato: TTabItem;
    Layout63: TLayout;
    Layout64: TLayout;
    Label80: TLabel;
    Label81: TLabel;
    Layout65: TLayout;
    Label82: TLabel;
    Label83: TLabel;
    Layout66: TLayout;
    Label84: TLabel;
    Label85: TLabel;
    Rectangle46: TRectangle;
    Layout67: TLayout;
    Label86: TLabel;
    Image48: TImage;
    Rectangle47: TRectangle;
    Label87: TLabel;
    ActionList: TActionList;
    actRedesSociais: TChangeTabAction;
    actDeliverys: TChangeTabAction;
    actTelefones: TChangeTabAction;
    actCheckList: TChangeTabAction;
    actGrupoSubGrupo: TChangeTabAction;
    actFuncionamento: TChangeTabAction;
    actImagens: TChangeTabAction;
    actSobre: TChangeTabAction;
    actAvaliacoes: TChangeTabAction;
    actAtualizaApp: TChangeTabAction;
    imgInterno: TImage;
    imgLoading: TCircle;
    faLoading: TFloatAnimation;
    lblCaptionLoading: TLabel;
    lytloading: TLayout;
    imgLixeira: TImage;
    lstvTelefones: TListView;
    recCancelar: TRectangle;
    Label88: TLabel;
    lytImages: TLayout;
    recMenu5: TRectangle;
    Layout18: TLayout;
    Image5: TImage;
    Layout19: TLayout;
    Label10: TLabel;
    lstvCheckList: TListView;
    Rectangle18: TRectangle;
    edtCheckList: TEdit;
    Rectangle19: TRectangle;
    lstvNovoCheckList: TListView;
    recAddGrupo: TRectangle;
    ShadowEffect2: TShadowEffect;
    Layout30: TLayout;
    Image34: TImage;
    Rectangle49: TRectangle;
    Label78: TLabel;
    Rectangle50: TRectangle;
    Label89: TLabel;
    Rectangle51: TRectangle;
    edtGrupo: TEdit;
    Layout68: TLayout;
    Label90: TLabel;
    recAddSubGrupo: TRectangle;
    ShadowEffect3: TShadowEffect;
    Layout69: TLayout;
    Image35: TImage;
    Rectangle54: TRectangle;
    Label92: TLabel;
    Rectangle55: TRectangle;
    Label93: TLabel;
    Layout70: TLayout;
    Label94: TLabel;
    Rectangle36: TRectangle;
    Label34: TLabel;
    mmDescricaoGrupo: TMemo;
    Label96: TLabel;
    Rectangle48: TRectangle;
    lstvGrupoListaGrupos: TListView;
    Layout71: TLayout;
    Rectangle56: TRectangle;
    edtSubCategoria: TEdit;
    Label91: TLabel;
    Rectangle52: TRectangle;
    lstvNovoSubGrupo: TListView;
    Rectangle29: TRectangle;
    Label95: TLabel;
    imgNovo: TImage;
    recCorIcone1: TFillRGBEffect;
    recCorIcone2: TFillRGBEffect;
    recCorIcone3: TFillRGBEffect;
    recCorIcone4: TFillRGBEffect;
    recCorIcone5: TFillRGBEffect;
    Label43: TLabel;
    recAnuncioDestaque: TRectangle;
    recAnuncioSecao: TRectangle;
    Image38: TImage;
    opdgImagens: TOpenDialog;
    Label46: TLabel;
    imgEditaFoto: TImage;
    Rectangle31: TRectangle;
    edtTituloEmpresa: TEdit;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Rectangle30: TRectangle;
    imgVerFoto: TImage;
    FillRGBEffect1: TFillRGBEffect;
    recViewFoto: TRectangle;
    Label47: TLabel;
    tabViewCelular: TTabControl;
    tbGrupo: TTabItem;
    tbSubGrupo: TTabItem;
    tbListaComercio: TTabItem;
    tbComercio: TTabItem;
    recTool: TRectangle;
    sbtnVoltar: TImage;
    FillRGBEffect16: TFillRGBEffect;
    lytTitulos: TLayout;
    Layout46: TLayout;
    lblGrupo: TLabel;
    Line21: TLine;
    Layout47: TLayout;
    lblSubGrupo: TLabel;
    btnAdicionar: TImage;
    FillRGBEffect5: TFillRGBEffect;
    recSearch: TRectangle;
    imgBtnMenuPrincipal: TImage;
    faButtomOnMenu: TFloatAnimation;
    faButtomOffMenu: TFloatAnimation;
    FillRGBEffect12: TFillRGBEffect;
    imgBtnPesquisa: TImage;
    FloatAnimation1: TFloatAnimation;
    FloatAnimation2: TFloatAnimation;
    edtBusca: TEdit;
    imgSino: TImage;
    FillRGBEffect6: TFillRGBEffect;
    faSino: TFloatAnimation;
    btnEnviar: TImage;
    FillRGBEffect7: TFillRGBEffect;
    btnHome: TImage;
    FillRGBEffect8: TFillRGBEffect;
    Layout72: TLayout;
    Image36: TImage;
    Image37: TImage;
    Label48: TLabel;
    Layout73: TLayout;
    Label49: TLabel;
    Rectangle32: TRectangle;
    Image39: TImage;
    FillRGBEffect2: TFillRGBEffect;
    Layout74: TLayout;
    Layout75: TLayout;
    Label50: TLabel;
    Line22: TLine;
    Layout76: TLayout;
    Label100: TLabel;
    Image45: TImage;
    FillRGBEffect11: TFillRGBEffect;
    ListView1: TListView;
    Image40: TImage;
    Layout77: TLayout;
    Image41: TImage;
    Layout78: TLayout;
    Label101: TLabel;
    Label102: TLabel;
    Rectangle37: TRectangle;
    Image42: TImage;
    FillRGBEffect3: TFillRGBEffect;
    Layout79: TLayout;
    Layout80: TLayout;
    Label103: TLabel;
    Line23: TLine;
    Layout81: TLayout;
    Label104: TLabel;
    Image43: TImage;
    FillRGBEffect4: TFillRGBEffect;
    Line24: TLine;
    TMSFMXRating1: TTMSFMXRating;
    Label105: TLabel;
    Label106: TLabel;
    Rectangle38: TRectangle;
    Image44: TImage;
    FillRGBEffect9: TFillRGBEffect;
    Layout82: TLayout;
    Layout83: TLayout;
    Label107: TLabel;
    Line25: TLine;
    Layout84: TLayout;
    Label108: TLabel;
    Image46: TImage;
    FillRGBEffect10: TFillRGBEffect;
    VertScrollBox2: TVertScrollBox;
    Image49: TImage;
    Layout85: TLayout;
    lblComercio: TLabel;
    lblSlogam: TLabel;
    Layout86: TLayout;
    Layout87: TLayout;
    recLogoCom: TRectangle;
    imgLogoCom: TImage;
    aniLoadingLogo: TAniIndicator;
    ShadowEffect6: TShadowEffect;
    Layout88: TLayout;
    Image50: TImage;
    faLigacao: TFloatAnimation;
    Layout89: TLayout;
    Rectangle39: TRectangle;
    tmsrtEstrelas: TTMSFMXRating;
    lblPontuacao: TLabel;
    Layout90: TLayout;
    Image51: TImage;
    faGPS: TFloatAnimation;
    Layout91: TLayout;
    Image52: TImage;
    faWhats: TFloatAnimation;
    recSobrenos: TRectangle;
    lblSobre: TLabel;
    lytSobrenos: TLayout;
    lblTituloSobrenos: TLabel;
    Rectangle40: TRectangle;
    recSalvarRedesSociais: TRectangle;
    Label109: TLabel;
    recSalvarDelivery: TRectangle;
    Label110: TLabel;
    Rectangle43: TRectangle;
    Label111: TLabel;
    Rectangle44: TRectangle;
    Label112: TLabel;
    Rectangle45: TRectangle;
    Label113: TLabel;
    Rectangle53: TRectangle;
    Label114: TLabel;
    imgStatusRedesSociais: TImage;
    imgWarning: TImage;
    imgStop: TImage;
    imgCheck: TImage;
    imgStatusDelivery: TImage;
    imgSTatusTelefone: TImage;
    imgStatusCheckList: TImage;
    imgStatusGrupo: TImage;
    imgStatusFuncionamento: TImage;
    imgStatusImagens: TImage;
    imgStatusSobre: TImage;
    imgStatusAvaliacao: TImage;
    imgUpdate: TImage;
    FlowLayout1: TFlowLayout;
    Layout43: TLayout;
    chkAmbiente: TImage;
    Label68: TLabel;
    Layout44: TLayout;
    Label69: TLabel;
    Layout58: TLayout;
    chkAtendimento: TImage;
    Label76: TLabel;
    Layout59: TLayout;
    Label77: TLabel;
    Layout54: TLayout;
    chkLimpeza: TImage;
    Label74: TLabel;
    Layout55: TLayout;
    Label75: TLabel;
    Layout51: TLayout;
    chkLocalizacao: TImage;
    Label72: TLabel;
    Layout52: TLayout;
    Label73: TLabel;
    Layout48: TLayout;
    chkPrecos: TImage;
    Label70: TLabel;
    Layout49: TLayout;
    Label71: TLabel;
    Label115: TLabel;
    imgAvaliacaoBloqueada: TImage;
    procedure edtLinkFacebookKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtLinkInstagranKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtLinkTwitterKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtLinkYoutubeKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtLinkGooglePlusKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtLinkSiteKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtLinkEmailKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtLinkGooglePlayKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtLinkAppleStoreKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtIFoodKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtUberEatsKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtRappiKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtTelefoneKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtContatoKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtAbreSegKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure mmDescricaoKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtSlogamKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure recMenu1Click(Sender: TObject);
    procedure recMenu2Click(Sender: TObject);
    procedure recMenu3Click(Sender: TObject);
    procedure recMenu4Click(Sender: TObject);
    procedure recMenu5Click(Sender: TObject);
    procedure recMenu6Click(Sender: TObject);
    procedure recMenu7Click(Sender: TObject);
    procedure recMenu8Click(Sender: TObject);
    procedure recMenu9Click(Sender: TObject);
    procedure edtTelefoneTyping(Sender: TObject);
    procedure chkZapClick(Sender: TObject);
    procedure chkInternoClick(Sender: TObject);
    procedure Rectangle17Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lstvTelefonesDblClick(Sender: TObject);
    procedure lstvTelefonesItemClickEx(const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure recCancelarClick(Sender: TObject);
    procedure lstvCheckListItemClickEx(const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure Rectangle23Click(Sender: TObject);
    procedure Rectangle20Click(Sender: TObject);
    procedure lstvNovoCheckListItemClickEx(const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure Rectangle22Click(Sender: TObject);
    procedure Rectangle21Click(Sender: TObject);
    procedure lstvGrupoItemClickEx(const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure lstvSubGrupoItemClickEx(const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure Rectangle50Click(Sender: TObject);
    procedure edtGrupoKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure Rectangle49Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtSubCategoriaKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure lstvNovoSubGrupoItemClickEx(const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure recOutrosGrupoClick(Sender: TObject);
    procedure Rectangle29Click(Sender: TObject);
    procedure Rectangle55Click(Sender: TObject);
    procedure Rectangle28Click(Sender: TObject);
    procedure lstvGrupoListaGruposItemClickEx(const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure Rectangle54Click(Sender: TObject);
    procedure recMenu10Click(Sender: TObject);
    procedure recMenuTopo1Click(Sender: TObject);
    procedure sbtnAbreClick(Sender: TObject);
    procedure chkFechadoSegClick(Sender: TObject);
    procedure recAnuncioPrincipalClick(Sender: TObject);
    procedure recAnuncioDestaqueClick(Sender: TObject);
    procedure recAnuncioSecaoClick(Sender: TObject);
    procedure recLogoClick(Sender: TObject);
    procedure Image38Click(Sender: TObject);
    procedure recViewFotoClick(Sender: TObject);
    procedure chkAtendimentoClick(Sender: TObject);
    procedure tbcGuiaAlvoChange(Sender: TObject);
    procedure recSalvarRedesSociaisClick(Sender: TObject);
    procedure recSalvarDeliveryClick(Sender: TObject);
    procedure lstvTelefonesPainting(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
    procedure Rectangle45Click(Sender: TObject);
    procedure Rectangle53Click(Sender: TObject);
  private
    FControllerRedes : TControllerRedesSociais;

    procedure AddFoneLista(AIdRegistro: Integer; ATelefone, AContato, AZap, AInterno: String);
    procedure CarregaListaTelefone(AIdCom: Integer);
    procedure Loading(CaptionLoading : String; Status : Boolean = False);
    procedure AddListaCheckList(AIdCheckList : Integer; ACheckList : String; AChecked, ANovo : Boolean);
    function CarregaCheckList(AIdCom: Integer) : Boolean;
    procedure AddNovaCheckList(ACheckList: String);
    procedure AddGrupoLista(AIdGrupo : Integer; AGrupo : String; AGrupoChecked, ANovo : Boolean);
    function ListaGrupos : Boolean;
    procedure AddSubGrupo(AIdSubGrupo: Integer; ASubGrupo: String; AChecked, ANovo : Boolean);
    function CarregaListaSubGrupo(AIdCom, AIdGrupo : Integer): Boolean;
    procedure AddGruposNovos(AIdGrupo : Integer; AGrupo : String; ANovo, AChecked : Boolean);
    procedure CarregaGruposNovos(AIdChecked : Integer);
    procedure AddNovaSubCategoria(ACheckList: String);
    procedure MenuLateral(AAtivo: String);
    procedure MenuTopo(AAtivo: String);
    function ExtensaoValida(AFileName, AExtensao: String): Boolean;
    procedure CriaQuadroFotos(AIdFile : Integer; AFileFoto : String);
    procedure OnClickDelFoto(Sender: TObject);
    procedure OnClickViewFoto(Sender: TObject);
    procedure OnClickEditFoto(Sender: TObject);
    function IndiceImagens: Integer;
    function ValidaDelivery: Boolean;
    function ValidaRedesSociais: Boolean;
    procedure LoadStart;
    { Private declarations }
  public
    MyThread : TMyThread;
    FRedesSociais : TRedeSocial;

  end;

var
  frmGestorClient: TfrmGestorClient;
  lcIdTelefone : Integer;
  lcPausaThread: TCriticalSection;
  lcIdChecked : Integer;
  lcExtensao : String;
  lcIndexFotos : Integer = 1;
const
   AFieldsTime : Array[1..28] of String = ('edtAbreSeg','edtParaSeg','edtVoltaSeg','edtFechaSeg',
                                           'edtAbreTer','edtParaTer','edtVoltaTer','edtFechaTer',
                                           'edtAbreQua','edtParaQua','edtVoltaQua','edtFechaQua',
                                           'edtAbreQui','edtParaQui','edtVoltaQui','edtFechaQui',
                                           'edtAbreSex','edtParaSex','edtVoltaSex','edtFechaSex',
                                           'edtAbreSab','edtParaSab','edtVoltaSab','edtFechaSab',
                                           'edtAbreDom','edtParaDom','edtVoltaDom','edtFechaDom');

implementation

uses
  System.UIConsts, FMX.Platform.win, Winapi.Windows, Guia.Controle, uMensagens, GuiaAlvo.Controller.DataModuleDados;

{$R *.fmx}

procedure TfrmGestorClient.Loading(CaptionLoading : String; Status : Boolean = False);
begin

    recModal.Visible   := Status;
    lytloading.Visible := Status;
    faLoading.Enabled  := Status;
    lblCaptionLoading.Text := CaptionLoading;

end;

procedure TfrmGestorClient.OnClickDelFoto(Sender : TObject);
var
AIdFoto : String;
begin

     AIdFoto := TRectangle(Sender).Tag.ToString;

     TLayout(GridLayout.FindComponent('imgAnuncio' + AIdFoto)).DisposeOf;

end;

procedure TfrmGestorClient.OnClickViewFoto(Sender : TObject);
var
AName,
AIdFoto : String;
begin

     AIdFoto := TRectangle(Sender).Tag.ToString;
     recViewFoto.Visible := True;
     recModal.Visible := True;

     recViewFoto.Fill.Bitmap.Assign(TRectangle(TLayout(GridLayout.FindComponent('imgAnuncio' + AIdFoto)).FindComponent('recViewImagem' + AIdFoto)).Fill.Bitmap);

end;

procedure TfrmGestorClient.OnClickEditFoto(Sender : TObject);
var
AIdFoto : String;
begin

     AIdFoto := TRectangle(Sender).Tag.ToString;

     opdgImagens.Filter := 'JPG|*.jpg';
     opdgImagens.Options := [TOpenOption.ofHideReadOnly,TOpenOption.ofEnableSizing];

     if opdgImagens.Execute then
        begin
             if SizeImgpx(opdgImagens.FileName) <> ctrSIZEANUNCIOCOMERCIO then
                begin
                     MessageBox(WindowHandleToPLatform(Self.Handle).Wnd,
                                pChar('A foto deve ser no formato ' + ctrSIZEANUNCIOCOMERCIO),
                                'Guia Alvo', MB_OK + MB_ICONEXCLAMATION);
                     Exit;
                end
            else
               begin
                   case ExtensaoValida(opdgImagens.FileName, '.jpg') of

                             True : TRectangle(TLayout(GridLayout.FindComponent('imgAnuncio' + AIdFoto)).FindComponent('recViewImagem' + AIdFoto)).Fill.Bitmap.Bitmap.LoadFromFile(opdgImagens.FileName);
                            False : begin

                                          MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                     'Extensão inválida, a foto deve ser no formato .jpg!',
                                                     'Guia Alvo', MB_OK + MB_ICONINFORMATION);
                                           Exit;

                                    end;

                   end;
               end;
        end;
end;


procedure TfrmGestorClient.CriaQuadroFotos(AIdFile : Integer; AFileFoto : String);
var
ALayout, ALayoutRodape : TLayout;
ARectangle : TRectangle;
begin

     ALayout := TLayout.Create(GridLayout);
     ALayout.Parent := GridLayout;
     ALayout.Margins.Bottom := 4;
     ALayout.Margins.Left := 4;
     ALayout.Name := 'imgAnuncio' + AIdFile.ToString;
     ALayout.Tag := AIdFile;

     ALayoutRodape := TLayout.Create(ALayout);
     ALayoutRodape.Parent := ALayout;
     ALayoutRodape.Align := TAlignLayout.Bottom;
     ALayoutRodape.Height := 25;

     ARectangle := TRectangle.Create(ALayout);
     ARectangle.Parent := ALayout;
     ARectangle.Align := TAlignLayout.Client;
     ARectangle.Fill.Kind := TBrushKind.Bitmap;
     ARectangle.Fill.Bitmap.WrapMode := TWrapMode.TileStretch;
     ARectangle.Stroke.Color := TAlphaColorRec.Gainsboro;
     ARectangle.Stroke.Thickness := 2;
     ARectangle.XRadius := 5;
     ARectangle.YRadius := 5;
     ARectangle.Name := 'recViewImagem' + AIdFile.ToString;
     ARectangle.Fill.Bitmap.Bitmap.LoadFromFile(AFileFoto);
     ARectangle.Tag := AIdFile;

     ARectangle := TRectangle.Create(ALayout);
     ARectangle.Parent := ALayoutRodape;
     ARectangle.Align := TAlignLayout.Right;
     ARectangle.Fill.Kind := TBrushKind.Bitmap;
     ARectangle.Fill.Bitmap.WrapMode := TWrapMode.TileStretch;
     ARectangle.Stroke.Thickness := 0;
     ARectangle.Fill.Bitmap.Bitmap := imgVerFoto.Bitmap;
     ARectangle.Width := 25;
     ARectangle.Tag := AIdFile;
     ARectangle.Cursor := crHandPoint;
     ARectangle.HitTest := True;
     ARectangle.Name := 'recBtnView' + AIdFile.ToString;
     ARectangle.OnClick := OnClickViewFoto;

     ARectangle := TRectangle.Create(ALayout);
     ARectangle.Parent := ALayoutRodape;
     ARectangle.Align := TAlignLayout.Right;
     ARectangle.Fill.Kind := TBrushKind.Bitmap;
     ARectangle.Fill.Bitmap.WrapMode := TWrapMode.TileStretch;
     ARectangle.Stroke.Thickness := 0;
     ARectangle.Fill.Bitmap.Bitmap := imgEditaFoto.Bitmap;
     ARectangle.Width := 25;
     ARectangle.Tag := AIdFile;
     ARectangle.Cursor := crHandPoint;
     ARectangle.HitTest := True;
     ARectangle.Name := 'recBtnEdit' + AIdFile.ToString;
     ARectangle.OnClick := OnClickEditFoto;

     ARectangle := TRectangle.Create(ALayout);
     ARectangle.Parent := ALayoutRodape;
     ARectangle.Align := TAlignLayout.Right;
     ARectangle.Fill.Kind := TBrushKind.Bitmap;
     ARectangle.Fill.Bitmap.WrapMode := TWrapMode.TileStretch;
     ARectangle.Stroke.Thickness := 0;
     ARectangle.Fill.Bitmap.Bitmap := imgLixeiraFoto.Bitmap;
     ARectangle.Width := 25;
     ARectangle.Tag := AIdFile;
     ARectangle.Cursor := crHandPoint;
     ARectangle.HitTest := True;
     ARectangle.Name := 'recBtnDel' + AIdFile.ToString;
     ARectangle.OnClick := OnClickDelFoto;

end;

procedure TfrmGestorClient.lstvCheckListItemClickEx(const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
var
AIdCheckList : Integer;
begin

    if TListView(Sender).Selected <> nil then
        begin
            AIdCheckList := lstvCheckList.Items[lstvCheckList.ItemIndex].Tag;

            if ItemObject is TListItemImage then
                begin

                    if TListItemImage(ItemObject).Name = 'Image2' then
                        begin

                             TThread.CreateAnonymousThread(
                             procedure
                             begin

                                 TThread.Synchronize(nil,
                                 procedure
                                 begin
                                      try
                                          AddCheckListCom(cfgIdComercio, AIdCheckList);
                                          if CarregaCheckList(cfgIdComercio) = False then
                                             imgStatusCheckList.Bitmap.Assign(imgStop.Bitmap) else
                                             imgStatusCheckList.Bitmap.Assign(imgCheck.Bitmap);
                                      except
                                          MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                    pChar(ERRO_SELECTED_CHECKLIST),
                                                    'Guia Alvo', MB_OK + MB_ICONERROR);
                                      end;
                                 end);

                             end).Start;

                        end;

                end;

        end;

end;

procedure TfrmGestorClient.lstvGrupoItemClickEx(const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
var
AIdGrupo : Integer;
begin

    if TListView(Sender).Selected <> nil then
        begin
            AIdGrupo := lstvGrupo.Items[lstvGrupo.ItemIndex].Tag;

            if ItemObject is TListItemImage then
                begin

                    if TListItemImage(ItemObject).Name = 'Image2' then
                        begin

                             TThread.CreateAnonymousThread(
                             procedure
                             begin

                                 TThread.Synchronize(nil,
                                 procedure
                                 begin
                                      Try

                                          UpdateGrupoCom(cfgIdComercio, AIdGrupo);
                                          cfgIdCategoria := AIdGrupo;
                                          ListaGrupos;
                                          if CarregaListaSubGrupo(cfgIdComercio, cfgIdCategoria) = False then
                                             imgStatusGrupo.Bitmap.Assign(imgStop.Bitmap) else
                                             imgStatusGrupo.Bitmap.Assign(imgCheck.Bitmap);
                                      Except

                                         MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                    pChar(ERRO_SELECTED_GROUP),
                                                    'Guia Alvo', MB_OK + MB_ICONERROR);

                                      end;

                                 end);

                             end).Start;

                        end;

                end;

        end;

end;

procedure TfrmGestorClient.lstvGrupoListaGruposItemClickEx(const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
begin

    if TListView(Sender).Selected <> nil then
        begin
            lcIdChecked := lstvGrupoListaGrupos.Items[lstvGrupoListaGrupos.ItemIndex].Tag;

            if ItemObject is TListItemImage then
                begin

                    if TListItemImage(ItemObject).Name = 'Image2' then
                        begin

                             TThread.CreateAnonymousThread(
                             procedure
                             begin

                                 TThread.Synchronize(nil,
                                 procedure
                                 begin
                                      Try

                                         CarregaGruposNovos(lcIdChecked);

                                      Except

                                         MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                    pChar(ERRO_LOAD_NEW_GROUP),
                                                    'Guia Alvo', MB_OK + MB_ICONERROR);

                                      end;

                                 end);

                             end).Start;

                        end;

                end;

        end;

end;

procedure TfrmGestorClient.lstvNovoCheckListItemClickEx(const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
var
AIndexCheckList : Integer;
begin

    if TListView(Sender).Selected <> nil then
        begin
            AIndexCheckList := lstvNovoCheckList.ItemIndex;

            if ItemObject is TListItemImage then
                begin

                    if TListItemImage(ItemObject).Name = 'Image2' then
                        begin

                             lstvNovoCheckList.Items.Delete(AIndexCheckList);

                        end;

                end;

        end;

end;

procedure TfrmGestorClient.lstvNovoSubGrupoItemClickEx(const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
var
AIndexSubCategoria : Integer;
begin

    if TListView(Sender).Selected <> nil then
        begin
            AIndexSubCategoria := lstvNovoSubGrupo.ItemIndex;

            if ItemObject is TListItemImage then
                begin

                    if TListItemImage(ItemObject).Name = 'Image2' then
                         lstvNovoSubGrupo.Items.Delete(AIndexSubCategoria);

                end;

        end;
end;

procedure TfrmGestorClient.lstvSubGrupoItemClickEx(const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
var
AIdSubGrupo : Integer;
begin

    if TListView(Sender).Selected <> nil then
        begin
            AIdSubGrupo := lstvSubGrupo.Items[lstvSubGrupo.ItemIndex].Tag;

            if ItemObject is TListItemImage then
                begin

                    if TListItemImage(ItemObject).Name = 'Image2' then
                        begin

                             TThread.CreateAnonymousThread(
                             procedure
                             begin

                                 TThread.Synchronize(nil,
                                 procedure
                                 begin
                                     try
                                         InsertSubCatCom(cfgIdComercio, cfgIdCategoria, AIdSubGrupo);
                                         if CarregaListaSubGrupo(cfgIdComercio, cfgIdCategoria) = False then
                                             imgStatusGrupo.Bitmap.Assign(imgStop.Bitmap) else
                                             imgStatusGrupo.Bitmap.Assign(imgCheck.Bitmap);
                                     Except
                                         MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                    pChar(ERRO_SELECTED_CATEGORY),
                                                    'Guia Alvo', MB_OK + MB_ICONERROR);
                                     end;

                                 end);

                             end).Start;

                        end;

                end;

        end;

end;

procedure TfrmGestorClient.lstvTelefonesDblClick(Sender: TObject);
var
ATexto : TListItemText;
AImage : TListItemImage;
AItem  : TListViewItem;
begin

     lcIdTelefone := lstvTelefones.Items[lstvTelefones.ItemIndex].Tag;

     AItem := lstvTelefones.Items[lstvTelefones.ItemIndex];
     ATexto :=  AItem.Objects.FindDrawable('Text1') as TListItemText;
     edtTelefone.Text := ATexto.Text;

     ATexto := AItem.Objects.FindDrawable('Text2') as TListItemText;
     edtContato.Text := ATexto.Text;

     AImage := AItem.Objects.FindDrawable('Image3') as TListItemImage;
     if AImage.Bitmap <> nil then
        chkZap.Bitmap := imgchbChecked.Bitmap else
        chkZap.Bitmap := imgchbUnChecked.Bitmap;

     AImage := AItem.Objects.FindDrawable('Image4') as TListItemImage;
     if AImage.Bitmap <> nil then
        chkInterno.Bitmap := imgchbChecked.Bitmap else
        chkInterno.Bitmap := imgchbUnChecked.Bitmap;

     //lstvTelefones.Items.Delete(lstvTelefones.ItemIndex);
     Label29.Text := 'ALTERAR';
     recCancelar.Visible := True;
end;

procedure TfrmGestorClient.lstvTelefonesItemClickEx(const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
var
AIdTelefone : Integer;
begin

    if TListView(Sender).Selected <> nil then
        begin
            AIdTelefone := lstvTelefones.Items[lstvTelefones.ItemIndex].Tag;

            if ItemObject is TListItemImage then
                begin

                    if TListItemImage(ItemObject).Name = 'Image6' then
                        begin

                            case MessageBox(WindowHandleToPlatForm(Self.Handle).Wnd,
                                           'Confirma a exclusão do telefone selecionado?',
                                           'Guia Alvo', MB_YESNO + MB_ICONQUESTION) of
                                ID_YES : begin

                                            TThread.CreateAnonymousThread(
                                            procedure
                                            begin

                                                TThread.Synchronize(nil,
                                                procedure
                                                begin
                                                    Loading('Excluindo...', True);
                                                end);

                                                DeleteFone(AIdTelefone);
                                                CarregaListaTelefone(cfgIdComercio);

                                                TThread.Synchronize(nil,
                                                procedure
                                                begin
                                                    Loading('',False);
                                                end);

                                            end).Start;

                                         end;
                                ID_NO  : Exit;
                            end;

                        end;

                end;

    end;

end;

procedure TfrmGestorClient.lstvTelefonesPainting(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
begin
     if lstvTelefones.Items.Count = 0 then
        imgSTatusTelefone.Bitmap.Assign(imgStop.Bitmap) else
        imgSTatusTelefone.Bitmap.Assign(imgCheck.Bitmap);
end;

function NextFieldsTime(Sender: TObject) : Integer;
var
ACampoAtual : String;
ANextField : Integer;
begin

    ACampoAtual := TEdit(Sender).Name;

    for var i := 1 to 28 do
        begin

            if AFieldsTime[i] = ACampoAtual then
                ANextField := i;

        end;

    if ANextField = 28 then
        Result := 1 else
        Result := ANextField + 1;

end;



procedure TfrmGestorClient.chkAtendimentoClick(Sender: TObject);
begin

    if cfgAlteraAvaliacao = True then
        IsImageChecked(TImage(Sender)) else
        MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                   'Você não pode mais mudar as avaliações pois ' +
                   'ja existe(m) avaliação(ões) registrada!',
                   'GuiaAlvo Alvo', MB_OK + MB_ICONEXCLAMATION);
end;

procedure TfrmGestorClient.chkFechadoSegClick(Sender: TObject);
begin

    if TImage(Sender).Tag = 0 then
        begin
            TImage(Sender).Bitmap := imgchbChecked.Bitmap;
            TImage(Sender).Tag := 1;
        end
    else
        begin
            TImage(Sender).Bitmap := imgchbUnChecked.Bitmap;
            TImage(Sender).Tag := 0;
        end;
end;

procedure TfrmGestorClient.chkInternoClick(Sender: TObject);
begin
IsImageChecked(chkInterno);
end;

procedure TfrmGestorClient.AddFoneLista(AIdRegistro : Integer; ATelefone, AContato, AZap, AInterno : String);
var
AItem  : TListViewItem;
AText  : TListItemText;
AImage : TListItemImage;
begin

    AItem := lstvTelefones.Items.Add;

    AItem.Tag := AIdRegistro;

    AText := TListItemText(AItem.Objects.FindDrawable('Text1'));
    if Length(ATelefone) = 11 then
        AText.Text := Mask('(##) #####-####', ATelefone) else
        AText.Text := Mask('(##) ####-####', ATelefone);

    AText := TListItemText(AItem.Objects.FindDrawable('Text2'));
    AText.Text := AContato;

    AImage := TListItemImage(AItem.Objects.FindDrawable('Image6'));
    AImage.Bitmap := imgLixeira.Bitmap;

    if AZap = '1' then
        begin
            AImage := TListItemImage(AItem.Objects.FindDrawable('Image3'));
            AImage.Bitmap := imgWhatsApp.Bitmap;
        end
    else
        begin
            AImage := TListItemImage(AItem.Objects.FindDrawable('Image3'));
            AImage.Bitmap := nil;
        end;

    if AInterno = '1' then
        begin
            AImage := TListItemImage(AItem.Objects.FindDrawable('Image4'));
            AImage.Bitmap := imgInterno.Bitmap;
        end
    else
        begin
            AImage := TListItemImage(AItem.Objects.FindDrawable('Image4'));
            AImage.Bitmap := nil;
        end;
end;

procedure TfrmGestorClient.chkZapClick(Sender: TObject);
begin
IsImageChecked(chkZap);
end;

procedure TfrmGestorClient.edtSubCategoriaKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin

     if Key = VK_RETURN then
        begin
            if edtSubCategoria.Text = '' then
                begin
                    MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                               'É necessário informar um nome para a Sub-Categoria',
                               'Guia Alvo', MB_OK + MB_ICONEXCLAMATION);
                    edtSubCategoria.SetFocus;
                    Exit;
                end
            else
                begin
                    AddNovaSubCategoria(edtSubCategoria.Text);
                    edtSubCategoria.Text := '';
                end;
        end;

end;

procedure TfrmGestorClient.edtAbreSegKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin

    NextField(Key, TEdit(Self.FindComponent(AFieldsTime[NextFieldsTime(Sender)])));

end;

procedure TfrmGestorClient.edtContatoKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtTelefone);
end;

procedure TfrmGestorClient.edtGrupoKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin

     if Key = VK_RETURN then
        mmDescricaoGrupo.SetFocus;

end;

procedure TfrmGestorClient.edtIFoodKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtUberEats);
end;

procedure TfrmGestorClient.edtLinkAppleStoreKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtLinkFacebook);
end;

procedure TfrmGestorClient.edtLinkEmailKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtLinkGooglePlay);
end;

procedure TfrmGestorClient.edtLinkFacebookKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin

NextField(Key, edtLinkInstagran);

end;

procedure TfrmGestorClient.edtLinkGooglePlayKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtLinkAppleStore);
end;

procedure TfrmGestorClient.edtLinkGooglePlusKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtLinkSite);
end;

procedure TfrmGestorClient.edtLinkInstagranKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtLinkTwitter);
end;

procedure TfrmGestorClient.edtLinkSiteKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtLinkEmail);
end;

procedure TfrmGestorClient.edtLinkTwitterKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtLinkYoutube);
end;

procedure TfrmGestorClient.edtLinkYoutubeKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtLinkGooglePlus);
end;

procedure TfrmGestorClient.edtRappiKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtIFood);
end;

procedure TfrmGestorClient.edtSlogamKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
    if Key = vkReturn then
        mmTag.SetFocus;
end;

procedure TfrmGestorClient.edtTelefoneKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtContato);
end;

procedure TfrmGestorClient.edtTelefoneTyping(Sender: TObject);
begin

    Formatar(Sender, TFormato.erFixoMovel);

end;

procedure TfrmGestorClient.edtUberEatsKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtRappi);
end;

procedure TfrmGestorClient.AddGrupoLista(AIdGrupo : Integer; AGrupo : String; AGrupoChecked, ANovo : Boolean);
var
AItem  : TListViewItem;
AText  : TListItemText;
AImage : TListItemImage;
begin

     AItem := lstvGrupo.Items.Add;
     AItem.Tag := AIdGrupo;

     AText := AItem.Objects.FindDrawable('Text1') as TListItemText;
     AText.Text := AGrupo;

     AImage := AItem.Objects.FindDrawable('Image2') as TListItemImage;
     case AGrupoChecked of
          True : AImage.Bitmap := imgrbChecked.Bitmap;
         False : AImage.Bitmap := imgrbUnChecked.Bitmap;
     end;

     if ANovo = True then
        begin
             AImage := AItem.Objects.FindDrawable('Image3') as TListItemImage;
             AImage.Bitmap := imgNovo.Bitmap;
        end;

end;

function TfrmGestorClient.ListaGrupos : Boolean;
var
AQtde : Boolean;
begin

    AQtde := False;
    lstvGrupo.Items.Clear;

    LoadGrupos(cfgIdComercio);

    dmGeralClient.memGrupo.First;

    lstvGrupo.BeginUpdate;
    while not dmGeralClient.memGrupo.Eof do
        begin

             var ANovo : Boolean;
             if dmGeralClient.memGrupo.FieldByName('CATNOVO').AsString = 'T' then
                ANovo := True else
                ANovo := False;

             if  (cfgIdCategoria <> 0) and (dmGeralClient.memGrupo.FieldByName('IDCAT').AsInteger = cfgIdCategoria) then
                 begin
                     AddGrupoLista(dmGeralClient.memGrupo.FieldByName('IDCAT').AsInteger,
                                   dmGeralClient.memGrupo.FieldByName('NOMECAT').AsString,
                                   True, ANovo);
                     AQtde := True;
                 end
             else
                 begin
                     AddGrupoLista(dmGeralClient.memGrupo.FieldByName('IDCAT').AsInteger,
                                   dmGeralClient.memGrupo.FieldByName('NOMECAT').AsString,
                                   False, ANovo);
                 end;

            dmGeralClient.memGrupo.Next;
        end;
    lstvGrupo.EndUpdate;
    Result := AQtde;

end;


procedure TfrmGestorClient.FormCreate(Sender: TObject);
begin

    LoadStart;
    cfgAlteraAvaliacao := podeAlterarAvaliacao;
    imgAvaliacaoBloqueada.Visible := not cfgAlteraAvaliacao;
end;

procedure TfrmGestorClient.LoadStart;
var
AGrupo, ASubGrupo : Boolean;
begin

    LoadFichaComercio(cfgIdComercio);

    edtIFood.Text    := dmGeralClient.memComercio.FieldByName('IFOODCOM').AsString;
    edtUberEats.Text := dmGeralClient.memComercio.FieldByName('UBEREATSCOM').AsString;
    edtRappi.Text    := dmGeralClient.memComercio.FieldByName('RAPPICOM').AsString;

    Try
       cfgIdCategoria := dmGeralClient.memFichaComercio.FieldByName('IDCAT_COM').AsInteger;
    Except
       cfgIdCategoria := 0;
    end;

    lcPausaThread := TCriticalSection.Create;

    getControle;
    lytImages.Visible := False;
    LoadControle(dmGeralClient.memControle);

    CarregaListaTelefone(cfgIdComercio);
    case CarregaCheckList(cfgIdComercio) of
         True : imgStatusCheckList.Bitmap.Assign(imgCheck.Bitmap);
        False : imgStatusCheckList.Bitmap.Assign(imgStop.Bitmap);
    end;

    AGrupo := ListaGrupos;
    ASubGrupo := CarregaListaSubGrupo(cfgIdComercio, cfgIdCategoria);

    if (AGrupo = True) and (ASubGrupo = True) then
       imgStatusGrupo.Bitmap.Assign(imgCheck.Bitmap) else
       imgStatusGrupo.Bitmap.Assign(imgStop.Bitmap);

    case PreencheHoras of
         False : imgStatusFuncionamento.Bitmap.Assign(imgWarning.Bitmap);
          True : imgStatusFuncionamento.Bitmap.Assign(imgCheck.Bitmap);
    end;

    case ValidaRedesSociais of
         True : imgStatusRedesSociais.Bitmap.Assign(imgCheck.Bitmap);
        False : imgStatusRedesSociais.Bitmap.Assign(imgWarning.Bitmap);
    end;

    case ValidaDelivery of
         True : imgStatusDelivery.Bitmap.Assign(imgCheck.Bitmap);
        False : imgStatusDelivery.Bitmap.Assign(imgWarning.Bitmap);
    end;

    if lstvTelefones.Items.Count = 0 then
       imgSTatusTelefone.Bitmap.Assign(imgStop.Bitmap) else
       imgSTatusTelefone.Bitmap.Assign(imgCheck.Bitmap);
end;

procedure TfrmGestorClient.FormDestroy(Sender: TObject);
begin

     if Assigned(lcPausaThread) then FreeAndNil(lcPausaThread);

end;

function MaxFotos(AQtdeFotos : Integer) : Boolean;
begin

    if AQtdeFotos > cfgQtdeAnuncio then
        begin
             Result := True;
             case MessageBox(WindowHandleToPlatform(frmGestorClient.Handle).Wnd,
                             pChar(uMensagens.MSG_QTDE_LIMITE_IMAGES), 'Guia Alvo',
                             MB_YESNO + MB_ICONQUESTION) of
                 ID_YES : begin
                               Abort;
                               //Mudar de plano
                          end;
                  ID_NO : begin
                               Abort;
                               //Cancela a operação
                          end;
             end;
        end
    else
        begin
            Result := False;
        end;

end;

function TfrmGestorClient.IndiceImagens : Integer;
var
fLista : TStringList;
i : Integer;
ANomeComponente : String;
begin

    Try
        fLista := TStringList.Create;

        for i := 0 to GridLayout.ComponentCount - 1 do
            begin

                if GridLayout.Components[i] is TLayout then
                    begin

                        ANomeComponente := TLayout(GridLayout.Components[i]).Name;

                        if Pos('imgAnuncio', ANomeComponente) > 0 then
                            fLista.Add(ApenasNumeros(ANomeComponente));

                    end;

            end;

        fLista.Sorted := True;

    finally
        Try
            Result := fLista.Strings[fLista.Count - 1].ToInteger;
        Except
            Result := 0;
        end;
        FreeAndNil(fLista);
    end;
end;

procedure TfrmGestorClient.Image38Click(Sender: TObject);
var
pError : Boolean;
pQtdeImagens : Integer;
begin

    lcIndexFotos := IndiceImagens;
    pQtdeImagens := GridLayout.ChildrenCount;
    if not MaxFotos(pQtdeImagens) then
        begin
            pError := False;
            opdgImagens.Filter := 'JPG|*.jpg';
            opdgImagens.Options := [TOpenOption.ofHideReadOnly,TOpenOption.ofEnableSizing, TOpenOption.ofAllowMultiSelect];

            if opdgImagens.Execute then
                begin
                     for var i := 0 to opdgImagens.Files.Count - 1 do
                         begin
                              if (ExtensaoValida(opdgImagens.Files[i], '.jpg') = True) and (SizeImgPx(opdgImagens.Files[i]) = ctrSIZEANUNCIOCOMERCIO) then
                                  begin

                                       lcIndexFotos := lcIndexFotos + 1;
                                       pQtdeImagens := pQtdeImagens + 1;
                                       CriaQuadroFotos(lcIndexFotos ,opdgImagens.Files[i]);
                                       MaxFotos(pQtdeImagens);

                                  end
                              else
                                  begin
                                       pError := True;
                                  end;

                         end;

                         if pError = True then
                            begin
                                 MessageBox(WindowHandleToPlatForm(Self.Handle).Wnd,
                                            pChar('Algumas imagens não puderam ser carregadas por serem de formatos compatíveis!'+#13+
                                                  'As fotos devem ser ".jpg" no formato ' + ctrSIZEANUNCIOCOMERCIO),
                                                  'Guia Alvo', MB_OK);
                                 Exit;
                            end;

                end;
        end;

end;

procedure TfrmGestorClient.CarregaListaTelefone(AIdCom : Integer);
begin

    lstvTelefones.Items.Clear;
    getTelefone(AIdCom);

    dmGeralClient.memTelefones.First;

    lstvTelefones.BeginUpdate;
    while not dmGeralClient.memTelefones.Eof do
        begin
            frmGestorClient.AddFoneLista(dmGeralClient.memTelefones.FieldByName('IDFONE').AsInteger,
                                         dmGeralClient.memTelefones.FieldByName('TELFONE').AsString,
                                         dmGeralClient.memTelefones.FieldByName('CONTATOFONE').AsString,
                                         dmGeralClient.memTelefones.FieldByName('ZAPFONE').AsString,
                                         dmGeralClient.memTelefones.FieldByName('INTFONE').AsString);
            dmGeralClient.memTelefones.Next;
        end;
    lstvTelefones.EndUpdate;

end;

procedure TfrmGestorClient.mmDescricaoKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
NextField(Key, edtSlogam);
end;

procedure TfrmGestorClient.recMenu9Click(Sender: TObject);
begin

    actAvaliacoes.ExecuteTarget(Self);
    MenuLateral(TRectangle(Sender).Name);

end;

procedure TfrmGestorClient.recMenuTopo1Click(Sender: TObject);
begin
MenuTopo(TRectangle(Sender).Name);
end;

procedure TfrmGestorClient.recMenu10Click(Sender: TObject);
begin

    MenuLateral(TRectangle(Sender).Name);

end;

procedure TfrmGestorClient.recMenu1Click(Sender: TObject);
begin

    actRedesSociais.ExecuteTarget(Self);
    MenuLateral(TRectangle(Sender).Name);

end;

procedure TfrmGestorClient.recCancelarClick(Sender: TObject);
begin

    CarregaListaTelefone(cfgIdComercio);
    edtTelefone.Text := '';
    edtContato.Text := '';
    chkZap.Bitmap := imgchbUnchecked.Bitmap;
    chkInterno.Bitmap := imgchbUnchecked.Bitmap;
    edtTelefone.SetFocus;
    Label29.Text := 'ADICIONAR';
    recCancelar.Visible := False;
end;

procedure TfrmGestorClient.recLogoClick(Sender: TObject);
begin
     opdgImagens.Filter := 'PNG|*.png';
     opdgImagens.Options := [TOpenOption.ofHideReadOnly,TOpenOption.ofEnableSizing];

     if opdgImagens.Execute then
        begin
             if SizeImgpx(opdgImagens.FileName) <> ctrSIZELOGOCOMERCIO then
                begin
                     MessageBox(WindowHandleToPLatform(Self.Handle).Wnd,
                                pChar('O logo deve ser no formato ' + ctrSIZELOGOCOMERCIO),
                                'Guia Alvo', MB_OK + MB_ICONEXCLAMATION);
                     Exit;
                end
            else
               begin
                   case ExtensaoValida(opdgImagens.FileName, '.png') of

                             True : begin
                                         recLogo.Fill.Bitmap.Bitmap.LoadFromFile(opdgImagens.FileName);
                                         Label46.Visible := False;
                                    end;
                            False : begin

                                          MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                     'Extensão inválida, o logo deve ser no formato .png!',
                                                     'Guia Alvo', MB_OK + MB_ICONINFORMATION);
                                           Exit;

                                    end;
                   end;
               end;
        end;
end;

procedure TfrmGestorClient.recMenu4Click(Sender: TObject);
begin

    actCheckList.ExecuteTarget(Self);
    MenuLateral(TRectangle(Sender).Name);

end;

procedure TfrmGestorClient.recMenu2Click(Sender: TObject);
begin

    actDeliverys.ExecuteTarget(Self);
    MenuLateral(TRectangle(Sender).Name);

end;

procedure TfrmGestorClient.recMenu6Click(Sender: TObject);
begin

    actFuncionamento.ExecuteTarget(Self);
    MenuLateral(TRectangle(Sender).Name);

end;

procedure TfrmGestorClient.recMenu5Click(Sender: TObject);
begin

    actGrupoSubGrupo.ExecuteTarget(Self);
    MenuLateral(TRectangle(Sender).Name);

end;

procedure TfrmGestorClient.recMenu7Click(Sender: TObject);
begin

    actImagens.ExecuteTarget(Self);
    MenuLateral(TRectangle(Sender).Name);

end;

procedure TfrmGestorClient.recOutrosGrupoClick(Sender: TObject);
begin
     CarregaGruposNovos(0);

     recModal.Visible := True;
     recAddSubGrupo.Visible := True;
end;

procedure TfrmGestorClient.recSalvarDeliveryClick(Sender: TObject);
begin
    Try
        case gravaDelivery(edtUberEats.Text, edtRappi.Text, edtIFood.Text) of
            True: begin

                       if ValidaDelivery = False then
                          begin
                               imgStatusDelivery.Bitmap := imgWarning.Bitmap;
                               MessageBox(WindowHandleToPlatForm(Self.Handle).Wnd,
                                  'As informações foram salvas, porém você não cadastrou nenhuma das opções.',
                                  'Guia Alvo', MB_OK + MB_ICONINFORMATION);
                          end
                      else
                          begin
                               imgStatusDelivery.Bitmap := imgCheck.Bitmap;
                               MessageBox(WindowHandleToPlatForm(Self.Handle).Wnd,
                                  'Informações salvas com sucesso!', 'Guia Alvo', MB_OK + MB_ICONINFORMATION);

                          end;

                  end;
           False: begin
                       MessageBox(WindowHandleToPlatForm(Self.Handle).Wnd,
                             pChar(ERRO_UPDATE_SOCIAIS), 'Guia Alvo', MB_OK + MB_ICONINFORMATION);
                       Exit;
                  end;
        end;
    Except
          On E:Exception do
             begin
                  MessageBox(WindowHandleToPlatForm(Self.Handle).Wnd,
                             pChar(ERRO_SESSION_LOAD), 'Guia Alvo', MB_OK + MB_ICONINFORMATION);
                  Exit;
             end;
    end;

end;

function  TfrmGestorClient.ValidaRedesSociais : Boolean;
begin

if (FRedesSociais.SITECOM    = '') and
   (FRedesSociais.EMAILCOM   = '') and
   (FRedesSociais.FACECOM    = '') and
   (FRedesSociais.INSTACOM   = '') and
   (FRedesSociais.TWITERCOM  = '') and
   (FRedesSociais.GOOGLECOM  = '') and
   (FRedesSociais.TUBECOM    = '') and
   (FRedesSociais.APPCOM     = '') and
   (FRedesSociais.APPLECOM   = '') then
   Result := False else Result := True;
end;

function  TfrmGestorClient.ValidaDelivery : Boolean;
begin

 if (edtUberEats.Text = '') and
    (edtRappi.Text    = '') and
    (edtIFood.Text    = '') then
    Result := False else
    Result := True;
end;

procedure TfrmGestorClient.recSalvarRedesSociaisClick(Sender: TObject);
begin

    Try

        FRedesSociais.SITECOM   := edtLinkSite.Text;
        FRedesSociais.EMAILCOM  := edtLinkEmail.Text;
        FRedesSociais.FACECOM   := edtLinkFacebook.Text;
        FRedesSociais.INSTACOM  := edtLinkInstagran.Text;
        FRedesSociais.TWITERCOM := edtLinkTwitter.Text;
        FRedesSociais.GOOGLECOM := edtLinkGooglePlus.Text;
        FRedesSociais.TUBECOM   := edtLinkYoutube.Text;
        FRedesSociais.APPCOM    := edtLinkGooglePlay.Text;
        FRedesSociais.APPLECOM  := edtLinkAppleStore.Text;

        case FControllerRedes.SalvaRedesSociais(FRedesSociais) of
            True: begin

                       if ValidaRedesSociais = True then
                          begin
                               imgStatusRedesSociais.Bitmap := imgWarning.Bitmap;
                               MessageBox(WindowHandleToPlatForm(Self.Handle).Wnd,
                                  'As informações foram salvas, porém você não cadastrou nenhuma das opções, se realmente não possua ' +
                                  'providencie pois no final das contas pode fazer a diferença.', 'Guia Alvo', MB_OK + MB_ICONINFORMATION);
                          end
                      else
                          begin
                               imgStatusRedesSociais.Bitmap := imgCheck.Bitmap;
                               MessageBox(WindowHandleToPlatForm(Self.Handle).Wnd,
                                  'Informações salvas com sucesso!', 'Guia Alvo', MB_OK + MB_ICONINFORMATION);

                          end;

                  end;
           False: begin
                       MessageBox(WindowHandleToPlatForm(Self.Handle).Wnd,
                             pChar(ERRO_UPDATE_DELIVERY), 'Guia Alvo', MB_OK + MB_ICONINFORMATION);
                       Exit;
                  end;
        end;

    Except
          On E:Exception do
             begin
                  MessageBox(WindowHandleToPlatForm(Self.Handle).Wnd,
                             pChar(ERRO_SESSION_LOAD), 'Guia Alvo', MB_OK + MB_ICONINFORMATION);
                  Exit;
             end;
    end;

end;

procedure TfrmGestorClient.recMenu8Click(Sender: TObject);
begin

    actSobre.ExecuteTarget(Self);
    MenuLateral(TRectangle(Sender).Name);

end;

procedure TfrmGestorClient.Rectangle17Click(Sender: TObject);
var
AStatus : Integer;
begin

    if Length(ApenasNumeros(edtTelefone.Text)) < 10 then
        begin
            MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                       'O telefone informado é inválido, verifique!',
                       'Guia Alvo', MB_OK + MB_ICONERROR);
            edtTelefone.SetFocus;
            Exit;
        end;
    if lcIdTelefone = 0 then
        AStatus := 1 else AStatus := 2;

    if TelRepetido(ApenasNumeros(edtTelefone.Text)) = AStatus then
        begin
            MessageBox(WindowHandleToplatform(Self.Handle).Wnd,
                       'O telefone informado já está cadastrado.',
                       'Guia Alvo', MB_OK + MB_ICONERROR);
            edtTelefone.SetFocus;
            Exit;
        end
    else
        begin

            TThread.CreateAnonymousThread(
            procedure
            begin

                TThread.Synchronize(nil,
                procedure
                begin
                    Loading('Salvando...', True);
                end);

                AddTelefone(ApenasNumeros(edtTelefone.Text), edtContato.Text, chkZap.Tag.ToString, chkInterno.Tag.ToString, cfgIdComercio, lcIdTelefone);

                CarregaListaTelefone(cfgIdComercio);

                TThread.Synchronize(nil,
                procedure
                begin
                    Loading('');
                    Label29.Text := 'ADICIONAR';
                    recCancelar.Visible := False;
                    lcIdTelefone := 0;
                    edtTelefone.Text := '';
                    edtContato.Text := '';
                    chkZap.Bitmap := imgchbUnchecked.Bitmap;
                    chkInterno.Bitmap := imgchbUnchecked.Bitmap;
                    edtTelefone.SetFocus;
                end);

            end).Start;

        end;

end;


procedure TfrmGestorClient.Rectangle20Click(Sender: TObject);
begin

    if edtCheckList.Text = '' then
        begin
            MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                       'É necessário informar um nome para a checklist',
                       'Guia Alvo', MB_OK + MB_ICONEXCLAMATION);
            edtCheckList.SetFocus;
            Exit;
        end
    else
        begin
            AddNovaCheckList(edtCheckList.Text);
            edtCheckList.Text := '';
        end;

end;

procedure TfrmGestorClient.Rectangle21Click(Sender: TObject);
var
AText : TListItemText;
begin

    if lstvNovoCheckList.Items.Count = 0 then
        begin

             MessageBox(WIndowHandleToPlatForm(Self.Handle).Wnd,
                        'Nenhuma CheckList na lista para enviar!',
                        'Guia Alvo', MB_OK + MB_ICONERROR);
             edtCheckList.SetFocus;
             Exit;

        end
    else
        begin

            for var i := 0 to lstvNovoCheckList.Items.Count - 1 do
                begin

                     AText := TListItemText(lstvNovoCheckList.Items[i].Objects.FindDrawable('Text1'));
                     AddCheckListNovo(AText.Text, cfgIdComercio);

                end;

            CarregaCheckList(cfgIdComercio);
            MessageBox(WindowHandleToPlatForm(Self.Handle).Wnd,
                       'Sua solicitação de inclusão de checklist foi enviada com sucesso, ' +
                       'assim que aprovada sera adicionada automaticamente em seu cadastro.',
                       'Guia Alvo', MB_OK + MB_ICONINFORMATION);
            Rectangle22Click(Self);

        end;

end;

procedure TfrmGestorClient.Rectangle22Click(Sender: TObject);
begin

     edtCheckList.Text := '';
     lstvNovoCheckList.Items.Clear;
     recAddCheckList.Visible := False;
     recModal.Visible := False;

end;

procedure TfrmGestorClient.Rectangle23Click(Sender: TObject);
begin

     recModal.Visible := True;
     recAddCheckList.Visible := True;

end;

procedure TfrmGestorClient.Rectangle28Click(Sender: TObject);
begin
     CarregaGruposNovos(0);

     recModal.Visible := True;
     recAddSubGrupo.Visible := True;
end;

procedure TfrmGestorClient.Rectangle29Click(Sender: TObject);
begin

     recModal.Visible := True;
     recAddGrupo.Visible := True;

end;

function TfrmGestorClient.ExtensaoValida(AFileName, AExtensao : String) : Boolean;
var
AExt : String;
begin

     AExt := ExtractFileExt(AFileName);
     if AExt <> AExtensao then
        Result := False else
        Result := True;

end;

procedure TfrmGestorClient.recAnuncioDestaqueClick(Sender: TObject);
begin
     opdgImagens.Filter := 'JPG|*.jpg';
     opdgImagens.Options := [TOpenOption.ofHideReadOnly,TOpenOption.ofEnableSizing];

     if opdgImagens.Execute then
        begin
             if SizeImgpx(opdgImagens.FileName) <> ctrSIZEIMGDESTAKE then
                begin
                     MessageBox(WindowHandleToPLatform(Self.Handle).Wnd,
                                pChar('O anúncio de destaque deve ser no formato ' + ctrSIZEIMGDESTAKE),
                                'Guia Alvo', MB_OK + MB_ICONEXCLAMATION);
                     Exit;
                end
            else
               begin
                    case ExtensaoValida(opdgImagens.FileName, '.jpg') of

                         True : recAnuncioDestaque.Fill.Bitmap.Bitmap.LoadFromFile(opdgImagens.FileName);
                        False : begin

                                      MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                 'Extensão inválida, o anúncio deve ser no formato .jpg!',
                                                 'Guia Alvo', MB_OK + MB_ICONINFORMATION);
                                       Exit;

                                end;

                    end;
               end;
        end;
end;

procedure TfrmGestorClient.recAnuncioPrincipalClick(Sender: TObject);
begin
     opdgImagens.Filter := 'JPG|*.jpg';
     opdgImagens.Options := [TOpenOption.ofHideReadOnly,TOpenOption.ofEnableSizing];

     if opdgImagens.Execute then
        begin
             if SizeImgpx(opdgImagens.FileName) <> ctrSIZEIMGDESTAKE then
                begin
                     MessageBox(WindowHandleToPLatform(Self.Handle).Wnd,
                                pChar('O anúncio principal deve ser no formato ' + ctrSIZEIMGDESTAKE),
                                'Guia Alvo', MB_OK + MB_ICONEXCLAMATION);
                     Exit;
                end
            else
               begin
                   case ExtensaoValida(opdgImagens.FileName, '.jpg') of

                             True : recAnuncioPrincipal.Fill.Bitmap.Bitmap.LoadFromFile(opdgImagens.FileName);
                            False : begin

                                          MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                     'Extensão inválida, o anúncio deve ser no formato .jpg!',
                                                     'Guia Alvo', MB_OK + MB_ICONINFORMATION);
                                           Exit;

                                    end;

                   end;
               end;
        end;
end;

procedure TfrmGestorClient.recAnuncioSecaoClick(Sender: TObject);
begin
     opdgImagens.Filter := 'JPG|*.jpg';
     opdgImagens.Options := [TOpenOption.ofHideReadOnly,TOpenOption.ofEnableSizing];

     if opdgImagens.Execute then
        begin
             if SizeImgpx(opdgImagens.FileName) <> ctrSIZEIMGDESTAKE then
                begin
                     MessageBox(WindowHandleToPLatform(Self.Handle).Wnd,
                                pChar('O anúncio da seção deve ser no formato ' + ctrSIZEIMGDESTAKE),
                                'Guia Alvo', MB_OK + MB_ICONEXCLAMATION);
                     Exit;
                end
            else
               begin
                   case ExtensaoValida(opdgImagens.FileName, '.jpg') of

                             True : recAnuncioSecao.Fill.Bitmap.Bitmap.LoadFromFile(opdgImagens.FileName);
                            False : begin

                                          MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                                                     'Extensão inválida, o anúncio deve ser no formato .jpg!',
                                                     'Guia Alvo', MB_OK + MB_ICONINFORMATION);
                                           Exit;

                                    end;

                   end;
               end;
        end;
end;

procedure TfrmGestorClient.Rectangle45Click(Sender: TObject);
var
AIndex : Integer;
ATag : String;
begin

    try
        for AIndex := 0 to mmTag.Items.Count - 1 do
            ATag := ATag + ';' + mmTag.Items[AIndex].Text;

        gravaSobre(mmDescricao.Text, edtSlogam.Text, ATag);

        MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                   'Informações salva com sucesso.', 'GuiaAlvo',
                   MB_OK + MB_ICONINFORMATION);
    Except

    end;

end;

procedure TfrmGestorClient.Rectangle49Click(Sender: TObject);
var
ASolicitacoes : Integer;
begin

    TThread.CreateAnonymousThread(
    procedure
    begin
         lcPausaThread.Enter;
             try
                 TThread.Synchronize(nil,
                 procedure
                 begin
                      Loading('Validando Grupo...', True);
                 end);

                      Try
                         ASolicitacoes := SolicitacoesNovaCategoria;
                      except

                           MessageBox(WindowHandleToPlatForm(Self.Handle).Wnd,
                                      pChar(ERRO_GROUP_REQUESTS),
                                      'Guia Alvo', MB_OK + MB_ICONERROR);
                          Exit;

                      end;

                 TThread.Synchronize(nil,
                 procedure
                 begin
                      Loading('');
                 end);
             finally
                 lcPausaThread.Leave;
             end;

    end).Start;

    if ASolicitacoes >= 3 then
        begin
            MessageBox(WindowHandleToPlatForm(Self.Handle).Wnd,
                       pChar('Você ja possui ' + ASolicitacoes.ToString +
                             'solicitações, aguarde a analise para fazer mais solicitações caso seja necessário!'),
                             'Guia Alvo', MB_OK + MB_OK);
            edtGrupo.SetFocus;
            Exit;
        end;

    if Length(edtGrupo.Text) < 3 then
        begin
            MessageBox(WindowHandleToPlatForm(Self.Handle).Wnd,
                       'O campo grupo esta com o preenchimento inválido!',
                       'Guia Alvo', MB_OK + MB_OK);
            edtGrupo.SetFocus;
            Exit;
        end;

    if Length(mmDescricaoGrupo.Text) < 30 then
        begin
            MessageBox(WindowHandleToPlatForm(Self.Handle).Wnd,
                       'A descrição do grupo deve conter no minimo de 30 caracteres!',
                       'Guia Alvo', MB_OK + MB_OK);
            mmDescricaoGrupo.SetFocus;
            Exit;
        end
    else
        begin

            TThread.CreateAnonymousThread(
            procedure
            begin

                 TThread.Synchronize(nil,
                 procedure
                 begin

                      Loading('Enviando novo grupo...', True);

                 end);

                      Try
                          InsertCategoria(edtGrupo.Text, mmDescricaoGrupo.Text);
                          MessageBox(WindowHandleToPlatForm(Self.Handle).Wnd,
                                     'Solicitação de um novo grupo enviada com sucesso, ' +
                                     'vamos analisar as informações enviadas e assim que ' +
                                     'aprovado você será notificado para fazer o uso deste novo grupo.',
                                     'Guia Alvo', MB_OK + MB_ICONINFORMATION);
                          edtGrupo.Text := '';
                          ListaGrupos;
                          mmDescricaoGrupo.Lines.Clear;
                          recAddGrupo.Visible:= False;
                          recModal.Visible := False;

                      Except
                          MessageBox(WindowHandleToPlatForm(Self.Handle).Wnd,
                                     pChar(ERRO_INSERT_GROUP),
                                     'Guia Alvo', MB_OK + MB_ICONERROR);
                          Exit;
                      end;

                 TThread.Synchronize(nil,
                 procedure
                 begin

                      Loading('');

                 end);

            end).Start;

        end;

end;

procedure TfrmGestorClient.Rectangle50Click(Sender: TObject);
begin

     edtGrupo.Text := '';
     recAddGrupo.Visible:= False;
     recModal.Visible := False;

end;

procedure TfrmGestorClient.Rectangle53Click(Sender: TObject);
var
AErro : Boolean;
begin
     AErro := False;

     if (chkAmbiente.Tag    = 1) or (chkAtendimento.Tag = 1) or
        (chkLimpeza.Tag     = 1) or (chkLocalizacao.Tag = 1) or
        (chkPrecos.Tag      = 1) then
        AErro := False else
        AErro := True;

    case AErro of
        True : begin
                   MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                             'Para salvar é necessário selecionar pelo menos um dos tipos de avaliação!',
                             'Guia Alvo', MB_ICONWARNING);
                   Exit;
               end;
       False : begin
                   gravaCadastroAvaliacoes(StrToBoolValue(chkAmbiente.Tag.ToString,    '1', '0'),
                                           StrToBoolValue(chkAtendimento.Tag.ToString, '1', '0'),
                                           StrToBoolValue(chkLimpeza.Tag.ToString,     '1', '0'),
                                           StrToBoolValue(chkLocalizacao.Tag.ToString, '1', '0'),
                                           StrToBoolValue(chkPrecos.Tag.ToString,      '1', '0'));
                   MessageBox(WIndowHandleToPlatForm(Self.Handle).Wnd,
                             'Lista de avaliações salva com sucesso!',
                             'Guia Alvo', MB_OK + MB_ICONINFORMATION);
               end;
    end;
end;

procedure TfrmGestorClient.Rectangle54Click(Sender: TObject);
var
AText : TListItemText;
begin

    if lstvNovoSubGrupo.Items.Count = 0 then
        begin

             MessageBox(WIndowHandleToPlatForm(Self.Handle).Wnd,
                        'Nenhum Sub-Grupo na lista para enviar!',
                        'Guia Alvo', MB_OK + MB_ICONERROR);
             edtSubCategoria.SetFocus;
             Exit;

        end
    else
        begin

            for var i := 0 to lstvNovoSubGrupo.Items.Count - 1 do
                begin
                     AText := TListItemText(lstvNovoSubGrupo.Items[i].Objects.FindDrawable('Text1'));
                     InsertNewSubCategoria(lcIdChecked, AText.Text);
                end;

            ListaGrupos;
            CarregaListaSubGrupo(cfgIdComercio, cfgIdCategoria);
            MessageBox(WindowHandleToPlatForm(Self.Handle).Wnd,
                       'Sua solicitação de inclusão de novo(s) sub-grupo(s) foi(am) enviada(s) com sucesso, ' +
                       'assim que aprovada sera adicionada automaticamente em seu cadastro.',
                       'Guia Alvo', MB_OK + MB_ICONINFORMATION);
            lstvNovoSubGrupo.Items.Clear;
            Rectangle55Click(Self);
            lcIdChecked := 0;
        end;

end;

procedure TfrmGestorClient.MenuLateral(AAtivo : String);
var
I : Integer;
begin

     for i := 1 to 10 do
           begin
                if TRectangle(frmGestorClient.FindComponent('RecMenu' + i.ToString)).Name = AAtivo then
                     TRectangle(frmGestorClient.FindComponent('RecMenu' + i.ToString)).Fill.Color := StringToAlphaColor('#FFE8EAFF') else
                     TRectangle(frmGestorClient.FindComponent('RecMenu' + i.ToString)).Fill.Color := TAlphaColorRec.White;
           end;

end;

procedure TfrmGestorClient.MenuTopo(AAtivo : String);
var
I : Integer;
begin

     for i := 1 to 5 do
           begin
                if TRectangle(frmGestorClient.FindComponent('recMenuTopo' + i.ToString)).Name = AAtivo then
                     begin
                          TRectangle(frmGestorClient.FindComponent('recMenuTopo' + i.ToString)).Fill.Color := StringToAlphaColor('#FF0070F9');
                          TFillRGBEffect(Self.FindComponent('recCorIcone' + i.ToString)).Color := TAlphaColorRec.White;
                     end
                else
                     begin
                          TRectangle(frmGestorClient.FindComponent('recMenuTopo' + i.ToString)).Fill.Color :=  StringToAlphaColor('#FFC9C6C6');
                          TFillRGBEffect(Self.FindComponent('recCorIcone' + i.ToString)).Color := StringToAlphaColor('#FFACA8A8');
                     end;
           end;

end;

procedure TfrmGestorClient.Rectangle55Click(Sender: TObject);
begin

     recAddSubGrupo.Visible := False;
     recModal.Visible := False;
     lcIdChecked := 0;
end;



procedure TfrmGestorClient.recViewFotoClick(Sender: TObject);
begin
recViewFoto.Visible := False;
recViewFoto.Fill.Bitmap.Bitmap := nil;
recModal.Visible := False;
end;

procedure TfrmGestorClient.sbtnAbreClick(Sender: TObject);
begin
ReplicaHoras(Sender);
end;

procedure TfrmGestorClient.tbcGuiaAlvoChange(Sender: TObject);
begin

    if tbcGuiaAlvo.ActiveTab = tbiAvaliacao then
        begin
            if not cfgAlteraAvaliacao then
                Rectangle53.Visible := False else
                Rectangle53.Visible := True;
        end;


end;

procedure TfrmGestorClient.AddNovaCheckList(ACheckList : String);
var
AItem  : TListViewItem;
AText  : TListItemText;
AImage : TListItemImage;
begin

     AItem := lstvNovoCheckList.Items.Add;

     AText := TListItemText(AItem.Objects.FindDrawable('Text1'));
     AText.Text := ACheckList;

     AImage := TListItemImage(AItem.Objects.FindDrawable('Image2'));
     AImage.Bitmap := imgLixeira.Bitmap;

end;

procedure TfrmGestorClient.AddNovaSubCategoria(ACheckList : String);
var
AItem  : TListViewItem;
AText  : TListItemText;
AImage : TListItemImage;
begin

     AItem := lstvNovoSubGrupo.Items.Add;

     AText := TListItemText(AItem.Objects.FindDrawable('Text1'));
     AText.Text := ACheckList;

     AImage := TListItemImage(AItem.Objects.FindDrawable('Image2'));
     AImage.Bitmap := imgLixeira.Bitmap;

end;

procedure TfrmGestorClient.AddListaCheckList(AIdCheckList : Integer; ACheckList : String; AChecked, ANovo : Boolean);
var
AItem  : TListViewItem;
AText  : TListItemText;
AImage : TListItemImage;
begin

    AItem := lstvCheckList.Items.Add;
    AItem.Tag := AIdCheckList;

    AImage := TListItemImage(AItem.Objects.FindDrawable('Image2'));
    case AChecked of

         True : AImage.Bitmap := imgchbChecked.Bitmap;
        False : AImage.Bitmap := imgchbUnchecked.Bitmap;

    end;

    if ANovo = True then
       begin
           AImage := TListItemImage(AItem.Objects.FindDrawable('Image3'));
           AImage.Bitmap := imgNovo.Bitmap;
       end;

    AText := TListItemText(AItem.Objects.FindDrawable('Text1'));
    AText.Text := ACheckList;

end;

procedure TfrmGestorClient.AddSubGrupo(AIdSubGrupo : Integer; ASubGrupo : String; AChecked, ANovo : Boolean);
var
AItem  : TListViewItem;
AText  : TListItemText;
AImage : TListItemImage;
begin

     AItem := lstvSubGrupo.Items.Add;
     AItem.Tag := AIdSubGrupo;

     AText := AItem.Objects.FindDrawable('Text1') as TListItemText;
     AText.Text := ASubGrupo;

     AImage := AItem.Objects.FindDrawable('Image2') as TListItemImage;
     case AChecked of

          True : AImage.Bitmap := imgchbChecked.Bitmap;
         False : AImage.Bitmap := imgchbUnchecked.Bitmap;

     end;

     if ANovo = True then
        begin
             AImage := AItem.Objects.FindDrawable('Image3') as TListItemImage;
             AImage.Bitmap := imgNovo.Bitmap;
        end;

end;

function TfrmGestorClient.CarregaListaSubGrupo(AIdCom, AIdGrupo : Integer) : Boolean;
var
AQtde : Integer;
begin


     AQtde := 0;
     lstvSubGrupo.Items.Clear;
     LoadSubGrupo(AIdGrupo);
     LoadSubCatCom(AIdCom);

     dmGeralClient.memSubGrupo.First;
     dmGeralClient.memSubCatCom.First;

     while not dmGeralClient.memSubGrupo.Eof do
           begin

                dmGeralClient.memSubCatCom.Filter   := 'ID_SUBCAT = ' + dmGeralClient.memSubGrupo.FieldByName('IDSUBCAT').AsString;
                dmGeralClient.memSubCatCom.Filtered := True;

                var ANovo : Boolean;
                if dmGeralClient.memSubGrupo.FieldByName('SUBCATNOVO').AsString = 'T' then
                   ANovo := True else
                   ANovo := False;

                if dmGeralClient.memSubCatCom.RecordCount = 0 then
                   begin
                       AddSubGrupo(dmGeralClient.memSubGrupo.FieldByName('IDSUBCAT').AsInteger,
                                   dmGeralClient.memSubGrupo.FieldByName('NOMESUBCAT').AsString,
                                   False, ANovo);
                   end
                else
                   begin
                       AddSubGrupo(dmGeralClient.memSubGrupo.FieldByName('IDSUBCAT').AsInteger,
                                   dmGeralClient.memSubGrupo.FieldByName('NOMESUBCAT').AsString,
                                   True, ANovo);
                       AQtde := AQtde + 1;
                   end;

               dmGeralClient.memSubGrupo.Next;

           end;

           if AQtde > 0 then
              Result := True else
              Result := False;


end;

function TfrmGestorClient.CarregaCheckList(AIdCom : Integer) : Boolean;
var
i : Integer;
begin

    i := 0;

    lstvCheckList.Items.Clear;
    LoadCheckList;
    LoadCheckListSelected(cfgIdComercio);

    dmGeralClient.memCheckList.First;

    lstvCheckList.BeginUpdate;

    while not dmGeralClient.memCheckList.Eof do
        begin

            dmGeralClient.memCheckListSelected.Filter   := 'IDCHECK = ' + QuotedStr(dmGeralClient.memCheckList.FieldByName('IDCHECK').AsString);
            dmGeralClient.memCheckListSelected.Filtered := True;

            var AChecked : Boolean;
            if dmGeralClient.memCheckListSelected.RecordCount > 0 then
               AChecked := True else AChecked := False;

            var ANovo : Boolean;
            if dmGeralClient.memCheckList.FieldByName('NOVOCHECK').AsString = 'T' then
               ANovo := True else ANovo := False;

            AddListaCheckList(dmGeralClient.memCheckList.FieldByName('IDCHECK').AsInteger,
                              dmGeralClient.memCheckList.FieldByName('DESCRCHECK').AsString,
                              AChecked, ANovo);
             if AChecked = True then
                i := i + 1;

            dmGeralClient.memCheckList.Next;

        end;
   lstvCheckList.EndUpdate;

   if i > 0 then
      Result := True else
      Result := False;

end;

procedure TfrmGestorClient.CarregaGruposNovos(AIdChecked : Integer);
begin

    TThread.CreateAnonymousThread(
    procedure
    var
    pNovo : Boolean;
    begin

        Try
            LoadGrupos(cfgIdComercio, 'T');

            dmGeralClient.memGrupo.First;
            lstvGrupoListaGrupos.Items.Clear;

            while not dmGeralClient.memGrupo.Eof do
                begin

                    if dmGeralClient.memGrupo.FieldByName('CATNOVO').AsString = 'T' then
                        pNovo := True else
                        pNovo := False;

                    if AIdChecked = dmGeralClient.memGrupo.FieldByName('IDCAT').AsInteger then
                        AddGruposNovos(dmGeralClient.memGrupo.FieldByName('IDCAT').AsInteger,
                                       dmGeralClient.memGrupo.FieldByName('NOMECAT').AsString,
                                       pNovo, True) else
                        AddGruposNovos(dmGeralClient.memGrupo.FieldByName('IDCAT').AsInteger,
                                       dmGeralClient.memGrupo.FieldByName('NOMECAT').AsString,
                                       pNovo, False);

                    dmGeralClient.memGrupo.Next;
                end;
        Except

            MessageBox(WindowHandleToPlatForm(Self.Handle).Wnd,
                       pChar(ERRO_LIST_GROUP),
                      'Guia Alvo', MB_OK + MB_ICONERROR);
            Exit;

        end;

    end).Start;

end;

procedure TfrmGestorClient.AddGruposNovos(AIdGrupo : Integer; AGrupo : String; ANovo, AChecked : Boolean);
var
AItem  : TListViewItem;
AText  : TListItemText;
AImage : TListItemImage;
begin

     AItem := lstvGrupoListaGrupos.Items.Add;
     AItem.Tag := AIdGrupo;

     AText := AItem.Objects.FindDrawable('Text1') as TListItemText;
     AText.Text := AGrupo;

     case AChecked of
          True : begin
                     AImage := AItem.Objects.FindDrawable('Image2') as TListItemImage;
                     AImage.Bitmap := imgrbChecked.Bitmap;
                 end;
         False : begin
                     AImage := AItem.Objects.FindDrawable('Image2') as TListItemImage;
                     AImage.Bitmap := imgrbUnchecked.Bitmap;
                 end;

     end;

     if ANovo = True then
        begin
             AImage := AItem.Objects.FindDrawable('Image3') as TListItemImage;
             AImage.Bitmap := imgNovo.Bitmap;

             if lcIdChecked = 0 then
                 begin
                      lcIdChecked := AIdGrupo;
                      AImage := AItem.Objects.FindDrawable('Image2') as TListItemImage;
                      AImage.Bitmap := imgrbChecked.Bitmap;
                 end;

        end;

end;

procedure TfrmGestorClient.recMenu3Click(Sender: TObject);
begin

    actTelefones.ExecuteTarget(Self);
    MenuLateral(TRectangle(Sender).Name);

end;

procedure TMyThread.LoadingImages(APathFtp, ANomeImage : String; AImage : TImage; AListImage : TListItemImage; ALoading : TAniIndicator);
begin
    With frmGestorClient do
        begin
            MyThread                 := TMyThread.create;
            MyThread.FUrlFtp         := APathFtp;
            MyThread.FFileFtp        := ANomeImage;
            if AImage = nil then
                MyThread.FImage      := AListImage else
                MyThread.FimgImage   := AImage;
            if ALoading <> nil then
                MyThread.FAniLoading := ALoading;

            MyThread.FreeOnTerminate := True;
            MyThread.Start;
        end;
end;

{ TMyThread }

constructor TMyThread.create;
begin
     inherited Create(True);
end;

procedure TMyThread.Execute;
var
   AFtp : TIdFTP;

begin
  inherited;
    Self.Fms := TMemoryStream.Create;
    Self.Fms.Position := 0;

    AFtp := TIdFTP.Create;

    ConectaFTP(AFtp);
    AFtp.ChangeDir(Self.FUrlFtp);
    AFtp.TransferType := ftBinary;
    AFtp.Get(Self.FFileFtp, Self.Fms);

    Synchronize(
    procedure
    var
         img : TImage;
    begin
         img := TImage.Create(nil);
         img.Bitmap.LoadFromStream(Self.Fms);

         if FImage <> nil then
            begin
               Self.FImage.Bitmap := img.Bitmap;
               Self.FImage.OwnsBitmap := True;
            end
         else
            begin
               Self.FimgImage.Bitmap := img.Bitmap;
               if FAniLoading <> nil then
                  begin
                       FAniLoading.Enabled := False;
                       FAniLoading.Visible := False;
                  end;
            end;

         img.DisposeOf;
         Self.Fms.DisposeOf;
         AFtp.DisposeOf;

    end);

end;

end.
