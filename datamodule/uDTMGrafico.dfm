object DTMGrafico: TDTMGrafico
  OldCreateOrder = False
  Height = 377
  Width = 583
  object dtsProdutoEstoque: TDataSource
    Left = 135
    Top = 38
  end
  object QryProdutoEstoque: TFDQuery
    Active = True
    Connection = dtmConexao.dtmPrincipal
    SQL.Strings = (
      
        'select CONVERT(varchar,produtoId) +'#39' - '#39'+nome as label, Quantida' +
        'de as value from produtos')
    Left = 47
    Top = 38
    object QryProdutoEstoquelabel: TStringField
      FieldName = 'label'
      Origin = 'label'
      ReadOnly = True
      Size = 93
    end
    object QryProdutoEstoquevalue: TFMTBCDField
      FieldName = 'value'
      Origin = 'value'
      Precision = 18
      Size = 5
    end
  end
  object QryValorVendaPorCliente: TFDQuery
    Active = True
    Connection = dtmConexao.dtmPrincipal
    SQL.Strings = (
      
        'select convert(varchar, vendas.clienteID) +'#39'-'#39'+clientes.nome as ' +
        'Label, sum(vendas.totalVenda) as Value from Vendas'
      
        #9'inner join clientes on clientes.clienteId = vendas.clienteId wh' +
        'ere vendas.dataVenda between CONVERT(date, getdate()-7) and conv' +
        'ert(date, getdate())'
      #9'group by Vendas.clienteId, clientes.Nome')
    Left = 247
    Top = 38
    object QryValorVendaPorClienteLabel: TStringField
      FieldName = 'Label'
      Origin = 'Label'
      ReadOnly = True
      Size = 91
    end
    object QryValorVendaPorClienteValue: TFMTBCDField
      FieldName = 'Value'
      Origin = 'Value'
      ReadOnly = True
      Precision = 38
      Size = 5
    end
  end
  object Qry10ProdutosMaisVendidos: TFDQuery
    Active = True
    Connection = dtmConexao.dtmPrincipal
    SQL.Strings = (
      ''
      
        'select top 10 convert(varchar, vi.produtoId) +'#39'-'#39'+p.nome as Labe' +
        'l, sum(vi.totalProduto) as Value from vendasItens as vi'
      'inner join produtos as P on p.produtoId = vi.produtoId'
      'group by vi.produtoId, p.nome'
      'order by label desc')
    Left = 55
    Top = 142
    object Qry10ProdutosMaisVendidosLabel: TStringField
      FieldName = 'Label'
      Origin = 'Label'
      ReadOnly = True
      Size = 91
    end
    object Qry10ProdutosMaisVendidosValue: TFMTBCDField
      FieldName = 'Value'
      Origin = 'Value'
      ReadOnly = True
      Precision = 38
      Size = 5
    end
  end
  object QryVendasUltimaSemana: TFDQuery
    Connection = dtmConexao.dtmPrincipal
    SQL.Strings = (
      
        'select vendas.dataVenda as Label, sum(vendas.totalVenda) AS Valu' +
        'e'
      ' FROM Vendas'
      
        ' where vendas.dataVenda between CONVERT(date, getdate()-7) and C' +
        'ONVERT(date, getdate())'
      ' group by vendas.dataVenda')
    Left = 176
    Top = 136
    object QryVendasUltimaSemanaLabel: TSQLTimeStampField
      FieldName = 'Label'
      Origin = 'Label'
    end
    object QryVendasUltimaSemanaValue: TFMTBCDField
      FieldName = 'Value'
      Origin = 'Value'
      ReadOnly = True
      Precision = 38
      Size = 5
    end
  end
  object dsGraficos: TDataSource
    Left = 488
    Top = 201
  end
  object QryGraficos: TFDQuery
    Active = True
    Connection = dtmConexao.dtmPrincipal
    SQL.Strings = (
      'SELECT '
      '    FORMAT(dataVenda, '#39'MM-yyyy'#39') AS AnoMes,'
      '    SUM(totalVenda) AS TotalVendas'
      'FROM vendas'
      'GROUP BY FORMAT(dataVenda, '#39'MM-yyyy'#39')'
      'ORDER BY MIN(dataVenda)')
    Left = 424
    Top = 193
    object QryGraficosAnoMes: TWideStringField
      FieldName = 'AnoMes'
      Origin = 'AnoMes'
      ReadOnly = True
      Size = 4000
    end
    object QryGraficosTotalVendas: TFMTBCDField
      FieldName = 'TotalVendas'
      Origin = 'TotalVendas'
      ReadOnly = True
      Precision = 38
      Size = 5
    end
  end
  object dsProdutos: TDataSource
    Left = 488
    Top = 121
  end
  object QryProdutos: TFDQuery
    Connection = dtmConexao.dtmPrincipal
    SQL.Strings = (
      'SELECT '
      
        '  DATEFROMPARTS(YEAR(DataProduto), MONTH(DataProduto), DAY(DataP' +
        'roduto)) AS DataMes,'
      '  SUM(valor * quantidade) AS TotalMes'
      'FROM produtos'
      
        'GROUP BY DATEFROMPARTS(YEAR(DataProduto), MONTH(DataProduto), DA' +
        'Y(DataProduto))'
      'ORDER BY DataMes;')
    Left = 424
    Top = 113
    object QryProdutosDataMes: TDateField
      FieldName = 'DataMes'
      Origin = 'DataMes'
      ReadOnly = True
    end
    object QryProdutosTotalMes: TFMTBCDField
      FieldName = 'TotalMes'
      Origin = 'TotalMes'
      ReadOnly = True
      Precision = 38
      Size = 10
    end
  end
end
