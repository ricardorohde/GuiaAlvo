program ServerConsole;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Horse,
  Horse.Jhonson,
  System.Json,
  Horse.Etag,
  Horse.Compression,
  Server.Controller.Comercio in 'Controller\Server.Controller.Comercio.pas',
  Server.Controller.Conexao in 'Controller\Server.Controller.Conexao.pas',
  Server.Funcoes in 'Server.Funcoes.pas',
  GuiaAlvo.Model.Comercio in '..\GestorClient\Model\GuiaAlvo.Model.Comercio.pas';

var
App : THorse;

begin

  WriteLn('######### Servidor Guia Alvo  #########');

  App := THorse.Create;

  App.Use(Compression());
  App.Use(Jhonson);
  App.Use(eTag);

  Server.Controller.Conexao.Registry(App);
  Conecta;
  ReportMemoryLeaksOnShutdown := True;

  App.Listen(9000)



end.
