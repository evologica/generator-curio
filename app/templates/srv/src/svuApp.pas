unit svu<%= appname %>;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr,
  mxuConnectionServer;

type
  Tsv<%= appname %> = class(TService)
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceBeforeInstall(Sender: TService);
    procedure ServiceCreate(Sender: TObject);
    procedure ServiceAfterInstall(Sender: TService);
    procedure ServiceAfterUninstall(Sender: TService);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
  private
    fConnectionServer: mxConnectionServer;
    fDescription: string;
    fPortNumber : Word;
    procedure LerConfiguracao;
  public
    function GetServiceController: TServiceController; override;
  end;

var
  sv<%= appname %>: Tsv<%= appname %>;

implementation

{$R *.DFM}

uses
  Registry,
  acuSystem;


procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  sv<%= appname %>.Controller(CtrlCode);
end;

function Tsv<%= appname %>.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TsvApp.LerConfiguracao;
begin
  if gSystem.HasParam('Application.Service') then
  begin
    Self.Name:=gSystem.ParamByName['Application.Service.@Name'];
    Self.DisplayName:=gSystem.ParamByName['Application.Service.@DisplayName'];
    Self.fPortNumber:=StrToInt(gSystem.ParamByName['Application.Service.@Port']);
    Self.fDescription:=gSystem.ParamByName['Application.Service.@Description']
  end;
end;

procedure Tsv<%= appname %>.ServiceAfterInstall(Sender: TService);
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create(KEY_READ or KEY_WRITE);
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    //entrada do registro com a descrição do serviço
    if Reg.OpenKey('\SYSTEM\CurrentControlSet\Services\' + Self.Name, false) then
    begin
      Reg.WriteString('Description', fDescription);
      Reg.CloseKey;
    end;
    //Entrada do registro com a vinculação dos eventos do event viewer
  {  if Reg.OpenKey('\SYSTEM\CurrentControlSet\Services\Eventlog\Application\' + Self.Name, True) then
    begin
      Reg.WriteString('EventMessageFile', ParamStr(0));
      Reg.WriteInteger('TypesSupported', 7);
      Reg.CloseKey;
    end; }
  finally
    Reg.Free;
  end;
end;

procedure Tsv<%= appname %>.ServiceAfterUninstall(Sender: TService);
{var
  Reg : TRegistry;
  Chave : string;}
begin
  //Remover entrada no registro da vinculação com o event viewer
{  Chave := '\SYSTEM\CurrentControlSet\Services\Eventlog\Application\' + Self.Name;
  Reg := TRegistry.Create(KEY_READ or KEY_WRITE);
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.KeyExists(Chave) then
      Reg.DeleteKey(Chave);
  finally
    Reg.Free;
  end;}
end;

procedure Tsv<%= appname %>.ServiceBeforeInstall(Sender: TService);
begin
  LerConfiguracao;
end;

procedure Tsv<%= appname %>.ServiceCreate(Sender: TObject);
begin
  LerConfiguracao;
end;

procedure Tsv<%= appname %>.ServiceStart(Sender: TService; var Started: Boolean);
begin
  fConnectionServer := mxConnectionServer.Create;
  if fPortNumber > 0 then fConnectionServer.Start(fPortNumber) else fConnectionServer.Start;
end;

procedure Tsv<%= appname %>.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
  fConnectionServer.Free;
end;

initialization

finalization


end.
