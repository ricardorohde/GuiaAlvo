unit untContrato;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FMX.ListBox, FMX.EditBox, FMX.SpinBox,
  FMX.Edit, FMX.StdCtrls, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.TMSCustomEdit,
  FMX.TMSEdit, FMX.ComboTrackBar, System.Rtti, FMX.Grid.Style, FMX.Grid,
  FMX.ScrollBox;

type
  TfrmContrato = class(TForm)
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
    Panel1: TPanel;
    sbtnSair: TSpeedButton;
    Line1: TLine;
    Label3: TLabel;
    Label1: TLabel;
    edtContrato: TEdit;
    Rectangle3: TRectangle;
    cbMeses: TComboTrackBar;
    Label4: TLabel;
    Label5: TLabel;
    edtValor: TTMSFMXEdit;
    Line2: TLine;
    cbFotos: TComboTrackBar;
    Label6: TLabel;
    Rectangle1: TRectangle;
    sbtnIncluir: TSpeedButton;
    sgrdContratos: TStringGrid;
    StringColumn1: TStringColumn;
    StringColumn2: TStringColumn;
    StringColumn3: TStringColumn;
    qryContrato: TFDQuery;
    CurrencyColumn1: TCurrencyColumn;
    procedure sbtnIncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sgrdContratosCellDblClick(const Column: TColumn;
      const Row: Integer);
    procedure sbtnOKClick(Sender: TObject);
    procedure sbtnSimClick(Sender: TObject);
    procedure sbtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContrato: TfrmContrato;
  vLine: Integer = 0;
  vIdContrato : Integer = 0;
implementation

{$R *.fmx}

uses untDmGeral, untGlobal;

procedure TfrmContrato.FormShow(Sender: TObject);
begin
vLine := 0;
With qryContrato do
   begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT * FROM ALTIPOCONTRATO');
      Open;
      sgrdContratos.RowCount := 0;
      While not eof do
         begin
            sgrdContratos.RowCount := sgrdContratos.RowCount + 1;
            sgrdContratos.Cells[0, vLine] := FieldByName('NOMETIPOCONTRATO').AsString;
            sgrdContratos.Cells[1, vLine] := FieldByName('PERIODOTIPOCONTRATO').AsString;
            sgrdContratos.Cells[2, vLine] := FieldByName('FOTOSTIPOCONTRATO').AsString;
            sgrdContratos.Cells[3, vLine] := CurrToStrf(FieldByName('VALORTIPOCONTRATO').AsCurrency,ffNumber,2);
            vLine := vLine + 1;
            Next;
         end;
         CurrencyColumn1.Width := 58;
   end;
end;

procedure TfrmContrato.sbtnIncluirClick(Sender: TObject);
begin
if vIdContrato <= 0 then
   begin
      With qryContrato do
         begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT * FROM ALTIPOCONTRATO');
            Sql.Add('WHERE NOMETIPOCONTRATO = :NOME');
            Params[0].AsString := edtContrato.Text;
            Open;
            if RecordCount > 0 then
               begin
                  fMsg(Self,'','Ja existe um tipo de contrato com este nome!',fIconInformation,fBtnOK);
                  edtContrato.SetFocus;
                  Exit;
               end
            else
               begin
                  if Length(Trim(edtContrato.Text)) = 0 then
                     begin
                        fMsg(Self, '', 'É necessário preencher o campo tipo de contrato!',fIconExclamation, fBtnOK);
                        edtContrato.SetFocus;
                        Exit;
                     end;
                  if (Length(Trim(edtValor.Text)) = 0) or (edtValor.Text <= '0') then
                     begin
                        fMsg(Self, '', 'É necessário preencher o valor do contrato!',fIconExclamation, fBtnOK);
                        edtValor.SetFocus;
                        Exit;
                     end;

                        Close;
                        Sql.Clear;
                        Sql.Add('INSERT INTO ALTIPOCONTRATO');
                        Sql.Add('(NOMETIPOCONTRATO, PERIODOTIPOCONTRATO, FOTOSTIPOCONTRATO, VALORTIPOCONTRATO) VALUES');
                        Sql.Add('(:NOMETIPOCONTRATO, :PERIODOTIPOCONTRATO, :FOTOSTIPOCONTRATO, :VALORTIPOCONTRATO)');
                        Params[0].AsString  := edtContrato.Text;
                        Params[1].AsSingle  := cbMeses.Value;
                        Params[2].AsSingle  := cbFotos.Value;
                        Params[3].AsCurrency := StrToCurr(edtValor.Text);
                        ExecSql;

                        sgrdContratos.RowCount := sgrdContratos.RowCount + 1;
                        sgrdContratos.Cells[0, vLine] := edtContrato.Text;
                        sgrdContratos.Cells[1, vLine] := cbMeses.Text;
                        sgrdContratos.Cells[2, vLine] := cbFotos.Text;
                        sgrdContratos.Cells[3, vLine] := edtValor.Text;
                        vLine := vLine + 1;
                        edtContrato.Text := '';
                        edtValor.Text := '0,00';
                        cbMeses.Value := 1;
                        cbFotos.Value := 1;
                        edtContrato.SetFocus;
               end;
         end;
   end
else
   begin
      if (Length(Trim(edtValor.Text)) = 0) or (edtValor.Text <= '0') then
         begin
            fMsg(Self, '', 'É necessário preencher o valor do contrato!',fIconExclamation, fBtnOK);
            edtValor.SetFocus;
            Exit;
         end;
      fMsg(Self,'','A alteração de qualquer informação deste contrato'+#13+
                   'afetara todos os clientes cadastrado com o mesmo!'+#13+
                   'Deseja continuar?',fIconInterrogation,fbtnYesNo);
      Self.Tag := 1;
   end;
end;

procedure TfrmContrato.sbtnOKClick(Sender: TObject);
begin
recModal.Visible := False;
end;

procedure TfrmContrato.sbtnSairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmContrato.sbtnSimClick(Sender: TObject);
begin
{$REGION 'Update'}
if Tag = 1 then
   begin
      With qryContrato do
         begin
            Close;
            Sql.Clear;
            Sql.Add('UPDATE ALTIPOCONTRATO SET ');
            Sql.Add('PERIODOTIPOCONTRATO  = :PERIODO,');
            Sql.Add('FOTOSTIPOCONTRATO    = :FOTOS,');
            Sql.Add('VALORTIPOCONTRATO    = :VALOR');
            Sql.Add('WHERE IDTIPOCONTRATO = :ID');
            Params[0].AsSingle   := cbMeses.Value;
            Params[1].AsSingle   := cbFotos.Value;
            Params[2].AsCurrency := StrToCurr(edtValor.Text);
            Params[3].AsInteger  := vIdContrato;
            ExecSql;
            vIdContrato := 0;
            edtContrato.Enabled := True;
            edtContrato.Text := '';
            edtValor.Text := '0,00';
            cbMeses.Value := 1;
            cbFotos.Value := 1;
            edtContrato.SetFocus;
            FormShow(Self);
            recModal.Visible := False;
         end;
   end;
{$ENDREGION}
end;

procedure TfrmContrato.sgrdContratosCellDblClick(const Column: TColumn;
  const Row: Integer);
begin
With qryContrato do
   begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT * FROM ALTIPOCONTRATO');
      Sql.Add('WHERE NOMETIPOCONTRATO = :NOME');
      Params[0].AsString := sgrdContratos.Cells[0, Row];
      Open;
      If RecordCount > 0 then
         vIdContrato := FieldByName('IDTIPOCONTRATO').AsInteger;
   end;
edtContrato.Enabled := False;
edtContrato.Text := sgrdContratos.Cells[0, Row];
cbMeses.Text     := sgrdContratos.Cells[1, Row];
cbFotos.Text     := sgrdContratos.Cells[2, Row];
edtValor.Text    := sgrdContratos.Cells[3, Row];
end;

end.
