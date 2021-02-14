unit untMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.TabControl, FMX.Layouts,
  FMX.DateTimeCtrls, FMX.Edit, FMX.ScrollBox, FMX.Memo, IdThreadComponent,
  IdBaseComponent,System.UIConsts, FMX.Ani, System.ImageList, FMX.ImgList,
  System.Actions, FMX.ActnList, FMX.Effects, FMX.ListBox, System.IOUtils,
  System.Threading, FMX.Maps, System.Sensors, FMX.WebBrowser, System.Permissions,
  IdComponent, IdTCPConnection, IdTCPClient, untFrameLoading, REST.Types, REST.Client,
  REST.Authenticator.Basic, Data.Bind.Components, Data.Bind.ObjectScope,
  REST.Response.Adapter, System.Sensors.Components,
  FMX.PhoneDialer, FMX.DialogService, IPPeerClient, FireDAC.Stan.Param,
  REST.Backend.PushTypes, System.JSON, REST.Backend.EMSPushDevice,
  System.PushNotification, REST.Backend.EMSProvider, REST.Backend.BindSource,
  REST.Backend.PushDevice, FMX.MultiView, FMX.TMSRating, FMX.TMSBaseControl, FMX.Filter.Effects, System.Notification,
  FMX.Platform, IdExplicitTLSClientServerBase, IdFTP, Guia.Controle, Guia.untClientmodule, Guia.DmGeral,
  Guia.Notificacao, Guia.OpenViewUrl, System.StrUtils, Guia.Dados.Frames, untFrameAvaliacoes, untFrameNotificacoes,
  FMX.Media, untConfiguracao, untOnBoarding, untUsuarios, IniFiles, untComoAutorizar, FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView,IdFTPCommon;

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

  TfrmMain = class(TForm)
    StyleBook1: TStyleBook;
    ImageList1: TImageList;
    tbcPrincipal: TTabControl;
    tbiPrincipal: TTabItem;
    recSearch: TRectangle;
    tbcAnuncios: TTabControl;
    tmBannerPrincipal: TTimer;
    tbiSubSecoes: TTabItem;
    tbiItensSecao: TTabItem;
    recAnunciosCom: TRectangle;
    tbiConexao: TTabItem;
    Layout2: TLayout;
    imgLogoAppErroConexao: TImage;
    Rectangle5: TRectangle;
    lblTentarNovamente: TLabel;
    lblEncerrar: TLabel;
    Layout14: TLayout;
    lblMsgErro: TLabel;
    AniIndicator1: TAniIndicator;
    Layout15: TLayout;
    Image3: TImage;
    imgFundoSplash: TImage;
    lytLoadingPrincipal: TLayout;
    Label9: TLabel;
    aniLoading: TAniIndicator;
    Layout3: TLayout;
    ActionList1: TActionList;
    actComercio: TChangeTabAction;
    actSubSecao: TChangeTabAction;
    actPrincipal: TChangeTabAction;
    actErroConexao: TChangeTabAction;
    actItensSecao: TChangeTabAction;
    actDados: TChangeTabAction;
    actAvaliar: TChangeTabAction;
    tmBannerFotosSecao: TTimer;
    tbiExibiComercio: TTabItem;
    lblComercio: TLabel;
    lblSlogam: TLabel;
    VertScrollBoxCom: TVertScrollBox;
    recSobrenos: TRectangle;
    lytSobrenos: TLayout;
    lblTituloSobrenos: TLabel;
    lblSobre: TLabel;
    Layout9: TLayout;
    imgFotoComPrincipal: TImage;
    Layout7: TLayout;
    Layout8: TLayout;
    recLogoCom: TRectangle;
    imgLogoCom: TImage;
    ShadowEffect6: TShadowEffect;
    Layout11: TLayout;
    Layout19: TLayout;
    Rectangle1: TRectangle;
    tmsrtEstrelas: TTMSFMXRating;
    Layout20: TLayout;
    recNossosDados: TRectangle;
    lytNossosDados: TLayout;
    lblTituloNossosDados: TLabel;
    Layout25: TLayout;
    lytLocalizacao: TLayout;
    Image10: TImage;
    lblDistancia: TLabel;
    lytEndereco: TLayout;
    Image12: TImage;
    lblEndereco: TLabel;
    Layout29: TLayout;
    lytTelefones: TLayout;
    lblTelefones: TLabel;
    Layout30: TLayout;
    Image11: TImage;
    lytWhatsApp: TLayout;
    lblWhatsapp: TLabel;
    Layout32: TLayout;
    Image13: TImage;
    lytSiteEmail: TLayout;
    lblSiteEmail: TLabel;
    recRedesSociais: TRectangle;
    HorzScrollBox1: THorzScrollBox;
    imgFacebook: TImage;
    imgApp: TImage;
    imgYoutube: TImage;
    imgGoogleMais: TImage;
    imgInstagram: TImage;
    imgTwitter: TImage;
    Label17: TLabel;
    lblPontuacao: TLabel;
    Image7: TImage;
    Image8: TImage;
    recFotos: TRectangle;
    GridLayout: TGridLayout;
    imgFoto1: TImage;
    imgFoto2: TImage;
    imgFoto3: TImage;
    imgFoto4: TImage;
    imgFoto5: TImage;
    imgFoto6: TImage;
    imgFoto7: TImage;
    Layout13: TLayout;
    Label1: TLabel;
    recCarregaFotos: TRectangle;
    aniFotos: TAniIndicator;
    recFuncionamento: TRectangle;
    Label6: TLabel;
    Layout18: TLayout;
    recLogin: TRectangle;
    Layout36: TLayout;
    edtSenhaPrincipal: TEdit;
    Layout39: TLayout;
    lblEsqueciSenha: TLabel;
    Layout40: TLayout;
    Label15: TLabel;
    Layout41: TLayout;
    Layout42: TLayout;
    Rectangle4: TRectangle;
    lblEntrar: TLabel;
    Label18: TLabel;
    Line9: TLine;
    Rectangle10: TRectangle;
    Label19: TLabel;
    tbcUsuario: TTabControl;
    tbiLogin: TTabItem;
    tbiNovoUsuario: TTabItem;
    recNovoUsuario: TRectangle;
    Layout10: TLayout;
    lblCadastrarUsuario: TLabel;
    lblCancelarCadastro: TLabel;
    tbiAtivacao: TTabItem;
    recValidacao: TRectangle;
    Layout24: TLayout;
    lblAtivar: TLabel;
    Layout26: TLayout;
    Label21: TLabel;
    edtConfSenha: TEdit;
    edtSenha: TEdit;
    edtCelular: TEdit;
    edtNome: TEdit;
    Layout27: TLayout;
    Image14: TImage;
    Image15: TImage;
    Layout33: TLayout;
    Label23: TLabel;
    recModal: TRectangle;
    recMsg: TRectangle;
    ShadowEffect1: TShadowEffect;
    Layout12: TLayout;
    Layout16: TLayout;
    Layout17: TLayout;
    lblOKRegistronaoEncontrado: TLabel;
    Label5: TLabel;
    Image18: TImage;
    recFalhaConexao: TRectangle;
    ShadowEffect5: TShadowEffect;
    Layout1: TLayout;
    imgLogoAppConexao: TImage;
    lblCaptionConexao: TLabel;
    Layout5: TLayout;
    Layout6: TLayout;
    lblOKErroConexao: TLabel;
    Label11: TLabel;
    Image2: TImage;
    recGPS: TRectangle;
    ShadowEffect2: TShadowEffect;
    Layout21: TLayout;
    imgLogoAppGPS: TImage;
    lblCaptionGPS: TLabel;
    Layout22: TLayout;
    Layout23: TLayout;
    Label8: TLabel;
    imgWaze: TImage;
    imgMaps: TImage;
    recMsgLogin: TRectangle;
    ShadowEffect3: TShadowEffect;
    Layout34: TLayout;
    imgLogoAppMsg: TImage;
    lblCaptionMsgConfirmacao: TLabel;
    Layout35: TLayout;
    Layout43: TLayout;
    lblOK: TLabel;
    lblMsgLogin: TLabel;
    imgIcone: TImage;
    Layout45: TLayout;
    Layout46: TLayout;
    lblMsgValidacao: TLabel;
    vsbUsuario: TVertScrollBox;
    lytUsuario: TLayout;
    tmAtivacao: TTimer;
    edtCodigoAtivacao: TEdit;
    recLoading: TRectangle;
    aiLoading: TAniIndicator;
    lblMsgLoading: TLabel;
    lblSim: TLabel;
    lblNao: TLabel;
    ActionCadastro: TActionList;
    actNovoUsuario: TChangeTabAction;
    actCodigoAtivacao: TChangeTabAction;
    actEsqueciSenha: TChangeTabAction;
    actCorrigeCelular: TChangeTabAction;
    actLogin: TChangeTabAction;
    Layout47: TLayout;
    Layout55: TLayout;
    lblReenviando: TLabel;
    Layout48: TLayout;
    Layout57: TLayout;
    lblCancelaAtivacao: TLabel;
    Layout49: TLayout;
    Image21: TImage;
    lblAviso: TLabel;
    lblTimer: TLabel;
    Layout58: TLayout;
    Layout59: TLayout;
    edtCelularPrincipal: TEdit;
    ShadowEffect4: TShadowEffect;
    recRecuperaSenha: TRectangle;
    ShadowEffect7: TShadowEffect;
    Layout28: TLayout;
    aiRecuperaSenha: TAniIndicator;
    lblMsgRecuperaSenha: TLabel;
    lblCelular: TLabel;
    Image17: TImage;
    recMenu: TRectangle;
    imgTopoMenu: TImage;
    lytMenuGeral: TLayout;
    lytFavorito: TLayout;
    Layout75: TLayout;
    Image32: TImage;
    lblFavoritos: TLabel;
    lblQtdeFavoritos: TLabel;
    lytDestaque: TLayout;
    Layout77: TLayout;
    Image33: TImage;
    lblDestaques: TLabel;
    Line22: TLine;
    Layout80: TLayout;
    Layout81: TLayout;
    Image34: TImage;
    lblNotificacoes: TLabel;
    VertScrollBox2: TVertScrollBox;
    lytavaliar: TLayout;
    Layout83: TLayout;
    Image35: TImage;
    lblAvaliaApp: TLabel;
    Line26: TLine;
    lytConfiguracoes: TLayout;
    Layout85: TLayout;
    Image36: TImage;
    lblConfiguracoes: TLabel;
    Line27: TLine;
    lytLogar: TLayout;
    Layout87: TLayout;
    Image37: TImage;
    lblLogar: TLabel;
    Line28: TLine;
    lytMinhaConta: TLayout;
    Layout89: TLayout;
    Image38: TImage;
    lblMinhaConta: TLabel;
    Line29: TLine;
    lytSobre: TLayout;
    Layout93: TLayout;
    Image40: TImage;
    lblSobrenos: TLabel;
    Line31: TLine;
    lytSair: TLayout;
    Layout95: TLayout;
    Image41: TImage;
    lblSair: TLabel;
    Line32: TLine;
    recBaseMenu: TRectangle;
    faOpenMenu: TFloatAnimation;
    faCloseMenu: TFloatAnimation;
    imgFavoritos: TImage;
    tbiDestaques: TTabItem;
    actDestaque: TChangeTabAction;
    imgBtnMenuPrincipal: TImage;
    faButtomOnMenu: TFloatAnimation;
    faButtomOffMenu: TFloatAnimation;
    imgBtnPesquisa: TImage;
    FloatAnimation1: TFloatAnimation;
    FloatAnimation2: TFloatAnimation;
    imgFoto8: TImage;
    recAvaliacoes: TRectangle;
    Label3: TLabel;
    lblBtnExibeAvaliacoes: TLabel;
    Layout38: TLayout;
    Layout44: TLayout;
    Layout50: TLayout;
    Layout51: TLayout;
    Layout52: TLayout;
    Label12: TLabel;
    rtMediaGeral: TTMSFMXRating;
    lblTotalAvaliacoes: TLabel;
    lblMaisAvaliacoes: TLabel;
    rtMediaAmbiente: TTMSFMXRating;
    lblMediaAmbiente: TLabel;
    Line8: TLine;
    Label14: TLabel;
    NotificationCenter: TNotificationCenter;
    FillRGBEffect12: TFillRGBEffect;
    IdFTP: TIdFTP;
    imgLogoSplash: TImage;
    actPrimeiro: TChangeTabAction;
    actProximo: TChangeTabAction;
    tbiComentarios: TTabItem;
    actComentarios: TChangeTabAction;
    recTool: TRectangle;
    sbtnVoltar: TImage;
    FillRGBEffect16: TFillRGBEffect;
    Layout56: TLayout;
    lytTitulos: TLayout;
    Layout60: TLayout;
    Layout61: TLayout;
    lblGrupo: TLabel;
    lblSubGrupo: TLabel;
    Layout31: TLayout;
    actLoading: TChangeTabAction;
    btnAdicionar: TImage;
    FillRGBEffect5: TFillRGBEffect;
    Line10: TLine;
    lstAvaliacoes: TListBox;
    recDetalhesAvaliacao: TRectangle;
    lytLocal: TLayout;
    tmstrLocal: TTMSFMXRating;
    Layout37: TLayout;
    Label13: TLabel;
    lytAmbiente: TLayout;
    tmstrAmbiente: TTMSFMXRating;
    Layout53: TLayout;
    Label16: TLabel;
    lytAvaliacoes: TLayout;
    lytLimpeza: TLayout;
    tmstrLimpeza: TTMSFMXRating;
    Layout54: TLayout;
    Label22: TLabel;
    lytAtendimento: TLayout;
    tmstrAtendimento: TTMSFMXRating;
    Layout62: TLayout;
    Label26: TLabel;
    lytPrecos: TLayout;
    tmstrPrecos: TTMSFMXRating;
    Layout63: TLayout;
    Label28: TLabel;
    Layout64: TLayout;
    ShadowEffect8: TShadowEffect;
    lblNomeUsuario: TLabel;
    Layout65: TLayout;
    lblDataAvaliacao: TLabel;
    tmstrMedia: TTMSFMXRating;
    lblValorMedia: TLabel;
    Image20: TImage;
    lytAvaliacoesTotal: TLayout;
    lytAmbienteTotal: TLayout;
    lytLimpezaTotal: TLayout;
    rtMediaLimpeza: TTMSFMXRating;
    Label27: TLabel;
    lblMediaLimpeza: TLabel;
    lytlocalizacaoTotal: TLayout;
    rtMediaLocalizacao: TTMSFMXRating;
    Label30: TLabel;
    lblMediaLocalizacao: TLabel;
    lytAtendimentoTotal: TLayout;
    rtMediaAtendimento: TTMSFMXRating;
    Label34: TLabel;
    lblMediaAtendimento: TLabel;
    lytPrecoTotal: TLayout;
    rtMediaPreco: TTMSFMXRating;
    Label36: TLabel;
    lblMediaPreco: TLabel;
    edtBusca: TEdit;
    recCarregamento: TRectangle;
    Layout4: TLayout;
    Arc1: TArc;
    Arc2: TArc;
    faCarregamento: TFloatAnimation;
    Layout66: TLayout;
    lblMsgCarregamento: TLabel;
    Rectangle2: TRectangle;
    Layout67: TLayout;
    recAdicionaAvaliacao: TRectangle;
    recAvaliacao: TRectangle;
    ShadowEffect9: TShadowEffect;
    Rectangle7: TRectangle;
    Rectangle9: TRectangle;
    imgLogoAvaliado: TImage;
    lblNomeAvaliado: TLabel;
    Layout68: TLayout;
    Layout69: TLayout;
    Layout70: TLayout;
    Label20: TLabel;
    Line11: TLine;
    Layout71: TLayout;
    mmComentario: TMemo;
    lblPerguntaAvaliacao: TLabel;
    Layout79: TLayout;
    lytAvaliarLimpeza: TLayout;
    tmsStarAvaliaLimpeza: TTMSFMXRating;
    Layout97: TLayout;
    Label25: TLabel;
    lytAvaliarAtendimento: TLayout;
    tmsStarAvaliaAtendimento: TTMSFMXRating;
    Layout99: TLayout;
    Label29: TLabel;
    lytAvaliarPrecos: TLayout;
    tmsStarAvaliaPrecos: TTMSFMXRating;
    Layout101: TLayout;
    Label33: TLabel;
    lytAvaliarLocalizacao: TLayout;
    tmsStarAvaliaLocalizacao: TTMSFMXRating;
    Layout103: TLayout;
    Label35: TLabel;
    lytAvaliarAmbiente: TLayout;
    tmsStarAvaliaAmbiente: TTMSFMXRating;
    Layout105: TLayout;
    Label37: TLabel;
    Label38: TLabel;
    lblNotaPrecos: TLabel;
    lblNotaLocalizacao: TLabel;
    lblNotaAmbiente: TLabel;
    lblNotaLimpeza: TLabel;
    lblNotaAtendimento: TLabel;
    Layout72: TLayout;
    lblCancelar: TLabel;
    lblAvaliar: TLabel;
    Rectangle6: TRectangle;
    lblMsgAInsuficiente: TLabel;
    Layout96: TLayout;
    lblCaptionMSG: TLabel;
    Line12: TLine;
    lytSegunda: TLayout;
    Layout100: TLayout;
    Layout102: TLayout;
    Label10: TLabel;
    lblSeg: TLabel;
    Line1: TLine;
    lytDomingo: TLayout;
    Layout106: TLayout;
    Label39: TLabel;
    Layout107: TLayout;
    lblDom: TLabel;
    Line2: TLine;
    lytSabado: TLayout;
    Layout109: TLayout;
    Label41: TLabel;
    Layout110: TLayout;
    lblSab: TLabel;
    Line3: TLine;
    lytSexta: TLayout;
    Layout111: TLayout;
    Label43: TLabel;
    Layout112: TLayout;
    lblSex: TLabel;
    Line4: TLine;
    lytQuinta: TLayout;
    Layout114: TLayout;
    Label45: TLabel;
    Layout115: TLayout;
    lblQui: TLabel;
    Line5: TLine;
    lytQuarta: TLayout;
    Layout117: TLayout;
    Label47: TLabel;
    Layout118: TLayout;
    lblQua: TLabel;
    Line6: TLine;
    lytTerca: TLayout;
    Layout120: TLayout;
    Label49: TLabel;
    Layout121: TLayout;
    lblTer: TLabel;
    Line7: TLine;
    recNotificacao: TRectangle;
    ShadowEffect10: TShadowEffect;
    Layout98: TLayout;
    Layout104: TLayout;
    Layout108: TLayout;
    Layout113: TLayout;
    imgNotificacao: TImage;
    lblTituloNotificacao: TLabel;
    lblNotificacao: TLabel;
    tmPush: TTimer;
    tbiNotificacoes: TTabItem;
    actNotificacoes: TChangeTabAction;
    recNotificacoes: TRectangle;
    tbiAnuncios: TTabItem;
    actAnuncios: TChangeTabAction;
    tmAnuncios: TTimer;
    actProximoAnuncio: TChangeTabAction;
    imgSino: TImage;
    FillRGBEffect6: TFillRGBEffect;
    faSino: TFloatAnimation;
    CirclePushMenu: TCircle;
    tbiQueroAnunciar: TTabItem;
    lytCNPJ: TLayout;
    edtCNPJ: TEdit;
    ScrollCadastro: TVertScrollBox;
    lytContato: TLayout;
    edtContato: TEdit;
    lytTelefone: TLayout;
    Layout125: TLayout;
    edtTelefone: TEdit;
    lytTitulo: TLayout;
    lblTitulo: TLabel;
    lblCnpjInvalido: TLabel;
    lblFoneInvalido: TLabel;
    lblContatoInvalido: TLabel;
    actCadastroNovo: TChangeTabAction;
    lytAnunciar: TLayout;
    Layout91: TLayout;
    Image39: TImage;
    lblQueroAnunciar: TLabel;
    Line30: TLine;
    lytRazao: TLayout;
    edtRazao: TEdit;
    lblRazaoInvalido: TLabel;
    lytEmail: TLayout;
    edtEmail: TEdit;
    lblEmailInvalido: TLabel;
    btnEnviar: TImage;
    FillRGBEffect7: TFillRGBEffect;
    btnHome: TImage;
    FillRGBEffect8: TFillRGBEffect;
    recDelivery: TRectangle;
    HorzScrollBox2: THorzScrollBox;
    imgUberEats: TImage;
    imgRappi: TImage;
    imgIfood: TImage;
    Label32: TLabel;
    Layout82: TLayout;
    Image19: TImage;
    EfectFavoritar: TMonochromeEffect;
    EffectMonoWaze: TMonochromeEffect;
    EffectMonoMaps: TMonochromeEffect;
    recAvisoCadastro: TRectangle;
    Layout92: TLayout;
    Image4: TImage;
    Layout94: TLayout;
    Layout116: TLayout;
    Label24: TLabel;
    Image5: TImage;
    lblAcessarSemLogin: TLabel;
    Label42: TLabel;
    ShadowEffect12: TShadowEffect;
    faGPS: TFloatAnimation;
    faWhats: TFloatAnimation;
    faLigacao: TFloatAnimation;
    FillRGBEffect1: TFillRGBEffect;
    FillRGBEffect2: TFillRGBEffect;
    FillRGBEffect3: TFillRGBEffect;
    lytFavoritos: TLayout;
    Line15: TLine;
    Line16: TLine;
    Layout73: TLayout;
    recAutorizacao: TRectangle;
    Layout74: TLayout;
    Image6: TImage;
    Layout76: TLayout;
    Label31: TLabel;
    Label44: TLabel;
    Layout78: TLayout;
    ShadowEffect13: TShadowEffect;
    Image16: TImage;
    faPino: TFloatAnimation;
    Label46: TLabel;
    recFinalizaApp: TRectangle;
    ShadowEffect14: TShadowEffect;
    Layout119: TLayout;
    Image9: TImage;
    Layout122: TLayout;
    Layout123: TLayout;
    Label50: TLabel;
    Layout124: TLayout;
    Label51: TLabel;
    Line17: TLine;
    Image22: TImage;
    Label48: TLabel;
    Label52: TLabel;
    LocationSensor1: TLocationSensor;
    Image1: TImage;
    recNotFound: TRectangle;
    Layout88: TLayout;
    Label2: TLabel;
    Label4: TLabel;
    recNotFoundPrincipal: TRectangle;
    Layout84: TLayout;
    Image23: TImage;
    Label7: TLabel;
    Label40: TLabel;
    tbcGuiaAlvo: TTabControl;
    tbiSplash: TTabItem;
    tbiGuia: TTabItem;
    actGuia: TChangeTabAction;
    actSplash: TChangeTabAction;
    recErrorDestaque: TRectangle;
    Layout86: TLayout;
    Image24: TImage;
    Label53: TLabel;
    Label54: TLabel;
    recErrorNotificacoes: TRectangle;
    Layout90: TLayout;
    Image25: TImage;
    Label55: TLabel;
    recErroComentario: TRectangle;
    Layout126: TLayout;
    Image26: TImage;
    Label56: TLabel;
    Label57: TLabel;
    lstvComercio: TListView;
    imgLinha: TImage;
    imgStarApagada: TImage;
    imgStarAcesa: TImage;
    lstvPrincipal: TListView;
    lstvSubGrupo: TListView;
    aniLoadFotoPrincipal: TAniIndicator;
    aniLoadingLogo: TAniIndicator;
    aniLoadingFoto1: TAniIndicator;
    aniLoadingFoto2: TAniIndicator;
    aniLoadingFoto3: TAniIndicator;
    aniLoadingFoto4: TAniIndicator;
    aniLoadingFoto5: TAniIndicator;
    aniLoadingFoto6: TAniIndicator;
    aniLoadingFoto7: TAniIndicator;
    aniLoadingFoto8: TAniIndicator;
    FillRGBEffect4: TFillRGBEffect;
    FillRGBEffect9: TFillRGBEffect;
    FillRGBEffect10: TFillRGBEffect;
    FillRGBEffect11: TFillRGBEffect;
    FillRGBEffect13: TFillRGBEffect;
    FillRGBEffect14: TFillRGBEffect;
    FillRGBEffect15: TFillRGBEffect;
    FillRGBEffect17: TFillRGBEffect;
    FillRGBEffect18: TFillRGBEffect;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure lblTentarNovamenteClick(Sender: TObject);
    procedure lblEncerrarClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure tmBannerPrincipalTimer(Sender: TObject);
    procedure lblOKRegistronaoEncontradoClick(Sender: TObject);
    procedure lblOKErroConexaoClick(Sender: TObject);
    procedure tmBannerFotosSecaoTimer(Sender: TObject);
    procedure imgFacebookClick(Sender: TObject);
    procedure imgTwitterClick(Sender: TObject);
    procedure imgInstagramClick(Sender: TObject);
    procedure imgGoogleMaisClick(Sender: TObject);
    procedure imgYoutubeClick(Sender: TObject);
    procedure imgAppClick(Sender: TObject);
    procedure imgFoto1Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure LocationSensor1LocationChanged(Sender: TObject; const OldLocation,
      NewLocation: TLocationCoord2D);
    procedure Image8Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure imgWazeClick(Sender: TObject);
    procedure imgMapsClick(Sender: TObject);
    procedure lblCancelarCadastroClick(Sender: TObject);
    procedure Image14Click(Sender: TObject);
    procedure Image15Click(Sender: TObject);
    procedure Label18Click(Sender: TObject);
    procedure lblCadastrarUsuarioClick(Sender: TObject);
    procedure lblOKClick(Sender: TObject);
    procedure lblAtivarClick(Sender: TObject);
    procedure FormFocusChanged(Sender: TObject);
    procedure FormVirtualKeyboardHidden(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure FormVirtualKeyboardShown(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure tmAtivacaoTimer(Sender: TObject);
    //procedure Label27Click(Sender: TObject);
    procedure lblDestaquesClick(Sender: TObject);
    procedure lblNaoClick(Sender: TObject);
    procedure lblCelularErradoClick(Sender: TObject);
    procedure lblCancelarRecuperaSenhaClick(Sender: TObject);
    procedure lblCancelaAtivacaoClick(Sender: TObject);
    procedure lblEntrarClick(Sender: TObject);
    procedure lblEsqueciSenhaClick(Sender: TObject);
    procedure Image17Click(Sender: TObject);
    procedure recBaseMenuClick(Sender: TObject);
    procedure faButtomOnMenuFinish(Sender: TObject);
    procedure faCloseMenuFinish(Sender: TObject);
    procedure faOpenMenuFinish(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imgFavoritosClick(Sender: TObject);
    procedure imgBtnMenuPrincipalClick(Sender: TObject);
    procedure faButtomOffMenuFinish(Sender: TObject);
    procedure lblFavoritosClick(Sender: TObject);
    procedure imgBtnPesquisaClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure lblBtnExibeAvaliacoesClick(Sender: TObject);
    procedure sbtnVoltarClick(Sender: TObject);
    procedure Image20Tap(Sender: TObject; const Point: TPointF);
    procedure edtBuscaKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure btnAdicionarClick(Sender: TObject);
    procedure lblCancelarClick(Sender: TObject);
    procedure lblAvaliarClick(Sender: TObject);
    procedure tmsStarAvaliaLimpezaPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
    procedure tmsStarAvaliaAmbientePaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
    procedure tmsStarAvaliaLocalizacaoPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
    procedure tmsStarAvaliaAtendimentoPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
    procedure tmsStarAvaliaPrecosPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
    procedure tmPushTimer(Sender: TObject);
    procedure tmAnunciosTimer(Sender: TObject);
    procedure lblConfiguracoesTap(Sender: TObject; const Point: TPointF);
    procedure lblNotificacoesClick(Sender: TObject);
    procedure lblSairClick(Sender: TObject);
    procedure edtCNPJExit(Sender: TObject);
    procedure edtTelefoneExit(Sender: TObject);
    procedure lblQueroAnunciarClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure edtContatoKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure imgIfoodClick(Sender: TObject);
    procedure imgRappiClick(Sender: TObject);
    procedure imgUberEatsClick(Sender: TObject);
    procedure btnHomeClick(Sender: TObject);
    procedure Image19Click(Sender: TObject);
    procedure Label42Click(Sender: TObject);
    procedure lblAcessarSemLoginClick(Sender: TObject);
    procedure Label15Click(Sender: TObject);
    procedure lblAvaliaAppClick(Sender: TObject);
    procedure lblMinhaContaClick(Sender: TObject);
    procedure lblLogarClick(Sender: TObject);
    procedure Label44Click(Sender: TObject);
    procedure Label31Click(Sender: TObject);
    procedure Label48Click(Sender: TObject);
    procedure Label52Click(Sender: TObject);
    procedure Label63Tap(Sender: TObject; const Point: TPointF);
    procedure lstvPrincipalItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure lstvPrincipalUpdateObjects(const Sender: TObject; const AItem: TListViewItem);
    procedure lstvSubGrupoItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure lstvSubGrupoUpdateObjects(const Sender: TObject; const AItem: TListViewItem);
    procedure lstvComercioUpdateObjects(const Sender: TObject; const AItem: TListViewItem);
    procedure lstvComercioItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure CarregaSecoesPrincipal;
  private

    FPhoneDialerService: IFMXPhoneDialerService;
    FReadSMS, FCallPhonePermission: String;
    Access_Fine_Location, Access_Coarse_Location : string;
    FNeedOffSet: Boolean;
    FKBBounds: TRectF;
    procedure CarregaDestaqueFavorito(vIdUsu : Integer);
    procedure CalcContentBoundsProc(Sender: TObject;
               var ContentBounds: TRectF);
    procedure RestorePosition(vScrollBox: TVertScrollBox; vLayout: TLayout);
    procedure UpdateKBBounds(vScrollBox: TVertScrollBox; vLayout: TLayout);
    procedure CarregaListaComercio(Sender: TObject);
    procedure CarregaSubSecoes(Sender: TObject);


    procedure CarregaComercio(Sender: TObject);

    procedure MensagemErro(vMsg : String; vOK : Boolean);

    procedure LocationPermissionRequestResult
             (Sender: TObject; const APermissions: TArray<string>;
             const AGrantResults: TArray<TPermissionStatus>);

    procedure ReadSMSPermissionRequestResult
             (Sender: TObject; const APermissions: TArray<string>;
             const AGrantResults: TArray<TPermissionStatus>);

    procedure MakePhoneCallPermissionRequestResult(Sender: TObject;
      const APermissions: TArray<string>;
      const AGrantResults: TArray<TPermissionStatus>);

    procedure DisplayRationale(Sender: TObject;
      const APermissions: TArray<string>; const APostRationaleProc: TProc);
    function AppEventProc(AAppEvent: TApplicationEvent; AContext: TObject): Boolean;
    procedure DoServiceConnectionChange(Sender: TObject; PushChanges: TPushService.TChanges);
    procedure DoReceiveNotificationEvent(Sender: TObject; const ServiceNotification: TPushServiceNotification);
    procedure LoadImagens(sThread: TThread; ALista : TStringList);
    procedure GerarFramesAvaliacoes(AAvaliacao: TAvaliacoes);
    procedure ExibeAvaliacoes(AStart : Integer);
    procedure ControlaTool(ArecSearch, AsbtnVoltar, AbtnAdicionar, AlytTitulos, AbtnEnviar, AbtnHome: Boolean);
    procedure ExtraiAvaliacoes;
    procedure OnTapNotificacao(Sender: TObject; const Point: TPointF);
    procedure CarregaPush;
    procedure OnTapDeletePush(Sender: TObject; const Point: TPointF);
    procedure VisualizaAnuncios(AIdCom: Integer);
    procedure OnClickExibeAnuncios(Sender: TObject);
    procedure OnClickPushCom(Sender: TObject);
    procedure OnActivePush(AIdCom, ANomeCom: String);
    procedure OnClickActivePush(Sender: TObject);
    procedure OnTapPushCom(Sender: TObject; const Point: TPointF);
    procedure FinalizaThreadLoading(Sender: TObject);
    function LogaUsuarioIni: Boolean;
    procedure AddItemComercio(FIdComercio, FAvaliacao : Integer; FLogoComercio, FComercio, FSlogam, FStatus, FDistancia : String);
    procedure AddSecaoGrupo(FIdSecaoGrupo : Integer; FIconeGrupo, FNomeGrupo, FDescricaoGrupo : String);
    procedure AddSubGrupo(FIdSubGrupo: Integer; FDescricaoSubGrupo: String);
    procedure OnTapDestaque(Sender: TObject; const Point: TPointF);


    { Private declarations }
  public
    { Public declarations }
    MyThread : TMyThread;
    PushService: TPushService;
    ServiceConnection: TPushServiceConnection;
    procedure ExibeLoading(AMsg: String; AExibe: Boolean = True);

  end;

var
  frmMain: TfrmMain;
  vListaTab : TStringList;
  i : Integer = 1;
  j : Integer = 0;
  IndexFotos : Integer = 0;
  IndexFotosSecao : Integer = 0;
  gVoltaDestaque : Boolean = False;

  //TabControl
  tbControl : TTabControl;
  //Integer
  vIdSecao,
  vidComercio,
  vIdSubSecao,
  vCountAvaliacao,
  vStartAvaliacao : Integer;
  //tRectangle
  frecSubSecoes : TRectangle;
  recAvalia : TRectangle;
  lcBaseAnuncio : TRectangle;
  //TLayout
  lytLayoutMain,
  lytLayoutCom : TLayout;
  //TMemo
  ListaSecoes : TMemo;
  //TFlowLayout
  grdFlowlytCheck,
  flytFavorito : TFlowLayout;
  //TGridLayout
  grdGridlytFotos : TGridLayout;
  //String
  urlFoneWhats,
  vLatitudeApp,
  vLongitudeApp,
  lnkFace,
  lnkTwitter,
  lnkInstagran,
  lnkGoogleMais,
  lnkYoutube,
  lnkApp,
  lnkIfood,
  lnkRappi,
  lnkUberEats,
  lnkEndereco,
  vFone,
  vLogAtual,
  vCodigoAtivacao,
  vNovaSenha,
  lcDistancia,
  device_token,
  lcGrupo,
  lcSubGrupo,
  vLinkPush : String;
  //Double
  LatOrigem : Double = 0;
  LongOrigem : Double = 0;
  LatDestino,
  LongDestino : Double;
  //TVertScrollBox
  vsbVerticalScroll,
  vsbAvaliacoes,
  vsbFavorito,
  gScrollBox,
  vScrollPush : TVertScrollBox;
  //TTime
  lcTempo : TTime;
  vIndexLista1,
  vIndexLista2,
  vIndiceMedia : Integer;
  //Boolean
  vSendMSG : Boolean;
  gPesquisa : Boolean = False;
  gDestaque : Boolean = False;
  //TLabel
  lblLabelCom  : TLabel;
  //TImage
  imgImageCom  : TImage;
  //TStringList
  lstArquivos : TStringList;
  lcTabControl : TTabControl;
  lcAnuncio : Boolean = False;
  lcIdComercioPush,
  lcIdCom : Integer;
  lcNomeCom,
  lcIdComercio : String;
  lcAcessar : Boolean = False;
  lcErro : Boolean = False;
  lcAnterior : String;
  lcOnCreate : Boolean = False;
  lcNaoPermitiu : Boolean;
  lcSemLogar : Boolean = False;
  lcAcessoAnuncio : Boolean = False;

implementation

//{$REGION 'Nome'}
//{$ENDREGION}

{$R *.fmx}
{$R *.LgXhdpiTb.fmx ANDROID}

uses
untGlobal,
untVisualizaFotos,
Androidapi.JNI.GraphicsContentViewText,
Androidapi.Helpers,
IdURI,
Androidapi.JNI.JavaTypes,
Androidapi.JNIBridge,
Androidapi.JNI.Net,
Androidapi.JNI.Os,
Androidapi.IOUtils,
Androidapi.Jni.App,
FMX.Helpers.Android,
System.Android.Sensors,
FMX.FontGlyphs.Android,
System.Math;

procedure TfrmMain.VisualizaAnuncios(AIdCom : Integer);
var
AItemTab : TTabItem;
AImagem  : TImage;
AThreadAnuncios : TThread;
begin

    dmGeral.getAnuncios(AIdCom);

    dmGeral.memAnuncios.First;

    lcTabControl.DisposeOf;

    lcTabControl := TTabControl.Create(Self);
    lcTabControl.Parent := tbiAnuncios;
    lcTabControl.Align := TAlignLayout.Client;
    lcTabControl.TabPosition := TTabPosition.Dots;

    gListaParamAnuncio.DisposeOf;

    gListaParamAnuncio := TStringList.Create;

    while not dmGeral.memAnuncios.Eof do
        begin

            AItemTab := TTabItem.Create(lcTabControl);
            AItemTab.Parent := lcTabControl;

            AImagem          := TImage.Create(Self);
            AImagem.Parent   := AItemTab;
            AImagem.Align    := TAlignLayout.Client;
            AImagem.WrapMode := TImageWrapMode.Stretch;
            AImagem.Name     := 'imgAnuncio_' + dmGeral.memAnuncios.FieldByName('ID_ANUNCIOS').AsString;
            AImagem.Bitmap.LoadFromFile(CaminhoArquivos('LoadingAnuncios.jpg'));

            var vNameFile    := dmGeral.memAnuncios.FieldByName('NOMEFILE_ANUNCIO').AsString;
            gListaParamAnuncio.Add('IDFTP ' + ctrPATHANUNCIOSFTP + ' ' + vNameFile + ' ' + AImagem.Name);

            dmGeral.memAnuncios.Next;

        end;

        LoadImagens(AThreadAnuncios, gListaParamAnuncio);

end;

procedure TfrmMain.ExibeLoading(AMsg : String; AExibe : Boolean = True);
begin

    lblMsgCarregamento.Text := AMsg;
    recCarregamento.Visible := AExibe;
    faCarregamento.Enabled  := AExibe;

end;

procedure TfrmMain.OnTapDeletePush(Sender: TObject; const Point: TPointF);
var
AComponente : String;
begin

    AComponente := TImage(Sender).TagString;

    TThread.CreateAnonymousThread(
    procedure
    begin

        DeletePush(ApenasNumeros(AComponente).ToInteger);

        TThread.Synchronize(TThread.CurrentThread,
        procedure
        begin
            TRectangle(frmMain.FindComponent(AComponente)).DisposeOf;
        end);

    end).Start;
end;

procedure TfrmMain.CarregaPush;
var
recBase : TRectangle;
lytBase, lytAuxiliar, lytLayout  : TLayout;
imgImage : TImage;
lblLabel : TLabel;
lblLinkAnuncio : TLabel;
AThreadNotificacao : TThread;
begin

    vScrollPush.DisposeOf;

    dmGeral.getNotificacoes(gIdUsuConectado);

    if dmGeral.memNotificacao.RecordCount <= 0 then
        begin

            recErrorNotificacoes.Visible := True;

        end
     else
        begin
            recErrorNotificacoes.Visible := False;
            vScrollPush := TVertScrollBox.Create(Self);
            vScrollPush.Parent := recNotificacoes;
            vScrollPush.Align := TAlignLayout.Client;

            dmGeral.memNotificacao.First;

            gListaParamGeral.DisposeOf;

            gListaParamGeral := TStringList.Create;

            While not dmGeral.memNotificacao.Eof do
                begin
                    //Retangulo Base
                    recBase             := TRectangle.Create(Self);
                    recBase.Parent      := vScrollPush;
                    recBase.Align       := TAlignLayout.Top;
                    recBase.Height      := 110;
                    recBase.Fill.Color  := StringToAlphaColor('#FFF2F2F2');
                    recBase.Stroke.Kind := TBrushKind.None;
                    recBase.Margins.Bottom := 2;
                    recBase.Name        := 'imgRecNotificacao_' + dmGeral.memNotificacao.FieldByName('ID_PUSH').AsString;
                    //Layout para a imagem
                    lytLayout := TLayout.Create(Self);
                    lytLayout.Parent    := recBase;
                    lytLayout.Align     := TAlignLayout.Left;
                    lytLayout.Width     := 60;
                    //Image para a imagem
                    imgImage            := TImage.Create(Self);
                    imgImage.Parent     := lytLayout;
                    imgImage.Align      := TAlignLayout.Center;
                    imgImage.Width      := 50;
                    imgImage.Height     := 50;
                    imgImage.Name       := 'imgImageNotificacao_' + dmGeral.memNotificacao.FieldByName('ID_PUSH').AsString;
                    imgImage.WrapMode   := TImageWrapMode.Center;

                    var vNameFile := dmGeral.memNotificacao.FieldByName('IMAGEM_PUSH').AsString;
                    gListaParamGeral.Add('IDFTP ' + ctrPATHPUSHFTP + ' ' + vNameFile + ' ' + imgImage.Name);

                    //LayoutBase da base da notificacao
                    lytBase             := TLayout.Create(Self);
                    lytBase.Parent      := recBase;
                    lytBase.Align       := TAlignLayout.Client;
                    //Layout para o titulo
                    lytLayout           := TLayout.Create(Self);
                    lytLayout.Parent    := lytBase;
                    lytLayout.Align     := TAlignLayout.Top;
                    lytLayout.Height    := 30;
                    //Label contendo o titulo
                    lblLabel            := TLabel.Create(Self);
                    lblLabel.Parent     := lytLayout;
                    lblLabel.Align      := TAlignLayout.Client;
                    lblLabel.Margins.Left := 10;
                    lblLabel.StyledSettings := lblLabel.StyledSettings - [TStyledSetting.Family,TStyledSetting.Style, TStyledSetting.Size];
                    lblLabel.TextSettings.Font.Size  := 14;
                    lblLabel.TextSettings.Font.Style := [TFontStyle.fsBold];
                    lblLabel.Text       := dmGeral.memNotificacao.FieldByName('TITULO_PUSH').AsString;
                    if (dmGeral.memNotificacao.FieldByName('IDCOM_PUSH').AsInteger > 0) and
                       (dmGeral.memNotificacao.FieldByName('ANUNCIO_PUSH').AsString = 'F') then
                       begin
                           lblLabel.TagString := dmGeral.memNotificacao.FieldByName('IDCOM_PUSH').AsString;
                           lblLabel.HitTest   := True;
                           lblLabel.OnClick   := OnClickPushCom;
                       end;


                    //Layout Auxiliar
                    lytAuxiliar         := TLayout.Create(Self);
                    lytAuxiliar.Parent  := lytBase;
                    lytAuxiliar.Align   := TAlignLayout.Client;
                    //Layout para o icone da lixeira
                    lytLayout           := TLayout.Create(Self);
                    lytLayout.Parent    := lytAuxiliar;
                    lytLayout.Align     := TAlignLayout.Right;
                    lytLayout.Width     := 50;
                    //Image para o icone da lixeira
                    imgImage            := TImage.Create(Self);
                    imgImage.Parent     := lytLayout;
                    imgImage.Align      := TAlignLayout.Top;
                    imgImage.Height     := 35;
                    imgImage.Bitmap.LoadFromFile(CaminhoArquivos('btnTrash.png'));
                    imgImage.WrapMode   := TImageWrapMode.Fit;
                    imgImage.TagString  := recBase.Name;
                    imgImage.OnTap      := OnTapDeletePush;
                    //Layout para a notificação
                    lytLayout           := TLayout.Create(Self);
                    lytLayout.Parent    := lytAuxiliar;
                    lytLayout.Align     := TAlignLayout.Client;
                    //Label com a data
                    lblLabel            := TLabel.Create(Self);
                    lblLabel.Parent     := lytLayout;
                    lblLabel.Align      := TAlignLayout.Bottom;
                    lblLabel.Height     := 20;
                    lblLabel.Margins.Left   := 10;
                    lblLabel.StyledSettings := lblLabel.StyledSettings - [TStyledSetting.Family,
                                                                          TStyledSetting.Style,
                                                                          TStyledSetting.Size,
                                                                          TStyledSetting.FontColor,
                                                                          TStyledSetting.Other];
                    lblLabel.TextSettings.Font.Size := 12;
                    lblLabel.TextSettings.FontColor := StringToAlphaColor('#FF939393');
                    var AData := FormatDateTime('dddddd',dmGeral.memNotificacao.FieldByName('DATA_PUSH').AsDateTime);
                    lblLabel.Text       := Copy(AData, Pos(',', AData) + 1, Length(AData));
                    //Label caso a notificacao tenha anuncio

                    if dmGeral.memNotificacao.FieldByName('ANUNCIO_PUSH').AsString = 'T' then
                        begin

                            lblLinkAnuncio                := TLabel.Create(Self);
                            lblLinkAnuncio.Parent         := lblLabel;
                            lblLinkAnuncio.Align          := TAlignLayout.Right;
                            lblLinkAnuncio.Width          := 110;
                            lblLinkAnuncio.StyledSettings := lblLabel.StyledSettings - [TStyledSetting.Family,
                                                                                        TStyledSetting.Style,
                                                                                        TStyledSetting.Size,
                                                                                        TStyledSetting.FontColor,
                                                                                        TStyledSetting.Other];
                            lblLinkAnuncio.TextSettings.Font.Size  := 11;
                            lblLinkAnuncio.TextSettings.Font.Style := [TFontStyle.fsUnderline];
                            lblLinkAnuncio.TextSettings.FontColor  := StringToAlphaColor('#FF0C36FF');
                            lblLinkAnuncio.TextSettings.HorzAlign  := TTextAlign.Trailing;
                            lblLinkAnuncio.Text                    := 'Visualizar os anúncios';
                            lblLinkAnuncio.AutoSize                := True;
                            lblLinkAnuncio.TagString               := dmGeral.memNotificacao.FieldByName('TITULOCOM').AsString + '|' +
                                                                      dmGeral.memNotificacao.FieldByName('IDCOM_PUSH').AsString;

                            lblLinkAnuncio.HitTest                 := True;
                            lblLinkAnuncio.OnClick                 := OnClickExibeAnuncios;

                        end;
                    //Label com a Notificacao
                    lblLabel            := TLabel.Create(Self);
                    lblLabel.Parent     := lytLayout;
                    lblLabel.Align      := TAlignLayout.Client;
                    lblLabel.Margins.Left := 10;
                    lblLabel.StyledSettings := lblLabel.StyledSettings - [TStyledSetting.Family,
                                                                          TStyledSetting.Style,
                                                                          TStyledSetting.Size,
                                                                          TStyledSetting.FontColor,
                                                                          TStyledSetting.Other];
                    lblLabel.TextSettings.Font.Size := 14;
                    lblLabel.Text                   := dmGeral.memNotificacao.FieldByName('MSG_PUSH').AsString;
                    if (dmGeral.memNotificacao.FieldByName('IDCOM_PUSH').AsInteger > 0) and
                       (dmGeral.memNotificacao.FieldByName('ANUNCIO_PUSH').AsString = 'F') then
                       begin
                           lblLabel.TagString := dmGeral.memNotificacao.FieldByName('IDCOM_PUSH').AsString;
                           lblLabel.HitTest   := True;
                           lblLabel.OnClick   := OnClickPushCom;
                       end;
                    dmGeral.memNotificacao.Next;

                end;

             LoadImagens(AThreadNotificacao, gListaParamGeral);

        end;

end;

procedure TfrmMain.OnClickExibeAnuncios(Sender: TObject);
var
AIdCom, ANomeCom : String;
begin

    ExibeLoading('Carregando Anuncios');
    AIdCom   := Copy(TLabel(Sender).TagString,Pos('|',TLabel(Sender).TagString) + 1, Length(TLabel(Sender).TagString));
    ANomeCom := Copy(TLabel(Sender).TagString, 1, Pos('|',TLabel(Sender).TagString) - 1);

    TThread.CreateAnonymousThread(
    procedure
    begin

        VisualizaAnuncios(AIdCom.ToInteger);

        TThread.Synchronize(TThread.CurrentThread,
        procedure
        begin

            ExibeLoading('',False);
            actAnuncios.ExecuteTarget(Self);
            tmAnuncios.Enabled := True;
            lblGrupo.Text    := 'Anúncios';
            lblSubGrupo.Text := ANomeCom;
            ControlaTool(False, False, False, True, False, True);
            recNotificacao.Visible := False;
        end);

    end).Start;

end;

procedure TfrmMain.OnClickPushCom(Sender: TObject);
var
APoint : TPointF;
S : String;
begin

    vidComercio := TLabel(Sender).TagString.ToInteger;
    //OnTapComercio(Self, Apoint);
    ControlaTool(False, False,False,True,False,True);
end;

procedure TfrmMain.OnClickActivePush(Sender : TObject);
begin

    ExibeLoading('Carregando Anuncios');

    TThread.CreateAnonymousThread(
    procedure
    begin

        VisualizaAnuncios(lcIdComercioPush);

        TThread.Synchronize(TThread.CurrentThread,
        procedure
        begin

            ExibeLoading('',False);
            actAnuncios.ExecuteTarget(Self);
            tmAnuncios.Enabled := True;
            lblGrupo.Text    := 'Anúncios';
            lblSubGrupo.Text := lcNomeCom;
            ControlaTool(False, False, False, True, False, True);
            recNotificacao.Visible := False;

        end);

    end).Start;

end;

procedure TfrmMain.OnActivePush(AIdCom, ANomeCom: String);
begin

    ExibeLoading('Carregando Anuncios');

    TThread.CreateAnonymousThread(
    procedure
    begin

        VisualizaAnuncios(AIdCom.ToInteger);

        TThread.Synchronize(TThread.CurrentThread,
        procedure
        begin

            ExibeLoading('',False);
            actAnuncios.ExecuteTarget(Self);
            tmAnuncios.Enabled := True;
            lblGrupo.Text    := 'Anúncios';
            lblSubGrupo.Text := ANomeCom;
            ControlaTool(False, False, False, True, False, True);
            recNotificacao.Visible := False;

        end);

    end).Start;

end;

procedure TfrmMain.lblOKClick(Sender: TObject);
begin
recMsgLogin.Visible := False;
recModal.Visible    := False;
imgIcone.Visible:= True;
if uAction = uAAtivacao then
   actLogin.ExecuteTarget(Self) else
//if uAction = uARecuperacao then
   //actPrincipal.ExecuteTarget(Self);
end;

procedure TfrmMain.lblDestaquesClick(Sender: TObject);
begin
TThread.CreateAnonymousThread(
   procedure
      begin
         lcAcessoAnuncio := True;
         lcAnterior      := 'Destaque';
         faButtomOffMenu.Enabled := True;
         faCloseMenu.Enabled     := True;
         lblGrupo.Text           := 'Destaques';
         lblSubGrupo.Text        := '';
         lcGrupo    := 'Destaques';
         lcSubGrupo := '';
         uAction := uAFavoritos;
         TThread.Synchronize(nil,
            procedure
               begin
                  ExibeLoading('Carregando Destaques', True);
               end);
         CarregaDestaqueFavorito(0);
         ExibeLoading('',False);
         ControlaTool(False, True, False, True, False, True);
         gVoltaDestaque := True;
         actDestaque.ExecuteTarget(Self);
      end).Start;
end;

procedure TfrmMain.btnAdicionarClick(Sender: TObject);
begin

     lblPerguntaAvaliacao.Text      := Format(msgAvaliacao, [lblComercio.Text]);
     imgLogoAvaliado.Bitmap         := imgLogoCom.Bitmap;
     lblNomeAvaliado.Text           := lblComercio.Text;

     tmsStarAvaliaLimpeza.Value     := 0;
     tmsStarAvaliaAtendimento.Value := 0;
     tmsStarAvaliaPrecos.Value      := 0;
     tmsStarAvaliaLocalizacao.Value := 0;
     tmsStarAvaliaAmbiente.Value    := 0;

     lblNotaPrecos.Text             := '0.00';
     lblNotaLocalizacao.Text        := '0.00';
     lblNotaAmbiente.Text           := '0.00';
     lblNotaLimpeza.Text            := '0.00';
     lblNotaAtendimento.Text        := '0.00';

     mmComentario.SetFocus;

     recAdicionaAvaliacao.Visible   := True;

end;

procedure TfrmMain.btnEnviarClick(Sender: TObject);
begin

     if (ValidaDoc(ApenasNumeros(edtCNPJ.Text)) = False) or (Length(ApenasNumeros(edtCNPJ.Text)) <= 0) then
        begin
             lblCnpjInvalido.Visible := True;
             edtCNPJ.SetFocus;
             Abort;
        end else lblCnpjInvalido.Visible := False;

     if ValidaEMail(edtEmail.Text) = False then
         begin
             lblEmailInvalido.Visible := True;
             edtEmail.SetFocus;
             Abort;
         end else lblEmailInvalido.Visible := False;

     if length(edtRazao.Text) < 5 then
         begin
             lblRazaoInvalido.Visible := True;
             edtRazao.SetFocus;
             Abort;
         end else lblRazaoInvalido.Visible := False;

     if Length(ApenasNumeros(edtTelefone.Text)) < 10 then
        begin
             lblFoneInvalido.Visible := True;
             edtTelefone.SetFocus;
             Abort;
        end else lblFoneInvalido.Visible := False;

     if Length(edtContato.Text) < 3 then
        begin
             lblContatoInvalido.Visible := True;
             edtContato.SetFocus;
             Abort;
        end else lblContatoInvalido.Visible := False;

     if ComercioCadastrado(ApenasNumeros(edtCNPJ.Text)) = True then
        begin
             MensagemErro('CNPJ/CPF ja efetuou o cadastro, aguarde que entraremos em contato.', True);
             Abort;
        end
     else
        begin

           ExibeLoading('Enviando informações');

           TThread.CreateAnonymousThread(
           procedure
           begin

                NovoComercio(ApenasNumeros(edtCNPJ.Text), edtRazao.Text, edtEmail.Text, ApenasNumeros(edtTelefone.Text), edtContato.Text);

                TThread.Synchronize(TThread.CurrentThread,
                procedure
                begin

                     ExibeLoading('',False);

                     TLoading.ToastMessage(Self,
                                           'Dados enviados com sucesso, em breve entraremos em contato.',
                                            TAlignLayout.Bottom,
                                            $64000000);
                     ControlaTool(True, False, False, False, False, False);
                     actPrincipal.ExecuteTarget(Self);

                end);

           end).Start;

        end;
end;

procedure TfrmMain.btnHomeClick(Sender: TObject);
begin
    edtBusca.Text := '';
    lblSubGrupo.Text := '';
    lcSubGrupo := '';
    gPesquisa := False;
    lcAcessoAnuncio := False;
    ControlaTool(True,False,False,False,False,False);
    actPrincipal.ExecuteTarget(Self);
end;

procedure TfrmMain.CalcContentBoundsProc(Sender: TObject;
   var ContentBounds: TRectF);
begin
   if FNeedOffSet and (FKBBounds.Top > 0) then
   begin
      ContentBounds.Bottom := Max(ContentBounds.Bottom,
         2 * ClientHeight - FKBBounds.Top);
   end;
end;

procedure TfrmMain.RestorePosition(vScrollBox: TVertScrollBox; vLayout: TLayout);
begin
   vScrollBox.ViewportPosition := PointF(vScrollBox.ViewportPosition.X, 0);
   vLayout.Align := TAlignLayout.Client;
   vScrollBox.RealignContent;
end;

procedure TfrmMain.UpdateKBBounds(vScrollBox: TVertScrollBox;
vLayout: TLayout);
var
   LFocused: TControl;
   LFocusRect: TRectF;
begin
   FNeedOffSet := False;
   if Assigned(Focused) then
   begin
      LFocused := TControl(Focused.GetObject);
      LFocusRect := LFocused.AbsoluteRect;
      LFocusRect.Offset(vScrollBox.ViewportPosition);
      if (LFocusRect.IntersectsWith(TRectF.Create(FKBBounds))) and
         (LFocusRect.Bottom > FKBBounds.Top) then
      begin
         FNeedOffSet := True;
         vLayout.Align := TAlignLayout.Horizontal;
         vScrollBox.RealignContent;
         Application.ProcessMessages;
         vScrollBox.ViewportPosition := PointF(vScrollBox.ViewportPosition.X,
            LFocusRect.Bottom - FKBBounds.Top);
      end;
   end;
   if not FNeedOffSet then
      RestorePosition(gScrollBox, vLayout);
end;

procedure webLink(lnkLink : String);
var
   Intent: JIntent;
begin
   Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_VIEW, TJnet_Uri.JavaClass.parse(StringToJString(TIdURI.URLEncode(lnkLink))));
             TAndroidHelper.Activity.startActivity(Intent);
end;

procedure TfrmMain.SpeedButton2Click(Sender: TObject);
begin

   actDestaque.ExecuteTarget(Self);

end;


procedure TfrmMain.FormActivate(Sender: TObject);
var
    Notifications : TArray<TPushServiceNotification>;
    x : Integer;
    AMensagem,
    ATitulo,
    AImagem : String;
    AIdComercio : Integer;
    APointF : TPointF;
begin

    AIdComercio := 0;
    recNotificacao.Margins.Bottom := frmMain.Height - 80;
    recNotificacao.Visible        := False;

    Notifications := PushService.StartupNotifications;

    if Length(Notifications) > 0 then
    begin

        if Notifications[0].DataKey = 'fcm' then
        begin

             for x := 0 to Notifications[0].DataObject.Count - 1 do
                begin
                   if Notifications[0].DataObject.Pairs[x].JsonString.Value = 'Mensagem' then
                           AMensagem := Notifications[0].DataObject.Pairs[x].JsonValue.Value;

                   if Notifications[0].DataObject.Pairs[x].JsonString.Value = 'Titulo' then
                           ATitulo := Notifications[0].DataObject.Pairs[x].JsonValue.Value;

                   if Notifications[0].DataObject.Pairs[x].JsonString.Value = 'Imagem' then
                           AImagem := Notifications[0].DataObject.Pairs[x].JsonValue.Value;

                   if Notifications[0].DataObject.Pairs[x].JsonString.Value = 'Anuncio' then
                           lcAnuncio := StrToBoolValue(Notifications[0].DataObject.Pairs[x].JsonValue.Value,'T','F');

                   if Notifications[0].DataObject.Pairs[x].JsonString.Value = 'IdComercio' then
                           AIdComercio := Notifications[0].DataObject.Pairs[x].JsonValue.Value.ToInteger;

                   if Notifications[0].DataObject.Pairs[x].JsonString.Value = 'NomeComercio' then
                           lcNomeCom := Notifications[0].DataObject.Pairs[x].JsonValue.Value;

                end;

        end;

        if lcAnuncio = True then
            begin
               lcIdComercio := AIdComercio.ToString;
               Exit;
            end
         else
            begin
               imgSino.Visible            := True;
               faSino.Enabled             := True;
               CirclePushMenu.Visible     := True;
            end;

    end;

end;

procedure CancelarNotificacao(nome : string);
begin
    with frmMain do
    begin
        if nome = '' then
            NotificationCenter.CancelAll
        else
            NotificationCenter.CancelNotification(nome);
    end;
end;

procedure TfrmMain.DoReceiveNotificationEvent(Sender: TObject; const ServiceNotification: TPushServiceNotification);
var
        AMensagem,
        ATitulo,
        AImagem : string;
        x: Integer;
begin
        AMensagem   := '';
        lcIdComercioPush := 0;
        for x := 0 to ServiceNotification.DataObject.Count - 1 do
        begin

                if ServiceNotification.DataKey = 'fcm' then
                    begin

                        // Nosso server...
                        case AnsiIndexStr(ServiceNotification.DataObject.Pairs[x].JsonString.Value,['Mensagem','Titulo','Imagem', 'Anuncio', 'IdComercio','NomeComercio']) of

                                 0 : AMensagem        := ServiceNotification.DataObject.Pairs[x].JsonValue.Value;
                                 1 : ATitulo          := ServiceNotification.DataObject.Pairs[x].JsonValue.Value;
                                 2 : AImagem          := ServiceNotification.DataObject.Pairs[x].JsonValue.Value;
                                 3 : lcAnuncio        := StrToBoolValue(ServiceNotification.DataObject.Pairs[x].JsonValue.Value,'T','F');
                                 4 : lcIdComercioPush := ServiceNotification.DataObject.Pairs[x].JsonValue.Value.ToInteger;
                                 5 : lcNomeCom        := ServiceNotification.DataObject.Pairs[x].JsonValue.Value;
                        end;

                    end;

        end;

        imgSino.Visible            := True;
        faSino.Enabled             := True;
        CirclePushMenu.Visible     := True;

        lblTituloNotificacao.Text  := ATitulo;
        lblNotificacao.Text        := AMensagem;

        if lcAnuncio = True then
            begin
                lblTituloNotificacao.OnClick := OnClickActivePush;
                lblNotificacao.OnClick       := OnClickActivePush;
            end
        else
           begin
               if lcIdComercioPush > 0 then
                   begin
                       lblTituloNotificacao.TagString := lcIdComercioPush.ToString;
                       lblNotificacao.TagString       := lcIdComercioPush.ToString;
                       lblTituloNotificacao.OnClick   := OnClickPushCom;
                       lblNotificacao.OnClick         := OnClickPushCom;
                   end
                else
                   begin
                       lblTituloNotificacao.OnTap := OnTapNotificacao;
                       lblNotificacao.OnTap       := OnTapNotificacao;
                   end;
           end;

           ReceiveFileFtp(ctrPATHPUSHFTP, AImagem, imgNotificacao, nil);
           recNotificacao.Visible := True;
           tmPush.Enabled         := True;
           lcAnuncio := False;

end;

procedure TfrmMain.OnTapPushCom(Sender: TObject; const Point: TPointF);
var
Apoint : TPointF;
begin

    //OnTapComercio(Self, Apoint);

end;

procedure TfrmMain.OnTapNotificacao(Sender: TObject; const Point: TPointF);
begin

     case lcAnuncio of

          True : OnClickExibeAnuncios(Self);
         False : begin
                    if gIdUsuConectado > 0 then
                         lblNotificacoesClick(Self);
                 end;
     end;

end;

procedure TfrmMain.DoServiceConnectionChange(Sender: TObject; PushChanges: TPushService.TChanges);
begin
        if TPushService.TChange.DeviceToken in PushChanges then
             begin
                device_token := PushService.DeviceTokenValue[TPushService.TDeviceTokenNames.DeviceToken];
                gKeyPush     := device_token;
                gRecebeNotificacao := RecebeNotificacao;
             end;
end;

procedure TfrmMain.edtBuscaKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
if key = 13 then
   begin

        Key := 0;
        imgBtnPesquisaClick(Self);

   end;

end;

procedure TfrmMain.edtCNPJExit(Sender: TObject);
begin

     edtCNPJ.Text := FormataDoc(edtCNPJ.Text);

end;

procedure TfrmMain.edtContatoKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin

     if Key = 13 then
        begin

             Key := 0;
             btnEnviarClick(Self);
        end;

end;

procedure TfrmMain.edtTelefoneExit(Sender: TObject);
begin

     edtTelefone.Text := formataTelefone(edtTelefone.Text);

end;

function TfrmMain.AppEventProc(AAppEvent: TApplicationEvent; AContext: TObject): Boolean;
begin
    if (AAppEvent = TApplicationEvent.BecameActive) then
        CancelarNotificacao('');
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
   Info: JApplicationInfo;
   AppEvent : IFMXApplicationEventService;
   AHeigthAviso : Single;
   AArqIni : TIniFile;
begin
       tbcGuiaAlvo.TabPosition := TTabPosition.None;
       imgStarApagada.Visible := False;
       imgStarAcesa.Visible   := False;
       imgLinha.Visible       := False;

       Label9.Text := 'Aguarde, Carregando...';
       actSplash.ExecuteTarget(Self);
       actPrincipal.ExecuteTarget(Self);
       AHeigthAviso := (Screen.Height - 360) / 2;

       recAvisoCadastro.Margins.Top    := AHeigthAviso;
       recAvisoCadastro.Margins.Bottom := AHeigthAviso;


       tmPush.Interval     := ctrTEMPOEXIBICAOPUSH;
       tmAnuncios.Interval := ctrTEMPOEXIBICAOANUNCIO;

       gImgFundoSplash     := CaminhoArquivos('FundoSplash.png');
       gImgTopoMenu        := CaminhoArquivos('FundoTopoMenu.png');
       gImgIconeMsg        := CaminhoArquivos('IconeMsg.png');
       gImgLogoErroConexao := CaminhoArquivos('LogoErroConexao.png');
       gImgLogoSplash      := CaminhoArquivos('LogoSplash.png');

       lblCaptionConexao.Text        := gNomeApp;
       lblCaptionGPS.Text            := gNomeApp;
       lblCaptionMsgConfirmacao.Text := gNomeApp;
       lblCaptionMSG.Text            := gNomeApp;

       imgLogoSplash.Bitmap.LoadFromFile(gImgLogoSplash);
       imgFundoSplash.Bitmap.LoadFromFile(gImgFundoSplash);

       imgLogoAppErroConexao.Bitmap.LoadFromFile(gImgLogoErroConexao);
       imgLogoAppConexao.Bitmap.LoadFromFile(gImgIconeMsg);
       imgLogoAppGPS.Bitmap.LoadFromFile(gImgIconeMsg);
       imgLogoAppMsg.Bitmap.LoadFromFile(gImgIconeMsg);
       imgTopoMenu.Bitmap.LoadFromFile(gImgTopoMenu);
       imgLogoAppErroConexao.Bitmap.LoadFromFile(gImgLogoErroConexao);

        // Eventos do app (para exclusao das notificacoes)...
        if TPlatformServices.Current.SupportsPlatformService(IFMXApplicationEventService, IInterface(AppEvent)) then
            AppEvent.SetApplicationEventHandler(AppEventProc);

        // Notificações Push...
        {$IFDEF IOS}
        PushService := TPushServiceManager.Instance.GetServiceByName(TPushService.TServiceNames.APS);
        {$ELSE}
        PushService := TPushServiceManager.Instance.GetServiceByName(TPushService.TServiceNames.GCM);
        {$ENDIF}

        ServiceConnection := TPushServiceConnection.Create(PushService);
        ServiceConnection.OnChange := DoServiceConnectionChange;
        ServiceConnection.OnReceiveNotification := DoReceiveNotificationEvent;
        ServiceConnection.Active := True;

     Try

        AArqIni := TIniFile.Create(CaminhoArquivos('Tutorial.ini'));
        gPermissionLocal := StrToBoolValue(AArqIni.ReadString('PERMISSION', 'Localizacao', ''),'T','F')
     finally

        AArqIni.DisposeOf;

     end;

   FReadSMS               := JStringToString(TJManifest_permission.JavaClass.READ_SMS);
   FCallPhonePermission   := JStringToString(TJManifest_permission.JavaClass.CALL_PHONE);
   Access_Coarse_Location := JStringToString(TJManifest_permission.JavaClass.ACCESS_COARSE_LOCATION);
   Access_Fine_Location   := JStringToString(TJManifest_permission.JavaClass.ACCESS_FINE_LOCATION);
   TPlatformServices.Current.SupportsPlatformService(IFMXPhoneDialerService, FPhoneDialerService);

   if gPermissionLocal = False then
       begin
            recAutorizacao.Visible := True;
            recModal.Visible       := True;
            faPino.Enabled         := True;
            Exit;
       end
    else
       begin

       PermissionsService.RequestPermissions([Access_Coarse_Location,
                                              Access_Fine_Location],
                                              LocationPermissionRequestResult,
                                              DisplayRationale);

       if (LogaUsuarioIni = False) and (lcSemLogar = False) then
           begin
              tbcUsuario.Visible := True;
              Exit;
           end;
       if (LogaUsuarioIni = True) or (lcSemLogar = True) then
           begin

               Try
                   Info := TAndroidHelper.Context.getPackageManager.getApplicationInfo(StringToJString('com.waze'), 0);
                   if Info.packageName.equals(StringToJString('com.waze')) then
                      begin
                         EffectMonoWaze.Enabled := False;
                         imgWaze.HitTest := True;
                      end
                   else
                      begin
                         EffectMonoWaze.Enabled := True;
                         imgWaze.HitTest := False;
                      end;
               Except
                  EffectMonoWaze.Enabled := True;
                  imgWaze.HitTest := False;
               end;

               Try
                   Info := TAndroidHelper.Context.getPackageManager.getApplicationInfo(StringToJString('com.google.android.apps.maps'), 0);
                   if Info.packageName.equals(StringToJString('com.google.android.apps.maps')) then
                      begin
                         EffectMonoMaps.Enabled := False;
                         imgMaps.HitTest := True;
                      end
                   else
                      begin
                         EffectMonoMaps.Enabled := True;
                         imgMaps.HitTest := False;
                      end;
               Except
                   EffectMonoMaps.Enabled := True;
                   imgMaps.HitTest := False;
               end;

                  lstArquivos := TStringList.Create;

                  gTempoReenvio := StrToTime('00:02:00');
                  FormatSettings.DecimalSeparator := '.';

                  lytLoadingPrincipal.Visible := True;

                  //Application.FormFactor.Orientations := [TFormOrientation.Portrait];
                  tbcGuiaAlvo.ActiveTab := tbiSplash;

                  TThread.CreateAnonymousThread(
                     procedure
                        begin
                           TThread.Synchronize(nil,
                              procedure
                                 begin
                                    lblMsgErro.Text := #13#13+
                                                       'Não foi possivel se conectar'+#13+
                                                       'com o servidor!!!'+#13#13+
                                                       'Verifique sua conexão e'+#13+
                                                       'tente novamente.';
                                    aniLoading.Enabled := True;
                                    tbcUsuario.Visible := False;
                                 end);
                           CarregaSecoesPrincipal;
                        end).Start;

           end;
       end;
end;

procedure TfrmMain.FormFocusChanged(Sender: TObject);
begin

     UpdateKBBounds(gScrollBox, lytUsuario);

end;

procedure TfrmMain.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
   if Key = vkHardwareBack then
      begin
         if dmGeral.KeyboradShowing = True then
            begin
               dmGeral.KeyboradHide;
            end
         else
            begin
               if (frmVisualizaFotos.Visible = True) or (recModal.Visible = True) or (recCarregamento.Visible = True) then
                  begin
                     Key := 0;
                     Exit;
                  end
               else
                  begin
                     Key := 0;
                     sbtnVoltarClick(Self);
                  end;
            end;
      end;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin

    EfectFavoritar.Enabled := True;

end;

procedure TfrmMain.FormVirtualKeyboardHidden(Sender: TObject;
  KeyboardVisible: Boolean; const Bounds: TRect);
begin
   FKBBounds.Create(0, 0, 0, 0);
   FNeedOffSet := False;
   RestorePosition(gScrollBox, lytUsuario);

   ScrollCadastro.Margins.Bottom := 0;
end;

procedure TfrmMain.FormVirtualKeyboardShown(Sender: TObject;
  KeyboardVisible: Boolean; const Bounds: TRect);
begin
   FKBBounds := TRectF.Create(Bounds);
   FKBBounds.TopLeft := ScreenToClient(FKBBounds.TopLeft);
   FKBBounds.BottomRight := ScreenToClient(FKBBounds.BottomRight);
   UpdateKBBounds(gScrollBox, lytUsuario);
end;

procedure TfrmMain.MakePhoneCallPermissionRequestResult(Sender: TObject;
  const APermissions: TArray<string>;
  const AGrantResults: TArray<TPermissionStatus>);
begin
   if (Length(AGrantResults) = 1) and
     (AGrantResults[0] = TPermissionStatus.Granted) then
      FPhoneDialerService.Call(vFone)
   else
      TDialogService.ShowMessage
        ('Não é possível fazer uma ligação porque a permissão necessária não foi concedida');
end;

procedure TfrmMain.DisplayRationale(Sender: TObject;
  const APermissions: TArray<string>; const APostRationaleProc: TProc);
begin
  TDialogService.ShowMessage( 'O aplicativo precisa de permissao para ler seus SMS para validar automaticamente',
    procedure(const AResult: TModalResult)
    begin
      APostRationaleProc;
    end)
end;

procedure TfrmMain.faButtomOffMenuFinish(Sender: TObject);
begin
  faButtomOffMenu.Enabled := False;
end;

procedure TfrmMain.faButtomOnMenuFinish(Sender: TObject);
begin

  faButtomOnMenu.Enabled := False;

end;

procedure TfrmMain.faCloseMenuFinish(Sender: TObject);
begin

     recBaseMenu.Visible := False;
     faCloseMenu.Enabled := False;

end;

procedure TfrmMain.faOpenMenuFinish(Sender: TObject);
begin

   faOpenMenu.Enabled := False;

end;

procedure TfrmMain.CarregaDestaqueFavorito(vIdUsu : Integer);
var
recFavorito  : TRectangle;
lytFavorito  : TLayout;
lytBaseFavorito : TLayout;
lytBaseFavoritoPrincipal : TLayout;
rtFavotiro   : TTMSFMXRating;
imgFavorito  : TImage;
lblFavorito  : TLabel;
seFavorito   : TShadowEffect;
vH, vW, i, idControl : Integer;
vHT : Single;
AThreadFavoritos : TThread;
AItem : TListViewItem;
begin

   Try

      //Define a variavel que e a tela de destaque
      gDestaque := True;

      FormatSettings.DecimalSeparator  := '.';
      FormatSettings.ThousandSeparator := ',';
      //carrega a lista de Destaques
      dmGeral.LoadDestaqueFavorito(device_token, vIdUsu);

      //Verifica se foi encontrado algum registro
      if dmGeral.memDestaques.RecordCount = 0 then
         begin
            recErrorDestaque.Visible := true;
            ControlaTool(False, True, False, True, False, True);
            edtBusca.Text := '';
            Exit;
         end
      else
         begin
            recErrorDestaque.Visible := False;
            //coloca o ponteiro no primeiro registro
            dmGeral.memDestaques.First;

            vsbFavorito.DisposeOf;
            i := 1;
            vsbFavorito := TVertScrollBox.Create(frmMain);
            vsbFavorito.Parent := tbiDestaques;
            vsbFavorito.Align := TAlignLayout.Client;
            vsbFavorito.Margins.Top    := 5;
            vsbFavorito.Margins.Left   := 5;
            vsbFavorito.Margins.Bottom := 5;
            vsbFavorito.Margins.Right  := 5;

            gListaParamFavorito.DisposeOf;

            gListaParamFavorito := TStringList.Create;

            while not dmGeral.memDestaques.Eof do
               begin
                  //Pega a latitude e a longitude do Comercio (Cadastrado no Banco de dados
                  LatDestino  := dmGeral.memDestaques.FieldByName('LATCOM').AsFloat;
                  LongDestino := dmGeral.memDestaques.FieldByName('LONGCOM').AsFloat;

                  lcDistancia := GetDistancia(LatOrigem,LongOrigem,LatDestino,LongDestino);
                   //Armazena o codigo do registro atual
                  idControl := dmGeral.memDestaques.FieldByName('IDCOM').AsInteger;

                  //Cria o Layout para os anuncios
                  if i = 1 then
                     begin
                        lytBaseFavoritoPrincipal := TLayout.Create(frmMain);
                        lytBaseFavoritoPrincipal.Parent := vsbFavorito;
                        lytBaseFavoritoPrincipal.Align := TAlignLayout.Bottom;
                        lytBaseFavoritoPrincipal.Margins.Left  := 5;
                        lytBaseFavoritoPrincipal.Margins.Right := 5;
                        lytBaseFavoritoPrincipal.Margins.Top   := 5;
                        lytBaseFavoritoPrincipal.Height := Round(vsbFavorito.Width / 2);
                        lytBaseFavoritoPrincipal.Height := lytBaseFavoritoPrincipal.Height - 5;
                        vHT := lytBaseFavoritoPrincipal.Height;

                     end;

                     i := i + 1;

                     //Cria o Quadro para o anuncio
                     recFavorito := TRectangle.Create(frmMain);
                     recFavorito.Parent := lytBaseFavoritoPrincipal;
                     recFavorito.Align  := TAlignLayout.Left;
                     recFavorito.Width  := lytBaseFavoritoPrincipal.Height - 10;
                     recFavorito.Margins.Left   := 2;
                     recFavorito.Margins.Right  := 2;
                     recFavorito.Margins.Bottom := 2;
                     recFavorito.Fill.Color := TAlphaColorRec.White;
                     recFavorito.Stroke.Kind := TBrushKind.None;
                     recFavorito.HitTest := True;
                     recFavorito.TagString := dmGeral.memDestaques.FieldByName('TITULOCOM').AsString;
                     recFavorito.Name := 'recBaseFavorito_' + idControl.ToString;
                     recFavorito.OnTap := OnTapDestaque;


                     //Cria o efeito de sombra no quadro
                     seFavorito := TShadowEffect.Create(frmMain);
                     seFavorito.Parent := recFavorito;


                     //Cria o Layout base do rodape do quadro
                     lytBaseFavorito := TLayout.Create(frmMain);
                     lytBaseFavorito.Parent := recFavorito;
                     lytBaseFavorito.Align  := TAlignLayout.Bottom;
                     lytBaseFavorito.Height := 50;
                     lytBaseFavorito.Locked := True;

                     //Cria o Layout da qualificacao e distancia
                     lytFavorito := TLayout.Create(frmMain);
                     lytFavorito.Parent := lytBaseFavorito;
                     lytFavorito.Align  := TAlignLayout.Bottom;
                     lytFavorito.Height := 25;
                     lytFavorito.Locked := True;

                     //Cria o TMSRating(Estrelas)
                     rtFavotiro := TTMSFMXRating.Create(frmMain);
                     rtFavotiro.Parent  := lytFavorito;
                     rtFavotiro.Align   := TAlignLayout.Left;
                     rtFavotiro.Margins.Left := 3;
                     rtFavotiro.Height  := 25;
                     rtFavotiro.Width   := 90;
                     rtFavotiro.Enabled := False;
                     rtFavotiro.Name    := 'rtDestaque_'+idControl.ToString;
                     rtFavotiro.Value   := dmGeral.memDestaques.FieldByName('MEDIATOTALAVALIA').Value;
                     rtFavotiro.OnTap   := OnTapDestaque;

                     //Cria o label com a distancia
                     lblFavorito := TLabel.Create(frmMain);
                     lblFavorito.Parent := lytFavorito;
                     lblFavorito.StyledSettings := lblFavorito.StyledSettings - [TStyledSetting.FontColor,TStyledSetting.Family,TStyledSetting.Style, TStyledSetting.Size];
                     lblFavorito.Align := TAlignLayout.Client;
                     lblFavorito.TextSettings.HorzAlign := TTextAlign.Trailing;
                     lblFavorito.Margins.Right := 5;
                     lblFavorito.Font.Size := 14;
                     lblFavorito.Name := 'lblDistanciadestaque_'+idControl.ToString;
                     lblFavorito.Text := lcDistancia;
                     lblFavorito.OnTap := OnTapDestaque;

                     //Cria o Layout do titulo
                     lytFavorito := TLayout.Create(frmMain);
                     lytFavorito.Parent := lytBaseFavorito;
                     lytFavorito.Align  := TAlignLayout.Client;

                     //Cria o Label do Titulo
                     lblFavorito := TLabel.Create(frmMain);
                     lblFavorito.Parent := lytFavorito;
                     lblFavorito.Align := TAlignLayout.Bottom;
                     lblFavorito.StyledSettings := lblFavorito.StyledSettings - [TStyledSetting.FontColor,TStyledSetting.Family,TStyledSetting.Style, TStyledSetting.Size];
                     lblFavorito.TextSettings.HorzAlign := TTextAlign.Center;
                     lblFavorito.Font.Size := 18;
                     lblFavorito.Name := 'lblTitulodestaque_'+idControl.ToString;
                     lblFavorito.Text := dmGeral.memDestaques.FieldByName('TITULOCOM').AsString;
                     lblFavorito.OnTap := OnTapDestaque;

                     //Cria o Timage para armazenar o logo do comercio
                     imgFavorito := TImage.Create(frmMain);
                     imgFavorito.Parent := recFavorito;
                     imgFavorito.Align  := TAlignLayout.Client;
                     imgFavorito.Margins.Top    := 5;
                     imgFavorito.Margins.Left   := 5;
                     imgFavorito.Margins.Bottom := 5;
                     imgFavorito.Margins.Right  := 5;
                     imgFavorito.Bitmap.LoadFromFile(CaminhoArquivos('LoadingIco.png'));
                     imgFavorito.Name := 'imgDestaque_'+idControl.ToString;
                     imgFavorito.OnTap := OnTapDestaque;

                     var vNameFile := dmGeral.memDestaques.FieldByName('ICOCOM').AsString;
                     gListaParamFavorito.Add('IdFTP ' + ctrPATHLOGOSFTP + ' ' + vNameFile + ' ' + imgFavorito.Name);

                     if i = 3 then
                        begin
                           i := 1;
                           lytBaseFavoritoPrincipal.Align := TAlignLayout.Top;
                        end;


                     //Caso tenha mais algum registro vai para o proximo e repete o processo
                     dmGeral.memDestaques.Next;
               end;
            FormatSettings.DecimalSeparator  := ',';
            FormatSettings.ThousandSeparator := '.';
            LoadImagens(AThreadFavoritos, gListaParamFavorito);
            lytBaseFavoritoPrincipal.Align := TAlignLayout.Top;
         end;

   Except on E:EJNIException do
      begin
         //Oculta a janela de loading
         ExibeLoading('',False);

         recModal.Visible := True;
         recFalhaConexao.Visible := True;
      end;
   end;
end;

procedure TfrmMain.LocationPermissionRequestResult
  (Sender: TObject; const APermissions: TArray<string>;
const AGrantResults: TArray<TPermissionStatus>);
var
AArqIni : TIniFile;
begin
   if (Length(AGrantResults) = 2) and
      (AGrantResults[0] = TPermissionStatus.Granted) and
      (AGrantResults[1] = TPermissionStatus.Granted) then
      begin
         Try
             AArqIni := TIniFile.Create(CaminhoArquivos('Tutorial.ini'));
             AArqIni.WriteString('PERMISSION', 'Localizacao', 'T');
         finally
             AArqIni.DisposeOf;
         end;

         LocationSensor1.Active := True;
         gPermissionLocal       := True;

         if lcOnCreate = True then
            begin
                lcOnCreate := False;
                faPino.Enabled := false;
                recModal.Visible := False;
                recAutorizacao.Visible := false;
                FormCreate(Self);
            end;

      end
   else
     begin
        gPermissionLocal := False;
        faSino.Enabled := False;
        recAutorizacao.Visible := False;
        recFinalizaApp.Visible := True;
        Label48.Visible := False;
     end;
end;

procedure TfrmMain.Image14Click(Sender: TObject);
begin

     ViewSenha(Image14, edtSenha.Password);
     edtSenha.Password := not edtSenha.Password;

end;

procedure TfrmMain.Image15Click(Sender: TObject);
begin

     ViewSenha(Image15, edtConfSenha.Password);
     edtConfSenha.Password := not edtConfSenha.Password;

end;

procedure TfrmMain.Image17Click(Sender: TObject);
begin

     ViewSenha(Image17, edtSenhaPrincipal.Password);
     edtSenhaPrincipal.Password := not edtSenhaPrincipal.Password;

end;

procedure TfrmMain.Image19Click(Sender: TObject);
var
urlWhats, urlMsg : String;
begin

urlMsg := 'Ola, ficamos sabendo sobre a empresa '+lblComercio.Text+' através do app ' + gNomeApp;
urlWhats := 'https://api.whatsapp.com/send?phone=55'+urlFoneWhats+'&text='+urlMsg;

webLink(urlWhats);
end;

procedure TfrmMain.imgBtnMenuPrincipalClick(Sender: TObject);
begin
  dmGeral.KeyboradHide;

  faButtomOnMenu.Enabled := True;
  recBaseMenu.Visible    := True;
  faOpenMenu.Enabled     := True;
end;

procedure TfrmMain.imgBtnPesquisaClick(Sender: TObject);
var
APoint : TPointF;
begin
if Length(edtBusca.Text) < 3 then
   begin
      dmGeral.KeyboradHide;
      uAction := uANull;
      MensagemErro('Para pesquisar é necessario preencher o campo de busca!',True);
      Exit;
   end
else
   begin
      gPesquisa := True;
      dmGeral.KeyboradHide;
      lblGrupo.Text    := 'Resultado da Pesquisa';
      lblSubGrupo.Text := '';
      lcGrupo    := 'Resultado da Pesquisa';
      lcSubGrupo := '';
      CarregaListaComercio(Self);
      ControlaTool(False, True, False, True, False, True);
   end;
end;

procedure TfrmMain.Image20Tap(Sender: TObject; const Point: TPointF);
begin
recModal.Visible := False;
recDetalhesAvaliacao.Visible := False;
end;

procedure TfrmMain.Image7Click(Sender: TObject);
begin
if FPhoneDialerService <> nil then
      PermissionsService.RequestPermissions([FCallPhonePermission],
                                             MakePhoneCallPermissionRequestResult,
                                             DisplayRationale)
   else
      TDialogService.ShowMessage('Serviço não suportado');
end;

procedure TfrmMain.Image8Click(Sender: TObject);
begin
recModal.Visible := True;
recGPS.Visible := True;
end;

procedure TfrmMain.imgAppClick(Sender: TObject);
begin
webLink(lnkApp);
end;

procedure TfrmMain.imgFacebookClick(Sender: TObject);
begin
webLink(lnkFace);
end;

procedure TfrmMain.imgFavoritosClick(Sender: TObject);
begin
   if gIdUsuConectado > 0 then
      begin

         if cm.ServerMethodsClient.IsFavorito(gIdUsuConectado, gIdComSelecionado) then
            begin
               cm.ServerMethodsClient.ControleFavorito(gIdUsuConectado,gIdComSelecionado, uAExclusao);
               EfectFavoritar.Enabled := True;
               gQtdeFavorito := gQtdeFavorito - 1;
           end
         else
            begin
               cm.ServerMethodsClient.ControleFavorito(gIdUsuConectado,gIdComSelecionado, uAInclusao);
               EfectFavoritar.Enabled := False;
               gQtdeFavorito := gQtdeFavorito + 1;
            end;
         lblQtdeFavoritos.Text := '('+ gQtdeFavorito.ToString +')';

      end
   else
      begin

         uAction := uANull;
         MensagemErro('Para adicionar aos favoritos é necessário estar logado no App!', True);

      end;
end;

procedure TfrmMain.imgFoto1Click(Sender: TObject);
begin
if Copy(TImage(Sender).Name,Length(TImage(Sender).Name),1) <= dmGeral.memFotosComercio.RecordCount.ToString then
   begin
      gFotoAtual := StrToInt(Copy(TImage(Sender).Name,Length(TImage(Sender).Name),1));
      frmVisualizaFotos.imgViewFoto.Bitmap := TImage(Sender).Bitmap;
      frmVisualizaFotos.Show;
   end;
end;

procedure TfrmMain.imgGoogleMaisClick(Sender: TObject);
begin
webLink(lnkGoogleMais);
end;

procedure TfrmMain.imgIfoodClick(Sender: TObject);
begin
webLink(lnkIfood);
end;

procedure TfrmMain.imgInstagramClick(Sender: TObject);
begin
webLink(lnkInstagran);
end;

procedure TfrmMain.imgMapsClick(Sender: TObject);
begin
webLink('https://www.google.com/maps/dir/?api=1&destination='+lnkEndereco);
recModal.Visible := False;
recGPS.Visible   := False;
end;

procedure TfrmMain.imgRappiClick(Sender: TObject);
begin
webLink(lnkRappi);
end;

procedure TfrmMain.imgTwitterClick(Sender: TObject);
begin
webLink(lnkTwitter);
end;

procedure TfrmMain.imgUberEatsClick(Sender: TObject);
begin
webLink(lnkUberEats);
end;

procedure TfrmMain.imgWazeClick(Sender: TObject);
begin
webLink('https://waze.com/ul?q='+lnkEndereco);
recModal.Visible := False;
recGPS.Visible   := False;
end;

procedure TfrmMain.imgYoutubeClick(Sender: TObject);
begin
webLink(lnkYoutube);
end;

procedure TfrmMain.MensagemErro(vMsg : String; vOK : Boolean);
begin
recModal.Visible    := True;
recMsgLogin.Visible := True;
lblMsgLogin.Text    := vMsg;
lblOK.Visible       := vOK;
lblSim.Visible      := not vOK;
lblNao.Visible      := not vOK;
recModal.Repaint;
end;

procedure TfrmMain.lblCadastrarUsuarioClick(Sender: TObject);
begin
If Length(Trim(edtNome.Text)) < 3 then
   begin
      MensagemErro('Nome de usuário inválido!',True);
      Exit;
   end;
If edtNome.Text = '' then
   begin
      MensagemErro('O campo nome é obrigatório!',True);
      Exit;
   end;
If edtCelular.Text = '' then
   begin
      MensagemErro('O campo celular é obrigatório!',True);
      Exit;
   end;
If not IsValidCelular(edtCelular.Text) then
   begin
      MensagemErro('Formato de celular inválido!',True);
      Exit;
   end;
if edtSenha.Text = '' then
   begin
      MensagemErro('O campo senha é obrigatório!',True);
      Exit;
   end;
if Length(edtSenha.Text) < 6 then
   begin
      MensagemErro('A senha deve conter no minimo 6 caracteres!',True);
      Exit;
   end;
if edtConfSenha.Text = '' then
   begin
      MensagemErro('O campo confirmação da senha é obrigatório!',True);
      Exit;
   end;
if edtSenha.Text <> edtConfSenha.Text then
   begin
      MensagemErro('A confirmação da senha não confere!',True);
      Exit;
   end;


TThread.CreateAnonymousThread(
   procedure
   begin

      TThread.Synchronize(nil,
         procedure
         begin

            lblMsgLoading.Text :='Aguarde...';
            recModal.Visible   := True;
            recLoading.Visible := True;
            aiLoading.Enabled  := True;

         end);

      //Verifica se o celular ja esta cadastrado no servidor
      if dmGeral.CelularDuplicado(edtCelular.Text) then
         begin
            uAction := uARecuperacao;
            recModal.Visible   := False;
            recLoading.Visible := False;
            aiLoading.Enabled  := False;
            MensagemErro('Este celular ja se encontra cadastrado!'+#13#13+
                              'Deseja recuperar a senha?', False);
            Exit;
         end;

            //Gera Codigo de ativação
            Randomize;
            vCodigoAtivacao:= FormatFloat('000000',Random(999999));

            //Desabilita Timer
            tmAtivacao.Enabled := False;

            //Envia SMS com o código de ativação
            SendSMS(edtCelular.Text, gNomeApp + ' - Codigo de Ativacao: ' + vCodigoAtivacao);

            //Define status
            uAction := uAAtivacao;

            //Pede permissão para ler SMS
            PermissionsService.RequestPermissions([FReadSMS],
                                                   ReadSMSPermissionRequestResult,
                                                   nil);

            //Exibi o numero do celular que sera enviado o sms
            lblCelular.Text := edtCelular.Text;

            //Define o valor para a variavel calcular o tempo
            lcTempo := Time;

            //Oculta janela de loading
            recModal.Visible   := False;
            recLoading.Visible := False;
            aiLoading.Enabled  := False;

            //Vai para a tela de Ativacao
            actCodigoAtivacao.ExecuteTarget(Self);

   end).Start;
end;

procedure TfrmMain.lblCancelaAtivacaoClick(Sender: TObject);
begin
actNovoUsuario.ExecuteTarget(Self);
tmAtivacao.Enabled := False;
end;

procedure TfrmMain.lblCancelarCadastroClick(Sender: TObject);
begin
Layout3.Height := 150;
actLogin.ExecuteTarget(Self);
end;

procedure TfrmMain.lblCancelarClick(Sender: TObject);
begin

    recAdicionaAvaliacao.Visible := False;

end;

procedure TfrmMain.lblCancelarRecuperaSenhaClick(Sender: TObject);
begin
actLogin.ExecuteTarget(Self);
Layout3.Height := 150;
tmAtivacao.Enabled := False;
end;

procedure TfrmMain.lblBtnExibeAvaliacoesClick(Sender: TObject);
begin

     lstAvaliacoes.Clear;
     ExibeLoading('Carregando Avaliações');

     TThread.CreateAnonymousThread(
     procedure
     begin

          ExibeAvaliacoes(0);

          TThread.Synchronize(nil,
          procedure
          begin

               ExibeLoading('',False);

          end);

          if gIdUsuConectado <= 0 then
             begin
                Label5.Text := 'Para fazer uma avaliação é necessário estar logado.';
                recModal.Visible := True;
                recMsg.Visible := True;
                ControlaTool(False, True, False, True, False, False);
             end
          else
             begin
                if not VerificaUsuarioAvaliou(gIdUsuConectado, gIdComSelecionado) then
                    begin
                        ControlaTool(False, True, True, True, False, False);
                    end
                else
                    begin
                        Label5.Text := 'Você fez uma avaliação para esta empresa recentemente, ainda não é possivel fazer outra avaliação.';
                        recModal.Visible := True;
                        recMsg.Visible := True;
                        ControlaTool(False, True, False, True, False, False);
                    end;
             end;

          lblGrupo.Text    := 'Avaliações';
          lblSubGrupo.Text := '';
          actComentarios.ExecuteTarget(Self);

     end).Start;

end;

procedure TfrmMain.FinalizaThreadLoading(Sender: TObject);
begin

if (ExecutaTutorial = True) and (lcErro = False) then
    begin
       Application.CreateForm(TfrmOnBoarding, frmOnBoarding);
       frmOnBoarding.Show;
    end;

if lcAcessar = True then
   begin
      actGuia.ExecuteTarget(Self);
      recModal.Visible     := True;
   end;

end;

procedure TfrmMain.lblEntrarClick(Sender: TObject);
var
AThreadLoading : TThread;
begin
//Valida os campos
If edtCelularPrincipal.Text = '' then
   begin
      MensagemErro('O campo celular é obrigatório!',True);
      lcErro := True;
      Exit;
   end;
If not IsValidCelular(edtCelularPrincipal.Text) then
   begin
      MensagemErro('Formato de celular inválido!',True);
      lcErro := True;
      Exit;
   end;
if edtSenhaPrincipal.Text = '' then
   begin
      MensagemErro('É necessário preencher o campo senha',True);
      lcErro := True;
      Exit;
   end;

   dmGeral.KeyboradHide;

   try
      AThreadLoading := TThread.CreateAnonymousThread(
         procedure
            begin
               AThreadLoading.Synchronize(AThreadLoading,
                  procedure
                     begin

                        //Exibi a janela de loading
                        lblMsgLoading.Text :='Aguarde...';
                        recModal.Visible   := True;
                        recLoading.Visible := True;
                        aiLoading.Enabled  := True;

                     end);

               //Faz o download dos dados do usuario
               dmGeral.DownloadUsuario(edtCelularPrincipal.Text);

               //Oculta a janela de loading
               recModal.Visible   := False;
               recLoading.Visible := False;
               aiLoading.Enabled  := False;

               //Verifica se existe o usuario cadastrado com o telefone informado e
               //se a senha corresponde a digitada
               if (dmGeral.memUsuarios.RecordCount = 0) or
                  (MD5(edtSenhaPrincipal.Text) <> dmGeral.memUsuarios.FieldByName('SENHAUSU').AsString) then
                  begin
                     lcAcessar := False;
                     AThreadLoading.Synchronize(AThreadLoading,procedure
                        begin
                           //Muda status da acao e manda a mensagem de dados invalidos caso a condicao seja falsa
                           dmGeral.KeyboradHide;
                           lcErro := True;
                           uAction := uANull;
                           MensagemErro('Dados invalidos, verifique!', True);
                           edtCelularPrincipal.SetFocus;
                           dmGeral.KeyboradShow(edtCelularPrincipal);
                           Exit;
                        end);

                  end
               else
                  begin
                      lcAcessar := True;
                      lcErro := False;
                      gRaio := dmGeral.memUsuarios.FieldByName('RAIOUSU').AsInteger;
                      //Pega a ID do usuario logado e quantidade de favoritos
                      lytLogar.Visible := False;
                      gIdUsuConectado  := dmGeral.memUsuarios.FieldByName('IDUSU').AsInteger;
                      gQtdeFavorito    := dmGeral.memUsuarios.FieldByName('QTDEFAVUSU').AsInteger;
                      gNomeUsuario     := dmGeral.memUsuarios.FieldByName('NOMEUSU').AsString;
                      gCelularUsuario  := FormataFone(edtCelularPrincipal.Text);
                      gSenhaUsuario    := MD5(edtSenhaPrincipal.Text);
                      dmGeral.RegistrarDispositivo(device_token, gIdUsuConectado);

                      if FileExists(CaminhoArquivos(gNomeFileIni)) then DeleteFile(CaminhoArquivos(gNomeFileIni));

                      GravaLoginIni(gIdUsuConectado, edtCelularPrincipal.Text, dmGeral.memUsuarios.FieldByName('SENHAUSU').AsString);

                      FormCreate(Self);
                      AThreadLoading.Synchronize(AThreadLoading,procedure
                        begin
                           //Expoe a quantidade de favoritos no menu
                           lblQtdeFavoritos.Text := '('+ gQtdeFavorito.ToString +')';

                        end);

                  end;

            end);

            AThreadLoading.OnTerminate := FinalizaThreadLoading;
            AThreadLoading.Start;

      Except On E:EJNIException do
         begin
            //Caso aconteca algum erro jogamos a culpa no servidor
            //Oculta a janela de loading
            recModal.Visible   := False;
            recLoading.Visible := False;
            aiLoading.Enabled  := False;

            //Muda a acao e envia a mensagem para o usuario
            uAction := uANull;
            MensagemErro('Falha ao se conectar com o servidor!!!',True);
            Exit;
         end;
   end;

end;

procedure TfrmMain.lblEsqueciSenhaClick(Sender: TObject);
begin
If edtCelularPrincipal.Text = '' then
   begin
      MensagemErro('Para recuperar a senha e necessario preencher o celular!',True);
      Exit;
   end;
If not IsValidCelular(edtCelularPrincipal.Text) then
   begin
      MensagemErro('Formato de celular inválido!',True);
      Exit;
   end;

   dmGeral.DownloadUsuario(edtCelularPrincipal.Text);

   if (dmGeral.memUsuarios.RecordCount = 0) then
      begin
         uAction := uANull;
         MensagemErro('Numero de celular não cadastrado!', True);
         edtCelularPrincipal.SetFocus;
         Exit;
       end
    else
       begin
         //Pede permissão para ler SMS

         uAction := uARecuperacao;
         PermissionsService.RequestPermissions([FReadSMS],
                                                ReadSMSPermissionRequestResult,
                                                nil);
      end;

end;

procedure TfrmMain.lblFavoritosClick(Sender: TObject);
begin
lcAnterior := 'Favorito';
if gIdUsuConectado <= 0 then
    begin
         Label5.Text := 'Para ter acesso aos favoritos é necessário estar logado.';
         recModal.Visible := True;
         recMsg.Visible := True;
     end
  else
     begin
        if gQtdeFavorito <= 0 then
           begin
              faButtomOffMenu.Enabled := True;
              faCloseMenu.Enabled     := True;
              uAction := uANull;
              recErrorDestaque.Visible := True;
              actDestaque.ExecuteTarget(Self);
              ControlaTool(False, True, False, True, False, False);
              edtBusca.Text := '';
              Exit;
           end
        else
           begin
           TThread.CreateAnonymousThread(
              procedure
                 begin
                    faButtomOffMenu.Enabled := True;
                    faCloseMenu.Enabled     := True;
                    lblGrupo.Text           := 'Favoritos';
                    lblSubGrupo.Text        := '';
                    lcGrupo                 := 'Favoritos';
                    lcSubGrupo              := '';
                    uAction := uAFavoritos;
                    TThread.Synchronize(nil,
                       procedure
                          begin
                             ExibeLoading('Carregando Favoritos');
                          end);
                    CarregaDestaqueFavorito(gIdUsuConectado);
                    Exibeloading('',False);
                    actDestaque.ExecuteTarget(Self);
                    ControlaTool(False, True, False, True, False, False);
                 end).Start;
           end;
     end;
end;

procedure TfrmMain.lblLogarClick(Sender: TObject);
begin

     recBaseMenuClick(Self);
     tbcGuiaAlvo.ActiveTab := tbiSplash;
     tbcUsuario.Visible := True;

end;

procedure TfrmMain.lblMinhaContaClick(Sender: TObject);
begin

     if gIdUsuConectado > 0 then
        begin

             Application.CreateForm(TfrmUsuarios, frmUsuarios);
             frmUsuarios.lblNome.Text      := gNomeUsuario;
             frmUsuarios.lblNrCelular.Text := gCelularUsuario;
             recBaseMenuClick(Self);
             frmUsuarios.Show;

        end
     else
        begin

             Label5.Text      := 'É necessário estar logado para acessar esta opção!';
             recModal.Visible := True;
             recMsg.Visible   := True;

        end;
end;

procedure TfrmMain.lblAtivarClick(Sender: TObject);
begin
if edtCodigoAtivacao.Text <> vCodigoAtivacao then
   begin
      MensagemErro('Código de ativação inválido!', True);
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
                     //Carrega a tela de loading
                     recLoading.Visible := True;
                     recModal.Visible   := True;
                     aiLoading.Enabled  := True;
                  end);

            if FileExists(CaminhoArquivos(gNomeFileIni)) then DeleteFile(CaminhoArquivos(gNomeFileIni));

            //faz a inclusão na tabela do servidor
            cm.ServerMethodsClient.InsertUsuario(edtNome.Text,
                                                 edtCelular.Text,
                                                 MD5(edtSenha.Text));

            //Tras o codigo do do usuario cadastrado
            dmGeral.DownloadIdUsuario(edtCelular.Text);

            GravaLoginIni(dmGeral.memUsuarios.FieldByName('IDUSU').AsInteger,edtCelular.Text,MD5(edtSenha.Text));

            //Oculta a tela de loading
            recLoading.Visible := False;
            recModal.Visible   := False;
            aiLoading.Enabled  := False;

            TThread.Synchronize(nil,
            procedure
            begin
                  //Ajusta o form de ativacao
                  edtCodigoAtivacao.Text := '';
                  lblTimer.Text := '00:02:00';

                  //Limpa a tela de cadastro
                  edtConfSenha.Text := '';
                  edtSenha.Text     := '';
                  edtCelular.Text   := '';
                  edtNome.Text      := '';

                  //da o foco no campo celular na tela de login
                  edtCelularPrincipal.SetFocus;

                  //Exibi o teclado
                  dmGeral.KeyboradShow(edtCelularPrincipal);

                  //Mensagem de confirmação do cadastro
                  imgIcone.Visible := False;
                  MensagemErro('Cadastro concluido com sucesso',True);

            end);

         end).Start;
   end;
end;

procedure TfrmMain.lblAvaliaAppClick(Sender: TObject);
begin

     webLink(ctrLINKLOJAAPP);

end;

procedure TfrmMain.lblAvaliarClick(Sender: TObject);
var
AMedia : Single;
begin

    if (lytAvaliarLimpeza.Visible     = True) and (tmsStarAvaliaLimpeza.Value     = 0) or
       (lytAvaliarAtendimento.Visible = True) and (tmsStarAvaliaAtendimento.Value = 0) or
       (lytAvaliarPrecos.Visible      = True) and (tmsStarAvaliaPrecos.Value      = 0) or
       (lytAvaliarLocalizacao.Visible = True) and (tmsStarAvaliaLocalizacao.Value = 0) or
       (lytAvaliarAmbiente.Visible    = True) and (tmsStarAvaliaAmbiente.Value    = 0) then
       begin

            Label5.Text      := 'A avaliação miníma deve ser 0,5!';
            recModal.Visible := True;
            recMsg.Visible   := True;
            Exit
       end
    else
       begin

             ExibeLoading('Salvando Avaliação');

             TThread.CreateAnonymousThread(
             procedure
             begin

                   AMedia := tmsStarAvaliaAmbiente.Value + tmsStarAvaliaAtendimento.Value + tmsStarAvaliaLimpeza.Value + tmsStarAvaliaLocalizacao.Value + tmsStarAvaliaPrecos.Value;
                   AMedia := Format('%2.2f', [AMedia / vIndiceMedia]).ToSingle;

                   SalvaAvaliacao(gIdComSelecionado, gIdUsuConectado, tmsStarAvaliaAmbiente.Value, tmsStarAvaliaAtendimento.Value,
                                 tmsStarAvaliaLimpeza.Value, tmsStarAvaliaLocalizacao.Value, tmsStarAvaliaPrecos.Value,
                                 AMedia, mmComentario.Text);

                   TThread.Synchronize(TThread.CurrentThread,
                   procedure
                   begin

                      TLoading.ToastMessage(Self,
                                            'Avaliação salva com sucesso',
                                            TAlignLayout.Bottom,
                                            $64000000);
                     recAdicionaAvaliacao.Visible := False;
                     ExibeLoading('',False);
                     ExtraiAvaliacoes;
                     sbtnVoltarClick(Self);

                   end);

             end).Start;

       end;

end;

procedure TfrmMain.Label15Click(Sender: TObject);
begin

   recModal.Visible := True;
   recAvisoCadastro.Visible := True;
   lytLogar.Visible := True;

end;

procedure TfrmMain.Label18Click(Sender: TObject);
begin
Layout3.Height := 0;
actNovoUsuario.ExecuteTarget(Self);
end;

procedure TfrmMain.Label31Click(Sender: TObject);
begin

    faPino.Enabled := False;
    recAutorizacao.Visible := False;
    recFinalizaApp.Visible := True;
    Label48.Visible := True;

end;

procedure TfrmMain.lblAcessarSemLoginClick(Sender: TObject);
begin
lcSemLogar := True;
lblQtdeFavoritos.Text := '(-)';
gIdUsuConectado := 0;
gRaio := ctrRAIOPADRAO;

dmGeral.RegistrarDispositivo(device_token, 0);

if ExecutaTutorial = True then
     begin
        Application.CreateForm(TfrmOnBoarding, frmOnBoarding);
        frmOnBoarding.Show;
     end;

recModal.Visible := False;
recAvisoCadastro.Visible := False;
FormCreate(Self);
end;

procedure TfrmMain.Label42Click(Sender: TObject);
begin
actNovoUsuario.ExecuteTarget(Self);
recAvisoCadastro.Visible := False;
recModal.Visible := False;
end;

procedure TfrmMain.Label44Click(Sender: TObject);
begin
   lcOnCreate := True;
   faPino.Enabled := False;
   recAutorizacao.Visible := False;
   recModal.Visible := False;
   PermissionsService.RequestPermissions([Access_Coarse_Location,
                                          Access_Fine_Location],
                                          LocationPermissionRequestResult,
                                          DisplayRationale);

end;

procedure TfrmMain.Label52Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TfrmMain.Label63Tap(Sender: TObject; const Point: TPointF);
begin
 Application.Terminate;
end;

procedure TfrmMain.Label48Click(Sender: TObject);
begin
    faPino.Enabled := True;
    recAutorizacao.Visible := True;
    recFinalizaApp.Visible := False;
end;

procedure TfrmMain.Label8Click(Sender: TObject);
begin
recModal.Visible := False;
recGPS.Visible   := False;
end;

procedure TfrmMain.lblOKErroConexaoClick(Sender: TObject);
begin
recFalhaConexao.Visible := False;
recModal.Visible := False;
end;

procedure TfrmMain.lblOKRegistronaoEncontradoClick(Sender: TObject);
begin
recMsg.Visible := False;
recModal.Visible := False;
end;

procedure TfrmMain.lblQueroAnunciarClick(Sender: TObject);
begin

     edtCNPJ.Text     := '';
     edtTelefone.Text := '';
     edtContato.Text  := '';
     edtRazao.Text    := '';
     edtEmail.Text    := '';

     lytTitulo.Visible          := True;
     lblCnpjInvalido.Visible    := False;
     lblFoneInvalido.Visible    := False;
     lblContatoInvalido.Visible := False;
     lblRazaoInvalido.Visible   := False;
     lblEmailInvalido.Visible   := False;

     recBaseMenuClick(Self);

     ControlaTool(False, True, False, True, True, False);

     lblGrupo.Text    := 'Quero anunciar';
     lblSubGrupo.Text := '';

     actCadastroNovo.ExecuteTarget(Self);

end;

procedure TfrmMain.lblSairClick(Sender: TObject);
begin

    if FileExists(CaminhoArquivos(gNomeFileIni)) then DeleteFile(CaminhoArquivos(gNomeFileIni));


    Application.Terminate;

end;

procedure TfrmMain.lblTentarNovamenteClick(Sender: TObject);
begin
TThread.CreateAnonymousThread(
   procedure
      begin
         TThread.Synchronize(nil,
            procedure
               begin
                  lblTentarNovamente.Text := 'Aguarde...';
                  AniIndicator1.Visible := True;
                  AniIndicator1.Enabled := True;
               end);
         OnCreate(frmMain);
      end).Start;
end;

procedure TfrmMain.LocationSensor1LocationChanged(Sender: TObject;
  const OldLocation, NewLocation: TLocationCoord2D);
begin

       LocationSensor1.Active := False;

       LatOrigem   := StrToFloat(Format('%2.6f', [NewLocation.Latitude]));
       LongOrigem  := StrToFloat(Format('%2.6f', [NewLocation.Longitude]));

end;

procedure TfrmMain.lblCelularErradoClick(Sender: TObject);
begin
tmAtivacao.Enabled := False;
actCorrigeCelular.ExecuteTarget(Self);
end;

procedure TfrmMain.lblConfiguracoesTap(Sender: TObject; const Point: TPointF);
begin

     if gIdUsuConectado > 0 then
        begin
           Application.CreateForm(TfrmConfiguracao, frmConfiguracao);
           frmConfiguracao.Show;

           recBaseMenuClick(Self);
        end
     else
        begin
             recBaseMenuClick(Self);

             Label5.Text      := 'Para alterar alguma configuração é necessário esta logado!';
             recModal.Visible := True;
             recMsg.Visible   := True;
        end;

end;

procedure TfrmMain.lblEncerrarClick(Sender: TObject);
begin
SharedActivity.finish;
end;

procedure TfrmMain.lblNaoClick(Sender: TObject);
begin
actLogin.ExecuteTarget(Self);
Layout3.Height := 150;
recModal.Visible    := False;
recMsgLogin.Visible := False;
end;

procedure TfrmMain.lblNotificacoesClick(Sender: TObject);
begin
     lcAnterior := 'Notificação';
     if gIdUsuConectado > 0 then
        begin
             ExibeLoading('Carregando Notificações');

             TThread.CreateAnonymousThread(
             procedure
             begin

                  CarregaPush;

                  TThread.Synchronize(nil,
                  procedure
                  begin

                       ExibeLoading('',False);
                       faButtomOffMenu.Enabled := True;
                       faCloseMenu.Enabled     := True;
                       recBaseMenu.Visible     := False;
                       actNotificacoes.ExecuteTarget(Self);
                       lblGrupo.Text    := 'Notificações';
                       lblSubGrupo.Text := '';
                       ControlaTool(False, True, False, True, False, False);
                       imgSino.Visible        := False;
                       faSino.Enabled         := False;
                       CirclePushMenu.Visible := False;

                  end);

             end).Start;
        end
     else
        begin

            Label5.Text := 'Para ter acesso a notificações é necessário estar logado.';
            recModal.Visible := True;
            recMsg.Visible := True;

        end;
end;

procedure TfrmMain.ReadSMSPermissionRequestResult(Sender: TObject;
  const APermissions: TArray<string>;
  const AGrantResults: TArray<TPermissionStatus>);
begin
  if (Length(AGrantResults) = 1) and
     (AGrantResults[0] = TPermissionStatus.Granted) then
     begin
     if uAction = uARecuperacao then
        begin
            TThread.CreateAnonymousThread(
               procedure
               var
               FChegou : Boolean;
               begin
               FChegou := False;
               TThread.Synchronize(nil,
                  procedure
                  begin

                     //Carrega janela de loading
                     recModal.Visible         := True;
                     recRecuperaSenha.Visible := True;
                     lblMsgRecuperaSenha.Text := 'Aguarde enviando nova senha...';
                     aiRecuperaSenha.Enabled  := True;

                     //define nova senha e armazena na variavel
                     vNovaSenha := FormatFloat('000000', Random(999999));

                     //Envia nova senha pos SMS
                     SendSMS(edtCelularPrincipal.Text,'Nova senha: '+vNovaSenha);

                  end);

               //"FChegou" define se o SMS chegou
               While not FChegou do
                  begin
                     //Verifica se o SMS que chegou corresponde ao enviado
                     if Pos(vNovaSenha,FetchSms.Strings[0]) > 0 then
                        begin

                           //Oculta a janela de loading
                           recModal.Visible         := False;
                           recRecuperaSenha.Visible := False;
                           aiRecuperaSenha.Enabled  := False;
                           imgIcone.Visible         := False;
                           recLogin.Repaint;

                           //Faz o Download do usuario do servidor
                           dmGeral.DownloadUsuario(edtCelularPrincipal.Text);

                           //Atualiza os dados no servidor
                           UpdateUsuario(dmGeral.memUsuarios.FieldByName('NOMEUSU').AsString,
                                         dmGeral.memUsuarios.FieldByName('CELULARUSU').AsString,
                                         MD5(vNovaSenha),
                                         dmGeral.memUsuarios.FieldByName('IDUSU').AsInteger);

                           //Faz o Download do usuario do servidor
                           dmGeral.DownloadUsuario(edtCelularPrincipal.Text);

                           //Preenche o campo senha do Login com a nova senha
                           edtSenhaPrincipal.Text := vNovaSenha;

                           //Define o Status da operacao
                           uAction := uARecuperacao;

                           //Exibi mensagem de conclusao
                           MensagemErro('Nova senha cadastrada com sucesso!', True);//+#13+
                          //              'Acesse o "Menu>Cadastro>Alterar Senha" para cadastrar uma nova senha',True);

                           //Defini a variavel como true para encerrar a verificacao de SMS
                           FChegou:= True;
                        end
                     else
                        begin
                           //Mantem a variavel como false para aguardar o recebimento do SMS
                           FChegou:= False;
                        end;
                   end;
                   //Starta a TThread
               end).Start;
        end
     else
        begin
           //Ativa o Timer para verificacao do codigo de ativacao
           tmAtivacao.Enabled := True;
        end;
     end
   else
     begin
        //Caso usuario nao conceda permissao para ler seus SMS's
        //Na acao de recuperacao de senha
        if uAction = uARecuperacao then
           begin
              //Exibi a mensagem que nao podera verificar automaticamente os SMS
              TDialogService.ShowMessage
              ('Não é possível verificar o SMS, porque o app não possui acesso.'+#13+
               'Ao receber o SMS digite a sua nova senha no campo Senha,'#13+
               'em seguida Acesse o "Menu> Meus Dados> Alterar Senha" para cadastrar uma nova senha');

               //Gera uma nova senha
               vNovaSenha := 'AL'+FormatFloat('000000', Random(999999));

               //Envia SMS com a nova senha
               SendSMS(edtCelularPrincipal.Text,'Nova senha: '+vNovaSenha);

               //Faz o Download do usuario do servidor
               dmGeral.DownloadUsuario(edtCelularPrincipal.Text);

               //Atualiza os dados no servidor
               UpdateUsuario(dmGeral.memUsuarios.FieldByName('NOMEUSU').AsString,
                             dmGeral.memUsuarios.FieldByName('CELULARUSU').AsString,
                             MD5(vNovaSenha),
                             dmGeral.memUsuarios.FieldByName('IDUSU').AsInteger);

               Exit;
           end
        else
           begin
              //Caso nao seja concedido permissao para ler SMS
              //o codigo de ativacao devera ser preenchido manualmente.
              TDialogService.ShowMessage
              ('Não é possível verificar o SMS porque o app não possui acesso');
              recModal.Visible := False;
           end;
     end;
end;

procedure TfrmMain.recBaseMenuClick(Sender: TObject);
begin

  faButtomOffMenu.Enabled := True;
  faCloseMenu.Enabled     := True;
  recBaseMenu.Visible     := False;

end;

procedure TfrmMain.SpeedButton5Click(Sender: TObject);
begin
actSubSecao.ExecuteTarget(Self);
end;

procedure TfrmMain.sbtnVoltarClick(Sender: TObject);
begin

if tbcPrincipal.ActiveTab = tbiSubSecoes then
   begin
        frecSubSecoes.DisposeOf;
        ControlaTool(True, False, False, False, False,False);
        edtBusca.Text := '';
        actPrincipal.ExecuteTarget(Self);
   end;

if tbcPrincipal.ActiveTab = tbiItensSecao then
   begin
      if gPesquisa = False then
         begin
            vsbVerticalScroll.DisposeOf;
            tbControl.DisposeOf;
            lblSubGrupo.Text := '';
            actSubSecao.ExecuteTarget(Self);
         end
      else
         begin
            vsbVerticalScroll.DisposeOf;
            gPesquisa := False;
            tbControl.DisposeOf;
            ControlaTool(True, False, False, False, False,False);
            edtBusca.Text := '';
            lblSubGrupo.Text := '';
            actPrincipal.ExecuteTarget(Self);
         end;
   end;

if tbcPrincipal.ActiveTab = tbiExibiComercio then
   begin

      if gPesquisa = True then
         begin

              lblGrupo.Text := 'Resultado da Pesquisa';
              actItensSecao.ExecuteTarget(Self);
              faLigacao.Enabled := False;
              faGPS.Enabled     := False;
              faWhats.Enabled   := False;

         end;

      if gVoltaDestaque = False then
         begin
            grdFlowlytCheck.DisposeOf;
            lytLayoutCom.DisposeOf;
            lblLabelCom.DisposeOf;
            imgImageCom.DisposeOf;

            VertScrollBoxCom.ScrollBy(VertScrollBoxCom.ViewportPosition.X,
                                      VertScrollBoxCom.ViewportPosition.Y);
            lblDistancia.Text := '';

            if uAction = uANull then
               actItensSecao.ExecuteTarget(Self) else
               actDestaque.ExecuteTarget(Self);
            Abort;
         end
      else
         begin
              grdFlowlytCheck.DisposeOf;
              lytLayoutCom.DisposeOf;
              lblLabelCom.DisposeOf;
              imgImageCom.DisposeOf;

              VertScrollBoxCom.ScrollBy(VertScrollBoxCom.ViewportPosition.X,
                                        VertScrollBoxCom.ViewportPosition.Y);
              lblDistancia.Text := '';

              ControlaTool(False, True,False, True, False, False);
              actDestaque.ExecuteTarget(Self);
              lblGrupo.Text := 'Destaques';
              lblSubGrupo.Text := '';
              Abort;

         end;
   end;

if tbcPrincipal.ActiveTab = tbiDestaques then
   begin
        edtBusca.Text := '';
        actPrincipal.ExecuteTarget(Self);
        gVoltaDestaque := False;
        ControlaTool(True, False, False, False, False, False);
   end;

if tbcPrincipal.ActiveTab = tbiComentarios then
    begin

        lblGrupo.Text    := lcGrupo;
        lblSubGrupo.Text := lcSubGrupo;
        actComercio.ExecuteTarget(Self);
        ControlaTool(False, True, False, True,False,True);

    end;

if tbcPrincipal.ActiveTab = tbiNotificacoes then
    begin

        actPrincipal.ExecuteTarget(Self);
        edtBusca.Text := '';
        ControlaTool(True, False, False, False, False, False);

    end;

if tbcPrincipal.ActiveTab = tbiAnuncios then
   begin

        actNotificacoes.ExecuteTarget(Self);
        lcTabControl.DisposeOf;
        tmAnuncios.Enabled := False;
        lblGrupo.Text := 'Notificações';
        lblSubGrupo.Text := '';

   end;

if tbcPrincipal.ActiveTab = tbiQueroAnunciar then
   begin

        ControlaTool(True, False, False, False, False, False);
        edtBusca.Text := '';
        actPrincipal.ExecuteTarget(Self);

   end;

end;


procedure TfrmMain.tmBannerFotosSecaoTimer(Sender: TObject);
begin

   actProximo.Tab := tbControl.Tabs[0];

   if tbControl.TabIndex = (tbControl.TabCount - 1) then
      actProximo.ExecuteTarget(Self) else tbControl.Next;

end;

procedure TfrmMain.tmBannerPrincipalTimer(Sender: TObject);
begin
   actPrimeiro.Tab := tbcAnuncios.Tabs[0];

   if tbcAnuncios.TabIndex = (tbcAnuncios.TabCount - 1) then
      actPrimeiro.ExecuteTarget(Self) else tbcAnuncios.Next;

end;

procedure TfrmMain.tmPushTimer(Sender: TObject);
begin

    tmPush.Enabled         := False;
    recNotificacao.Visible := False;

end;

procedure TfrmMain.tmsStarAvaliaAmbientePaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
begin
lblNotaAmbiente.Text := Format('%2.2f', [tmsStarAvaliaAmbiente.Value]);
end;

procedure TfrmMain.tmsStarAvaliaAtendimentoPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
begin
lblNotaAtendimento.Text := Format('%2.2f', [tmsStarAvaliaAtendimento.Value]);
end;

procedure TfrmMain.tmsStarAvaliaLimpezaPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
begin
lblNotaLimpeza.Text := Format('%2.2f', [tmsStarAvaliaLimpeza.Value]);
end;

procedure TfrmMain.tmsStarAvaliaLocalizacaoPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
begin
lblNotaLocalizacao.Text := Format('%2.2f', [tmsStarAvaliaLocalizacao.Value]);
end;

procedure TfrmMain.tmsStarAvaliaPrecosPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
begin
lblNotaPrecos.Text := Format('%2.2f', [tmsStarAvaliaPrecos.Value]);
end;

procedure TfrmMain.tmAnunciosTimer(Sender: TObject);
begin

   actProximoAnuncio.Tab := lcTabControl.Tabs[0];

   if lcTabControl.TabIndex = (lcTabControl.TabCount - 1) then
      actProximoAnuncio.ExecuteTarget(Self) else lcTabControl.Next;

end;

procedure TfrmMain.tmAtivacaoTimer(Sender: TObject);
begin

TThread.CreateAnonymousThread(
    procedure
    begin

       lblTimer.Text := TimeToStr(gTempoReenvio - (Time - lcTempo));

       //Verifica se o SMS é da Ativação e ativa automaticamente
       if (Pos(vCodigoAtivacao,FetchSms.Strings[0]) > 0) and
          (uAction = uAAtivacao) then
          begin

             edtCodigoAtivacao.Text := vCodigoAtivacao;
             tmAtivacao.Enabled := False;
             imgIcone.Visible    := False;

             recModal.Visible   := False;
             recLoading.Visible := False;
             aiLoading.Enabled  := False;

             lblAtivarClick(Self);
          end;

       TThread.Synchronize(TThread.CurrentThread,
       procedure
       begin
           //Verifica se o tempo zerou antes de chegar o SMS e reencaminha o SMS
           if uAction = uAAtivacao then
              begin
              if lblTimer.Text = '00:00:00' then
                 begin
                    lblReenviando.Visible := True;
                    SendSMS(edtCelular.Text, gNomeApp + ' - Codigo de Ativacao: ' + vCodigoAtivacao);
                    lcTempo := Time;
                    lblTimer.Text := '00:02:00'
                 end
              else
                 begin
                    lblReenviando.Visible := False;
                 end;
              end;
       end);

    end).Start;
end;

procedure TfrmMain.ControlaTool(ArecSearch, AsbtnVoltar, AbtnAdicionar, AlytTitulos, AbtnEnviar, AbtnHome : Boolean);
begin
   recSearch.Visible    := ArecSearch;
   sbtnVoltar.Visible   := AsbtnVoltar;
   btnAdicionar.Visible := AbtnAdicionar;
   lytTitulos.Visible   := AlytTitulos;
   btnEnviar.Visible    := AbtnEnviar;
   btnHome.Visible      := AbtnHome;
end;

procedure TfrmMain.LoadImagens(sThread : TThread; ALista : TStringList);
begin
ConectaFTP(IdFTP);
sThread := TThread.CreateAnonymousThread(
   procedure
      begin
         Try

            for var i := 0 to ALista.Count - 1 do
                ReceiveFileFtpParams(ALista.Strings[i]);

         finally
            ALista.DisposeOf;
            ALista := nil;
            IdFTP.Disconnect;
         end;
          if lcAnuncio = True then
              begin
                  lcAnuncio := False;
                  OnActivePush(lcIdComercio, lcNomeCom);
              end;
      end);
   sThread.Start;
end;


function TfrmMain.LogaUsuarioIni : Boolean;
begin
  //verifica se usuario quer manter conectado
  gIdUsuConectado := UsuarioConectado;
  if gIdUsuConectado = 0 then
     begin

          Result := False;

     end
  else
     begin

         dmGeral.DownloadUsuarioId(gIdUsuConectado);
         gRaio := dmGeral.memUsuarios.FieldByName('RAIOUSU').AsInteger;

         dmGeral.RegistrarDispositivo(device_token, gIdUsuConectado);

         lblQtdeFavoritos.Text := '('+ gQtdeFavorito.ToString +')';

         recModal.Visible := False;
         lytLogar.Visible := False;

         Result := True;

     end;
end;

procedure TfrmMain.CarregaSecoesPrincipal; //Carrega as seçoes da tela principal
var
tbItem : TTabItem;
imgImage : TImage;
recSecoes, recImageSecoes : TRectangle;
lytLayout, lytLayoutAux : TLayout;
lblLabel : TLabel;
vDestaque : Boolean;
vQtde : Integer;
ThreadSecao, TThreadSecao2 : TThread;
begin
tbItem.DisposeOf;
imgImage.DisposeOf;
recSecoes.DisposeOf;
recImageSecoes.DisposeOf;;
lytLayout.DisposeOf;
lytLayoutAux.DisposeOf;
lblLabel.DisposeOf;
ListaSecoes.DisposeOf;
gListaParamSecao.DisposeOf;
gListaParamSecao := TStringList.Create;
   Try

      TThread.CreateAnonymousThread(
      procedure
      begin
           TThread.Synchronize(nil,
           procedure
           begin
                Label9.Text := 'Obtendo sua localização.';
           end);
      end).Start;

         while (LongOrigem = 0) or (LatOrigem = 0) do
              begin

              end;

      TThreadSecao2 := TThread.CreateAnonymousThread(
      procedure
      begin

         if gExibeLoading = True then
            begin
                 ExibeLoading('Aguarde, carregando...');
                 gExibeLoading := False;
            end;

          GravaUltimaPosicaoUsuario(FloatToStr(LatOrigem), FloatToStr(LongOrigem), device_token);

          ListaSecoes := TMemo.Create(Self);
          dmGeral.LoadDestaquePrincipal(device_token);
          vDestaque := False;
          tmBannerPrincipal.Enabled := vDestaque;
          dmGeral.memContrato.First;

          While not dmGeral.memContrato.eof do
             begin
             if dmGeral.memContrato.FieldByName('IMGDESTAQUEHOMECONTRATO').AsString <> '' then
                begin
                  vDestaque := True;
                  Break
                end
             else
                begin
                   dmGeral.memContrato.Next;
                end;
             end;

          TThreadSecao2.Synchronize(TThreadSecao2,
          procedure
          begin
              if vDestaque = True then
                 begin
                 dmGeral.memContrato.First;
                 tbcAnuncios.Visible := True;

                    While not dmGeral.memContrato.Eof do
                       begin
                          if dmGeral.memContrato.FieldByName('IMGDESTAQUEHOMECONTRATO').AsString <> '' then
                             begin
                                tbItem := TTabItem.Create(tbcAnuncios);
                                tbItem.Parent := tbcAnuncios;
                                tbItem.Name  := 'tbItem_'+dmGeral.memContrato.FieldByName('IDCONTRATO').AsString;

                                imgImage := TImage.Create(frmMain);
                                imgImage.Parent := tbItem;
                                imgImage.Align :=  TAlignLayout.Client;
                                imgImage.WrapMode := TImageWrapMode.Stretch;
                                imgImage.Name := 'ImageDestaqueHome_'+dmGeral.memContrato.FieldByName('IDCOM').AsString;
                                var vNameFile := dmGeral.memContrato.FieldByName('IMGDESTAQUEHOMECONTRATO').AsString;
                                //imgImage.OnTap := OnTapComercio;
                                gListaParamSecao.Add('IdFTP ' + ctrPATHFOTOSFTP + ' ' + vNameFile + ' ' + imgImage.Name);

                                dmGeral.memContrato.Next;
                             end
                          else
                             begin
                                dmGeral.memContrato.Next;
                             end;
                       end;
                 end
              else
                 begin
                    tbcAnuncios.Visible := False;
                 end;
          end);

          if gRaio <= 0 then gRaio := ctrRAIOPADRAO;

          dmGeral.loadCategorias(device_token);
          tmBannerPrincipal.Enabled := vDestaque;
          dmGeral.memCategorias.First;
          ListaSecoes.Lines.Clear;
          While not dmGeral.memCategorias.eof do
             begin
                ListaSecoes.Lines.Add(dmGeral.memCategorias.FieldByName('NOMECAT').AsString+'_'+dmGeral.memCategorias.FieldByName('IDCAT').AsString);
                dmGeral.memCategorias.Next;
             end;

          if dmGeral.memCategorias.RecordCount = 0 then
             recNotFoundPrincipal.Visible := True else recNotFoundPrincipal.Visible := False;
          dmGeral.memCategorias.First;
          TThreadSecao2.Synchronize(TThreadSecao2,
          procedure
          begin
              While not dmGeral.memCategorias.eof do
                 begin
                    AddSecaoGrupo(dmGeral.memCategorias.FieldByName('IDCAT').AsInteger,
                                  dmGeral.memCategorias.FieldByName('IMGCAT').AsString,
                                  dmGeral.memCategorias.FieldByName('NOMECAT').AsString,
                                  dmGeral.memCategorias.FieldByName('DETALHECAT').AsString);

                    dmGeral.memCategorias.Next;
                 end;
            actGuia.ExecuteTarget(Self);
            recModal.Visible := False;
          end);

          LoadImagens(ThreadSecao, gListaParamSecao);
          lytLoadingPrincipal.Visible := False;

          ExibeLoading('', False);

          if lcAnuncio = True then
               OnClickActivePush(Self)
          else
          if lcIdComercioPush > 0 then
               OnClickPushCom(Self);
      end);

      TThreadSecao2.Start;

   Except
      On E:EJNIException do
         begin
            lblTentarNovamente.Text := 'Tentar novamente';
            tbcPrincipal.ActiveTab := tbiConexao;
            AniIndicator1.Enabled := False;
            AniIndicator1.Visible := False;
            Exit;
         end;
       On E:Exception do
         begin
            lblTentarNovamente.Text := 'Tentar novamente';
            tbcPrincipal.ActiveTab := tbiConexao;
            AniIndicator1.Enabled := False;
            AniIndicator1.Visible := False;
            Exit;
         end;
   end;

end;

procedure TfrmMain.CarregaComercio(Sender: TObject);
var
vSep : String;
vTelefone, vEndereco, vWhatsapp : String;
CountCheck : Integer;
recDadosHeigth, recCheckHeigth, vW : Double;
begin


     VertScrollBoxCom.ScrollBy(0,0);
     recFotos.Height := 175;
     gDestaque := False;
     //VertScrollBox.ScrollBy(0,0);
     urlFoneWhats := '';
     CountCheck   := 0;
     gTotalFotos  := 0;

     lblComercio.Text := '';
     lblSlogam.Text   := '';
     lblPontuacao.Text := '-';
     imgFotoComPrincipal.Bitmap := nil;
     imgLogoCom.Bitmap := nil;
     grdFlowlytCheck.DisposeOf;

     TThread.CreateAnonymousThread(
     procedure
     begin

           TThread.Synchronize(nil,
           procedure
           begin
              for var i := 1 to 8 do
                   TImage(frmMain.FindComponent('imgFoto' + i.ToString)).Bitmap := nil;

              if gIdUsuConectado <= 0 then
                 begin
                     imgFavoritos.Visible := False;
                 end
              else
                 begin
                      if cm.ServerMethodsClient.IsFavorito(gIdUsuConectado, gIdComSelecionado) then
                         EfectFavoritar.Enabled := False else
                         EfectFavoritar.Enabled := True;
                 end;
           end);

           dmGeral.LoadComercio(vidComercio); //Carrega todos os dados do comercio

           //Carrega as fotos do Comercio
           dmGeral.memFotosComercio.First;
           gTotalFotos := dmGeral.memFotosComercio.RecordCount;

           TThread.Synchronize(nil,
           procedure
           begin
              for var i := 1 to gTotalFotos do
                  begin
                       TImage(frmMain.FindComponent('imgFoto' + i.ToString)).Bitmap := nil;
                       TAniIndicator(frmMain.FindComponent('aniLoadingFoto' + i.ToString)).Visible := True;
                       TAniIndicator(frmMain.FindComponent('aniLoadingFoto' + i.ToString)).Enabled := True;
                  end;
           end);

           cm.ServerMethodsClient.SalvaHistoricoUsu(gIdUsuConectado,vIdSecao,vIdSubSecao,vidComercio,'');

           TThread.Synchronize(nil,
           procedure
           begin
              //Carrega Media Avaliações
              if dmGeral.memComercio.FieldByName('MEDIATOTALAVALIA').AsString = '0' then
                 lblPontuacao.Text := '-' else
                 lblPontuacao.Text := dmGeral.memComercio.FieldByName('MEDIATOTALAVALIA').AsString + ' ('+
                                      dmGeral.memComercio.FieldByName('MEDIATOTALAVALIA').AsInteger.ToString+')';

             tmsrtEstrelas.Value := dmGeral.memComercio.FieldByName('MEDIATOTALAVALIA').AsSingle;

             //Carrega Titulo/Slogam
             lblComercio.Text := dmGeral.memComercio.FieldByName('TITULOCOM').AsString;
             if Length(dmGeral.memComercio.FieldByName('SLOGAMCOM').AsString) > 40 then
                lblSlogam.Height := 40 else lblSlogam.Height := 20;
             lblSlogam.Text   := dmGeral.memComercio.FieldByName('SLOGAMCOM').AsString;

             //Carrega Site e Email
             lblSiteEmail.Text := dmGeral.memComercio.FieldByName('SITECOM').AsString + #13 +
                                  dmGeral.memComercio.FieldByName('EMAILCOM').AsString;
             //Caso tenha sido clicado no anuncio joga o nome na recTool e pega a distancia
             if lcAcessoAnuncio = True then
                 begin
                      FormatSettings.DecimalSeparator  := '.';
                      FormatSettings.ThousandSeparator := ',';

                      lblGrupo.Text := dmGeral.memComercio.FieldByName('TITULOCOM').AsString;

                      LatDestino        := dmGeral.memComercio.FieldByName('LATCOM').AsFloat;
                      LongDestino       := dmGeral.memComercio.FieldByName('LONGCOM').AsFloat;
                      lblDistancia.Text := GetDistancia(LatOrigem, LongOrigem, LatDestino, LongDestino);

                      FormatSettings.DecimalSeparator  := ',';
                      FormatSettings.ThousandSeparator := '.';

                 end;

             //Carrega as informações (SOBRE)
             ReceiveFileFtp(ctrPATHTEXTFTP, dmGeral.memComercio.FieldByName('SOBRECOM').AsString,nil,lblSobre);

             //Carrega logo do comercio
             MyThread.LoadingImages(ctrPATHLOGOSFTP,
                                    dmGeral.memComercio.FieldByName('ICOCOM').AsString,
                                    imgLogoCom,nil,aniLoadingLogo);

             //Carrega Imagem principal
             MyThread.LoadingImages(ctrPATHFOTOSFTP,
                                    dmGeral.memComercio.FieldByName('IMGDESTAQUEVIEWCOM').AsString,
                                    imgFotoComPrincipal,nil,aniLoadFotoPrincipal);


             //Carrega Lista de checklist
             dmGeral.memCheckList.First;

             grdFlowlytCheck            := TFlowLayout.Create(frmMain);
             grdFlowlytCheck.Parent     := recSobreNos;
             grdFlowlytCheck.Align      := TAlignLayout.Client;

              while not dmGeral.memCheckList.Eof do
                 begin

                    lytLayoutCom := TLayout.Create(frmMain);
                    lytLayoutCom.Parent := grdFlowlytCheck;
                    lytLayoutCom.Height := 30;
                    lytLayoutCom.Width  := (VertScrollBoxCom.Width - 20) / 2;

                    imgImageCom := TImage.Create(frmMain);
                    imgImageCom.Parent       := lytLayoutCom;
                    imgImageCom.Align        := TAlignLayout.Left;
                    imgImageCom.Width        := 30;
                    imgImageCom.WrapMode     := TImageWrapMode.Stretch;
                    imgImageCom.Margins.Left := 5;

                    MyThread.LoadingImages(ctrPATHICONESFTP,
                                           dmGeral.memCheckList.FieldByName('IMGCHECK').AsString,
                                           imgImageCom,nil,nil);

                    lblLabelCom := TLabel.Create(frmMain);
                    lblLabelCom.Parent         := lytLayoutCom;
                    lblLabelCom.Align          := TAlignLayout.Client;
                    lblLabelCom.StyledSettings := lblLabelCom.StyledSettings - [TStyledSetting.Family,TStyledSetting.Style, TStyledSetting.Size];
                    lblLabelCom.Font.Size      := 14;
                    lblLabelCom.Margins.Left   := 5;
                    lblLabelCom.TextSettings.WordWrap := False;

                    lblLabelCom.Text := dmGeral.memCheckList.FieldByName('DESCRCHECK').AsString;

                    CountCheck := CountCheck + 1;
                    dmGeral.memCheckList.Next;
                 end;

              recSobrenos.Height := 90;

              grdFlowlytCheck.Height := Round(CountCheck * 30);
              grdFlowlytCheck.Height := Round(grdFlowlytCheck.Height / 2);

              recCheckHeigth := Round((lytSobrenos.Height + lblSobre.Height) + ((CountCheck / 2) * 30))-10;

              recSobrenos.Height := recCheckHeigth + 40;
           end);

           //Carrega o endereço

           if dmGeral.memComercio.FieldByName('COMPLCOM').AsString = '' then
              vSep := '' else vSep := ' - ';
           dmGeral.ConsultaCep(dmGeral.memComercio.FieldByName('CEPLOG_COM').AsString);

           TThread.Synchronize(nil,
           procedure
           begin
              lnkEndereco := LowerCase(dmGeral.memCeplogradouro.AsString +', '+
                             dmGeral.memComercio.FieldByName('NRLOGCOM').AsString+' '+
                             dmGeral.memCepbairro.AsString+' '+
                             dmGeral.memCeplocalidade.AsString+' '+
                             dmGeral.memCepuf.AsString);

              lblEndereco.Text := dmGeral.memCeplogradouro.AsString + ', '+
                                  dmGeral.memComercio.FieldByName('NRLOGCOM').AsString +vSep+
                                  dmGeral.memComercio.FieldByName('COMPLCOM').AsString+#13+
                                  dmGeral.memCepbairro.AsString+#13+
                                  dmGeral.memCeplocalidade.AsString+' / '+
                                  dmGeral.memCepuf.AsString;

              vEndereco :=        dmGeral.memCeplogradouro.AsString + ','+
                                  dmGeral.memComercio.FieldByName('NRLOGCOM').AsString +'-'+
                                  dmGeral.memCepbairro.AsString+'-'+
                                  dmGeral.memCeplocalidade.AsString+'-'+
                                  dmGeral.memCepuf.AsString;
              lytEndereco.Height := lblEndereco.Height;
           end);

           //Carrega os telefones
           dmGeral.memTelefones.First;

           vFone := dmGeral.memTelefones.FieldByName('DDDFONE').AsString +
                    dmGeral.memTelefones.FieldByName('TELFONE').AsString;

           While not dmGeral.memTelefones.Eof do
              begin
                 vTelefone := '('+dmGeral.memTelefones.FieldByName('DDDFONE').AsString+') '+
                                  dmGeral.memTelefones.FieldByName('TELFONE').AsString + ' / ' +
                                  vTelefone;
                 if dmGeral.memTelefones.FieldByName('ZAPFONE').AsString = '1' then
                    begin
                       vWhatsapp := '('+dmGeral.memTelefones.FieldByName('DDDFONE').AsString+') '+
                                        dmGeral.memTelefones.FieldByName('TELFONE').AsString + ' / ';
                       if urlFoneWhats = '' then
                          urlFoneWhats := dmGeral.memTelefones.FieldByName('DDDFONE').AsString+
                                          StringReplace(dmGeral.memTelefones.FieldByName('TELFONE').AsString,
                                                        '-','',[rfReplaceAll]); ;
                    end;
                    dmGeral.memTelefones.Next;
              end;

           TThread.Synchronize(nil,
           procedure
           begin
              if urlFoneWhats = '' then
                 Layout82.Width := 0 else Layout82.Width := 45;

              lblTelefones.Text := Copy(vTelefone,1,Length(vTelefone)-3);
              lytTelefones.Height := lblTelefones.Height;
              //Carrega Whatsapp
              if vWhatsapp = '' then
                 begin
                    lytWhatsApp.Visible := False;
                    lytWhatsApp.Height := 0;
                    faWhats.Enabled := False;
                 end
              else
                 begin
                    faWhats.Enabled := True;
                    lytWhatsApp.Visible := True;
                    lblWhatsapp.Text    := Copy(vWhatsapp,1,Length(vWhatsapp)-3);
                    lytWhatsApp.Height  := lblWhatsapp.Height;
                 end;
           end);
               //Carrega as redes sociais...
               lnkFace       := Trim(dmGeral.memComercio.FieldByName('FACECOM').AsString);
               lnkYoutube    := Trim(dmGeral.memComercio.FieldByName('TUBECOM').AsString);
               lnkTwitter    := Trim(dmGeral.memComercio.FieldByName('TWITERCOM').AsString);
               lnkInstagran  := Trim(dmGeral.memComercio.FieldByName('INSTACOM').AsString);
               lnkGoogleMais := Trim(dmGeral.memComercio.FieldByName('GOOGLECOM').AsString);
               lnkApp        := Trim(dmGeral.memComercio.FieldByName('APPCOM').AsString);
               lnkUberEats   := Trim(dmGeral.memComercio.FieldByName('UBEREATSCOM').AsString);
               lnkIfood      := Trim(dmGeral.memComercio.FieldByName('IFOODCOM').AsString);
               lnkRappi      := Trim(dmGeral.memComercio.FieldByName('RAPPICOM').AsString);


            TThread.Synchronize(nil,
            procedure
            begin
               if lnkFace       = '' then imgFacebook.Visible   := False else imgFacebook.Visible   := True;
               if lnkYoutube    = '' then imgYoutube.Visible    := False else imgYoutube.Visible    := True;
               if lnkTwitter    = '' then imgTwitter.Visible    := False else imgTwitter.Visible    := True;
               if lnkInstagran  = '' then imgInstagram.Visible  := False else imgInstagram.Visible  := True;
               if lnkGoogleMais = '' then imgGoogleMais.Visible := False else imgGoogleMais.Visible := True;
               if lnkApp        = '' then imgApp.Visible        := False else imgApp.Visible        := True;

               if (imgFacebook.Visible   = False) and
                  (imgYoutube.Visible    = False) and
                  (imgTwitter.Visible    = False) and
                  (imgInstagram.Visible  = False) and
                  (imgGoogleMais.Visible = False) and
                  (imgApp.Visible        = False) then
                  recRedesSociais.Height := 0 else recRedesSociais.Height := 100;

               if lnkUberEats   = '' then imgUberEats.Visible   := False else imgUberEats.Visible   := True;
               if lnkIfood      = '' then imgIfood.Visible      := False else imgIfood.Visible      := True;
               if lnkRappi      = '' then imgRappi.Visible      := False else imgRappi.Visible      := True;

               if (imgIfood.Visible    = False) and
                  (imgUberEats.Visible = False) and
                  (imgRappi.Visible    = False) then
                  recDelivery.Height := 0 else recDelivery.Height := 100;


               var x := 1;
               While not dmGeral.memFotosComercio.Eof do
                  begin

                     if x > 4 then recFotos.Height := 308;

                     TImage(frmMain.FindComponent('imgFoto' + x.ToString)).Visible := True;

                     MyThread.LoadingImages(ctrPATHFOTOSFTP,
                                            dmGeral.memFotosComercio.FieldByName('NOMEFILES').AsString,
                                            TImage(frmMain.FindComponent('imgFoto' + x.ToString)),nil,
                                            TAniIndicator(frmMain.FindComponent('aniLoadingFoto' + x.ToString)));

                     MyThread.LoadingImages(ctrPATHFOTOSFTP,
                                            dmGeral.memFotosComercio.FieldByName('NOMEFILES').AsString,
                                            TImage(frmVisualizaFotos.FindComponent('imgFoto' + x.ToString)),nil,nil);

                     x := x + 1;
                     dmGeral.memFotosComercio.Next;
                  end;

                  faLigacao.Enabled := True;
                  faGPS.Enabled     := True;

                  //Ajusta o retangulo dos dados
                  recDadosHeigth := lytNossosDados.Height + lytLocalizacao.Height + lytEndereco.Height +
                                    lytTelefones.Height + lytWhatsApp.Height + lytSiteEmail.Height;
                  recNossosDados.Height := recDadosHeigth + 10;

                  //Carrega Horario de funcionamento
                  lblSeg.Text := HorarioFuncionamento(dmGeral.memComercio,'HRSEGCOM');
                  lblTer.Text := HorarioFuncionamento(dmGeral.memComercio,'HRTERCOM');
                  lblQua.Text := HorarioFuncionamento(dmGeral.memComercio,'HRQUACOM');
                  lblQui.Text := HorarioFuncionamento(dmGeral.memComercio,'HRQUICOM');
                  lblSex.Text := HorarioFuncionamento(dmGeral.memComercio,'HRSEXCOM');
                  lblSab.Text := HorarioFuncionamento(dmGeral.memComercio,'HRSABCOM');
                  lblDom.Text := HorarioFuncionamento(dmGeral.memComercio,'HRDOMCOM');
            end);
                  //Carrega media total das avaliacoes
                  ExtraiAvaliacoes;
     end).Start;

end;

procedure TfrmMain.ExtraiAvaliacoes;
begin
     vCountAvaliacao := 0;

     lytlocalizacaoTotal.Visible := StrToBoolValue(dmGeral.memComercio.FieldByName('AVALIALOCALCOM'      ).AsString,'T','F');
     lytAmbienteTotal.Visible    := StrToBoolValue(dmGeral.memComercio.FieldByName('AVALIAAMBIENTECOM'   ).AsString,'T','F');
     lytLimpezaTotal.Visible     := StrToBoolValue(dmGeral.memComercio.FieldByName('AVALIALIMPEZACOM'    ).AsString,'T','F');
     lytAtendimentoTotal.Visible := StrToBoolValue(dmGeral.memComercio.FieldByName('AVALIAATENDIMENTOCOM').AsString,'T','F');
     lytPrecoTotal.Visible       := StrToBoolValue(dmGeral.memComercio.FieldByName('AVALIAPRECOCOM'      ).AsString,'T','F');

     lytAvaliarLimpeza.Visible     := StrToBoolValue(dmGeral.memComercio.FieldByName('AVALIALIMPEZACOM'    ).AsString,'T','F');
     lytAvaliarAtendimento.Visible := StrToBoolValue(dmGeral.memComercio.FieldByName('AVALIAATENDIMENTOCOM').AsString,'T','F');
     lytAvaliarPrecos.Visible      := StrToBoolValue(dmGeral.memComercio.FieldByName('AVALIAPRECOCOM'      ).AsString,'T','F');
     lytAvaliarLocalizacao.Visible := StrToBoolValue(dmGeral.memComercio.FieldByName('AVALIALOCALCOM'      ).AsString,'T','F');
     lytAvaliarAmbiente.Visible    := StrToBoolValue(dmGeral.memComercio.FieldByName('AVALIAAMBIENTECOM'   ).AsString,'T','F');

     vIndiceMedia := 0;
     if dmGeral.memComercio.FieldByName('AVALIALIMPEZACOM'    ).AsString = 'T' then vIndiceMedia := vIndiceMedia + 1;
     if dmGeral.memComercio.FieldByName('AVALIAATENDIMENTOCOM').AsString = 'T' then vIndiceMedia := vIndiceMedia + 1;
     if dmGeral.memComercio.FieldByName('AVALIAPRECOCOM'      ).AsString = 'T' then vIndiceMedia := vIndiceMedia + 1;
     if dmGeral.memComercio.FieldByName('AVALIALOCALCOM'      ).AsString = 'T' then vIndiceMedia := vIndiceMedia + 1;
     if dmGeral.memComercio.FieldByName('AVALIAAMBIENTECOM'   ).AsString = 'T' then vIndiceMedia := vIndiceMedia + 1;

     if dmGeral.memComercio.FieldByName('MEDIATOTALAVALIA').AsSingle <= 0 then
         begin

             lblTotalAvaliacoes.Text  := '(-)';
             lblMediaAmbiente.Text    := '(-)';
             lblMediaAtendimento.Text := '(-)';
             lblMediaLimpeza.Text     := '(-)';
             lblMediaLocalizacao.Text := '(-)';
             lblMediaPreco.Text       := '(-)';
             lblMsgAInsuficiente.Visible := True;

         end
      else
         begin
             lblTotalAvaliacoes.Text  := '(' + Format('%2.2f', [dmGeral.memComercio.FieldByName('MEDIATOTALAVALIA').AsSingle]) + ')';
             lblMediaAmbiente.Text    := '(' + Format('%2.2f', [dmGeral.memComercio.FieldByName('AMBIENTEAVALIAMEDIACOM').AsSingle]) + ')';
             lblMediaAtendimento.Text := '(' + Format('%2.2f', [dmGeral.memComercio.FieldByName('ATENDIMENTOAVALIAMEDIACOM').AsSingle]) + ')';
             lblMediaLimpeza.Text     := '(' + Format('%2.2f', [dmGeral.memComercio.FieldByName('LIMPEZAAVALIAMEDIACOM').AsSingle]) + ')';
             lblMediaLocalizacao.Text := '(' + Format('%2.2f', [dmGeral.memComercio.FieldByName('LOCALAVALIAMEDIACOM').AsSingle]) + ')';
             lblMediaPreco.Text       := '(' + Format('%2.2f', [dmGeral.memComercio.FieldByName('PRECOAVALIAMEDIACOM').AsSingle]) + ')';
             lblMsgAInsuficiente.Visible := False;
         end;

     rtMediaGeral.Value       := dmGeral.memComercio.FieldByName('MEDIATOTALAVALIA').AsSingle;
     rtMediaAmbiente.Value    := dmGeral.memComercio.FieldByName('AMBIENTEAVALIAMEDIACOM').AsSingle;
     rtMediaAtendimento.Value := dmGeral.memComercio.FieldByName('ATENDIMENTOAVALIAMEDIACOM').AsSingle;
     rtMediaLimpeza.Value     := dmGeral.memComercio.FieldByName('LIMPEZAAVALIAMEDIACOM').AsSingle;
     rtMediaLocalizacao.Value := dmGeral.memComercio.FieldByName('LOCALAVALIAMEDIACOM').AsSingle;
     rtMediaPreco.Value       := dmGeral.memComercio.FieldByName('PRECOAVALIAMEDIACOM').AsSingle;
end;

procedure TfrmMain.GerarFramesAvaliacoes(AAvaliacao : TAvaliacoes);
var
        AFrame: TframeAvaliacoes;
        AItem : TListBoxItem;
begin
        AItem         := TListBoxItem.Create(nil);
        AItem.Text    := '';
        AItem.Height  := 131;

        AFrame        := TframeAvaliacoes.Create(AItem);
        AFrame.Parent := AItem;
        AFrame.Width  := frmMain.lstAvaliacoes.Width;
        AFrame.Avaliacoes := AAvaliacao;

        AItem.Align   := TAlignLayout.Client;
        frmMain.lstAvaliacoes.AddObject(AItem);
end;

procedure TfrmMain.ExibeAvaliacoes(AStart : Integer);
var
        AAvalia : TAvaliacoes;
begin

   dmGeral.LoadAvaliacoes(vIdComercio, AStart);

   dmGeral.memAvaliacoes.First;

   if dmGeral.memAvaliacoes.RecordCount = 0 then
        begin
            recErroComentario.Visible := True;
        end
     else
        begin
            recErroComentario.Visible := False;
            while not dmGeral.memAvaliacoes.eof do
               begin
                  var AData := FormatDateTime('dddddd',dmGeral.memAvaliacoes.FieldByName('DATAAVALIA').AsDateTime);
                  AAvalia.IDAvaliacao          := dmGeral.memAvaliacoes.FieldByName('IDAVALIA').AsInteger;
                  AAvalia.NomeUsuario          := dmGeral.memAvaliacoes.FieldByName('NOMEUSU').AsString;
                  AAvalia.DataAvaliacao        := Copy(AData,Pos(',',AData) + 1, Length(AData));
                  AAvalia.Comentario           := dmGeral.memAvaliacoes.FieldByName('COMENTARIOAVALIA').AsString;
                  AAvalia.AvaliacaoMedia       := dmGeral.memAvaliacoes.FieldByName('MEDIAAVALIA').AsSingle;

                  GerarFramesAvaliacoes(AAvalia);

                  dmGeral.memAvaliacoes.Next;

               end;
        end;

end;

procedure TfrmMain.CarregaSubSecoes(Sender: TObject); //Carrega itens da SubSecoes
var
lblLabelSubSecao   : TLabel;
lnLinha            : TLine;
S : String;
vsbScrollSubSecoes : TVertScrollBox;
recImgSeta : TRectangle;
i :Integer;
begin

   Try
      gPesquisa := False;

      lcGrupo := lblGrupo.Text;

      dmGeral.LoadSubCategoria(device_token, vidSecao);
      cm.ServerMethodsClient.SalvaHistoricoUsu(gIdUsuConectado,vIdSecao,0,0,'');

      lstvSubGrupo.Items.Clear;

      dmGeral.memSubCategorias.First;
      While not dmGeral.memSubCategorias.eof do
         begin
            AddSubGrupo(dmGeral.memSubCategorias.FieldByName('IDSUBCAT').AsInteger,
                        dmGeral.memSubCategorias.FieldByName('NOMESUBCAT').AsString);

            dmGeral.memSubCategorias.Next;
         end;
         uAction := uANull;
         actSubSecao.ExecuteTarget(Self);
   Except on E:EJNIException do
      begin
         //Oculta a janela de loading
         ExibeLoading('',False);

         recModal.Visible := True;
         recFalhaConexao.Visible := True;
      end;
   end;
end;

procedure TfrmMain.OnTapDestaque(Sender: TObject; const Point: TPointF);
var
vNameComponente : String;
begin
    TThread.CreateAnonymousThread(
    procedure
    begin

        TThread.Synchronize(nil,
        procedure
        begin
            vNameComponente := (Sender as TComponent).Name;
            ExibeLoading('Carregando Comércio');
            vidComercio       := ApenasNumeros(frmMain.FindComponent(vNameComponente).Name).ToInteger;
            gIdComSelecionado := vIdComercio;

            if Pos('Pesquisa', lblGrupo.Text) > 0 then
               lblGrupo.Text := lblComercio.Text;

            //Ajusta o tamanho do campo das imagens
            GridLayout.ItemWidth  := (VertScrollBoxCom.Width - 20) / 4;
            GridLayout.ItemHeight := 130;

            if lcAcessoAnuncio = False then
              lblDistancia.Text := TLabel(frmMain.FindComponent('lblDistanciadestaque_' + vIdComercio.ToString)).Text;

        end);

          if lcAcessoAnuncio = True then
             ControlaTool(False,False,False,True,False,True) else
          if lcAnterior = '' then ControlaTool(False,True,False,True,False,True);

          ExibeLoading('',False);
          actComercio.ExecuteTarget(Self);
          CarregaComercio(Self);

    end).Start;
 end;

procedure TfrmMain.lstvComercioItemClick(const Sender: TObject; const AItem: TListViewItem);
var
ATexto : TListItemText;
begin
    TThread.CreateAnonymousThread(
    procedure
    begin

        TThread.Synchronize(nil,
        procedure
        begin
            ExibeLoading('Carregando Comércio');
            vidComercio       := AItem.TagString.ToInteger;
            gIdComSelecionado := vIdComercio;

            if Pos('Pesquisa', lblGrupo.Text) > 0 then
               lblGrupo.Text := lblComercio.Text;

            //Ajusta o tamanho do campo das imagens
            GridLayout.ItemWidth  := (VertScrollBoxCom.Width - 20) / 4;
            GridLayout.ItemHeight := 130;

            ATexto := TListItemText(AItem.Objects.FindDrawable('Text5'));

            if lcAcessoAnuncio = False then
              lblDistancia.Text := ATexto.Text;

        end);

          if lcAcessoAnuncio = True then
             ControlaTool(False,False,False,True,False,True) else
          if lcAnterior = '' then ControlaTool(False,True,False,True,False,True);

          ExibeLoading('',False);
          aniLoadFotoPrincipal.Visible := True;
          aniLoadFotoPrincipal.Enabled := True;
          aniLoadingLogo.Visible       := True;
          aniLoadingLogo.Enabled       := True;
          actComercio.ExecuteTarget(Self);
          CarregaComercio(Self);

    end).Start;

end;

procedure TfrmMain.lstvComercioUpdateObjects(const Sender: TObject; const AItem: TListViewItem);
var
   ATexto : TListItemText;
   AImage : TListItemImage;
begin

   ATexto := TListItemText(AItem.Objects.FindDrawable('Text11'));
   ATexto.Width := Screen.Width - 125;

   ATexto := TListItemText(AItem.Objects.FindDrawable('Text4'));
   ATexto.Width := Screen.Width - 125;

   ATexto := TListItemText(AItem.Objects.FindDrawable('Text5'));
   ATexto.PlaceOffset.X := Screen.Width - 55;

   ATexto := TListItemText(AItem.Objects.FindDrawable('Text6'));
   ATexto.PlaceOffset.X := Screen.Width - 120;

end;

procedure TfrmMain.lstvPrincipalItemClick(const Sender: TObject; const AItem: TListViewItem);
var
ATexto : TListItemText;
begin
TThread.CreateAnonymousThread(
   procedure
   begin
      TThread.Synchronize(nil,
         procedure
         begin
            ExibeLoading('Carregando Seções');
            vidSecao := AItem.TagString.ToInteger;
         end);

      ATexto := AItem.Objects.FindDrawable('Text4') as TListItemText;

      lcAnterior    := '';
      lblGrupo.Text := ATexto.Text;
      lcGrupo       := lblGrupo.Text;
      CarregaSubSecoes(Self);
      ControlaTool(False, True, False, True, False, True);

      ExibeLoading('',False);
   end).Start;

end;

procedure TfrmMain.lstvPrincipalUpdateObjects(const Sender: TObject; const AItem: TListViewItem);
var
   ATexto : TListItemText;
   AImage : TListItemImage;
begin

   ATexto       := TListItemText(AItem.Objects.FindDrawable('Text4'));
   ATexto.Width := Screen.Width - 85;

   ATexto           := TListItemText(AItem.Objects.FindDrawable('Text3'));
   ATexto.Width     := Screen.Width - 85;
   ATexto.Font.Size := 14;

end;

procedure TfrmMain.lstvSubGrupoItemClick(const Sender: TObject; const AItem: TListViewItem);
var
   ATexto : TListItemText;
begin

    ExibeLoading('Carregando Comércios');
    lcAcessoAnuncio  := False;
    vidSubSecao      := AItem.TagString.ToInteger;
    ATexto           := AItem.Objects.FindDrawable('Text1') as TListItemText;
    lblSubGrupo.Text := ATexto.Text;

    CarregaListaComercio(Self);

end;

procedure TfrmMain.lstvSubGrupoUpdateObjects(const Sender: TObject; const AItem: TListViewItem);
var
   ATexto : TListItemText;
begin

   AItem.Height     := 60;
   ATexto           := TListItemText(AItem.Objects.FindDrawable('Text1'));
   ATexto.Font.Size := 22;
   ATexto.TextAlign := TTextAlign.Leading;

end;

procedure TfrmMain.AddSubGrupo(FIdSubGrupo : Integer; FDescricaoSubGrupo : String);
var
   ATexto : TListItemText;
   AImage : TListItemImage;
   AItem : TListViewItem;
begin

   AItem := lstvSubGrupo.Items.Add;
   AItem.TagString := FIdSubGrupo.ToString;

   ATexto := TListItemText(AItem.Objects.FindDrawable('Text1'));
   ATexto.Text := FDescricaoSubGrupo;

end;

procedure TfrmMain.AddSecaoGrupo(FIdSecaoGrupo : Integer; FIconeGrupo, FNomeGrupo, FDescricaoGrupo : String);
var
   ATexto : TListItemText;
   AImage : TListItemImage;
   AItem : TListViewItem;
begin

   AItem := lstvPrincipal.Items.Add;
   AItem.TagString := FIdSecaoGrupo.ToString;

   AImage            := TListItemImage(AItem.Objects.FindDrawable('Image2'));

   MyThread          := TMyThread.create;
   MyThread.FUrlFtp  := ctrPATHICONESFTP;
   MyThread.FFileFtp := FIconeGrupo;
   MyThread.FImage   := AImage;

   MyThread.FreeOnTerminate := True;
   MyThread.Start;

   ATexto := TListItemText(AItem.Objects.FindDrawable('Text4'));
   ATexto.Text := FNomeGrupo;
   ATexto.Font.Size := 20;
   ATexto.PlaceOffset.Y := 3;
   ATexto.Font.Style := [TFontStyle.fsBold];

   ATexto := TListItemText(AItem.Objects.FindDrawable('Text3'));
   ATexto.Text := FDescricaoGrupo;
   ATexto.Font.Size := 12;

end;

procedure TfrmMain.AddItemComercio(FIdComercio, FAvaliacao : Integer; FLogoComercio, FComercio, FSlogam, FStatus, FDistancia : String);
var
   ATexto : TListItemText;
   AImage : TListItemImage;
   AItem : TListViewItem;
begin

   AItem             := lstvComercio.Items.Add;
   AItem.TagString   := FIdComercio.ToString;
   AImage            := TListItemImage(AItem.Objects.FindDrawable('Image2'));

   MyThread          := TMyThread.create;
   MyThread.FUrlFtp  := ctrPATHLOGOSFTP;
   MyThread.FFileFtp := FLogoComercio;
   MyThread.FImage   := AImage;

   MyThread.FreeOnTerminate := True;
   MyThread.Start;

   AImage            := TListItemImage(AItem.Objects.FindDrawable('Image3'));
   AImage.OwnsBitmap := True;
   AImage.Bitmap     := imgLinha.Bitmap;
   AImage.Height     := 1;

   ATexto := TListItemText(AItem.Objects.FindDrawable('Text11'));
   ATexto.Text := FComercio;
   ATexto.Font.Size := 14;
   ATexto.PlaceOffset.Y := 3;
   ATexto.Font.Style := [TFontStyle.fsBold];

   ATexto := TListItemText(AItem.Objects.FindDrawable('Text4'));
   ATexto.Text := FSlogam;
   ATexto.Font.Size := 12;

   ATexto := TListItemText(AItem.Objects.FindDrawable('Text5'));
   ATexto.Text := FDistancia;
   ATexto.Font.Size := 12;

   ATexto := TListItemText(AItem.Objects.FindDrawable('Text6'));
   ATexto.Text := FStatus;
   ATexto.Font.Size := 12;
   if FStatus = 'Fechado' then
      ATexto.TextColor :=  TAlphaColorRec.Red else
      ATexto.TextColor :=  TAlphaColorRec.Limegreen;

   //Estrelas....
   for var i := 1 to 5 do
       begin
          var Aux := i + 6;
          AImage            := TListItemImage(AItem.Objects.FindDrawable('Image' + Aux.ToString));
          AImage.OwnsBitmap := True;
          AImage.Bitmap     := imgStarApagada.Bitmap;

          if FAvaliacao >= Aux then
             AImage.Bitmap  := imgStarAcesa.Bitmap;
       end;

end;

procedure TfrmMain.CarregaListaComercio(Sender: TObject); //Carrega lista de Comercio
var
recRectangle : TRectangle;
lblLabel     : TLabel;
lytLayout,
lytLayoutAux : TLayout;
fmsRating    : TTMSFMXRating;
imgImage     : TImage;
lnLine       : TLine;
seEfect : TShadowEffect;
tbItemCom : TTabItem;
idRepeteCom : Integer;
vDestaque : Boolean;
S : String;
ThreadSubCategoria : TThread;
vIndex : Integer;
ATThreadListaComercio : TThread;
begin

       ATThreadListaComercio := TThread.CreateAnonymousThread(
       procedure
       begin
           uAction := uANull;

           ATThreadListaComercio.Synchronize(ATThreadListaComercio,
           procedure
           begin
               for var i := 0 to ListaSecoes.Lines.Count - 1 do
                 begin
                    S := ListaSecoes.Lines.Strings[i];
                    if Pos('_'+vIdSubSecao.ToString,S) > 0 then
                        lblSubGrupo.Text := Copy(S,1,Pos('_',S)-1);
                    lcSubGrupo := lblSubGrupo.Text;
                 end;
           end);

          try
              //Verifica se e uma pesquisa ou e por secao o carregamento dos destaques
              if gPesquisa = True then
                 begin
                    cm.ServerMethodsClient.SalvaHistoricoUsu(gIdUsuConectado,0,0,0,edtBusca.Text);
                    vIdSecao := 0;
                    lblSubGrupo.Text := '';
                 end
              else
                 begin
                    cm.ServerMethodsClient.SalvaHistoricoUsu(gIdUsuConectado,vIdSecao,vIdSubSecao,0,'');
                 end;
          Except

             sbtnVoltarClick(Self);
             Label5.Text := 'Não foi possível receber as informações do servidor, tente novamente!';
             recMsg.Visible   := True;
             recModal.Visible := True;
             ATThreadListaComercio.Terminate;

          end;

          Try
              //Carrega tabela de destaques
              dmGeral.LoadFotosPorSecao(vIdSecao, edtBusca.Text, device_token);

          Except

              sbtnVoltarClick(Self);
              Label5.Text := 'Não foi possível receber as informações do servidor, tente novamente!';
              recMsg.Visible   := True;
              recModal.Visible := True;
              ATThreadListaComercio.Terminate;

          end;


          //Verifica a existencia de destaques ativos
          dmGeral.memFotosPorSecao.First;
          vDestaque := False;
          tmBannerFotosSecao.Enabled := vDestaque;
          While not dmGeral.memFotosPorSecao.eof do
             begin
                if Length(Trim(dmGeral.memFotosPorSecao.FieldByName('IMGDESTAQUESESSAOCONTRATO').AsString)) > 0 then
                   begin
                      vDestaque := True; //Seta a variavel para TRUE caso exista algum destaque
                      Break
                   end
                else
                   begin
                      dmGeral.memFotosPorSecao.Next;
                   end;
             end;

          tbControl.DisposeOf;

          gListaParamLstCom.DisposeOf;
          gListaParamLstCom := TStringList.Create;


          ATThreadListaComercio.Synchronize(ATThreadListaComercio,
          procedure
          begin
              //Caso exista destaque os mesmos são carregados...
              if (vDestaque = True) and (gPesquisa = False) then
                 begin

                    tbControl := TTabControl.Create(frmMain);
                    tbControl.Parent := recAnunciosCom;
                    tbControl.TabPosition := TTabPosition.Dots;
                    tbControl.Align  := TAlignLayout.Client;
                    tbControl.Name := 'tbFotosSecao';
                    tbControl.TabPosition := TTabPosition.None;

                    recAnunciosCom.Visible := True;

                    tbItemCom.DisposeOf;

                    dmGeral.memFotosPorSecao.First;
                    vIndex := 0;
                    While not dmGeral.memFotosPorSecao.eof do
                       begin
                          if dmGeral.memFotosPorSecao.FieldByName('IMGDESTAQUESESSAOCONTRATO').AsString <> '' then
                             begin
                                tbItemCom := TTabItem.Create(tbControl);
                                tbItemCom.Parent := tbControl;
                                tbItemCom.Name   := 'tbItemCom' + vIndex.ToString + '_' + dmGeral.memFotosPorSecao.FieldByName('ID_COM').AsString;

                                imgImage := TImage.Create(frmMain);
                                imgImage.Parent := tbItemCom;
                                imgImage.Align :=  TAlignLayout.Client;
                                imgImage.WrapMode := TImageWrapMode.Stretch;
                                imgImage.Name := 'ImageDestaqueSessao_' + dmGeral.memFotosPorSecao.FieldByName('ID_COM').AsString;
                                imgImage.Bitmap.LoadFromFile(CaminhoArquivos('LoadingAnu.png'));
                                var vNomeImagem := dmGeral.memFotosPorSecao.FieldByName('IMGDESTAQUESESSAOCONTRATO').AsString;
                                //imgImage.OnTap := OnTapComercio;
                                gListaParamLstCom.Add('IdFTP ' + ctrPATHFOTOSFTP + ' ' + vNomeImagem + ' ' + imgImage.Name);

                                Inc(vIndex, 1);
                                dmGeral.memFotosPorSecao.Next;
                             end
                          else
                             begin
                                dmGeral.memFotosPorSecao.Next;
                             end;
                       end;
                 end
              else
                 begin
                    //Caso não exista apaga o espaço do destaque
                    recAnunciosCom.Visible := False;

                 end;
          end);

             if gPesquisa = False then
                tmBannerFotosSecao.Enabled := vDestaque else
                tmBannerFotosSecao.Enabled := False;
             //Carrega os comercios
             try
                 if gPesquisa = False then
                    dmGeral.LoadComercioCategoria(device_token, vIdSecao, vIdSubSecao)
                 else
                    dmGeral.LoadComercioPesquisa(device_token, LowerCase(edtBusca.Text));
             Except
                  sbtnVoltarClick(Self);
                  Label5.Text := 'Não foi possível receber as informações do servidor, tente novamente!';
                  recMsg.Visible   := True;
                  recModal.Visible := True;
                  ATThreadListaComercio.Terminate;
             end;

             if dmGeral.memComCategorias.RecordCount = 0 then
                   recNotFound.Visible := True else recNotFound.Visible := False;

             ExibeLoading('', False);
             //Verifica a existencia de registros/anunciantes
             dmGeral.memComCategorias.First;
             idRepeteCom := 0;
             ATThreadListaComercio.Synchronize(ATThreadListaComercio,
             procedure
             begin
                FormatSettings.DecimalSeparator := '.';
                FormatSettings.ThousandSeparator := ',';
                lstvComercio.Items.Clear;

                While not dmGeral.memComCategorias.eof do
                  begin
                     if idRepeteCom = dmGeral.memComCategorias.FieldByName('IDCOM').AsInteger then
                        begin
                           idRepeteCom := dmGeral.memComCategorias.FieldByName('IDCOM').AsInteger;
                           dmGeral.memComCategorias.Next;
                        end
                     else
                        begin
                           LatDestino  := dmGeral.memComCategorias.FieldByName('LATCOM').Value;
                           LongDestino := dmGeral.memComCategorias.FieldByName('LONGCOM').Value;

                           lcDistancia := GetDistancia(LatOrigem,LongOrigem,LatDestino,LongDestino);

                           AddItemComercio(dmGeral.memComCategorias.FieldByName('IDCOM').AsInteger ,
                                            dmGeral.memComCategorias.FieldByName('MEDIATOTALAVALIA').Value,
                                            dmGeral.memComCategorias.FieldByName('ICOCOM').AsString,
                                            dmGeral.memComCategorias.FieldByName('TITULOCOM').AsString,
                                            dmGeral.memComCategorias.FieldByName('SLOGAMCOM').AsString,
                                            StatusComercio(dmGeral.memComCategorias),
                                            lcDistancia);
                           dmGeral.memComCategorias.Next;
                        end;

                  end;
               FormatSettings.DecimalSeparator := ',';
               FormatSettings.ThousandSeparator := '.';
               gDestaque := False;
             end);
               ExibeLoading('',False);
               actItensSecao.ExecuteTarget(Self);
               LoadImagens(ThreadSubCategoria, gListaParamLstCom);

       end);

       ATThreadListaComercio.Start;
end;

procedure TMyThread.LoadingImages(APathFtp, ANomeImage : String; AImage : TImage; AListImage : TListItemImage; ALoading : TAniIndicator);
begin
    With frmMain do
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
