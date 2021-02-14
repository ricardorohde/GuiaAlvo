unit ALeste.Mensagens;

interface

uses untGlobal, untMain;



const

icoWarning      : String = 'warning';
icoquestion     : String = 'question';
icoinformation  : String = 'information';
icoconfirmation : String = 'confirmation';

implementation

procedure MensagemOK(ACaption, AMensagem, AIcone : String);
begin

    frmMain.lblCaptionMsgOK.Text := ACaption;
    frmMain.lblMsgOK.Text        := AMensagem;
    pLoadImage(frmMain.icoImageMsgOK , AIcone);

end;

end.
