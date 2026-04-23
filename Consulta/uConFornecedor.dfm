inherited frmConFornecedor: TfrmConFornecedor
  Caption = 'Pesquisa de Fornecedor'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    inherited grdPesquisa: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'fornId'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Visible = True
        end>
    end
  end
  inherited QryListagem: TFDQuery
    SQL.Strings = (
      'select fornId, nome from fornecedor')
    object QryListagemfornId: TFDAutoIncField
      DisplayLabel = 'C'#243'digo Fornecedor'
      FieldName = 'fornId'
      Origin = 'fornId'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QryListagemnome: TStringField
      DisplayLabel = 'Nome Fornecedor'
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
  end
end
