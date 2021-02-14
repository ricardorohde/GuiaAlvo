program ServerAlvo;
{$APPTYPE GUI}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  untPrincipal in 'untPrincipal.pas' {Form1},
  untMetodosGerais in 'untMetodosGerais.pas' {ServerMethods: TDataModule},
  untWM in 'untWM.pas' {WM: TWebModule},
  unt_Conexao in 'unt_Conexao.pas' {dmConexao: TDataModule},
  untFuncoesServer in 'untFuncoesServer.pas',
  Guia.Controle in '..\Mobile\Guia.Controle.pas';

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.Run;
end.
