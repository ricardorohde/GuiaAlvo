program Login;

uses
  System.StartUpCopy,
  FMX.Forms,
  untLogin in 'untLogin.pas' {frmLogin},
  untGlobal in 'untGlobal.pas',
  untLoginDmGeral in 'untLoginDmGeral.pas' {dmLoginGeral: TDataModule},
  untCadastroUsuarios in 'untCadastroUsuarios.pas' {frmCadastroUsuarios},
  Guia.Controle in '..\Mobile\Guia.Controle.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmLoginGeral, dmLoginGeral);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmCadastroUsuarios, frmCadastroUsuarios);
  Application.Run;
end.
