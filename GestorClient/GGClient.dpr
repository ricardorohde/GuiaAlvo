program GGClient;

{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormat in 'uFormat.pas',
  uFuncoes in 'uFuncoes.pas',
  GuiaAlvo.Model.FuncoesServidor in 'Model\GuiaAlvo.Model.FuncoesServidor.pas',
  GuiaAlvo.View.Principal in 'View\GuiaAlvo.View.Principal.pas' {frmGestorClient},
  GuiaAlvo.View.ListaErros in 'View\GuiaAlvo.View.ListaErros.pas' {frmListaErros},
  GuiaAlvo.View.Login in 'View\GuiaAlvo.View.Login.pas' {frmLoginPrincipal},
  uMensagens in 'uMensagens.pas',
  GuiaAlvo.View.CadastroComercio in 'View\GuiaAlvo.View.CadastroComercio.pas' {frmCadastroNovo},
  GuiaAlvo.Model.Proxy in 'Model\GuiaAlvo.Model.Proxy.pas',
  Guia.Controle in '..\Mobile\Guia.Controle.pas',
  GuiaAlvo.Model.RedesSociais in 'Model\GuiaAlvo.Model.RedesSociais.pas',
  GuiaAlvo.Model.Comercio in 'Model\GuiaAlvo.Model.Comercio.pas',
  GuiaAlvo.Model.Contrato in 'Model\GuiaAlvo.Model.Contrato.pas',
  GuiaAlvo.Model.Delivery in 'Model\GuiaAlvo.Model.Delivery.pas',
  GuiaAlvo.Controller.RedesSociais in 'Controller\GuiaAlvo.Controller.RedesSociais.pas',
  GuiaAlvo.View.Planos in 'View\GuiaAlvo.View.Planos.pas' {frmPlanos},
  GuiaAlvo.Controller.ClientModule in 'Controller\GuiaAlvo.Controller.ClientModule.pas' {ModelClientModule: TDataModule},
  GuiaAlvo.Controller.DataModuleDados in 'Controller\GuiaAlvo.Controller.DataModuleDados.pas' {dmGeralClient: TDataModule};

{$R *.res}

begin
  //ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.CreateForm(TModelClientModule, ModelClientModule);
  Application.CreateForm(TdmGeralClient, dmGeralClient);
  Application.CreateForm(TfrmLoginPrincipal, frmLoginPrincipal);
  Application.Run;
end.
