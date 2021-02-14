unit frmUpdateFtp;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.TMSBaseControl, FMX.TMSGridCell, FMX.TMSGridOptions, FMX.TMSGridData,
  FMX.TMSCustomGrid, FMX.TMSGrid, FMX.Layouts, FMX.ListBox, FMX.StdCtrls,
  FMX.Effects, FMX.Objects, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdFTP, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Tfrm_UpdateFTP = class(TForm)
    mmInfo: TMemo;
    recInicio: TRectangle;
    ShadowEffect1: TShadowEffect;
    Label1: TLabel;
    IdFTP: TIdFTP;
    recModal: TRectangle;
    recMsg: TRectangle;
    Layout1: TLayout;
    Line10: TLine;
    Image7: TImage;
    lblCaption: TLabel;
    Layout2: TLayout;
    imgIcoMsg: TImage;
    lblMensagem: TLabel;
    sbtnOK: TSpeedButton;
    sbtnSim: TSpeedButton;
    sbtnNao: TSpeedButton;
    qryFTP: TFDQuery;
    procedure sbtnNaoClick(Sender: TObject);
    procedure sbtnSimClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_UpdateFTP: Tfrm_UpdateFTP;

implementation

{$R *.fmx}

uses untGlobal, untDmGeral, untCM;


procedure Tfrm_UpdateFTP.sbtnNaoClick(Sender: TObject);
begin
{recModal.Visible   := False;
recInicio.Visible := True;
frm_UpdateFTP.Close;}
end;

procedure Tfrm_UpdateFTP.sbtnSimClick(Sender: TObject);
begin
{TThread.CreateAnonymousThread(procedure begin
With IdFTP do
   begin
      Port     := gPortFtp;
      Host     := gHostFtp;
      Username := gUserFtp;
      Password := gPswFtp;
      Passive  := False;
      Try
         mmInfo.Lines.Add('CONECTANDO...');
         Connect;
         mmInfo.Lines.Add('CONECTADO');
         mmInfo.Lines.Add('VERIFICANDO INCLUSÕES NA TABELA ALCOMERCIO');
         recModal.Visible := False;
         With qryFTP do
            begin
               Close;
               Sql.Clear;
               Sql.Add('SELECT * FROM ALCOMERCIO');
               Sql.Add('WHERE IDCOM > :IDCOM');
               Params[0].AsInteger := dmGeral.getID('ALCOMERCIO','IDCOM');
               Open;
               First;
               if RecordCount > 0 then
                  begin
                     mmInfo.Lines.Add('');
                     mmInfo.Lines.Add('FORAM ENCONTRADO(S) '+RecordCount.ToString+' NOVOS REGISTROS.');
                     mmInfo.Lines.Add('');
                     mmInfo.Lines.Add('INSERINDO OS NOVOS REGISTROS...');
                        While not eof do
                           begin
                              CM.ServerMethods1Client.InsComercio(FieldByName('IDCOM'      ).AsInteger, FieldByName('IDCAT_COM'  ).AsInteger,
                                                                             FieldByName('NRLOGCOM'   ).AsInteger, FieldByName('CNPJCOM'    ).AsString,
                                                                             FieldByName('RAZAOCOM'   ).AsString, FieldByName('FANTASIACOM').AsString,
                                                                             FieldByName('CEPLOG_COM' ).AsString, FieldByName('COMPLCOM'   ).AsString,
                                                                             FieldByName('SITECOM'    ).AsString, FieldByName('EMAILCOM'   ).AsString,
                                                                             FieldByName('FACECOM'    ).AsString, FieldByName('INSTACOM'   ).AsString,
                                                                             FieldByName('TWITERCOM'  ).AsString, FieldByName('GOOGLECOM'  ).AsString,
                                                                             FieldByName('TUBECOM'    ).AsString, FieldByName('HRSEGCOM'   ).AsString,
                                                                             FieldByName('HRTERCOM'   ).AsString, FieldByName('HRQUACOM'   ).AsString,
                                                                             FieldByName('HRQUICOM'   ).AsString, FieldByName('HRSEXCOM'   ).AsString,
                                                                             FieldByName('HRSABCOM'   ).AsString, FieldByName('HRDOMCOM'   ).AsString,
                                                                             FieldByName('SENDFTPCOM' ).AsString, FieldByName('STATUSCOM'  ).AsString,
                                                                             FieldByName('SOBRECOM'   ).AsString, FieldByName('ICOCOM'     ).AsString,
                                                                             FieldByName('SLOGAMCOM'  ).AsString, FieldByName('UPDATECOM'  ).AsString,
                                                                             FieldByName('DTCADCOM'   ).AsString);

                              IdFTP.ChangeDir('/public_html/wp-content/app/imagens/');
                              IdFTP.Put(gPathImage ,FieldByName('ICOCOM').AsString);
                              Next;
                           end;
                  end
               else
                  begin
                     mmInfo.Lines.Add('NENHUM REGISTRO ENCONTRADO.');
                  end;
            end;
      Except on E : Exception do
         begin
            mmInfo.Lines.Add(E.Message);
         end;
      end;
   end;
end).start(); }




end;

end.
