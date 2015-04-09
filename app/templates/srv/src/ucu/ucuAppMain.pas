unit ucu<%= appname %>Main;

interface

uses
  ucuMain;

type
  uc<%= appname %>Main = class(ucMain)
  protected
   function GetGUIXML(piLevel: Integer): string; override;
  private
end;

implementation

uses
  acuSystem, SysUtils, SvcMgr, ucuManager, Classes, Windows;

function uc<%= appname %>Main.GetGUIXML(piLevel: Integer): string;
var
  lStream: TResourceStream;
  lResult: TStringStream;
begin
  lStream := TResourceStream.Create(HInstance, 'mmenu', RT_RCDATA);
  try
    lResult := TStringStream.Create('');
    try
      lResult.CopyFrom(lStream, lStream.Size);
      Result := lResult.DataString;
    finally
      lResult.Free;
    end;
  finally
    lStream.Free;
  end;
end;
        
initialization
  gucManager.RegisterClass(UCAPLMAIN, uc<%= appname %>Main);

end.

