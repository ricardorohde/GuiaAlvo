unit frmFindCep;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, FMX.StdCtrls, FMX.Grid, FMX.ScrollBox,
  FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.Layouts, FMX.Memo,
  FMX.TMSBaseControl, FMX.TMSBaseGroup, FMX.TMSRadioGroup, REST.Types, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, FMX.ListBox;

type
  Tfrm_FindCep = class(TForm)
    Rectangle11: TRectangle;
    Panel1: TPanel;
    Panel2: TPanel;
    edtFindLogradouro: TEdit;
    Line1: TLine;
    Label1: TLabel;
    lblCaptionBusca: TLabel;
    Line2: TLine;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    sbtnSair: TSpeedButton;
    sbtnAtualizar: TSpeedButton;
    sbtnIncluir: TSpeedButton;
    sbtnPesquisar: TSpeedButton;
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
    sgrdLogradouros: TStringGrid;
    StringColumn1: TStringColumn;
    StringColumn2: TStringColumn;
    StringColumn5: TStringColumn;
    lblInfo: TLabel;
    rbPor: TTMSFMXRadioGroup;
    edtCidade: TEdit;
    cbEstado: TComboBox;
    lytCidade: TLayout;
    Label3: TLabel;
    Label4: TLabel;
    rbFiltro: TTMSFMXRadioGroup;
    Layout3: TLayout;
    procedure sbtnPesquisarClick(Sender: TObject);
    procedure sbtnOKClick(Sender: TObject);
    procedure sbtnSairClick(Sender: TObject);
    procedure sbtnIncluirClick(Sender: TObject);
    procedure sbtnAtualizarClick(Sender: TObject);
    procedure rbPorRadioButtonChange(Sender: TObject; Index: Integer);
    procedure rbFiltroRadioButtonChange(Sender: TObject; Index: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_FindCep: Tfrm_FindCep;
  lcPesquisaContenha : Boolean = True;

implementation

{$R *.fmx}

uses untGlobal, untDmGeral, frmLogradouros;

procedure Tfrm_FindCep.rbFiltroRadioButtonChange(Sender: TObject; Index: Integer);
begin
     case rbFiltro.ItemIndex of

          0 : lcPesquisaContenha := True;
          1 : lcPesquisaContenha := False;

     end;
end;

procedure Tfrm_FindCep.rbPorRadioButtonChange(Sender: TObject; Index: Integer);
begin
case rbPor.ItemIndex of

   0 : begin

          lblCaptionBusca.Text := 'CEP:';
          rbPor.Align          := TAlignLayout.Top;
          rbFiltro.Visible     := False;
          lytCidade.Visible    := False;

       end;

   1 : begin

            lblCaptionBusca.Text := 'Logradouro:';
            rbPor.Align          := TAlignLayout.Bottom;
            lytCidade.Align      := TAlignLayout.Bottom;
            rbFiltro.Align       := TAlignLayout.Top;
            rbFiltro.Visible     := True;
            lytCidade.Align      := TAlignLayout.Top;
            lytCidade.Visible    := True;
            rbPor.Visible        := True;

       end;

end;


end;

procedure Tfrm_FindCep.sbtnAtualizarClick(Sender: TObject);
begin
if sgrdLogradouros.Selected < 0 then
   begin
      fMsg(Self,'','É necessário selecionar um logradouro!',fIconExclamation,fBtnOK);
      Exit;
   end
else
   begin
      With dmGeral.qryGeral do
         begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT * FROM LOGRADOUROS');
            Sql.Add('WHERE CEP = :CEP');
            Params[0].AsString := sgrdLogradouros.Cells[0, sgrdLogradouros.Selected];
            Open;
            frm_Logradouros.Tag := 2;
            frm_Logradouros.edtCEP.Text := sgrdLogradouros.Cells[0, sgrdLogradouros.Selected];
            frm_Logradouros.edtCEPExit(frm_Logradouros);
            frm_Logradouros.edtLogradouro.SetFocus;
            frm_Logradouros.edtCEP.Enabled := False;
            frm_Logradouros.ShowModal;
         end;
   end;
end;

procedure Tfrm_FindCep.sbtnIncluirClick(Sender: TObject);
begin
With frm_Logradouros do
   begin
      Tag := 1;
      edtCEP.Enabled := True;
      edtLogradouro.SetFocus;
      ShowModal;
   end;
end;

procedure Tfrm_FindCep.sbtnOKClick(Sender: TObject);
begin
recModal.Visible := False;
end;

procedure Tfrm_FindCep.sbtnPesquisarClick(Sender: TObject);
var
vLine : Integer;
vSql : String;
begin
if Trim(edtFindLogradouro.Text) = '' then
   begin
      fMsg(Self,'','O campo de pesquisa não pode ser branco!',fIconExclamation,fBtnOK);
      Exit;
   end;
if Length(edtFindLogradouro.Text) < 3 then
   begin
      fMsg(Self,'','O campo de pesquisa deve conter no minimo 3 craacteres!',fIconExclamation,fBtnOK);
      Exit;
   end;

   
   case rbPor.ItemIndex of
      0 : begin
            if Length(ApenasNumeros(edtFindLogradouro.Text)) > 8 then
               begin
                  fMsg(Self,'','CEP inválido, verifique!',fIconExclamation,fBtnOK);
                  Exit;
               end
            else
               begin
                  dmGeral.ConsultaCep(ApenasNumeros(edtFindLogradouro.Text));
                  if dmGeral.fdmemCep.RecordCount = 0 then
                     begin
                        fMsg(Self,'','Nenhum registro encontrado!',fIconInformation,fBtnOK);
                        lblInfo.Text := dmGeral.fdmemCep.RecordCount.ToString+' registro(s) encontrado(s)';
                        Exit;
                     end
                  else
                     begin
                        sgrdLogradouros.RowCount := sgrdLogradouros.RowCount + 1;
                        sgrdLogradouros.Cells[0, vLine] := dmGeral.fdmemCepcep.AsString;
                        sgrdLogradouros.Cells[1, vLine] := dmGeral.fdmemCeplogradouro.AsString;
                        sgrdLogradouros.Cells[2, vLine] := dmGeral.fdmemCepbairro.AsString;
                     end;
               end;
          end;
      1 : begin

               if Length(edtCidade.Text) < 3 then
                   begin
                        fMsg(Self,'','A cidade deve conter no minimo 3 caracteres!',fIconInformation,fBtnOK);
                        Exit;
                   end;
               if Length(edtFindLogradouro.Text) < 3 then
                   begin
                        fMsg(Self,'','O logradouro deve conter no minimo 3 caracteres!',fIconInformation,fBtnOK);
                        Exit;
                   end;
                if cbEstado.ItemIndex < 1 then
                   begin
                        fMsg(Self,'','É necessário selecionar o estado!',fIconInformation,fBtnOK);
                        Exit;
                   end;

                dmGeral.ConsultaLogradouro(cbEstado.Items[cbEstado.ItemIndex], edtCidade.Text, edtFindLogradouro.Text, lcPesquisaContenha);

                if dmGeral.fdmemCep.RecordCount <= 0 then
                   begin
                      fMsg(Self,'','Nenhum registro encontrado!',fIconInformation,fBtnOK);
                      lblInfo.Text := dmGeral.fdmemCep.RecordCount.ToString+' registro(s) encontrado(s)';
                      Exit;
                   end
                else
                   begin
                        dmGeral.fdmemCep.First;
                        vLine := 0;
                        lblInfo.Text := dmGeral.fdmemCep.RecordCount.ToString+' registro(s) encontrado(s)';
                        while not dmGeral.fdmemCep.Eof do
                           begin
                              sgrdLogradouros.Cells[0, vLine] := dmGeral.fdmemCepcep.AsString;
                              sgrdLogradouros.Cells[1, vLine] := dmGeral.fdmemCeplogradouro.AsString;
                              sgrdLogradouros.Cells[2, vLine] := dmGeral.fdmemCepbairro.AsString;
                              //sgrdLogradouros.Cells[3, vLine] := FieldByName('CIDADE').AsString;
                              //sgrdLogradouros.Cells[4, vLine] := FieldByName('UF').AsString;
                              vLine := vLine + 1;
                              sgrdLogradouros.RowCount := sgrdLogradouros.RowCount + 1;
                              dmGeral.fdmemCep.Next;
                           end;
                   end;
          end;

   end;

end;

procedure Tfrm_FindCep.sbtnSairClick(Sender: TObject);
begin
edtFindLogradouro.Text := '';
lblInfo.Text := '';
sgrdLogradouros.RowCount := 0;
Close;
end;

end.
