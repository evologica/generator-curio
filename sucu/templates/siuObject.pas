unit siu<%= sucuname %>;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, utuMessage, siuBuscaObjetosBasicaPortal, StdCtrls;

type
  Tsi<%= sucuname %> = class(TsiBuscaObjetosBasicaPortal)
  private
    { Private declarations }
  public
    procedure BuscaObjetos; override;
    procedure Inicializar(piField: utField);  override;
  end;

var
  si<%= sucuname %>: Tsi<%= sucuname %>;

implementation

uses ituObjectSearchManager,acuObject;

{$R *.dfm}

{ Tsi<%= sucuname %> }

procedure Tsi<%= sucuname %>.BuscaObjetos;
var 
  lMessage: mxRequestMessage;
  lField<%= sucuname %>: utField;
begin
  inherited;
  Screen.Cursor := crHourGlass;
  
  lMessage := self.NewRequest(UM_GET_OBJECTS);
  lMessage.Fields.AddField('ENTITY').AsString := Self.EntityCode;

  lField<%= sucuname %> := lMessage.RootField.AddField('<%= sucuname %>');
  {}

  Self.PreencherMensagemBuscaObjetos(lMessage);

  Self.InterfaceFromForm.PostMessage(lMessage);
end;

procedure Tsi<%= sucuname %>.Inicializar(piField: utField);
begin
  inherited;
end;

initialization
  gitControlPanel.RegistrarBuscador(Tsi<%= sucuname %>, <%= entcode %>);

Finalization
  gitControlPanel.DesregistrarBuscador(<%= entcode %>);

end.



