unit uTelaHerancaConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls,
  Vcl.Buttons, FireDAC.Comp.DataSet, System.IniFiles, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.ExtCtrls;

type
  TfrmTelaHerancaConsulta = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    mskPesquisa: TMaskEdit;
    lblIndice: TLabel;
    grdPesquisa: TDBGrid;
    QryListagem: TFDQuery;
    dtsListagem: TDataSource;
    btnFechar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure grdPesquisaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure grdPesquisaTitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure grdPesquisaDblClick(Sender: TObject);
    procedure mskPesquisaChange(Sender: TObject);
    procedure grdPesquisaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    procedure ExibirLabelIndice(Campo: string; aLabel: TLabel);
    function RetornarCampoTraduzido(Campo: string): string;
    { Private declarations }
  public
    { Public declarations }
    aRetornarIdSelecionado:Variant;
    aIniciarPesquisaId:Variant;
    aCampoId:string;
    IndiceAtual:string;
  end;

var
  frmTelaHerancaConsulta: TfrmTelaHerancaConsulta;

implementation

uses
  cUsuarioLogado, uPrincipal;

{$R *.dfm}

procedure TfrmTelaHerancaConsulta.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTelaHerancaConsulta.FormClose(Sender: TObject; var Action: TCloseAction);
var ArquivoINI:TIniFile; // Variável para criar o arquivo INI para salvar preferências de Grid por usuário.
    I: Integer; // Ponteiro para passar por todas as colunas (pastas)
begin
  inherited;
   if QryListagem.Active then
    QryListagem.Close;

  ExtractFilePath(Application.ExeName); // Garante que o INI fique na mesma pasta do .exe
  ArquivoINI := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'PreferenciasGridConsulta.ini'); //Criamos o INI File na pasta do .exe

  try
    for I := 0 to grdPesquisa.Columns.Count - 1 do  // O laço percorre do 0 à ultima coluna desenhada no Grid
    begin
      ArquivoINI.WriteInteger(
      oUsuarioLogado.nome, // Usamos o UsuarioLogado para separar de quem é a preferência.
      'Coluna_' + IntToStr(I), // Nomeamos a pasta com o Indice da coluna.
      grdPesquisa.Columns[I].Width); //A largura atual da coluna naquele exato segundo.
    end;
  finally
    ArquivoINI.Free;// Independentemente de dar erro ou não, sempre fechamos o caderninho para liberar a memória
  end;

  QryListagem.Close;

end;

procedure TfrmTelaHerancaConsulta.FormCreate(Sender: TObject);
var i :Integer;
begin

  grdPesquisa.TitleFont.Color:=clWhite;

  // Centraliza os titulos
    for i := 0 to grdPesquisa.Columns.Count - 1 do
    grdPesquisa.Columns[i].Title.Alignment := taCenter;


 if QryListagem.Active then
    QryListagem.Close;
    ExibirLabelIndice(IndiceAtual, lblIndice);

   QryListagem.Open;
end;

procedure TfrmTelaHerancaConsulta.FormShow(Sender: TObject);
var ArquivoINI: TIniFile ; //Referenciamos novamente nosso Arquivo
    I:Integer; //Passamos o ponteiro
begin
  inherited;

  if (aIniciarPesquisaId<>Unassigned) then
 begin
   QryListagem.Locate(aCampoId, aIniciarPesquisaId, [loPartialKey])
 end;
  ArquivoINI := TIniFile.Create(ExtractFilePath(Application.ExeName)+ 'PreferenciasGridConsulta.ini');// Apontamos para o mesmo endereço que salvamos no FormClose

  try
    for I := 0 to grdPesquisa.Columns.Count - 1 do //Percorremos o grid recem desenhado
    begin
      grdPesquisa.Columns[I].Width := ArquivoINI.ReadInteger //Redefinimos a largura do grid baseado no que está desenhado
      (oUsuarioLogado.nome, // Pegamos o UsuarioLogado
      'Coluna_' + IntToStr(I),//Procuramos a anotação correspondente à coluna atual.
      grdPesquisa.Columns[I].Width); //Se for primeiro acesso, mantém o Width padrão do Delphi.
    end;
  finally
    ArquivoINI.Free; //Liberamos o INI da memória.
  end;

end;

procedure TfrmTelaHerancaConsulta.grdPesquisaDblClick(Sender: TObject);
begin
  aRetornarIdSelecionado:=QryListagem.FieldByName(aCampoId).AsVariant;
  Close;
end;

procedure TfrmTelaHerancaConsulta.grdPesquisaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
var Linha: Integer;
begin

  if (gdFixed in State) then
  begin
    grdPesquisa.Canvas.Brush.Color := clGray;
    grdPesquisa.Canvas.FillRect(Rect);

    Exit;
  end;


  Linha := grdPesquisa.DataSource.DataSet.RecNo;

  if not (gdSelected in State) then
  begin
    if (Linha mod 2) = 0 then
      grdPesquisa.Canvas.Brush.Color := clWebLightgrey
    else
      grdPesquisa.Canvas.Brush.Color := clWhite;
  end
  else
  begin
    grdPesquisa.Canvas.Brush.Color := $00D8A76F;
    grdPesquisa.Canvas.Font.Color := clWhite;
  end;

  grdPesquisa.Canvas.FillRect(Rect);
  grdPesquisa.Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, Column.Field.AsString);
end;

procedure TfrmTelaHerancaConsulta.grdPesquisaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if(Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;
end;

procedure TfrmTelaHerancaConsulta.grdPesquisaTitleClick(Column: TColumn);
begin
 IndiceAtual         := Column.FieldName;
 QryListagem.IndexFieldNames:=IndiceAtual;
 ExibirLabelIndice(IndiceAtual, lblIndice);
end;

procedure TfrmTelaHerancaConsulta.mskPesquisaChange(Sender: TObject);
begin
 QryListagem.Locate(IndiceAtual, TMaskEdit(Sender).Text,[loPartialKey])
end;

procedure TfrmTelaHerancaConsulta.ExibirLabelIndice(Campo: string; aLabel:TLabel);
begin
  aLabel.Caption:=RetornarCampoTraduzido(Campo);
end;

function TfrmTelaHerancaConsulta.RetornarCampoTraduzido(Campo: string):string;
var i:Integer;
begin
  for I := 0 to QryListagem.FieldCount-1 do begin
    if LowerCase(QryListagem.Fields[i].FieldName) = LowerCase(Campo) then begin
       Result:=QryListagem.Fields[i].DisplayLabel;
       Break;
    end;
  end;
end;

end.
