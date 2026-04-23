inherited frmLog: TfrmLog
  Align = alClient
  Caption = 'Log do Sistema'
  ClientWidth = 932
  ExplicitWidth = 938
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 932
    inherited mskPesquisa: TMaskEdit
      Width = 592
      Align = alNone
      ExplicitWidth = 592
    end
    object btnPesquisar: TButton
      Left = 599
      Top = 17
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 1
      OnClick = btnPesquisarClick
    end
  end
  inherited Panel2: TPanel
    Width = 932
    inherited btnFechar: TBitBtn
      Left = 856
    end
  end
  inherited Panel3: TPanel
    Width = 932
    inherited grdPesquisa: TDBGrid
      Width = 930
      OnDblClick = nil
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'USUARIO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACAO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TELA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_HORA'
          Visible = True
        end>
    end
  end
  inherited QryListagem: TFDQuery
    Active = True
    SQL.Strings = (
      
        'select ID, DATA_HORA, USUARIO, ACAO, TELA, DESCRICAO from AUDITO' +
        'RIA')
    object QryListagemID: TFDAutoIncField
      FieldName = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QryListagemDATA_HORA: TSQLTimeStampField
      FieldName = 'DATA_HORA'
    end
    object QryListagemUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 50
    end
    object QryListagemACAO: TStringField
      FieldName = 'ACAO'
      Size = 50
    end
    object QryListagemTELA: TStringField
      FieldName = 'TELA'
      Size = 50
    end
    object QryListagemDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 255
    end
  end
end
