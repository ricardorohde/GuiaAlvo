unit GuiaAlvo.View.Planos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListBox, FMX.TabControl,
  GuiaAlvo.Model.FuncoesServidor, GuiaAlvo.Controller.DataModuleDados;

type
  TfrmPlanos = class(TForm)
    tabContrato: TTabControl;
    tiBasico: TTabItem;
    recBannerPlanoBasico: TRectangle;
    cbPeriodoBasico: TComboBox;
    Label30: TLabel;
    Label31: TLabel;
    lblPrecoPlanoBasico: TLabel;
    Label40: TLabel;
    Label112: TLabel;
    Layout4: TLayout;
    Label41: TLabel;
    Circle1: TCircle;
    Circle2: TCircle;
    Circle4: TCircle;
    Circle3: TCircle;
    Circle6: TCircle;
    Circle5: TCircle;
    Label39: TLabel;
    Label38: TLabel;
    Label36: TLabel;
    Label35: TLabel;
    Label34: TLabel;
    Label33: TLabel;
    tiPlus: TTabItem;
    Layout5: TLayout;
    Label42: TLabel;
    Circle7: TCircle;
    Circle8: TCircle;
    Circle9: TCircle;
    Circle10: TCircle;
    Circle11: TCircle;
    Circle12: TCircle;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Circle13: TCircle;
    Circle14: TCircle;
    Rectangle1: TRectangle;
    cbPeriodoPlus: TComboBox;
    Label49: TLabel;
    Label50: TLabel;
    lblPrecoPlanoPlus: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    FotosI: TTabItem;
    Rectangle3: TRectangle;
    cbPeriodoFotosI: TComboBox;
    Label64: TLabel;
    Label65: TLabel;
    lblPrecoPlanoFotosI: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Layout9: TLayout;
    Label57: TLabel;
    Circle15: TCircle;
    Circle16: TCircle;
    Circle17: TCircle;
    Circle18: TCircle;
    Circle19: TCircle;
    Circle20: TCircle;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Circle21: TCircle;
    Circle22: TCircle;
    Label72: TLabel;
    Label73: TLabel;
    Circle23: TCircle;
    Circle24: TCircle;
    tiFotosII: TTabItem;
    Layout10: TLayout;
    Label74: TLabel;
    Circle25: TCircle;
    Circle26: TCircle;
    Circle27: TCircle;
    Circle28: TCircle;
    Circle29: TCircle;
    Circle30: TCircle;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Circle31: TCircle;
    Circle32: TCircle;
    Label83: TLabel;
    Label84: TLabel;
    Circle33: TCircle;
    Circle34: TCircle;
    Rectangle8: TRectangle;
    cbPeriodoFotosII: TComboBox;
    Label85: TLabel;
    Label86: TLabel;
    lblPrecoPlanoFotosII: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    tiAnunciosI: TTabItem;
    Layout11: TLayout;
    Label91: TLabel;
    VertScrollBox1: TVertScrollBox;
    Circle35: TCircle;
    Circle36: TCircle;
    Circle37: TCircle;
    Circle38: TCircle;
    Circle41: TCircle;
    Circle43: TCircle;
    Circle44: TCircle;
    Circle42: TCircle;
    Circle39: TCircle;
    Circle40: TCircle;
    Label92: TLabel;
    Label93: TLabel;
    Label99: TLabel;
    Label101: TLabel;
    Label100: TLabel;
    Label98: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    Label110: TLabel;
    Circle45: TCircle;
    Label111: TLabel;
    Circle47: TCircle;
    Circle48: TCircle;
    Circle49: TCircle;
    Rectangle11: TRectangle;
    cbPeriodoAnunciosI: TComboBox;
    Label102: TLabel;
    Label103: TLabel;
    lblPrecoPlanoAnunciosI: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    tiAnunciosII: TTabItem;
    Layout12: TLayout;
    Label113: TLabel;
    VertScrollBox2: TVertScrollBox;
    Circle46: TCircle;
    Circle50: TCircle;
    Circle51: TCircle;
    Circle52: TCircle;
    Circle53: TCircle;
    Circle54: TCircle;
    Circle55: TCircle;
    Circle56: TCircle;
    Circle57: TCircle;
    Circle58: TCircle;
    Label114: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Label119: TLabel;
    Label120: TLabel;
    Label121: TLabel;
    Label122: TLabel;
    Label123: TLabel;
    Label124: TLabel;
    Label125: TLabel;
    Label126: TLabel;
    Circle59: TCircle;
    Label127: TLabel;
    Circle60: TCircle;
    Circle61: TCircle;
    Circle62: TCircle;
    Rectangle13: TRectangle;
    cbPeriodoAnunciosII: TComboBox;
    Label128: TLabel;
    Label129: TLabel;
    lblPrecoPlanoAnunciosII: TLabel;
    Label132: TLabel;
    Label133: TLabel;
    tiFull: TTabItem;
    Layout13: TLayout;
    Label134: TLabel;
    VertScrollBox3: TVertScrollBox;
    Circle63: TCircle;
    Circle64: TCircle;
    Circle65: TCircle;
    Circle66: TCircle;
    Circle67: TCircle;
    Circle68: TCircle;
    Circle69: TCircle;
    Circle70: TCircle;
    Circle71: TCircle;
    Circle72: TCircle;
    Label135: TLabel;
    Label136: TLabel;
    Label137: TLabel;
    Label138: TLabel;
    Label139: TLabel;
    Label140: TLabel;
    Label141: TLabel;
    Label142: TLabel;
    Label143: TLabel;
    Label144: TLabel;
    Label145: TLabel;
    Label146: TLabel;
    Label147: TLabel;
    Circle73: TCircle;
    Label148: TLabel;
    Circle74: TCircle;
    Circle75: TCircle;
    Circle76: TCircle;
    Circle77: TCircle;
    Label155: TLabel;
    Circle78: TCircle;
    Label156: TLabel;
    Rectangle15: TRectangle;
    cbPeriodoFull: TComboBox;
    Label149: TLabel;
    Label150: TLabel;
    lblPrecoPlanoFull: TLabel;
    Label153: TLabel;
    Label154: TLabel;
    Label1: TLabel;
    lblPrecoMensalBasico: TLabel;
    lblMsgBasico: TLabel;
    lblPrecoMensalPlus: TLabel;
    Label3: TLabel;
    lblMsgPlus: TLabel;
    lblPrecoMensalFotosI: TLabel;
    Label6: TLabel;
    lblMsgFotosI: TLabel;
    lblPrecoMensalFotosII: TLabel;
    Label9: TLabel;
    lblMsgFotosII: TLabel;
    lblPrecoMensalAnunciosI: TLabel;
    Label12: TLabel;
    lblMsgAnunciosI: TLabel;
    lblPrecoMensalAnunciosII: TLabel;
    Label15: TLabel;
    lblMsgAnunciosII: TLabel;
    lblPrecoMensalFull: TLabel;
    Label18: TLabel;
    lblMsgFull: TLabel;
    tiInformacoes: TTabItem;
    Label2: TLabel;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure tabContratoChange(Sender: TObject);
    procedure cbPeriodoBasicoChange(Sender: TObject);
    procedure recAdquirirFullClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPlanos: TfrmPlanos;

implementation

{$R *.fmx}

uses
uFuncoes, Guia.Controle, FMX.Platform.Win, Winapi.Windows;

function mesesPeriodo(APeriodo : String) : Integer;
begin

     if APeriodo = 'MENSAL'     then Result := 1;
     if APeriodo = 'TRIMESTRAL' then Result := 3;
     if APeriodo = 'SEMESTRAL'  then Result := 6;
     if APeriodo = 'ANUAL'      then Result := 12;

end;

procedure TfrmPlanos.cbPeriodoBasicoChange(Sender: TObject);
var
ALabel,
APlano,
AMarketing,
AIDPlano : String;
AEconomia : Currency;
begin

     if tabContrato.TabIndex > 0 then
         begin
//             AIDPlano := dmGeralClient.memPlanos.FieldByName('IDPLANO').AsString;
//
//             dmGeralClient.memPlanos.Filtered := False;
//             dmGeralClient.memPlanos.Filter   := 'IDPLANO=' + AIDPlano + ' AND ORDEMPLANO=1';
//             dmGeralClient.memPlanos.Filtered := True;
//
//             ABase := dmGeralClient.memPlanos.FieldByName('PRECOMENSALPLANO').AsCurrency;

             dmGeralClient.memPlanos.Filtered := False;
             dmGeralClient.memPlanos.Filter   := 'IDPRECOSPLANO=' + Integer(TComboBox(Sender).Items.Objects[TComboBox(Sender).ItemIndex]).ToString;
             dmGeralClient.memPlanos.Filtered := True;
             APlano := StringReplace(UpperCase(RemoveAcento(tabContrato.ActiveTab.Text)), ' ','',[rfReplaceAll]);

             AEconomia  := ABS((ctrPRECOBASE - dmGeralClient.memPlanos.FieldByName('PRECOMENSALPLANO').AsCurrency) *
                            mesesPeriodo(dmGeralClient.memPlanos.FieldByName('PERIODOPLANO').AsString));

             if TComboBox(Sender).ItemIndex = 0 then
                 TLabel(Self.FindComponent('lblMsg' + APlano)).Text := 'O plano Básico é ideal para quem quer apenas fazer um teste na plataforma Guia Alvo'
             else
                 TLabel(Self.FindComponent('lblMsg' + APlano)).Text := 'Neste plano você tera uma economia de R$ ' +
                                                                        CurrToStrf(AEconomia, ffNumber, 2) + ' sobre o total do plano, baseado no valor mensal do plano básico';

             TLabel(Self.FindComponent('lblPrecoMensal' + APlano)).Text := CurrToStrF(dmGeralClient.memPlanos.FieldByName('PRECOMENSALPLANO').AsCurrency, ffNumber,2);
             TLabel(Self.FindComponent('lblPrecoPlano'  + APlano)).Text := CurrToStrF(dmGeralClient.memPlanos.FieldByName('PRECOTOTALPLANO').AsCurrency, ffNumber,2);
         end;

end;

procedure TfrmPlanos.FormCreate(Sender: TObject);
begin

     ListaPlanos;

end;

procedure TfrmPlanos.recAdquirirFullClick(Sender: TObject);
var
APlano, AValorPlano : String;
begin

    APlano := tabContrato.ActiveTab.Name;
    AValorPlano:= TLabel(Self.FindComponent('lblPrecoPlano' + APlano)).Text;

    if MessageBox(WindowHandleToPlatform(Self.Handle).Wnd,
                  pChar('Confirma a escolha do plano ' + tabContrato.ActiveTab.Text +
                        ' no valor de ' + AValorPlano + ' pelo periodo ' +
                        TComboBox(Self.FindComponent('cbPeriodo' + APlano)).Items[TComboBox(Self.FindComponent('cbPeriodo' + APlano)).ItemIndex] + #13#13 +
                        'Lembrando que neste passo não será feita nenhuma cobrança ou solicitação de dados para tal!'),
                  'Guia Alvo', MB_YESNO + MB_ICONQUESTION) = IDYES then
        begin
            cfgPlanoSelecionado := '{"Plano":' + dmGeralClient.memPlanos.FieldByName('IDPLANO').AsString +
                                   ',"Periodo":' + dmGeralClient.memPlanos.FieldByName('IDPRECOSPLANO').AsString + '}' ;
        end;

end;

procedure TfrmPlanos.tabContratoChange(Sender: TObject);
var
APlano : String;
begin

    if tabContrato.TabIndex > 0 then
        begin
            APlano := UpperCase(RemoveAcento(tabContrato.ActiveTab.Text));

            dmGeralClient.memPlanos.Filtered := False;
            dmGeralClient.memPlanos.Filter   := 'NOMEPLANO=' + QuotedStr(APlano);
            dmGeralClient.memPlanos.Filtered := True;

            APlano := StringReplace(APlano, ' ','',[rfReplaceAll]);
            TComboBox(Self.FindComponent('cbPeriodo' + APlano)).Clear;

            dmGeralClient.memPlanos.First;

            While not dmGeralClient.memPlanos.Eof do
                begin
                    TComboBox(Self.FindComponent('cbPeriodo' + APlano)).Items.AddObject(dmGeralClient.memPlanos.FieldByName('PERIODOPLANO').AsString,
                                                                                        TObject(dmGeralClient.memPlanos.FieldByName('IDPRECOSPLANO').AsInteger));
                    dmGeralClient.memPlanos.Next;
                end;
                TComboBox(Self.FindComponent('cbPeriodo' + APlano)).ItemIndex := 1;
        end;
end;

end.
