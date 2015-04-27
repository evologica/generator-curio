unit sucu<%= sucuname %>;

interface

uses
  ucuUseCase, utuMessage, Classes, SysUtils, acuObject, acuframework,
  utuParamFields, sucuBuscaObjetosBasica, ucuControlPanel;

type
  suc<%= sucuname %> = class(sucBuscaObjetosBasica)
  private
  public
    procedure SearchObjects(piParams: utField; piResult: utField); override;
    procedure GetInicializationObjects(piInitializationData: utField); override;
  end;

implementation

uses
  Math;

const
  __MAX_REGISTERS = 100;

{ suc<%= sucuname %> }

procedure suc<%= sucuname %>.GetInicializationObjects(piInitializationData: utField);
begin
  inherited;
end;

procedure suc<%= sucuname %>.SearchObjects(piParams, piResult: utField);
var
  
  //lOQL:         IOQL; //Replace with your OQL query class
  lObjectList:  acPersistentObjectList;
  lEnum:        acEnumerator;
  lField<%= sucuname %>,
  lFieldItem:   utField;
  lCounter:     Integer;
begin
  inherited;

  lField<%= sucuname %> := piParams.FieldByName('<%= sucuname %>');

  //lOQL :=       { Instatiate your OQL query }
  //lOQL.Param_   { set search params, if any, from piParams}

  lObjectList := acPersistentObjectList.Create();
  try
    //lOQL.LoadList(lObjectList); { execute your search query }

    piResult.AddAttribute('Found').AsInteger := lObjectList.Count;
    piResult.AddAttribute('Returned').AsInteger := Min(lObjectList.Count, __MAX_REGISTERS);

    lEnum := acEnumerator.Create(lObjectList);
    try
      for lCounter := 1 to Min(lObjectList.Count, __MAX_REGISTERS) do
      begin
        lFieldItem := piResult.AddField('Item');

        //lObject := lEnum.Current as ... { cast your class }

        //lFieldItem.AddAttribute('OID').AsString := lObject.IDO.AsString;

        lEnum.MoveNext;
      end;
    finally
      lEnum.Free;
    end;
  finally
    lObjectList.Free;
  end;
end;

initialization
  gucControlPanelV3.RegistrarBuscador(suc<%= sucuname %>, <%= entcode %>);

end.