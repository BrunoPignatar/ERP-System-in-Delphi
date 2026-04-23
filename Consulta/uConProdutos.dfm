inherited frmConProduto: TfrmConProduto
  Caption = 'Pesquisa de Produtos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    inherited grdPesquisa: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'produtoId'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor_final'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantidade'
          Title.Caption = 'Quantidade'
          Visible = True
        end>
    end
  end
  inherited QryListagem: TFDQuery
    SQL.Strings = (
      
        ' select produtoId, nome,quantidade,  ceiling (valor / 0.45) as v' +
        'alor_final  from produtos;')
    object QryListagemprodutoId: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'produtoId'
      Origin = 'produtoId'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QryListagemnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Origin = 'nome'
      Size = 60
    end
    object QryListagemvalor_final: TFMTBCDField
      FieldName = 'valor_final'
      Origin = 'valor_final'
      ReadOnly = True
      Precision = 23
      Size = 0
    end
    object QryListagemquantidade: TFMTBCDField
      FieldName = 'quantidade'
      Origin = 'quantidade'
      Precision = 18
      Size = 5
    end
  end
end
