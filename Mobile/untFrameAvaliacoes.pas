unit untFrameAvaliacoes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.TMSBaseControl, FMX.TMSRating,
  FMX.Effects, untGlobal, Guia.DmGeral, Guia.Dados.Frames;

type
  TframeAvaliacoes = class(TFrame)
    Rectangle1: TRectangle;
    lytUsuario: TLayout;
    Layout3: TLayout;
    lytComentario: TLayout;
    Layout8: TLayout;
    lblNomeUsuario: TLabel;
    lblDataAvaliacao: TLabel;
    lblComentarioAvaliacao: TLabel;
    lblValorMedia: TLabel;
    Rectangle3: TRectangle;
    lblAvaliacaoCompleta: TLabel;
    tmstrMedia: TTMSFMXRating;
    procedure lblAvaliacaoCompletaTap(Sender: TObject; const Point: TPointF);
  private
    { Private declarations }
    pAvaliacao : TAvaliacoes;
    procedure Config_Avaliacoes(const AValor : TAvaliacoes);
  public
    { Public declarations }
    property Avaliacoes : TAvaliacoes read pAvaliacao write Config_Avaliacoes;
  end;

implementation

{$R *.fmx}

uses untMain;

{ TFrame2 }

procedure TframeAvaliacoes.Config_Avaliacoes(const AValor: TAvaliacoes);
begin

        pAvaliacao                      := AValor;
        lblAvaliacaoCompleta.TagString  := pAvaliacao.IDAvaliacao.ToString;
        lblNomeUsuario.Text             := pAvaliacao.NomeUsuario;
        lblDataAvaliacao.Text           := pAvaliacao.DataAvaliacao;
        lblComentarioAvaliacao.Text     := pAvaliacao.Comentario;
        lblValorMedia.Text              := Format('%2.2f', [pAvaliacao.AvaliacaoMedia]);
        tmstrMedia.Value                := pAvaliacao.AvaliacaoMedia;
end;

procedure TframeAvaliacoes.lblAvaliacaoCompletaTap(Sender: TObject; const Point: TPointF);
begin

    var AIdAvaliacao := ApenasNumeros(lblAvaliacaoCompleta.TagString).ToInteger;

    dmGeral.getAvaliacaoCompleta(AIdAvaliacao);

    var AData := FormatDateTime('dddddd',dmGeral.memAuxiliar.FieldByName('DATAAVALIA').AsDateTime);

    frmMain.lblDataAvaliacao.Text    := Copy(AData,Pos(',',AData) + 1, Length(AData));
    frmMain.lblNomeUsuario.Text      := dmGeral.memAuxiliar.FieldByName('NOMEUSU'           ).AsString;
    frmMain.lblValorMedia.Text       := Format('%2.2f', [dmGeral.memAuxiliar.FieldByName('MEDIAAVALIA').AsSingle]);
    frmMain.tmstrLocal.Value         := dmGeral.memAuxiliar.FieldByName('LOCAL_AVALIA'      ).AsSingle;
    frmMain.tmstrAmbiente.Value      := dmGeral.memAuxiliar.FieldByName('AMBIENTE_AVALIA'   ).AsSingle;
    frmMain.tmstrLimpeza.Value       := dmGeral.memAuxiliar.FieldByName('LIMPEZA_AVALIA'    ).AsSingle;
    frmMain.tmstrAtendimento.Value   := dmGeral.memAuxiliar.FieldByName('ATENDIMENTO_AVALIA').AsSingle;
    frmMain.tmstrPrecos.Value        := dmGeral.memAuxiliar.FieldByName('PRECO_AVALIA'      ).AsSingle;
    frmMain.tmstrMedia.Value         := dmGeral.memAuxiliar.FieldByName('MEDIAAVALIA'       ).AsSingle;

    frmMain.lytLocal.Visible         := StrToBoolValue(dmGeral.memAuxiliar.FieldByName('AVALIALOCALCOM'      ).AsString,'T','F');
    frmMain.lytAmbiente.Visible      := StrToBoolValue(dmGeral.memAuxiliar.FieldByName('AVALIAAMBIENTECOM'   ).AsString,'T','F');
    frmMain.lytLimpeza.Visible       := StrToBoolValue(dmGeral.memAuxiliar.FieldByName('AVALIALIMPEZACOM'    ).AsString,'T','F');
    frmMain.lytAtendimento.Visible   := StrToBoolValue(dmGeral.memAuxiliar.FieldByName('AVALIAATENDIMENTOCOM').AsString,'T','F');
    frmMain.lytPrecos.Visible        := StrToBoolValue(dmGeral.memAuxiliar.FieldByName('AVALIAPRECOCOM'      ).AsString,'T','F');

    frmMain.recModal.Visible             := True;
    frmMain.recDetalhesAvaliacao.Visible := True;

end;

end.
