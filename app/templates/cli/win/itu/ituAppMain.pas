unit itu<%= appname %>Main;

interface

uses
  ituInterfaceFactory, ituMain, ituMainPortal;

type
  it<%= appname %>Main = class(itMainPortal)
  protected
    function InitialLevel: integer; override;
  public
    procedure Initialize; override;
  end;

var
  fUsuario, fSenha, fCodigoSusep : string;

implementation

procedure it<%= appname %>Main.Initialize;
begin
  MainPortal := TMainPortal.Create(nil);
  inherited;
end;

function it<%= appname %>Main.InitialLevel: integer;
begin
  result := 0;
end;

initialization
  gInterfaceFactory.RegisterClass(ITCTLMAIN, it<%= appname %>Main);

finalization
  gInterfaceFactory.UnregisterClass(ITCTLMAIN);

end.
