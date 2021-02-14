object dmGeral: TdmGeral
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 531
  Width = 791
  object qryGeral: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM ALCOMERCIO')
    Left = 700
    Top = 203
  end
  object qryFiles: TFDQuery
    Connection = Conexao
    Left = 700
    Top = 272
  end
  object qryCheckList: TFDQuery
    Connection = Conexao
    Left = 700
    Top = 64
  end
  object qryCategoria: TFDQuery
    Connection = Conexao
    Left = 700
    Top = 133
  end
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=C:\EraSoft\GuiaAlvo\Dados\bdAlvo.fdb'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=191.252.153.142'
      'Port=3050'
      'DriverID=FB')
    LoginPrompt = False
    Left = 620
    Top = 64
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Dataset = fdmemCep
    FieldDefs = <>
    Response = RESTResponse1
    Left = 136
    Top = 370
  end
  object RESTResponse1: TRESTResponse
    Left = 136
    Top = 228
  end
  object restCEP: TRESTRequest
    Accept = #144
    Client = RESTClient1
    Params = <
      item
        Kind = pkURLSEGMENT
        Name = 'pCEP'
        Options = [poAutoCreated]
      end>
    Resource = 'ws/{pCEP}/json'
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 56
    Top = 299
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://viacep.com.br'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 136
    Top = 299
  end
  object fdmemCep: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 316
    Top = 454
    object fdmemCepcep: TWideStringField
      FieldName = 'cep'
      Size = 255
    end
    object fdmemCeplogradouro: TWideStringField
      FieldName = 'logradouro'
      Size = 255
    end
    object fdmemCepbairro: TWideStringField
      FieldName = 'bairro'
      Size = 255
    end
    object fdmemCeplocalidade: TWideStringField
      FieldName = 'localidade'
      Size = 255
    end
    object fdmemCepuf: TWideStringField
      FieldName = 'uf'
      Size = 255
    end
  end
  object restLogradouro: TRESTRequest
    Accept = #144
    Client = RESTClient1
    Params = <
      item
        Kind = pkURLSEGMENT
        Name = 'rEstado'
        Options = [poAutoCreated]
      end
      item
        Kind = pkURLSEGMENT
        Name = 'rCidade'
        Options = [poAutoCreated]
      end
      item
        Kind = pkURLSEGMENT
        Name = 'rLogradouro'
        Options = [poAutoCreated]
      end>
    Resource = 'ws/{rEstado}/{rCidade}/{rLogradouro}/json'
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 56
    Top = 228
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 700
    Top = 412
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorHome = 'C:\Program Files (x86)\Firebird\Firebird_2_5\'
    VendorLib = 'fbclient.dll'
    Left = 700
    Top = 340
  end
end
