unit untFrameNotificacoes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Controls.Presentation,
  FMX.Objects, FMX.Layouts, Guia.Dados.Frames, untGlobal, Guia.Controle;

type
  TFrameNotificacoes = class(TFrame)
    Rectangle3: TRectangle;
    Layout116: TLayout;
    imgFrameImagem: TImage;
    Layout119: TLayout;
    Layout122: TLayout;
    lblFrameTitulo: TLabel;
    Layout123: TLayout;
    Layout124: TLayout;
    imgFrameExcluir: TImage;
    Layout125: TLayout;
    lblFrameMsg: TLabel;
    lblFrameData: TLabel;
  private
    pNotificacao : TNotificacoes;
    procedure Config_Notificacoes(const AValor : TNotificacoes);
  public
    { Public declarations }
    property Notificacoes : TNotificacoes read pNotificacao write Config_Notificacoes;
  end;

implementation

{$R *.fmx}

{ TFrame2 }

procedure TFrameNotificacoes.Config_Notificacoes(const AValor: TNotificacoes);
begin

        pNotificacao        := AValor;
        lblFrameTitulo.Text := pNotificacao.TituloPush;
        lblFrameMsg.Text    := pNotificacao.MSGPush;
        lblFrameData.Text   := pNotificacao.DataPush;
        imgFrameExcluir.TagString := pNotificacao.Indice.ToString;

        ReceiveFileFtp(ctrPATHPUSHFTP, pNotificacao.ImagemPush, imgFrameImagem, nil);

end;

end.
