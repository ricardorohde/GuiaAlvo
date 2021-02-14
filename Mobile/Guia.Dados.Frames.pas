unit Guia.Dados.Frames;

interface

uses FMX.Graphics;

type

    TAvaliacoes   = record
                    IDAvaliacao          : Integer;
                    NomeUsuario          : String;
                    DataAvaliacao        : String;
                    Comentario           : String;
                    AvaliacaoMedia       : Single;
    end;
    TNotificacoes = record
                    IDPush         : Integer;
                    TituloPush     : String;
                    MSGPush        : String;
                    DataPush       : String;
                    ImagemPush     : String;
                    Indice         : Integer;
                    ListaDownload  : String;

    end;

implementation

end.
