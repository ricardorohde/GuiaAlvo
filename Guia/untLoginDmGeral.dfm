object dmLoginGeral: TdmLoginGeral
  OldCreateOrder = False
  Height = 418
  Width = 483
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 316
    Top = 88
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 316
    Top = 184
  end
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=C:\MegaDestake\AlvoLeste\Dados\bdalvoleste.fdb'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 152
    Top = 136
  end
  object fdqryUsuarios: TFDQuery
    Connection = Conexao
    Left = 156
    Top = 240
  end
end
