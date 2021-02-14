unit Guia.OpenViewUrl;

interface

function OpenURL(const URL: string; const DisplayError: Boolean = False): Boolean;

implementation

uses
  IdURI,
  SysUtils,
  Classes,
  FMX.Dialogs,
{$IFDEF ANDROID}
  FMX.Helpers.Android,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Net,
  Androidapi.JNI.JavaTypes,
  Androidapi.Helpers;
{$ENDIF ANDROID}

{$IFDEF IOS}
  Macapi.Helpers,
  iOSapi.Foundation,
  FMX.Helpers.iOS;
{$ENDIF IOS}

function OpenURL(const URL: string; const DisplayError: Boolean = False): Boolean;
{$IFDEF ANDROID}
var
  Intent: JIntent;
begin

  Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_VIEW,
    TJnet_Uri.JavaClass.parse(StringToJString(TIdURI.URLEncode(URL))));
  try
    SharedActivity.startActivity(Intent);
    exit(true);
  except
    on e: Exception do
    begin
      if DisplayError then
        ShowMessage('Erro ao tentar abrir a url "' + URL + '"');
      exit(False);
    end;
  end;
end;
{$ENDIF ANDROID}

{$IFDEF IOS}
var
  NSU: NSUrl;
begin

  NSU := StrToNSUrl(TIdURI.URLEncode(URL));
  if SharedApplication.canOpenURL(NSU) then
    exit(SharedApplication.OpenURL(NSU))
  else
  begin
    if DisplayError then
      ShowMessage('Erro ao tentar abrir a url "' + URL + '"');
    exit(False);
  end;
end;
{$ENDIF IOS}

{$IFDEF MSWINDOWS}
begin
   Try
      ShellExecute(Handle, 'open',  URL, nil, nil, SW_SHOWMAXIMIZED);
   except
       if DisplayError then
         ShowMessage('Erro ao tentar abrir a url "' + URL + '"');
       exit(False);
   end;

end;
{$ENDIF MSWINDOWS}

end.
