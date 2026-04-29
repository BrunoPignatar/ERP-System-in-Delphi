unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Imaging.jpeg, Vcl.GraphUtil,
  Vcl.Imaging.pngimage, System.IOUtils,Winapi.ShellAPI;

type
  TfrmLogin = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    edtUsuario: TEdit;
    Panel4: TPanel;
    Panel7: TPanel;
    Label3: TLabel;
    Panel8: TPanel;
    edtSenha: TEdit;
    Label2: TLabel;
    Panel5: TPanel;
    btnEntrar: TSpeedButton;
    Panel6: TPanel;
    btnSair: TSpeedButton;
    Image1: TImage;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    bFechar:Boolean;
    FTrocaUsuario: Boolean;
  public
    { Public declarations }
    property TrocaUsuario: Boolean read FTrocaUsuario write FTrocaUsuario;
  end;

var
  frmLogin: TfrmLogin;

implementation

uses
  cCadUsuario, uDTMConexao, uPrincipal;

{$R *.dfm}



procedure TfrmLogin.btnEntrarClick(Sender: TObject);
var oUsuario:TUsuario;
begin
  try
    oUsuario:=TUsuario.Create(dtmConexao.dtmPrincipal);
    if oUsuario.Logar(edtUsuario.Text,edtSenha.Text) then begin
      oUsuarioLogado.codigo:=oUsuario.codigo;
      oUsuarioLogado.nome:=oUsuario.nome;
      oUsuarioLogado.senha:=oUsuario.senha;
      oUsuarioLogado.perfilId := oUsuario.perfilId;
      bFechar:=True;
      ModalResult:=mrOk;
    end
    else begin
      MessageDlg('Usuário Inválido', mtInformation,[mbOK],0);

    end;
  finally
    if Assigned(oUsuario) then
      FreeAndNil(oUsuario);
  end;
end;



procedure TfrmLogin.btnSairClick(Sender: TObject);
begin
   if TrocaUsuario then
   begin
   bFechar:=True;
   ModalResult:=mrCancel;
   end
  else
    Application.Terminate;
end;

procedure TfrmLogin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 CanClose:=bFechar;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  ShellExecute(0, 'open', 'C:\Users\devmv\Desktop\ERP-System-in-Delphi\ContagemGit.bat', nil, nil, SW_HIDE);
   Sleep(500);
end;

procedure TfrmLogin.FormShow(Sender: TObject);
var versao: string;
begin
  bFechar:=False;
  if FileExists('C:\Users\devmv\Desktop\ERP-System-in-Delphi\versao.txt') then
  begin
    Versao := Trim(TFile.ReadAllText('C:\Users\devmv\Desktop\ERP-System-in-Delphi\versao.txt'));
    Label6.Caption := 'Versão 1.0.' + Versao;
  end
  else
    Label6.Caption := '1.0.0';
end;


end.
