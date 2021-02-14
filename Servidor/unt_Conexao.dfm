object dmConexao: TdmConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 457
  Width = 530
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 76
    Top = 104
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 76
    Top = 28
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 76
    Top = 257
  end
  object fdqryAuxiliar: TFDQuery
    Connection = fdConexao
    Left = 212
    Top = 28
  end
  object fdqryStatus: TFDQuery
    Connection = fdConexao
    Left = 212
    Top = 104
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorHome = 'C:\Program Files (x86)\Firebird\Firebird_2_5\'
    VendorLib = 'fbclient.dll'
    Left = 84
    Top = 176
  end
  object fdConexao: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 76
    Top = 332
  end
end
