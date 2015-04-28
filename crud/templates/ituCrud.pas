unit itu<%= crudname %>;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms, utuMessage, ituVCLUIController,
  ituUIController, ituCadastroBasicoV41;

type
  Tit<%= crudname %> = class(TitCadastroBasicoV41)
  private
  public
  end;

  it<%= crudname %> = class(itCadastroBasicoV4)
  protected
    procedure SendToInterface(piRequest: acRequest);      override;
    procedure SaveFromInterface(piRequest: acRequest);    override;
    procedure GetTargetObjectsData(piRequest: acRequest); override;
  public
    procedure Initialize; override;
  end;

implementation

uses 
  ituInterfaceFactory, acuObject;

{$R *.dfm}

{ it<%= crudname %> }


//Loads Context object data to GUI
procedure it<%= crudname %>.GetTargetObjectsData(piRequest: acRequest);
begin
  inherited;
  with Self.InterfaceForm as Tit<%= crudname %> do
  begin

    //GUI Component  <--- piRequest Fields  

  end;
  Screen.Cursor := crDefault;
end;

procedure it<%= crudname %>.Initialize;
begin
  inherited;
  Screen.Cursor := crHourGlass;
  Self.InterfaceForm := Tit<%= crudname %>.Create(Application);
  Tit<%= crudname %>(Self.InterfaceForm).sbNovo.Visible := False;
  Self.InterfaceForm.Show;
end;

//Saves GUI state to Object
procedure it<%= crudname %>.SaveFromInterface(piRequest: acRequest);
var
  lField: utField;
begin
  inherited;
  with Self.InterfaceForm as Tit<%= crudname %> do
  begin

    //GUI Component ---> piRequest Fields

  end;
  Screen.Cursor := crDefault;
end;

//Loads context dat to GUI
procedure it<%= crudname %>.SendToInterface(piRequest: acRequest);
begin
  inherited;
end;

initialization
  gInterfaceFactory.RegisterClass(<%= guicode %>, it<%= crudname %>);

finalization
  gInterfaceFactory.UnregisterClass(<%= guicode %>);

end.