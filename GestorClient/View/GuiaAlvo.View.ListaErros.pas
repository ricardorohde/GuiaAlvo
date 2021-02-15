unit GuiaAlvo.View.ListaErros;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Layouts, FMX.ListView, FMX.Objects;

type
  TfrmListaErros = class(TForm)
    lstvErros: TListView;
    Layout1: TLayout;
    sbtnProximo: TSpeedButton;
    Layout2: TLayout;
    Image1: TImage;
    Label11: TLabel;
    imgObrigatorio: TImage;
    imgInvalido: TImage;
    imgRepetido: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnProximoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListaErros: TfrmListaErros;

implementation

{$R *.fmx}

uses GuiaAlvo.View.CadastroComercio;

procedure TfrmListaErros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action := TCloseAction.caFree;
end;

procedure TfrmListaErros.sbtnProximoClick(Sender: TObject);
begin
     frmCadastroNovo.tbcNovoCadastro.ActiveTab := frmCadastroNovo.tbiDadosBasicos;
     frmCadastroNovo.lcStatusTab := 0;
     frmCadastroNovo.lblProgresso.Text := 'Etapa 1 de 5';
     frmCadastroNovo.sbtnProximo.Text  := 'Próximo >';
     Close;
end;

end.
