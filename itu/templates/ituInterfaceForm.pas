unit itu<%= ituname %>;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ituVCLUIController, ituUIController;

type
  Tit<%= ituname %> = class(itInterfaceForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  it<%= ituname %> = class(itInterface)
  private
    { Private declarations }
  public
    procedure Initialize; override;
    procedure Finalize; override;
  end;

implementation

uses
  ituInterfaceFactory, acuObject, utuMessage;

{$R *.dfm}

{ it<%= ituname %> }

procedure it<%= ituname %>.Initialize;
begin
  inherited;
  Self.InterfaceForm := Tit<%= ituname %>.Create(Application);
  Self.InterfaceForm.Show;
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