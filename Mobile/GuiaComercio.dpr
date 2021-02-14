program GuiaComercio;

{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  untSplash in 'untSplash.pas' {frmSplash},
  Guia.Controle in 'Guia.Controle.pas',
  untMain in 'untMain.pas' {frmMain},
  untGlobal in 'untGlobal.pas',
  Guia.DmGeral in 'Guia.DmGeral.pas' {dmGeral: TDataModule},
  Guia.Proxy in 'Guia.Proxy.pas',
  Guia.untClientmodule in 'Guia.untClientmodule.pas' {cm: TDataModule},
  Guia.Dados.Frames in 'Guia.Dados.Frames.pas',
  untVisualizaFotos in 'untVisualizaFotos.pas' {frmVisualizaFotos},
  untFrameAvaliacoes in 'untFrameAvaliacoes.pas' {frameAvaliacoes: TFrame},
  Guia.Notificacao in 'Guia.Notificacao.pas',
  Guia.OpenViewUrl in 'Guia.OpenViewUrl.pas',
  untFrameNotificacoes in 'untFrameNotificacoes.pas' {FrameNotificacoes: TFrame},
  untConfiguracao in 'untConfiguracao.pas' {frmConfiguracao},
  untOnBoarding in 'untOnBoarding.pas' {frmOnBoarding},
  untUsuarios in 'untUsuarios.pas' {frmUsuarios};

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Portrait];
  Application.CreateForm(TdmGeral, dmGeral);
  Application.CreateForm(Tcm, cm);
  Application.CreateForm(TfrmSplash, frmSplash);
  Application.CreateForm(TfrmVisualizaFotos, frmVisualizaFotos);
  Application.Run;
end.
