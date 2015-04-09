unit nguVersaoBanco;

interface

uses
  acuframework;

type
  ngVersaoBanco = class(acPersistentObject)
  private
    FVersao: acInt;
    FBranch: acString;
    FNomeArquivo: acString;
    FDataAtualizacao: acDateTime;
  published
    property Versao: acInt read FVersao write FVersao;
    property Branch: acString read FBranch write FBranch;
    property NomeArquivo: acString read FNomeArquivo write FNomeArquivo;
    property DataAtualizacao: acDateTime read FDataAtualizacao write FDataAtualizacao;
  end;

implementation

initialization
  PersistenceManager.RegisterClass(ngVersaoBanco);

end.
