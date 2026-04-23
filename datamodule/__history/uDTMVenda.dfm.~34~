object dtmVendas: TdtmVendas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 343
  Width = 716
  object QryCliente: TFDQuery
    Connection = dtmConexao.dtmPrincipal
    SQL.Strings = (
      'SELECT nome, clienteId, IDSituacao, observacao'
      'FROM clientes')
    Left = 64
    Top = 40
    object QryClienteclienteId: TFDAutoIncField
      DisplayLabel = 'Codigo'
      FieldName = 'clienteId'
      Origin = 'clienteId'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QryClientenome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Origin = 'nome'
      Size = 60
    end
    object QryClienteIDSituacao: TIntegerField
      FieldName = 'IDSituacao'
      Origin = 'IDSituacao'
    end
    object QryClienteobservacao: TStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 500
    end
  end
  object QryProdutos: TFDQuery
    Connection = dtmConexao.dtmPrincipal
    SQL.Strings = (
      'SELECT produtoId,'
      '       nome,'
      '       valor,'
      '       quantidade,'
      '       qntmini'
      'FROM produtos')
    Left = 168
    Top = 40
    object QryProdutosprodutoId: TFDAutoIncField
      DisplayLabel = 'Codigo'
      FieldName = 'produtoId'
      Origin = 'produtoId'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QryProdutosnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Origin = 'nome'
      Size = 60
    end
    object QryProdutosvalor: TFMTBCDField
      DisplayLabel = 'Valor'
      FieldName = 'valor'
      Origin = 'valor'
      DisplayFormat = 'R$ #,##0.00'
      currency = True
      Precision = 18
      Size = 5
    end
    object QryProdutosquantidade: TFMTBCDField
      DisplayLabel = 'Quantidade'
      FieldName = 'quantidade'
      Origin = 'quantidade'
      Precision = 18
      Size = 5
    end
    object QryProdutosqntmini: TFMTBCDField
      FieldName = 'qntmini'
      Origin = 'qntmini'
      Precision = 18
      Size = 5
    end
  end
  object cdsItensVenda: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 280
    Top = 40
    object cdsItensVendaprodutoId: TIntegerField
      FieldName = 'produtoId'
    end
    object cdsItensVendaNomeProduto: TStringField
      FieldName = 'NomeProduto'
      Size = 60
    end
    object cdsItensVendaquantidade: TFloatField
      FieldName = 'quantidade'
    end
    object cdsItensVendavalorUnitario: TFloatField
      FieldName = 'valorUnitario'
      currency = True
    end
    object cdsItensVendavalorTotalProduto: TFloatField
      FieldName = 'valorTotalProduto'
      currency = True
    end
  end
  object dtsCliente: TDataSource
    DataSet = QryCliente
    Left = 56
    Top = 120
  end
  object dtsItensVenda: TDataSource
    DataSet = cdsItensVenda
    Left = 288
    Top = 120
  end
  object dtsProdutos: TDataSource
    DataSet = QryProdutos
    Left = 168
    Top = 120
  end
  object QryClienteUpdate: TFDQuery
    Connection = dtmConexao.dtmPrincipal
    SQL.Strings = (
      'UPDATE clientes'
      'SET IDSituacao = :IDSituacao'
      'WHERE clienteId = :id')
    Left = 496
    Top = 48
    ParamData = <
      item
        Name = 'IDSITUACAO'
        ParamType = ptInput
      end
      item
        Name = 'ID'
        ParamType = ptInput
      end>
    object FDAutoIncField1: TFDAutoIncField
      DisplayLabel = 'Codigo'
      FieldName = 'produtoId'
      Origin = 'produtoId'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object StringField1: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Origin = 'nome'
      Size = 60
    end
    object FMTBCDField1: TFMTBCDField
      DisplayLabel = 'Valor'
      FieldName = 'valor'
      Origin = 'valor'
      Precision = 18
      Size = 5
    end
    object FMTBCDField2: TFMTBCDField
      DisplayLabel = 'Quantidade'
      FieldName = 'quantidade'
      Origin = 'quantidade'
      Precision = 18
      Size = 5
    end
  end
end
