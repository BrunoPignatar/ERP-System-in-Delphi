object dtmConexao: TdtmConexao
  OldCreateOrder = False
  Height = 307
  Width = 533
  object dtmPrincipal: TFDConnection
    Params.Strings = (
      'Server=DC-TR-04-VM\SERVERCURSO'
      'Database=Vendas'
      'User_Name=sa   '
      'Password=domtec@10'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 32
    Top = 16
  end
end
