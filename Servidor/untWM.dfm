object WM: TWM
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/'
      OnAction = WebModule1DefaultHandlerAction
    end>
  Height = 339
  Width = 614
  object DSServer1: TDSServer
    Left = 96
    Top = 11
  end
  object DSHTTPWebDispatcher1: TDSHTTPWebDispatcher
    Server = DSServer1
    Filters = <>
    SessionTimeout = 0
    WebDispatch.PathInfo = 'datasnap*'
    Left = 96
    Top = 75
  end
  object ServerUtils: TDSServerClass
    OnGetClass = ServerUtilsGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 232
    Top = 31
  end
end
