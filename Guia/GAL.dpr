program GAL;



{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  untPrincipal in 'untPrincipal.pas' {frmPrincipal},
  untDmGeral in 'untDmGeral.pas' {dmGeral: TDataModule},
  untCategorias in 'untCategorias.pas' {frmCategorias},
  untGlobal in 'untGlobal.pas',
  untComercio in 'untComercio.pas' {frmComercio},
  untCheckList in 'untCheckList.pas' {frmChekList},
  untMensagens in 'untMensagens.pas' {frmMensagens},
  untCaixaMsg in 'untCaixaMsg.pas' {frmCaixaMsg},
  untListaComercio in 'untListaComercio.pas' {frmListaComercio},
  untCadastroContrato in 'untCadastroContrato.pas' {frmCadastroContrato},
  untEditaComercio in 'untEditaComercio.pas' {frmEditaComercio},
  untEdicaoComercio in 'untEdicaoComercio.pas' {frmEdicaoComercio},
  frmFindCep in 'frmFindCep.pas' {frm_FindCep},
  frmLogradouros in 'frmLogradouros.pas' {frm_Logradouros},
  frmListaContaReceber in 'frmListaContaReceber.pas' {frm_ListaContaReceber},
  frmBaixaTitulos in 'frmBaixaTitulos.pas' {Form1},
  untCadastroUsuariosGAL in 'untCadastroUsuariosGAL.pas' {frmCadastroUsuarios},
  untValidacao in 'untValidacao.pas' {frmValidacao},
  Guia.Controle in '..\Mobile\Guia.Controle.pas',
  untNotificacoes in 'untNotificacoes.pas' {frmNotificacoes};

{$R *.res}
begin
if ParamStr(1) = '-ALST' then
  begin
     Halt;
  end
else
   begin
     Application.Initialize;
     Application.CreateForm(TdmGeral, dmGeral);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmEdicaoComercio, frmEdicaoComercio);
  Application.CreateForm(TfrmEditaComercio, frmEditaComercio);
  Application.CreateForm(TfrmCadastroContrato, frmCadastroContrato);
  Application.CreateForm(TfrmListaComercio, frmListaComercio);
  Application.CreateForm(TfrmCaixaMsg, frmCaixaMsg);
  Application.CreateForm(TfrmCategorias, frmCategorias);
  Application.CreateForm(TfrmComercio, frmComercio);
  Application.CreateForm(TfrmChekList, frmChekList);
  Application.CreateForm(Tfrm_FindCep, frm_FindCep);
  Application.CreateForm(Tfrm_Logradouros, frm_Logradouros);
  Application.CreateForm(Tfrm_ListaContaReceber, frm_ListaContaReceber);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmCadastroUsuarios, frmCadastroUsuarios);
  Application.CreateForm(TfrmValidacao, frmValidacao);
  Application.CreateForm(TfrmNotificacoes, frmNotificacoes);
  Application.Run;
   end;

   end.
