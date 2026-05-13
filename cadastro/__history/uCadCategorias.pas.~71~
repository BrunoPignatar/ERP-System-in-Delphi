unit uCadCategorias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.ComCtrls, cCadCategoria, uDTMConexao, uEnum;

type
  TfrmCadCategorias = class(TfrmTelaHeranca)
    edtCategoriaId: TLabeledEdit;
    edtDescricao: TLabeledEdit;
    QryListagemcategoriaId: TFDAutoIncField;
    QryListagemdescricao: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    oCategoria:TCategoria;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function GetDesc:string; override;
    { Private declarations }
  public
    function Excluir:Boolean; override;
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro): Boolean; override;
    { Public declarations }
  end;

var
  frmCadCategorias: TfrmCadCategorias;

implementation

{$R *.dfm}

{$REGION 'BOTÕES'}
procedure TfrmCadCategorias.btnAlterarClick(Sender: TObject);
begin
  if oCategoria.Seleciona(QryListagem.FieldByName('categoriaId').AsInteger) then begin
    edtCategoriaId.Text:=IntToStr(oCategoria.categoriaId);
    edtDescricao.Text:=oCategoria.Descricao;
  end
   else begin
     btnCancelar.Click;
     Abort;
   end;
  inherited;

end;

procedure TfrmCadCategorias.btnGravarClick(Sender: TObject);
begin
  inherited;
end;

{$ENDREGION}


{$REGION 'Override'}
function TfrmCadCategorias.Excluir: Boolean;
begin
  if oCategoria.Seleciona(QryListagem.FieldByName('categoriaId').AsInteger) then
    Result:=oCategoria.Apagar
  else
  Result:=false;
end;

function TfrmCadCategorias.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  if edtCategoriaId.Text<>EmptyStr then
     oCategoria.CategoriaId:=StrToInt(edtCategoriaId.Text)
  else
      oCategoria.CategoriaId:=0;
      oCategoria.Descricao := edtDescricao.Text;
  if (EstadoDoCadastro=ecInserir) then
    Result:=oCategoria.Gravar
   else if (EstadoDoCadastro=ecAlterar) then
    Result:=oCategoria.Atualizar
   else
    Result:=false;
end;
{$ENDREGION}

procedure TfrmCadCategorias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 inherited;
  Action := caFree;
  if Assigned(oCategoria) then
    FreeAndNil(oCategoria);
end;

procedure TfrmCadCategorias.FormCreate(Sender: TObject);
begin
    inherited;
    oCategoria:=TCategoria.create(dtmConexao.dtmPrincipal);
    IndiceAtual:='descricao';
end;

function TfrmCadCategorias.GetDesc:string;
begin
  Result := oCategoria.Descricao;
end;

end.
