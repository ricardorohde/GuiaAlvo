unit untPrincipal;

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.AppEvnts, Vcl.StdCtrls, IdHTTPWebBrokerBridge, Web.HTTPApp, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.IB, FireDAC.Phys.IBDef,
  FireDAC.VCLUI.Wait, IdBaseComponent, IdComponent, IdIPWatch, Vcl.Imaging.pngimage, System.ImageList, Vcl.ImgList, untFuncoesServer;

type
  TForm1 = class(TForm)
    ButtonStart: TButton;
    ButtonStop: TButton;
    EditPort: TEdit;
    Label1: TLabel;
    ApplicationEvents1: TApplicationEvents;
    tmUpdate: TTimer;
    Bevel1: TBevel;
    Label2: TLabel;
    lblIPLocal: TLabel;
    IdIPWatch1: TIdIPWatch;
    TrayIcon1: TTrayIcon;
    Image1: TImage;
    Image2: TImage;
    Label4: TLabel;
    Panel1: TPanel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
    procedure ButtonStartClick(Sender: TObject);
    procedure ButtonStopClick(Sender: TObject);
    procedure ButtonOpenBrowserClick(Sender: TObject);
    procedure tmUpdateTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ApplicationEvents1Minimize(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private
    FServer: TIdHTTPWebBrokerBridge;
    procedure StartServer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  WinApi.Windows, Winapi.ShellApi, Datasnap.DSSession, untMetodosGerais, untWM,
  System.DateUtils, unt_Conexao;


procedure TForm1.ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
begin
  ButtonStart.Enabled := not FServer.Active;
  ButtonStop.Enabled := FServer.Active;
  EditPort.Enabled := not FServer.Active;
end;

procedure TForm1.ApplicationEvents1Minimize(Sender: TObject);
begin



     Self.Hide();
     Self.WindowState := wsMinimized;
     TrayIcon1.Visible := True;
     TrayIcon1.Animate := True;
     TrayIcon1.ShowBalloonHint;

end;

procedure TForm1.ButtonOpenBrowserClick(Sender: TObject);
var
  LURL: string;
begin
  StartServer;
  LURL := Format('http://localhost:%s', [EditPort.Text]);
  ShellExecute(0,
        nil,
        PChar(LURL), nil, nil, SW_SHOWNOACTIVATE);
end;

procedure TForm1.ButtonStartClick(Sender: TObject);
begin
  StartServer;
  lblIPlocal.Caption := IdIPWatch1.LocalIP;
  tmUpdate.Enabled := True;
  Panel1.Visible := False;
end;

procedure TerminateThreads;
begin
  if TDSSessionManager.Instance <> nil then
    TDSSessionManager.Instance.TerminateAllSessions;
end;

procedure TForm1.ButtonStopClick(Sender: TObject);
var
APassword : String;
begin

  APassword := InputBox('Autorização',#31+'Digite sua Senha','');

  if APassword <> DayOf(DataAtual).ToString + 'AAlvo' + HourOf(Now).ToString then
     begin
        ShowMessage('Senha Inválida!');
        Exit;
     end
  else
     begin
        TerminateThreads;
        lblIPlocal.Caption := '';
        FServer.Active := False;
        FServer.Bindings.Clear;
        tmUpdate.Enabled := False;
        Panel1.Visible := True;
     end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin

   if ButtonStart.Enabled = False then
      ShellExecute(handle, 'open', pChar(ExtractFilePath(ParamStr(0))+ 'ServerGuiaAlvo.exe'),'', nil, SW_SHOW);

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FServer := TIdHTTPWebBrokerBridge.Create(Self);
  ButtonStartClick(Self);
end;

procedure TForm1.Image2Click(Sender: TObject);
begin

     if ButtonStart.Enabled then
        begin
           //
        end
     else
        begin
           Exit;
        end;

end;

procedure TForm1.StartServer;
begin
  if not FServer.Active then
  begin
    FServer.Bindings.Clear;
    FServer.DefaultPort := StrToInt(EditPort.Text);
    FServer.Active := True;
  end;
end;

procedure TForm1.tmUpdateTimer(Sender: TObject);
begin
With dmConexao.fdqryStatus do
   begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT * FROM ALUPDATESERVER');
      Open;
      if FieldByName('DATEUPDATE').AsDateTime < Date then
         begin
            With dmConexao.fdqryStatus do
               begin
                  Close;
                  Sql.Clear;
                  Sql.Add('UPDATE ALCONTRATO SET');
                  Sql.Add('STATUSCONTRATO = :STATUSCONTRATO');
                  Sql.Add('WHERE (DTFIMCONTRATO <= :DTFIMCONTRATO) AND');
                  Sql.Add('(STATUSCONTRATO IN (''ONLINE'',''OFFLINE'',''PAUSADO''))');
                  Params[0].AsString := 'VENCER';
                  Params[1].AsDate := IncDay(Date, -15);
                  ExecSql;

                  Close;
                  Sql.Clear;
                  Sql.Add('SELECT STATUSCR, IDCONTRATO_CR FROM CONTARECEBER');
                  Sql.Add('WHERE (STATUSCR <> ''CANCELADO'') AND (VENCTOCR < :VENCTO) AND (PAGTOCR IS NULL)');
                  Params[0].AsDate := IncDay(Date);
                  Open;

                  First;
                  dmConexao.fdqryAuxiliar.Close;
                  dmConexao.fdqryAuxiliar.SQL.Clear;
                  dmConexao.fdqryAuxiliar.SQL.Add('UPDATE ALCONTRATO SET');
                  dmConexao.fdqryAuxiliar.Sql.Add('STATUSCONTRATO = :STATUSCONTRATO');
                  dmConexao.fdqryAuxiliar.Sql.Add('WHERE (IDCONTRATO = :IDCONTRATO) AND');
                  dmConexao.fdqryAuxiliar.Sql.Add('(STATUSCONTRATO IN (''ONLINE'',''OFFLINE'',''VENCER''))');
                  While not eof do
                     begin
                          dmConexao.fdqryAuxiliar.Close;
                          dmConexao.fdqryAuxiliar.Params[0].AsString  := 'ATRASADO';
                          dmConexao.fdqryAuxiliar.Params[1].AsInteger := dmConexao.fdqryStatus.FieldByName('IDCONTRATO_CR').AsInteger;
                          dmConexao.fdqryAuxiliar.ExecSql;
                          dmConexao.fdqryStatus.Next;
                     end;

                  Close;
                  Sql.Clear;
                  Sql.Add('UPDATE CONTARECEBER SET');
                  Sql.Add('STATUSCR = :STATUSCR');
                  Sql.Add('WHERE (VENCTOCR < :VENCTOCR) AND (PAGTOCR IS NULL)');
                  Params[0].AsString := 'ATRASADO';
                  Params[1].AsDate := IncDay(Date);
                  ExecSql;

                  Close;
                  Sql.Clear;
                  Sql.Add('UPDATE ALCONTRATO SET');
                  Sql.Add('STATUSCONTRATO = :STATUSCONTRATO,');
                  Sql.Add('UPDATECONTRATO = 1');
                  Sql.Add('WHERE (DTFIMCONTRATO < :DATA) AND');
                  Sql.Add('(STATUSCONTRATO IN (''ONLINE'',''OFFLINE'',''ATRASADO''))');
                  Params[0].AsString := 'FINALIZADO';
                  Params[1].AsDate := Date;
                  ExecSql;

                  Close;
                  Sql.Clear;
                  Sql.Add('UPDATE ALUPDATESERVER SET');
                  Sql.Add('DATEUPDATE = :DATEUPDATE');
                  Params[0].AsDate := Date;
                  ExecSql;
               end;
         end;
   end;
end;



procedure TForm1.TrayIcon1DblClick(Sender: TObject);
begin
  TrayIcon1.Visible := False;
  Show();
  WindowState := wsNormal;
  Application.BringToFront();
end;

end.
