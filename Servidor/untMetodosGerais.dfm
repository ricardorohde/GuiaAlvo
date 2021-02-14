object ServerMethods: TServerMethods
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 522
  Width = 700
  object fdqryCategorias: TFDQuery
    Connection = fdConexao
    Left = 132
    Top = 32
  end
  object fdqryContrato: TFDQuery
    Connection = fdConexao
    Left = 132
    Top = 104
  end
  object fdqryComercioSecoes: TFDQuery
    Connection = fdConexao
    Left = 132
    Top = 177
  end
  object fdqrySubCategoria: TFDQuery
    Connection = fdConexao
    Left = 132
    Top = 250
  end
  object fdqryComercio: TFDQuery
    Connection = fdConexao
    SQL.Strings = (
      'SELECT * FROM ALCOMERCIO c'
      'WHERE (IDCOM = :IDCOM)')
    Left = 268
    Top = 136
    ParamData = <
      item
        Name = 'IDCOM'
        ParamType = ptInput
      end>
  end
  object fdqryFotosComercio: TFDQuery
    Connection = fdConexao
    SQL.Strings = (
      'SELECT * FROM ALFILES')
    Left = 268
    Top = 192
  end
  object fdqryCheckList: TFDQuery
    Connection = fdConexao
    SQL.Strings = (
      'SELECT * FROM ALCHECKLIST c'
      'INNER JOIN ALCHECKCOM d'
      'ON (d.IDCHECK_CHEKCOM = c.IDCHECK)'
      'WHERE d.IDCOM_CHECKCOM = :IDCHECKCOM')
    Left = 268
    Top = 248
    ParamData = <
      item
        Name = 'IDCHECKCOM'
        ParamType = ptInput
      end>
  end
  object fdqryFone: TFDQuery
    Connection = fdConexao
    SQL.Strings = (
      'SELECT * FROM ALFONE f'
      'INNER JOIN ALCOMERCIO c'
      'ON (f.IDCOM_FONE = c.IDCOM)'
      'WHERE (c.IDCOM = :IDCOM) AND (f.INTFONE = 0)')
    Left = 268
    Top = 304
    ParamData = <
      item
        Name = 'IDCOM'
        ParamType = ptInput
      end>
  end
  object fdqryAvaliacao: TFDQuery
    Connection = fdConexao
    SQL.Strings = (
      
        'SELECT FIRST 50 SKIP :START a.IDAVALIA, a.DATAAVALIA, a.MEDIAAVA' +
        'LIA, a.COMENTARIOAVALIA, u.NOMEUSU FROM ALAVALIA a'
      'INNER JOIN ALUSUARIOSAPP u'
      'ON (u.IDUSU =a.IDUSU_AVALIA)'
      'INNER JOIN ALCOMERCIO c'
      'ON (a.IDCOM_AVALIA = c.IDCOM)'
      'WHERE a.IDCOM_AVALIA = :IDCOMAVALIA'
      'ORDER BY IDAVALIA DESC')
    Left = 408
    Top = 305
    ParamData = <
      item
        Name = 'START'
        DataType = ftLargeint
        ParamType = ptInput
        Value = 0
      end
      item
        Name = 'IDCOMAVALIA'
        DataType = ftInteger
        ParamType = ptInput
        Value = 19
      end>
  end
  object fdqryUsuarios: TFDQuery
    Connection = fdConexao
    Left = 132
    Top = 323
  end
  object fdqryDispositivos: TFDQuery
    Connection = fdConexao
    SQL.Strings = (
      
        'select s.id_com, s.id_cat, c.imgdestaquesessaocontrato from alsu' +
        'bcatcom s'
      'inner join alcontrato c'
      'on (c.idcom_contrato = s.id_com)'
      
        'where (c.imgdestaquesessaocontrato <> '#39#39') and (s.id_cat = :idcat' +
        ')'
      'group by s.id_com, s.id_cat, c.imgdestaquesessaocontrato')
    Left = 408
    Top = 214
    ParamData = <
      item
        Name = 'IDCAT'
        ParamType = ptInput
      end>
  end
  object fdqryFavoritos: TFDQuery
    Connection = fdConexao
    SQL.Strings = (
      
        'select s.id_com, s.id_cat, c.imgdestaquesessaocontrato from alsu' +
        'bcatcom s'
      'inner join alcontrato c'
      'on (c.idcom_contrato = s.id_com)'
      
        'where (c.imgdestaquesessaocontrato <> '#39#39') and (s.id_cat = :idcat' +
        ')'
      'group by s.id_com, s.id_cat, c.imgdestaquesessaocontrato')
    Left = 408
    Top = 123
    ParamData = <
      item
        Name = 'IDCAT'
        ParamType = ptInput
      end>
  end
  object fdqryFotosSecao: TFDQuery
    Connection = fdConexao
    Left = 408
    Top = 396
  end
  object qryNotificacoes: TFDQuery
    Connection = fdConexao
    Left = 132
    Top = 396
  end
  object fdqryGeral: TFDQuery
    Connection = fdConexao
    Left = 268
    Top = 372
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 548
    Top = 140
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 548
    Top = 64
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 548
    Top = 293
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorHome = 'C:\Program Files (x86)\Firebird\Firebird_2_5\'
    VendorLib = 'fbclient.dll'
    Left = 556
    Top = 212
  end
  object fdConexao: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 548
    Top = 368
  end
  object ACBrMail: TACBrMail
    Host = '127.0.0.1'
    Port = '25'
    SetSSL = False
    SetTLS = False
    Attempts = 3
    DefaultCharset = UTF_8
    IDECharset = CP1252
    Left = 272
    Top = 72
  end
  object ACBrValidador: TACBrValidador
    IgnorarChar = './-'
    Left = 328
    Top = 48
  end
end
