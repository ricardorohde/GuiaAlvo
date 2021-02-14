unit Server.Funcoes;

interface

function MD5(const ASenha : String) : String;

implementation

uses
  IdHashMessageDigest;

function MD5(const ASenha : String) : String;
var
   idmd5 : TIdHashMessageDigest5;
begin

  idmd5 := TIdHashMessageDigest5.Create;
  try

     Result := idmd5.HashStringAsHex(ASenha);

  finally

     idmd5.Free;

  end;

end;

end.
