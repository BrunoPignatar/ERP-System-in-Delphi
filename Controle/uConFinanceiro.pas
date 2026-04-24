unit uConFinanceiro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls, VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs,
  VCLTee.Chart, VCLTee.DBChart;

type
  TfrmConFinanca = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    Panel3: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lblProdutos: TLabel;
    lblValorProduto: TLabel;
    Panel4: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblVendas: TLabel;
    lblValorVenda: TLabel;
    Panel5: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    lblLucro: TLabel;
    QryBalanco: TFDQuery;
    QryQntItens: TFDQuery;
    QryTotal: TFDQuery;
    QryTotaltotalproduto: TFMTBCDField;
    QryTotaltotalvendas: TFMTBCDField;
    QryBalancolucro: TFMTBCDField;
    QryQntItensqntprodutos: TFMTBCDField;
    QryQntItensqntvendas: TIntegerField;
    Panel6: TPanel;
    Splitter1: TSplitter;
    GraficoVendas: TDBChart;
    Series1: TFastLineSeries;
    Series2: TFastLineSeries;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GraficoVendasClickLegend(Sender: TCustomChart; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConFinanca: TfrmConFinanca;

implementation

uses
  uDTMConexao, uDTMGrafico;

{$R *.dfm}

procedure TfrmConFinanca.btnFecharClick(Sender: TObject);
begin
 close;
end;

procedure TfrmConFinanca.FormCreate(Sender: TObject);
var  Tlucro:Double;
begin
  QryTotal.Open();
  QryBalanco.Open();
  QryQntItens.Open();

  // vendas
  lblVendas.Caption:= QryQntItens.FieldByName('qntvendas').AsString;
  lblValorVenda.Caption :=FormatFloat('R$ ,0.00', QryTotal.FieldByName('totalvendas').AsFloat);

  // produtos
  lblprodutos.Caption:= QryQntItens.FieldByName('qntprodutos').AsString;
  lblValorProduto.Caption :=FormatFloat('R$ ,0.00', QryTotal.FieldByName('totalproduto').AsFloat);

  lbllucro.Caption :=FormatFloat(' R$ ,0.00', QryBalanco.FieldByName('lucro').AsFloat);

  Tlucro:= QryBalanco.FieldByName('lucro').AsFloat;

  if Tlucro < 0 then begin
    lbllucro.Font.Color:= clRed;
  end
  else if Tlucro > 0 then begin
    lbllucro.font.Color:=clGreen;
  end;


  QryTotal.close;
  QryBalanco.close;
  QryQntItens.close;
end;

procedure TfrmConFinanca.FormShow(Sender: TObject);
begin
  DTMGrafico.QryGraficos.Close;
  DTMGrafico.QryGraficos.Open;
  DTMGrafico.QryProdutos.Close;
  DTMGrafico.QryProdutos.Open;
  Series1.Marks.Style := smsValue;
  Series1.ValueFormat := 'R$ #,##0.00';
  Series2.Marks.Style := smsValue;
  Series2.ValueFormat := 'R$ #,##0.00';
  GraficoVendas.Series[0].Clear;

  while not DTMGrafico.QryGraficos.Eof do
  begin
    GraficoVendas.Series[0].Add(
    DTMGrafico.QryGraficos.FieldByName('totalVendas').AsFloat,
    DTMGrafico.QryGraficos.FieldByName('AnoMes').AsString);
    DTMGrafico.QryGraficos.Next;
  end;

  GraficoVendas.Series[1].Clear;

  while not DTMGrafico.QryProdutos.Eof do
  begin
    GraficoVendas.Series[1].Add(
    DTMGrafico.QryProdutos.FieldByName('TotalMes').AsFloat,
    DTMGrafico.QryProdutos.FieldByName('DataMes').AsString);
    DTMGrafico.QryProdutos.Next;
  end;
end;

procedure TfrmConFinanca.GraficoVendasClickLegend(Sender: TCustomChart; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
var
  Index: Integer;
  altura: Integer;
begin
  altura := Sender.Canvas.TextHeight('W') + 2;

  Index := (Y - Sender.Legend.Top) div altura;

  if (Index >= 0) and (Index < Sender.SeriesCount) then
    Sender.Series[Index].Marks.Visible :=
      not Sender.Series[Index].Marks.Visible;
end;

end.
