unit untCadastroUsuariosGAL;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation;

type
  TfrmCadastroUsuarios = class(TForm)
    Rectangle1: TRectangle;
    Label1: TLabel;
    Image1: TImage;
    edtNome: TEdit;
    Label2: TLabel;
    chkAdmin: TCheckBox;
    edtlogin: TEdit;
    Label3: TLabel;
    edtSenha: TEdit;
    Label4: TLabel;
    edtConfirmaSenha: TEdit;
    Label5: TLabel;
    edtCelular: TEdit;
    Label6: TLabel;
    Line1: TLine;
    recFechar: TRectangle;
    Label7: TLabel;
    recSalvar: TRectangle;
    Label9: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroUsuarios: TfrmCadastroUsuarios;

implementation

{$R *.fmx}

end.
