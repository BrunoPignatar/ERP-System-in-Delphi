unit uConCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHerancaConsulta, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList;

type
  TfrmConCliente = class(TfrmTelaHerancaConsulta)
    QryListagemclienteId: TFDAutoIncField;
    QryListagemnome: TStringField;
    QryListagemIDSituacao: TIntegerField;
    QryListagemobservacao: TStringField;
    ImageList1: TImageList;
    QryListagemdoc: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure grdPesquisaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConCliente: TfrmConCliente;

implementation

{$R *.dfm}

procedure TfrmConCliente.FormCreate(Sender: TObject);
begin
  aCampoId :='clienteId';
  IndiceAtual:='nome';

  inherited;

end;

procedure TfrmConCliente.grdPesquisaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var id: Integer;
  imgIndex: Integer;
begin
  inherited;
  if Column.FieldName = 'IDSituacao'    then
  begin
  grdPesquisa.Canvas.FillRect(Rect);
  id:=  QryListagem.FieldByName('idSituacao').AsInteger;

  if id = 1 then
    imgIndex := 3
  else if id = 2 then
    imgIndex := 4
  else if id = 3 then
    imgIndex := 0
  else if id = 4 then
    imgIndex := 1
  else if id = 5 then
    imgIndex := 2
  else
    Exit;

    ImageList1.Draw(grdPesquisa.Canvas, Rect.Left + (Rect.Width div 2) - 8, Rect.Top + (Rect.Height div 2) - 8, imgIndex);
  end
  else
  begin
    grdPesquisa.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;
end.
