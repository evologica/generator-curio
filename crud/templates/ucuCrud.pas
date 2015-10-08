unit ucu<%= crudname %>;

interface

uses
  utuStateMachine, utuRequest, ucuUseCase, ngu<%= classname %>;

type
  uc<%= crudname %> = class(ucUseCase)
  private
    f<%= classname %>: ng<%= classname %>;
    procedure GetTargetObjectsData(piRequest: utRequest);
    procedure SetTargetObjectsData(piRequest: utRequest);
  public
    procedure Initialize; Override;
    procedure Finalize; Override;
  published
    procedure EFFECT_ObtemContexto(piRequest: utRequest; piTransition: utTransition);
    procedure EFFECT_IncluiObjeto(piRequest: utRequest; piTransition: utTransition);
    procedure EFFECT_ExcluiObjeto(piRequest: utRequest; piTransition: utTransition);
    procedure EFFECT_EditaObjeto(piRequest: utRequest; piTransition: utTransition);
    procedure Effect_ConsultaObjeto(piRequest: utRequest; piTransition: utTransition);
    procedure EFFECT_SalvaObjeto(piRequest: utRequest; piTransition: utTransition);
  end;

implementation

uses
  acuFramework, ucuManager, acuObject, utuMessage, utuApplicationMessages;

procedure uc<%= crudname %>.Initialize;
begin
  inherited;
end;

procedure uc<%= crudname %>.Finalize;
begin
  inherited;
end;

procedure uc<%= crudname %>.SetTargetObjectsData(piRequest: utRequest);
begin
  // piRequest Fields ---> Object attributes
end;

procedure uc<%= crudname %>.GetTargetObjectsData(piRequest: utRequest);
begin
  // piRequest Fields <--- Object attributes
end;

procedure uc<%= crudname %>.EFFECT_ObtemContexto(piRequest: utRequest; piTransition: utTransition);
begin
  piRequest.Processed := True;
end;

procedure uc<%= crudname %>.EFFECT_IncluiObjeto(piRequest: utRequest; piTransition: utTransition);
begin
  if (not Self.HasPermission(CP_NEW_PERMISSION))
    then raise EucException.Create(gutApplicationMessages.Get('PERMISSAO_INCLUSAO_NEGADA',[]));
  f<%= classname %> := ng<%= classname %>.CreateNew(self.Session);
  GetTargetObjectsData(piRequest);
  piRequest.Processed := True;
end;

procedure uc<%= crudname %>.EFFECT_ExcluiObjeto(piRequest: utRequest; piTransition: utTransition);
var
  lIDO: integer;
  lSavePoint: acPersistenceSessionSavePoint;
begin
  lSavePoint := Self.Session.AddSavePoint;
  try 
    if (not self.HasPermission(CP_DELETE_PERMISSION))
      then raise EucException.Create(gutApplicationMessages.Get('PERMISSAO_EXCLUSAO_NEGADA',[]));
    if piRequest.Message.Fields.HasField('OBJECTID') then
    begin
      lIDO  := piRequest.Message.Fields.FieldByName('OBJECTID').AsInteger;
      try
        f<%= classname %> := self.Session.LoadObject(ng<%= classname %>, acOIDInt.Create(lIDO)) as ng<%= classname %>;
      except
        raise EucException.Create(gutApplicationMessages.Get('OBJETO_NAO_ENCONTRADO',[]));
      end;
      if not Assigned(f<%= classname %>)
        then raise EucException.Create(gutApplicationMessages.Get('OBJETO_NAO_ENCONTRADO',[]));
      self.Session.DeleteObject(f<%= classname %>);
      self.Session.Save;
    end
    else raise EucException.Create(gutApplicationMessages.Get('OBJECTID_NAO_INFORMADO',[]));
  except
    Self.Session.RollBackToSavePoint(lSavePoint);
    raise;
  end;
  piRequest.Processed := True;
end;

procedure uc<%= crudname %>.EFFECT_EditaObjeto(piRequest: utRequest; piTransition: utTransition);
var
  lIDO: integer;
begin
  if (not Self.HasPermission(CP_UPDATE_PERMISSION))
    then raise EucException.Create(gutApplicationMessages.Get('PERMISSAO_EDICAO_NEGADA',[]));

  if piRequest.Message.Fields.HasField('OBJECTID') then
  begin
    lIDO := piRequest.Message.Fields.FieldByName('OBJECTID').AsInteger;
    try
      f<%= classname %> := self.Session.LoadObject(ng<%= classname %>, acOIDInt.Create(lIDO)) as ng<%= classname %>;
    except
      raise EucException.Create(gutApplicationMessages.Get('OBJETO_NAO_ENCONTRADO',[]));
    end;
    if not Assigned(f<%= classname %>) then
      raise EucException.Create(gutApplicationMessages.Get('OBJETO_NAO_ENCONTRADO',[]));
    GetTargetObjectsData(piRequest);
  end
  else
    raise EucException.Create(gutApplicationMessages.Get('OBJECTID_NAO_INFORMADO',[]));
  piRequest.Processed := True;
end;

procedure uc<%= crudname %>.Effect_ConsultaObjeto(piRequest: utRequest; piTransition: utTransition);
var
  lIDO: integer;
begin
  if (not Self.HasPermission(CP_VIEW_PERMISSION))
    then raise EucException.Create(gutApplicationMessages.Get('PERMISSAO_EDICAO_NEGADA',[]));

  if piRequest.Message.Fields.HasField('OBJECTID') then
  begin
    lIDO := piRequest.Message.Fields.FieldByName('OBJECTID').AsInteger;
    try
      f<%= classname %> := self.Session.LoadObject(ng<%= classname %>, acOIDInt.Create(lIDO)) as ng<%= classname %>;
    except
      raise EucException.Create(gutApplicationMessages.Get('OBJETO_NAO_ENCONTRADO',[]));
    end;
    if not Assigned(f<%= classname %>) then
      raise EucException.Create(gutApplicationMessages.Get('OBJETO_NAO_ENCONTRADO',[]));
    GetTargetObjectsData(piRequest);
  end
  else
    raise EucException.Create(gutApplicationMessages.Get('OBJECTID_NAO_INFORMADO',[]));
  piRequest.Processed := True;
end;

procedure uc<%= crudname %>.EFFECT_SalvaObjeto(piRequest: utRequest; piTransition: utTransition);
var
  lSavePoint: acPersistenceSessionSavePoint;
begin
  lSavePoint := Self.Session.AddSavePoint;
  try
    SetTargetObjectsData(piRequest);
    self.Session.Save;
  except
    Self.Session.RollBackToSavePoint(lSavePoint);
    raise;
  end;
  GetTargetObjectsData(piRequest);
  piRequest.Processed := True;
end;

initialization

  gucManager.RegisterClass(<%= uccode %>, uc<%= crudname %>);

end.