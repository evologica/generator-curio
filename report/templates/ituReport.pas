unit itu<%= ituname %>;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, 
  ituReport, AppEvnts, StdCtrls, Buttons, ExtCtrls, OleCtrls, SHDocVw, 
  ituVCLUIController, ituUIController, utuMessage, fruReport, Menus;

type
  Tit<%= ituname %> = class(TitReport)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  it<%= ituname %> = class(itInterface)
  private
    { Private declarations }
  protected
    procedure GetReportDataSuccess(piRequest: acRequest);
  public
    procedure Initialize; override;
    procedure Finalize; override;
  end;

implementation

uses
  ituInterfaceFactory, acuObject;

{$R *.dfm}

{ it<%= ituname %> }

procedure it<%= ituname %>.Initialize;
var
  lRequest: acRequest;  
begin
  inherited;
  Self.InterfaceForm := Tit<%= ituname %>.Create(Application);
  lRequest := self.NewRequest('RM_GET_REPORT_DATA', GetReportDataSuccess);
  lRequest.Post;  
  Self.InterfaceForm.Show;
end;

procedure it<%= ituname %>.GetReportDataSuccess(piRequest: acRequest);
begin
  Self.InterfaceForm.Show;
 (Self.InterfaceForm as TitReport).LoadFromMessage(piRequest.Response.RootField);
end;

procedure it<%= ituname %>.Finalize;
begin
  inherited;
end;

initialization
  gInterfaceFactory.RegisterClass(<%= guicode %>, it<%= ituname %>);

finalization
  gInterfaceFactory.UnRegisterClass(<%= guicode %>);
end.