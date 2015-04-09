unit acuRegisterModelMappings;


interface

uses
  acuframework, classes;

procedure RegisterModelMappings(piMetaModel: acMetaModel);
implementation

uses
  acuRepositorySQL, utuStateMachine;

procedure RegisterClassTickets(piMetaModel: acMetaModel);
var
  lClassMapTicket: acClassTicket;
  lClassToDBMapTicket: acClassToDBMapTicket;
  lDBIntIdoMapTicket: acDBIdoMapTicket;
  prop: acAttributeTicket;
begin
  
    lClassMapTicket    := piMetaModel.NewClassRegisterTicket('-3','ngCategory','acPersistentObject', acOIDInt);
    lClassMapTicket.AuditDescription := '';
  
    lDBIntIdoMapTicket := acDBIntIdoMapTicket.Create('IESDIDCATE');
    lClassToDBMapTicket := (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewClassToDBMapRegisterTicket('-3', lClassMapTicket, lDBIntIdoMapTicket) ;
    lClassToDBMapTicket.TableName := 'IESDTCATEG';
  // registrando os atributos da classe
    prop := lClassMapTicket.NewAttributeTicket('Name', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 20;
    prop.Mandatory := False;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'IESDNMCATE';
    prop := lClassMapTicket.NewAttributeTicket('Code', 'acInt', pvPersistent, False);
    prop.FixSize := 10;
    prop.VarSize := 0;
    prop.Mandatory := True;
    prop.DBType := 'int';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'IESDCDCATE';
  
    lClassMapTicket    := piMetaModel.NewClassRegisterTicket('36','NGCidade','acPersistentObject', acOIDInt);
    lClassMapTicket.AuditDescription := '';
  
    lDBIntIdoMapTicket := acDBIntIdoMapTicket.Create('CGRDIDCIDA');
    lClassToDBMapTicket := (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewClassToDBMapRegisterTicket('36', lClassMapTicket, lDBIntIdoMapTicket) ;
    lClassToDBMapTicket.TableName := 'CGRDTCIDAD';
  // registrando os atributos da classe
    prop := lClassMapTicket.NewAttributeTicket('Nome', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 50;
    prop.Mandatory := False;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRDNMCIDA';
  
    lClassMapTicket    := piMetaModel.NewClassRegisterTicket('42','NGConta','acPersistentObject', acOIDInt);
    lClassMapTicket.AuditDescription := '';
  
    lDBIntIdoMapTicket := acDBIntIdoMapTicket.Create('FICCIDCONT');
    lClassToDBMapTicket := (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewClassToDBMapRegisterTicket('42', lClassMapTicket, lDBIntIdoMapTicket) ;
    lClassToDBMapTicket.TableName := 'FICCTCONTA';
  // registrando os atributos da classe
    prop := lClassMapTicket.NewAttributeTicket('Descricao', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 50;
    prop.Mandatory := False;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'FICCDSCONT';
    prop := lClassMapTicket.NewAttributeTicket('Codigo', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 20;
    prop.Mandatory := False;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'FICCCDCONT';
  
    lClassMapTicket    := piMetaModel.NewClassRegisterTicket('38','NGEndereco','acPersistentObject', acOIDInt);
    lClassMapTicket.AuditDescription := '';
  
    lDBIntIdoMapTicket := acDBIntIdoMapTicket.Create('CGRFIDENDE');
    lClassToDBMapTicket := (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewClassToDBMapRegisterTicket('38', lClassMapTicket, lDBIntIdoMapTicket) ;
    lClassToDBMapTicket.TableName := 'CGRFTENDER';
  // registrando os atributos da classe
    prop := lClassMapTicket.NewAttributeTicket('Rua', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 50;
    prop.Mandatory := True;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRFDSRUAA';
    prop := lClassMapTicket.NewAttributeTicket('Bairro', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 30;
    prop.Mandatory := True;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRFDSBAIR';
    prop := lClassMapTicket.NewAttributeTicket('Cep', 'acString', pvPersistent, False);
    prop.FixSize := 9;
    prop.VarSize := 0;
    prop.Mandatory := True;
    prop.DBType := 'char';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRFNOCEPP';
    prop := lClassMapTicket.NewAttributeTicket('EMail', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 30;
    prop.Mandatory := True;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRFDSEMAI';
    prop := lClassMapTicket.NewAttributeTicket('Telefone1', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 15;
    prop.Mandatory := True;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRFNOTEL1';
    prop := lClassMapTicket.NewAttributeTicket('Telefone2', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 15;
    prop.Mandatory := True;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRFNOTEL2';
    prop := lClassMapTicket.NewAttributeTicket('TelefoneFax', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 15;
    prop.Mandatory := True;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRFNOFAXX';
    prop := lClassMapTicket.NewAttributeTicket('Numero', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 10;
    prop.Mandatory := True;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRFNORUAA';
    prop := lClassMapTicket.NewAttributeTicket('Complemento', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 30;
    prop.Mandatory := True;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRFDSCOMP';
    prop := lClassMapTicket.NewAttributeTicket('DDD1', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 2;
    prop.Mandatory := True;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRFNODDD1';
    prop := lClassMapTicket.NewAttributeTicket('DDD2', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 2;
    prop.Mandatory := True;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRFNODDD2';
    prop := lClassMapTicket.NewAttributeTicket('DDDFax', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 2;
    prop.Mandatory := True;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRFNODDDF';
    prop := lClassMapTicket.NewAttributeTicket('Ramal1', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 5;
    prop.Mandatory := True;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRFNORAM1';
    prop := lClassMapTicket.NewAttributeTicket('Ramal2', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 5;
    prop.Mandatory := True;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRFNORAM2';
    prop := lClassMapTicket.NewAttributeTicket('RamalFax', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 5;
    prop.Mandatory := True;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRFNORAMF';
  
    lClassMapTicket    := piMetaModel.NewClassRegisterTicket('-4','ngEntity','acPersistentObject', acOIDInt);
    lClassMapTicket.AuditDescription := '';
  
    lDBIntIdoMapTicket := acDBIntIdoMapTicket.Create('IESCIDENTI');
    lClassToDBMapTicket := (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewClassToDBMapRegisterTicket('-4', lClassMapTicket, lDBIntIdoMapTicket) ;
    lClassToDBMapTicket.TableName := 'IESCTENTID';
  // registrando os atributos da classe
    prop := lClassMapTicket.NewAttributeTicket('Name', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 20;
    prop.Mandatory := False;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'IESCNMENTI';
    prop := lClassMapTicket.NewAttributeTicket('Code', 'acInt', pvPersistent, False);
    prop.FixSize := 10;
    prop.VarSize := 0;
    prop.Mandatory := False;
    prop.DBType := 'int';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'IESCCDENTI';
    prop := lClassMapTicket.NewAttributeTicket('Caption', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 20;
    prop.Mandatory := True;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'IESCTIENTI';
  
    lClassMapTicket    := piMetaModel.NewClassRegisterTicket('37','NGEstado','acPersistentObject', acOIDInt);
    lClassMapTicket.AuditDescription := '';
  
    lDBIntIdoMapTicket := acDBIntIdoMapTicket.Create('CGREIDESTA');
    lClassToDBMapTicket := (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewClassToDBMapRegisterTicket('37', lClassMapTicket, lDBIntIdoMapTicket) ;
    lClassToDBMapTicket.TableName := 'CGRETESTAD';
  // registrando os atributos da classe
    prop := lClassMapTicket.NewAttributeTicket('Nome', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 50;
    prop.Mandatory := False;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGREDSESTA';
    prop := lClassMapTicket.NewAttributeTicket('Sigla', 'acString', pvPersistent, False);
    prop.FixSize := 2;
    prop.VarSize := 0;
    prop.Mandatory := False;
    prop.DBType := 'char';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRESGESTA';
  
    lClassMapTicket    := piMetaModel.NewClassRegisterTicket('-8','ngEvent','acPersistentObject', acOIDInt);
    lClassMapTicket.AuditDescription := '';
  
    lDBIntIdoMapTicket := acDBIntIdoMapTicket.Create('SEGCIDESEG');
    lClassToDBMapTicket := (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewClassToDBMapRegisterTicket('-8', lClassMapTicket, lDBIntIdoMapTicket) ;
    lClassToDBMapTicket.TableName := 'SEGCTEVSEG';
  // registrando os atributos da classe
    prop := lClassMapTicket.NewAttributeTicket('DtLaunching', 'acDateTime', pvPersistent, False);
    prop.FixSize := 8;
    prop.VarSize := 0;
    prop.Mandatory := False;
    prop.DBType := 'datetime';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'SEGCDTLANC';
    prop := lClassMapTicket.NewAttributeTicket('EventType', 'acString', pvPersistent, False);
    prop.FixSize := 1;
    prop.VarSize := 0;
    prop.Mandatory := False;
    prop.DBType := 'char';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'SEGCTPEVEN';
  
    lClassMapTicket    := piMetaModel.NewClassRegisterTicket('54','NGFotoPessoaFisica','acPersistentObject', acOIDInt);
    lClassMapTicket.AuditDescription := '';
  
    lDBIntIdoMapTicket := acDBIntIdoMapTicket.Create('CGRSIDFOTO');
    lClassToDBMapTicket := (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewClassToDBMapRegisterTicket('54', lClassMapTicket, lDBIntIdoMapTicket) ;
    lClassToDBMapTicket.TableName := 'CGRSTIFOTO';
  // registrando os atributos da classe
    prop := lClassMapTicket.NewAttributeTicket('Imagem', 'acGraphic', pvPersistent, False);
    prop.FixSize := 16;
    prop.VarSize := 0;
    prop.Mandatory := True;
    prop.DBType := 'image';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRSIMFOTO';
  
    lClassMapTicket    := piMetaModel.NewClassRegisterTicket('6','NGFuncionario','acPersistentObject', acOIDInt);
    lClassMapTicket.AuditDescription := '';
  
    lDBIntIdoMapTicket := acDBIntIdoMapTicket.Create('CGROIDFUNC');
    lClassToDBMapTicket := (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewClassToDBMapRegisterTicket('6', lClassMapTicket, lDBIntIdoMapTicket) ;
    lClassToDBMapTicket.TableName := 'CGROTFUNCI';
  // registrando os atributos da classe
    prop := lClassMapTicket.NewAttributeTicket('Situacao', 'acString', pvPersistent, False);
    prop.FixSize := 1;
    prop.VarSize := 0;
    prop.Mandatory := False;
    prop.DBType := 'char';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGROSTFUNC';
    prop := lClassMapTicket.NewAttributeTicket('Matricula', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 20;
    prop.Mandatory := True;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRONOMATR';
  
    lClassMapTicket    := piMetaModel.NewClassRegisterTicket('128','ngGUITicket','acPersistentObject', acOIDInt);
    lClassMapTicket.AuditDescription := '';
  
    lDBIntIdoMapTicket := acDBIntIdoMapTicket.Create('IESOIDINTE');
    lClassToDBMapTicket := (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewClassToDBMapRegisterTicket('128', lClassMapTicket, lDBIntIdoMapTicket) ;
    lClassToDBMapTicket.TableName := 'IESOTINTER';
  // registrando os atributos da classe
    prop := lClassMapTicket.NewAttributeTicket('Name', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 50;
    prop.Mandatory := False;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'IESONMINTE';
    prop := lClassMapTicket.NewAttributeTicket('Code', 'acInt', pvPersistent, False);
    prop.FixSize := 10;
    prop.VarSize := 0;
    prop.Mandatory := False;
    prop.DBType := 'int';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'IESOCDINTE';
    prop := lClassMapTicket.NewAttributeTicket('Description', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 250;
    prop.Mandatory := False;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'IESODSINTE';
  
    lClassMapTicket    := piMetaModel.NewClassRegisterTicket('-2','ngIcon','acPersistentObject', acOIDInt);
    lClassMapTicket.AuditDescription := '';
  
    lDBIntIdoMapTicket := acDBIntIdoMapTicket.Create('IESFIDCUIC');
    lClassToDBMapTicket := (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewClassToDBMapRegisterTicket('-2', lClassMapTicket, lDBIntIdoMapTicket) ;
    lClassToDBMapTicket.TableName := 'IESFTCUICO';
  // registrando os atributos da classe
    prop := lClassMapTicket.NewAttributeTicket('Description', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 50;
    prop.Mandatory := True;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'IESFDSCUIC';
    prop := lClassMapTicket.NewAttributeTicket('Code', 'acInt', pvPersistent, False);
    prop.FixSize := 10;
    prop.VarSize := 0;
    prop.Mandatory := True;
    prop.DBType := 'int';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'IESFCDCUIC';
    prop := lClassMapTicket.NewAttributeTicket('Image', 'acBlob', pvPersistent, False);
    prop.FixSize := 16;
    prop.VarSize := 0;
    prop.Mandatory := False;
    prop.DBType := 'image';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'IESFIMCUIC';
  
    lClassMapTicket    := piMetaModel.NewClassRegisterTicket('-11','ngLevel','acPersistentObject', acOIDInt);
    lClassMapTicket.AuditDescription := '';
  
    lDBIntIdoMapTicket := acDBIntIdoMapTicket.Create('IESHIDLEVE');
    lClassToDBMapTicket := (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewClassToDBMapRegisterTicket('-11', lClassMapTicket, lDBIntIdoMapTicket) ;
    lClassToDBMapTicket.TableName := 'IESHTLEVEL';
  // registrando os atributos da classe
    prop := lClassMapTicket.NewAttributeTicket('Code', 'acInt', pvPersistent, False);
    prop.FixSize := 10;
    prop.VarSize := 0;
    prop.Mandatory := False;
    prop.DBType := 'int';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'IESHCDLEVE';
  
    lClassMapTicket    := piMetaModel.NewClassRegisterTicket('51','NGLocalNascEstrangeiro','acPersistentObject', acOIDInt);
    lClassMapTicket.AuditDescription := '';
  
    lDBIntIdoMapTicket := acDBIntIdoMapTicket.Create('CGRIIDESTR');
    lClassToDBMapTicket := (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewClassToDBMapRegisterTicket('51', lClassMapTicket, lDBIntIdoMapTicket) ;
    lClassToDBMapTicket.TableName := 'CGRITESTRA';
  // registrando os atributos da classe
    prop := lClassMapTicket.NewAttributeTicket('Descricao', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 30;
    prop.Mandatory := False;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRILOCNAS';
  
    lClassMapTicket    := piMetaModel.NewClassRegisterTicket('132','NGNatureza','acPersistentObject', acOIDInt);
    lClassMapTicket.AuditDescription := '';
  
    lDBIntIdoMapTicket := acDBIntIdoMapTicket.Create('SEGDIDNAUS');
    lClassToDBMapTicket := (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewClassToDBMapRegisterTicket('132', lClassMapTicket, lDBIntIdoMapTicket) ;
    lClassToDBMapTicket.TableName := 'SEGDTNAUSU';
  // registrando os atributos da classe
    prop := lClassMapTicket.NewAttributeTicket('Codigo', 'acInt', pvPersistent, False);
    prop.FixSize := 10;
    prop.VarSize := 0;
    prop.Mandatory := False;
    prop.DBType := 'int';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'SEGDCDNAUS';
    prop := lClassMapTicket.NewAttributeTicket('Descricao', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 50;
    prop.Mandatory := False;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'SEGDDSNAUS';
  
    lClassMapTicket    := piMetaModel.NewClassRegisterTicket('43','NGNaturezaConta','acPersistentObject', acOIDInt);
    lClassMapTicket.AuditDescription := '';
  
    lDBIntIdoMapTicket := acDBIntIdoMapTicket.Create('FICOIDNATC');
    lClassToDBMapTicket := (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewClassToDBMapRegisterTicket('43', lClassMapTicket, lDBIntIdoMapTicket) ;
    lClassToDBMapTicket.TableName := 'FICOTNATCO';
  // registrando os atributos da classe
    prop := lClassMapTicket.NewAttributeTicket('Descricao', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 50;
    prop.Mandatory := False;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'FICODSNATC';
    prop := lClassMapTicket.NewAttributeTicket('Codigo', 'acString', pvPersistent, False);
    prop.FixSize := 2;
    prop.VarSize := 0;
    prop.Mandatory := False;
    prop.DBType := 'char';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'FICOCDNATC';
  
    lClassMapTicket    := piMetaModel.NewClassRegisterTicket('-9','ngOperation','acPersistentObject', acOIDInt);
    lClassMapTicket.AuditDescription := '';
  
    lDBIntIdoMapTicket := acDBIntIdoMapTicket.Create('IESJIDOPER');
    lClassToDBMapTicket := (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewClassToDBMapRegisterTicket('-9', lClassMapTicket, lDBIntIdoMapTicket) ;
    lClassToDBMapTicket.TableName := 'IESJTOPERA';
  // registrando os atributos da classe
    prop := lClassMapTicket.NewAttributeTicket('Description', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 20;
    prop.Mandatory := False;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'IESJDSOPER';
    prop := lClassMapTicket.NewAttributeTicket('Code', 'acInt', pvPersistent, False);
    prop.FixSize := 10;
    prop.VarSize := 0;
    prop.Mandatory := True;
    prop.DBType := 'int';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'IESJCDOPER';
  
    lClassMapTicket    := piMetaModel.NewClassRegisterTicket('-7','ngPermission','acPersistentObject', acOIDInt);
    lClassMapTicket.AuditDescription := '';
  
    lDBIntIdoMapTicket := acDBIntIdoMapTicket.Create('SEGBIDPERM');
    lClassToDBMapTicket := (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewClassToDBMapRegisterTicket('-7', lClassMapTicket, lDBIntIdoMapTicket) ;
    lClassToDBMapTicket.TableName := 'SEGBTPERMI';
  
    lClassMapTicket    := piMetaModel.NewClassRegisterTicket('19','NGPessoa','acPersistentObject', acOIDInt);
    lClassMapTicket.AuditDescription := '';
  
    lDBIntIdoMapTicket := acDBIntIdoMapTicket.Create('CGRAIDPESS');
    lClassToDBMapTicket := (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewClassToDBMapRegisterTicket('19', lClassMapTicket, lDBIntIdoMapTicket) ;
    lClassToDBMapTicket.TableName := 'CGRATPESSO';
    lClassToDBMapTicket.TypeColumnName := 'CGRACDHERA';
  // registrando os atributos da classe
    prop := lClassMapTicket.NewAttributeTicket('Nome', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 100;
    prop.Mandatory := False;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRANMPESS';
    prop := lClassMapTicket.NewAttributeTicket('CNPJ_CPF', 'acDouble', pvPersistent, False);
    prop.FixSize := 9;
    prop.VarSize := 0;
    prop.Mandatory := True;
    prop.DBType := 'decimal';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRANOCPCG';
    prop := lClassMapTicket.NewAttributeTicket('DataCadastro', 'acDateTime', pvPersistent, False);
    prop.FixSize := 8;
    prop.VarSize := 0;
    prop.Mandatory := False;
    prop.DBType := 'datetime';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRADTCADA';
  
    lClassMapTicket    := piMetaModel.NewClassRegisterTicket('39','NGPessoaFisica','NGPessoa', acOIDInt);
    lClassMapTicket.AuditDescription := '';
  
    lDBIntIdoMapTicket := acDBIntIdoMapTicket.Create('CGRBIDPEFI');
    lClassToDBMapTicket := (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewClassToDBMapRegisterTicket('39', lClassMapTicket, lDBIntIdoMapTicket) ;
    lClassToDBMapTicket.TableName := 'CGRBTPEFIS';
  // registrando os atributos da classe
    prop := lClassMapTicket.NewAttributeTicket('DataNascimento', 'acDateTime', pvPersistent, False);
    prop.FixSize := 8;
    prop.VarSize := 0;
    prop.Mandatory := True;
    prop.DBType := 'datetime';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRBDTNASC';
    prop := lClassMapTicket.NewAttributeTicket('Nacionalidade', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 30;
    prop.Mandatory := True;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRBDSNACI';
    prop := lClassMapTicket.NewAttributeTicket('Sexo', 'acString', pvPersistent, False);
    prop.FixSize := 1;
    prop.VarSize := 0;
    prop.Mandatory := True;
    prop.DBType := 'char';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRBINSEXO';
    prop := lClassMapTicket.NewAttributeTicket('NomePai', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 50;
    prop.Mandatory := True;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRBNMPAII';
    prop := lClassMapTicket.NewAttributeTicket('NomeMae', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 50;
    prop.Mandatory := True;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRBNMMAEE';
    prop := lClassMapTicket.NewAttributeTicket('NumeroRG', 'acString', pvPersistent, False);
    prop.FixSize := 15;
    prop.VarSize := 0;
    prop.Mandatory := True;
    prop.DBType := 'char';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRBNORGGG';
    prop := lClassMapTicket.NewAttributeTicket('SiglaOrgaoEmissorRG', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 10;
    prop.Mandatory := True;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRBSGEMIS';
    prop := lClassMapTicket.NewAttributeTicket('Profissao', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 50;
    prop.Mandatory := True;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRBDSPROF';
    prop := lClassMapTicket.NewAttributeTicket('Empresa', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 50;
    prop.Mandatory := True;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRBDSEMPR';
    prop := lClassMapTicket.NewAttributeTicket('NumCertificadoReservista', 'acString', pvPersistent, False);
    prop.FixSize := 15;
    prop.VarSize := 0;
    prop.Mandatory := True;
    prop.DBType := 'char';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRBNORESE';
    prop := lClassMapTicket.NewAttributeTicket('NumeroTituloEleitor', 'acString', pvPersistent, False);
    prop.FixSize := 15;
    prop.VarSize := 0;
    prop.Mandatory := True;
    prop.DBType := 'char';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRBNOTIEL';
    prop := lClassMapTicket.NewAttributeTicket('ZonaEleitoral', 'acString', pvPersistent, False);
    prop.FixSize := 4;
    prop.VarSize := 0;
    prop.Mandatory := True;
    prop.DBType := 'char';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRBNOZOEL';
    prop := lClassMapTicket.NewAttributeTicket('SecaoEleitoral', 'acString', pvPersistent, False);
    prop.FixSize := 4;
    prop.VarSize := 0;
    prop.Mandatory := True;
    prop.DBType := 'char';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRBNOSEEL';
    prop := lClassMapTicket.NewAttributeTicket('IndicadorEstrangeiro', 'acString', pvPersistent, False);
    prop.FixSize := 1;
    prop.VarSize := 0;
    prop.Mandatory := True;
    prop.DBType := 'char';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRBINESTR';
    prop := lClassMapTicket.NewAttributeTicket('IndicadorDeficienciaFisica', 'acString', pvPersistent, False);
    prop.FixSize := 1;
    prop.VarSize := 0;
    prop.Mandatory := True;
    prop.DBType := 'char';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRBINDFIS';
    prop := lClassMapTicket.NewAttributeTicket('IndicadorDeficienciaVisual', 'acString', pvPersistent, False);
    prop.FixSize := 1;
    prop.VarSize := 0;
    prop.Mandatory := True;
    prop.DBType := 'char';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRBINDVIS';
    prop := lClassMapTicket.NewAttributeTicket('IndicadorDeficienciaAuditi', 'acString', pvPersistent, False);
    prop.FixSize := 1;
    prop.VarSize := 0;
    prop.Mandatory := True;
    prop.DBType := 'char';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRBINDAUD';
  
    lClassMapTicket    := piMetaModel.NewClassRegisterTicket('53','NGPessoaJuridica','NGPessoa', acOIDInt);
    lClassMapTicket.AuditDescription := '';
  
    lDBIntIdoMapTicket := acDBIntIdoMapTicket.Create('CGRCIDPEJU');
    lClassToDBMapTicket := (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewClassToDBMapRegisterTicket('53', lClassMapTicket, lDBIntIdoMapTicket) ;
    lClassToDBMapTicket.TableName := 'CGRCTPEJUR';
  // registrando os atributos da classe
    prop := lClassMapTicket.NewAttributeTicket('NumInscricaoEstadual', 'acString', pvPersistent, False);
    prop.FixSize := 10;
    prop.VarSize := 0;
    prop.Mandatory := True;
    prop.DBType := 'char';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRCNOINES';
    prop := lClassMapTicket.NewAttributeTicket('NumInscricaoMunicipal', 'acString', pvPersistent, False);
    prop.FixSize := 10;
    prop.VarSize := 0;
    prop.Mandatory := True;
    prop.DBType := 'char';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRCNOINMU';
    prop := lClassMapTicket.NewAttributeTicket('RazaoSocial', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 100;
    prop.Mandatory := True;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'CGRCNMRZSO';
  
    lClassMapTicket    := piMetaModel.NewClassRegisterTicket('-5','ngSystem','acPersistentObject', acOIDInt);
    lClassMapTicket.AuditDescription := '';
  
    lDBIntIdoMapTicket := acDBIntIdoMapTicket.Create('IESAIDSIST');
    lClassToDBMapTicket := (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewClassToDBMapRegisterTicket('-5', lClassMapTicket, lDBIntIdoMapTicket) ;
    lClassToDBMapTicket.TableName := 'IESATSISTE';
  // registrando os atributos da classe
    prop := lClassMapTicket.NewAttributeTicket('Name', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 10;
    prop.Mandatory := False;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'IESANMSIST';
    prop := lClassMapTicket.NewAttributeTicket('Description', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 50;
    prop.Mandatory := False;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'IESADSSIST';
    prop := lClassMapTicket.NewAttributeTicket('Version', 'acString', pvPersistent, False);
    prop.FixSize := 10;
    prop.VarSize := 0;
    prop.Mandatory := False;
    prop.DBType := 'char';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'IESAVERSAO';
    prop := lClassMapTicket.NewAttributeTicket('Code', 'acInt', pvPersistent, False);
    prop.FixSize := 10;
    prop.VarSize := 0;
    prop.Mandatory := True;
    prop.DBType := 'int';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'IESACDSIST';
  
    lClassMapTicket    := piMetaModel.NewClassRegisterTicket('129','ngSystemGUITickets','acPersistentObject', acOIDInt);
    lClassMapTicket.AuditDescription := '';
  
    lDBIntIdoMapTicket := acDBIntIdoMapTicket.Create('IESPIDSISI');
    lClassToDBMapTicket := (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewClassToDBMapRegisterTicket('129', lClassMapTicket, lDBIntIdoMapTicket) ;
    lClassToDBMapTicket.TableName := 'IESPTSISIN';
  
    lClassMapTicket    := piMetaModel.NewClassRegisterTicket('-1','ngUseCaseTicket','acPersistentObject', acOIDInt);
    lClassMapTicket.AuditDescription := '';
  
    lDBIntIdoMapTicket := acDBIntIdoMapTicket.Create('IESBIDCASO');
    lClassToDBMapTicket := (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewClassToDBMapRegisterTicket('-1', lClassMapTicket, lDBIntIdoMapTicket) ;
    lClassToDBMapTicket.TableName := 'IESBTCASOU';
  // registrando os atributos da classe
    prop := lClassMapTicket.NewAttributeTicket('Description', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 250;
    prop.Mandatory := False;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'IESBDSCASO';
    prop := lClassMapTicket.NewAttributeTicket('Name', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 50;
    prop.Mandatory := False;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'IESBNMCASO';
    prop := lClassMapTicket.NewAttributeTicket('Code', 'acInt', pvPersistent, False);
    prop.FixSize := 10;
    prop.VarSize := 0;
    prop.Mandatory := False;
    prop.DBType := 'int';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'IESBCDCASO';
    prop := lClassMapTicket.NewAttributeTicket('UseCaseType', 'acString', pvPersistent, False);
    prop.FixSize := 1;
    prop.VarSize := 0;
    prop.Mandatory := True;
    prop.DBType := 'char';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'IESBTPCASO';
  
    lClassMapTicket    := piMetaModel.NewClassRegisterTicket('-10','ngUseCaseTicketOperation','acPersistentObject', acOIDInt);
    lClassMapTicket.AuditDescription := '';
  
    lDBIntIdoMapTicket := acDBIntIdoMapTicket.Create('IESGIDCUOP');
    lClassToDBMapTicket := (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewClassToDBMapRegisterTicket('-10', lClassMapTicket, lDBIntIdoMapTicket) ;
    lClassToDBMapTicket.TableName := 'IESGTCUOPE';
  
    lClassMapTicket    := piMetaModel.NewClassRegisterTicket('-6','NGUser','acPersistentObject', acOIDInt);
    lClassMapTicket.AuditDescription := '';
  
    lDBIntIdoMapTicket := acDBIntIdoMapTicket.Create('SEGAIDUSUA');
    lClassToDBMapTicket := (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewClassToDBMapRegisterTicket('-6', lClassMapTicket, lDBIntIdoMapTicket) ;
    lClassToDBMapTicket.TableName := 'SEGATUSUAR';
    lClassToDBMapTicket.TypeColumnName := 'SEGACDHERA';
  // registrando os atributos da classe
    prop := lClassMapTicket.NewAttributeTicket('Login', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 25;
    prop.Mandatory := False;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'SEGACDUSUA';
    prop := lClassMapTicket.NewAttributeTicket('Password', 'acString', pvPersistent, False);
    prop.FixSize := 8;
    prop.VarSize := 0;
    prop.Mandatory := False;
    prop.DBType := 'char';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'SEGASENHAU';
    prop := lClassMapTicket.NewAttributeTicket('PasswordResetCode', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 20;
    prop.Mandatory := True;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'SEGAPRSETC';
    prop := lClassMapTicket.NewAttributeTicket('DtRegister', 'acDateTime', pvPersistent, False);
    prop.FixSize := 8;
    prop.VarSize := 0;
    prop.Mandatory := False;
    prop.DBType := 'datetime';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'SEGADTCADU';
    prop := lClassMapTicket.NewAttributeTicket('DtLastChangePassword', 'acDateTime', pvPersistent, False);
    prop.FixSize := 8;
    prop.VarSize := 0;
    prop.Mandatory := True;
    prop.DBType := 'datetime';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'SEGADTULSE';
    prop := lClassMapTicket.NewAttributeTicket('CancelIndicator', 'acString', pvPersistent, False);
    prop.FixSize := 1;
    prop.VarSize := 0;
    prop.Mandatory := False;
    prop.DBType := 'char';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'SEGAINCANC';
    prop := lClassMapTicket.NewAttributeTicket('CodigoReferencia', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 25;
    prop.Mandatory := True;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'SEGACDREFE';
    prop := lClassMapTicket.NewAttributeTicket('PasswordFormat', 'acInt', pvPersistent, False);
    prop.FixSize := 10;
    prop.VarSize := 0;
    prop.Mandatory := True;
    prop.DBType := 'int';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'SEGAFORMSE';
    prop := lClassMapTicket.NewAttributeTicket('PasswordSalt', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 128;
    prop.Mandatory := True;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'SEGASALTSE';
    prop := lClassMapTicket.NewAttributeTicket('MobilePIN', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 16;
    prop.Mandatory := True;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'SEGAMOBILE';
    prop := lClassMapTicket.NewAttributeTicket('Email', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 256;
    prop.Mandatory := True;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'SEGAEEMAIL';
    prop := lClassMapTicket.NewAttributeTicket('LoweredEmail', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 256;
    prop.Mandatory := True;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'SEGALEMAIL';
    prop := lClassMapTicket.NewAttributeTicket('PasswordQuestion', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 256;
    prop.Mandatory := True;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'SEGASENHAQ';
    prop := lClassMapTicket.NewAttributeTicket('PasswordAnswer', 'acString', pvPersistent, False);
    prop.FixSize := 0;
    prop.VarSize := 256;
    prop.Mandatory := True;
    prop.DBType := 'varchar';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'SEGASENHAA';
    prop := lClassMapTicket.NewAttributeTicket('IsLockedOut', 'acString', pvPersistent, False);
    prop.FixSize := 1;
    prop.VarSize := 0;
    prop.Mandatory := True;
    prop.DBType := 'char';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'SEGABLOQUE';
    prop := lClassMapTicket.NewAttributeTicket('LastLoginDate', 'acDateTime', pvPersistent, False);
    prop.FixSize := 8;
    prop.VarSize := 0;
    prop.Mandatory := True;
    prop.DBType := 'datetime';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'SEGAULTLGN';
    prop := lClassMapTicket.NewAttributeTicket('LastLockoutDate', 'acDateTime', pvPersistent, False);
    prop.FixSize := 8;
    prop.VarSize := 0;
    prop.Mandatory := True;
    prop.DBType := 'datetime';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'SEGAULTBLQ';
    prop := lClassMapTicket.NewAttributeTicket('FailedPasswordAttemptCount', 'acInt', pvPersistent, False);
    prop.FixSize := 10;
    prop.VarSize := 0;
    prop.Mandatory := True;
    prop.DBType := 'int';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'SEGAFSACOU';
    prop := lClassMapTicket.NewAttributeTicket('FailedPasswordAttemptWindowStart', 'acString', pvPersistent, False);
    prop.FixSize := 8;
    prop.VarSize := 0;
    prop.Mandatory := True;
    prop.DBType := 'datetime';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'SEGAFSAWST';
    prop := lClassMapTicket.NewAttributeTicket('FailedPasswordAnswerAttemptCount', 'acInt', pvPersistent, False);
    prop.FixSize := 10;
    prop.VarSize := 0;
    prop.Mandatory := True;
    prop.DBType := 'int';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'SEGAFSAACO';
    prop := lClassMapTicket.NewAttributeTicket('FailedPasswordAnswerAttemptWindowStart', 'acString', pvPersistent, False);
    prop.FixSize := 8;
    prop.VarSize := 0;
    prop.Mandatory := True;
    prop.DBType := 'datetime';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'SEGAFSAAWS';
    prop := lClassMapTicket.NewAttributeTicket('Comment', 'acText', pvPersistent, False);
    prop.FixSize := 16;
    prop.VarSize := 0;
    prop.Mandatory := True;
    prop.DBType := 'text';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'SEGACOMMEN';
    prop := lClassMapTicket.NewAttributeTicket('LastActivityDate', 'acDateTime', pvPersistent, False);
    prop.FixSize := 8;
    prop.VarSize := 0;
    prop.Mandatory := True;
    prop.DBType := 'datetime';
    lClassToDBMapTicket.NewDbColumnMapRegisterTicket(prop).ColumnName := 'SEGAULTACT';
  
    lClassMapTicket    := piMetaModel.NewClassRegisterTicket('7','NGUsuario','NGUser', acOIDInt);
    lClassMapTicket.AuditDescription := '';
  
    lDBIntIdoMapTicket := acDBIntIdoMapTicket.Create('SEGAIDUSUA');
    lClassToDBMapTicket := (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewClassToDBMapRegisterTicket('7', lClassMapTicket, lDBIntIdoMapTicket) ;
    lClassToDBMapTicket.TableName := 'SEGATUSUAR';
end;

procedure RegisterClassTicketsExtra(piMetaModel: acMetaModel);
begin
end;

procedure RegisterClassRelationTickets(piMetaModel: acMetaModel);
var
  lRelationTicket: acRelationTicket;
begin
  lRelationTicket := piMetaModel.NewRelationRegisterTicket('NGCidade', '', 0, 2147483647, pvNone, 'Endereço possui cidade', 'NGEndereco', 'Cidade', 1, 1, pvNone, False, False);
  if lRelationTicket <> nil then (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewOneToManyDbRelationMapRegisterTicket(lRelationTicket, 'CGRFIDCIDA');
  
  lRelationTicket := piMetaModel.NewRelationRegisterTicket('NGCidade', '', 0, 2147483647, pvNone, 'PessoaFisica possui cidade eleitoral', 'NGPessoaFisica', 'CidadeEleitoral', 1, 1, pvNone, False, False);
  if lRelationTicket <> nil then (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewOneToManyDbRelationMapRegisterTicket(lRelationTicket, 'CGRBIDCIEL');
  
  lRelationTicket := piMetaModel.NewRelationRegisterTicket('NGCidade', '', 0, 2147483647, pvNone, 'PessoaFisica possui cidade nascimento', 'NGPessoaFisica', 'CidadeNascimento', 1, 1, pvNone, False, False);
  if lRelationTicket <> nil then (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewOneToManyDbRelationMapRegisterTicket(lRelationTicket, 'CGRBIDCINA');
  
  lRelationTicket := piMetaModel.NewRelationRegisterTicket('NGConta', '', 1, 1, pvNone, 'Funcionario possui Conta', 'NGFuncionario', 'Conta', 1, 1, pvNone, False, False);
  if lRelationTicket <> nil then (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewOneToOneDbRelationMapRegisterTicket(lRelationTicket, 'CGROIDCONT');
  
  lRelationTicket := piMetaModel.NewRelationRegisterTicket('NGEstado', 'Cidades', 0, 2147483647, pvNone, 'Cidade pertence a um Estado', 'NGCidade', 'Estado', 1, 1, pvNone, True, False);
  if lRelationTicket <> nil then (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewOneToManyDbRelationMapRegisterTicket(lRelationTicket, 'CGRDIDESTA');
  
  lRelationTicket := piMetaModel.NewRelationRegisterTicket('NGEstado', '', 0, 2147483647, pvNone, 'PessoaFisica possui estado eleitoral', 'NGPessoaFisica', 'EstadoEleitoral', 1, 1, pvNone, False, False);
  if lRelationTicket <> nil then (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewOneToManyDbRelationMapRegisterTicket(lRelationTicket, 'CGRBIDESEL');
  
  lRelationTicket := piMetaModel.NewRelationRegisterTicket('NGEstado', '', 0, 2147483647, pvNone, 'PessoaFisica possui estado emissor RG', 'NGPessoaFisica', 'EstadoEmissorRG', 1, 1, pvNone, False, False);
  if lRelationTicket <> nil then (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewOneToManyDbRelationMapRegisterTicket(lRelationTicket, 'CGRBIDESEM');
  
  lRelationTicket := piMetaModel.NewRelationRegisterTicket('NGEstado', '', 0, 2147483647, pvNone, 'PessoaFisica possui estadoCertificadoReservista', 'NGPessoaFisica', 'EstCertificadoReservista', 1, 1, pvNone, False, False);
  if lRelationTicket <> nil then (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewOneToManyDbRelationMapRegisterTicket(lRelationTicket, 'CGRBIDESRE');
  
  lRelationTicket := piMetaModel.NewRelationRegisterTicket('NGNatureza', '', 0, 2147483647, pvNone, 'User has nature', 'NGUser', 'Natureza', 1, 1, pvNone, False, False);
  if lRelationTicket <> nil then (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewOneToManyDbRelationMapRegisterTicket(lRelationTicket, 'SEGAIDNAUS');
  
  lRelationTicket := piMetaModel.NewRelationRegisterTicket('NGNatureza', 'Systems', 0, 2147483647, pvNone, 'User nature can access systems', 'ngSystem', '', 0, 2147483647, pvNone, False, False);
  if lRelationTicket <> nil then (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewManyToManyDbRelationMapRegisterTicket(lRelationTicket, 'SEGEIDNAUS', 'SEGEIDSIST', 'SEGETSINAU');
  
  lRelationTicket := piMetaModel.NewRelationRegisterTicket('NGNaturezaConta', '', 0, 2147483647, pvNone, 'Conta possui Natureza', 'NGConta', 'Natureza', 1, 1, pvNone, False, False);
  if lRelationTicket <> nil then (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewOneToManyDbRelationMapRegisterTicket(lRelationTicket, 'FICCIDNATC');
  
  lRelationTicket := piMetaModel.NewRelationRegisterTicket('NGPessoa', '', 0, 2147483647, pvNone, 'Pessoa atua como Funcionario', 'NGFuncionario', 'Pessoa', 1, 1, pvNone, False, False);
  if lRelationTicket <> nil then (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewOneToManyDbRelationMapRegisterTicket(lRelationTicket, 'CGROIDPESS');
  
  lRelationTicket := piMetaModel.NewRelationRegisterTicket('NGPessoa', '', 0, 2147483647, pvNone, 'Pessoa atua como Usuario_', 'NGUsuario', 'Pessoa', 1, 1, pvNone, False, False);
  if lRelationTicket <> nil then (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewOneToManyDbRelationMapRegisterTicket(lRelationTicket, 'SEGAIDPESS');
  
  lRelationTicket := piMetaModel.NewRelationRegisterTicket('NGPessoa', 'Enderecos', 0, 2147483647, pvNone, 'Pessoa possui Endereços', 'NGEndereco', 'Pessoa', 1, 1, pvNone, True, False);
  if lRelationTicket <> nil then (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewOneToManyDbRelationMapRegisterTicket(lRelationTicket, 'CGRFIDPESS');
  
  lRelationTicket := piMetaModel.NewRelationRegisterTicket('NGPessoaFisica', '', 0, 2147483647, pvNone, 'Pessoa atua como Usuario', 'NGUsuario', 'Pessoa', 1, 1, pvNone, False, False);
  if lRelationTicket <> nil then (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewOneToManyDbRelationMapRegisterTicket(lRelationTicket, 'SEGAIDPESS');
  
  lRelationTicket := piMetaModel.NewRelationRegisterTicket('NGPessoaFisica', 'Foto', 1, 1, pvNone, 'pessoa física possui Foto', 'NGFotoPessoaFisica', 'PessoaFisica', 1, 1, pvNone, True, False);
  if lRelationTicket <> nil then (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewOneToOneDbRelationMapRegisterTicket(lRelationTicket, 'CGRSIDPEFI');
  
  lRelationTicket := piMetaModel.NewRelationRegisterTicket('NGPessoaFisica', 'LocalNascEstrangeiro', 1, 1, pvNone, 'pessoa física possui local de nascimento', 'NGLocalNascEstrangeiro', 'PessoaFisica', 1, 1, pvNone, True, False);
  if lRelationTicket <> nil then (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewOneToOneDbRelationMapRegisterTicket(lRelationTicket, 'CGRIIDPEFI');
  
  lRelationTicket := piMetaModel.NewRelationRegisterTicket('NGUser', 'PermissionSecurityEvents', 0, 2147483647, pvNone, 'User generate security events', 'ngEvent', 'User', 1, 1, pvNone, True, False);
  if lRelationTicket <> nil then (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewOneToManyDbRelationMapRegisterTicket(lRelationTicket, 'SEGCIDUSUA');
  
  lRelationTicket := piMetaModel.NewRelationRegisterTicket('NGUser', 'Permissions', 0, 2147483647, pvNone, 'User has Permissions', 'ngPermission', 'User', 1, 1, pvNone, True, False);
  if lRelationTicket <> nil then (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewOneToManyDbRelationMapRegisterTicket(lRelationTicket, 'SEGBIDUSUA');
  
  lRelationTicket := piMetaModel.NewRelationRegisterTicket('NGUser', 'SecurityEvents', 0, 2147483647, pvNone, 'User has security events', 'ngEvent', 'AuthorizedUser', 1, 1, pvNone, True, False);
  if lRelationTicket <> nil then (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewOneToManyDbRelationMapRegisterTicket(lRelationTicket, 'SEGCIDRESP');
  
  lRelationTicket := piMetaModel.NewRelationRegisterTicket('NGUsuario', '', 0, 2147483647, pvNone, 'Funcionario possui Usuário', 'NGFuncionario', 'Usuario', 1, 1, pvNone, False, False);
  if lRelationTicket <> nil then (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewOneToManyDbRelationMapRegisterTicket(lRelationTicket, 'CGROIDUSUA');
  
  lRelationTicket := piMetaModel.NewRelationRegisterTicket('ngCategory', 'UseCases', 0, 2147483647, pvNone, 'Usecases have a category', 'ngUseCaseTicket', 'Category', 1, 1, pvNone, True, False);
  if lRelationTicket <> nil then (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewOneToManyDbRelationMapRegisterTicket(lRelationTicket, 'IESBIDCATE');
  
  lRelationTicket := piMetaModel.NewRelationRegisterTicket('ngEntity', 'UseCases', 0, 2147483647, pvNone, 'Entity has Usecases', 'ngUseCaseTicket', 'Entity', 1, 1, pvNone, True, False);
  if lRelationTicket <> nil then (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewOneToManyDbRelationMapRegisterTicket(lRelationTicket, 'IESBIDENTI');
  
  lRelationTicket := piMetaModel.NewRelationRegisterTicket('ngGUITicket', 'SystemGUIs', 0, 2147483647, pvNone, 'System GUIs have GUI', 'ngSystemGUITickets', 'GUI', 1, 1, pvNone, True, False);
  if lRelationTicket <> nil then (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewOneToManyDbRelationMapRegisterTicket(lRelationTicket, 'IESPIDINTE');
  
  lRelationTicket := piMetaModel.NewRelationRegisterTicket('ngIcon', 'UseCases', 0, 2147483647, pvNone, 'Usecases have an icon', 'ngUseCaseTicket', 'Icon', 1, 1, pvNone, True, False);
  if lRelationTicket <> nil then (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewOneToManyDbRelationMapRegisterTicket(lRelationTicket, 'IESBIDCUIC');
  
  lRelationTicket := piMetaModel.NewRelationRegisterTicket('ngOperation', 'UseCaseOperations', 0, 2147483647, pvNone, 'UseCase operations has operation', 'ngUseCaseTicketOperation', 'Operation', 1, 1, pvNone, True, False);
  if lRelationTicket <> nil then (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewOneToManyDbRelationMapRegisterTicket(lRelationTicket, 'IESGIDOPER');
  
  lRelationTicket := piMetaModel.NewRelationRegisterTicket('ngSystem', 'SystemGUIs', 0, 2147483647, pvNone, 'System has GUIs', 'ngSystemGUITickets', 'System', 1, 1, pvNone, True, False);
  if lRelationTicket <> nil then (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewOneToManyDbRelationMapRegisterTicket(lRelationTicket, 'IESPIDSIST');
  
  lRelationTicket := piMetaModel.NewRelationRegisterTicket('ngSystem', 'Levels', 0, 2147483647, pvNone, 'System has Levels', 'ngLevel', 'System', 1, 1, pvNone, True, False);
  if lRelationTicket <> nil then (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewOneToManyDbRelationMapRegisterTicket(lRelationTicket, 'IESHIDSIST');
  
  lRelationTicket := piMetaModel.NewRelationRegisterTicket('ngSystem', 'Permissions', 0, 2147483647, pvNone, 'System has permissions', 'ngPermission', 'System', 1, 1, pvNone, True, False);
  if lRelationTicket <> nil then (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewOneToManyDbRelationMapRegisterTicket(lRelationTicket, 'SEGBIDSIST');
  
  lRelationTicket := piMetaModel.NewRelationRegisterTicket('ngSystem', 'Events', 0, 2147483647, pvNone, 'System has security events', 'ngEvent', '', 1, 1, pvNone, False, False);
  if lRelationTicket <> nil then (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewOneToManyDbRelationMapRegisterTicket(lRelationTicket, 'SEGCIDSIST');
  
  lRelationTicket := piMetaModel.NewRelationRegisterTicket('ngSystem', 'UseCases', 0, 2147483647, pvNone, 'System has usecases', 'ngUseCaseTicket', 'Systems', 0, 2147483647, pvNone, True, False);
  if lRelationTicket <> nil then (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewManyToManyDbRelationMapRegisterTicket(lRelationTicket, 'IESEIDSIST', 'IESEIDCASO', 'IESETSISCU');
  
  lRelationTicket := piMetaModel.NewRelationRegisterTicket('ngUseCaseTicket', 'SystemGUIs', 0, 2147483647, pvNone, 'UseCase has system GUIs', 'ngSystemGUITickets', 'UseCase', 1, 1, pvNone, True, False);
  if lRelationTicket <> nil then (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewOneToManyDbRelationMapRegisterTicket(lRelationTicket, 'IESPIDCASO');
  
  lRelationTicket := piMetaModel.NewRelationRegisterTicket('ngUseCaseTicket', 'UseCaseOperations', 0, 2147483647, pvNone, 'Usecase has usecase operations', 'ngUseCaseTicketOperation', 'UseCase', 1, 1, pvNone, True, False);
  if lRelationTicket <> nil then (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewOneToManyDbRelationMapRegisterTicket(lRelationTicket, 'IESGIDCASO');
  
  lRelationTicket := piMetaModel.NewRelationRegisterTicket('ngUseCaseTicketOperation', 'Events', 0, 2147483647, pvNone, 'Use Case Operations have security events', 'ngEvent', '', 1, 1, pvNone, False, False);
  if lRelationTicket <> nil then (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewOneToManyDbRelationMapRegisterTicket(lRelationTicket, 'SEGCIDCUOP');
  
  lRelationTicket := piMetaModel.NewRelationRegisterTicket('ngUseCaseTicketOperation', 'Permissions', 0, 2147483647, pvNone, 'UseCase Operation has permissions', 'ngPermission', 'UseCaseOperation', 1, 1, pvNone, True, False);
  if lRelationTicket <> nil then (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewOneToManyDbRelationMapRegisterTicket(lRelationTicket, 'SEGBIDCUOP');
  
  lRelationTicket := piMetaModel.NewRelationRegisterTicket('ngUseCaseTicketOperation', 'Levels', 0, 2147483647, pvNone, 'Usecase Operations has levels', 'ngLevel', 'UseCaseOperations', 0, 2147483647, pvNone, True, False);
  if lRelationTicket <> nil then (piMetaModel.DefaultMetaModelPersistenceMap as acMetaModelPersistenceMapSql).NewManyToManyDbRelationMapRegisterTicket(lRelationTicket, 'IESIIDCUOP', 'IESIIDLEVE', 'IESITOPLEV');
  
end;

procedure NewUseCaseTicket_ucImportaConfiguracaoSistema_1327(piMetaModel: acMetaModel);
var
  lUseCaseTicket: acUseCaseTicket;
begin
  //Criação do UseCaseTicket ucImportaConfiguracaoSistema (1327)
    lUseCaseTicket := piMetaModel.NewUseCaseTicket('1327', nil, True);
    lUseCaseTicket.Name := 'ucImportaConfiguracaoSistema';
    lUseCaseTicket.InheritsFrom := 'ucUseCase';
end;

procedure NewUseCaseTicket_ucExplorerV4_1432(piMetaModel: acMetaModel);
var
  lUseCaseTicket: acUseCaseTicket;
begin
  //Criação do UseCaseTicket ucExplorerV4 (1432)
    lUseCaseTicket := piMetaModel.NewUseCaseTicket('1432', nil, True);
    lUseCaseTicket.Name := 'ucExplorerV4';
    lUseCaseTicket.InheritsFrom := 'ucUseCase';
end;

procedure NewUseCaseTicket_ucCadastroNatureza_1360(piMetaModel: acMetaModel);
var
  lUseCaseTicket: acUseCaseTicket;
begin
  //Criação do UseCaseTicket ucCadastroNatureza (1360)
    lUseCaseTicket := piMetaModel.NewUseCaseTicket('1360', nil, True);
    lUseCaseTicket.Name := 'ucCadastroNatureza';
    lUseCaseTicket.InheritsFrom := 'ucUseCase';
end;

procedure NewUseCaseTicket_ucDetalhesAtualizacaoSistema_1359(piMetaModel: acMetaModel);
var
  lUseCaseTicket: acUseCaseTicket;
begin
  //Criação do UseCaseTicket ucDetalhesAtualizacaoSistema (1359)
    lUseCaseTicket := piMetaModel.NewUseCaseTicket('1359', nil, True);
    lUseCaseTicket.Name := 'ucDetalhesAtualizacaoSistema';
    lUseCaseTicket.InheritsFrom := 'ucUseCase';
end;

procedure NewUseCaseTicket_ucControleAcesso_104(piMetaModel: acMetaModel);
var
  lUseCaseTicket: acUseCaseTicket;
begin
  //Criação do UseCaseTicket ucControleAcesso (104)
    lUseCaseTicket := piMetaModel.NewUseCaseTicket('104', nil, True);
    lUseCaseTicket.Name := 'ucControleAcesso';
    lUseCaseTicket.InheritsFrom := 'ucUseCase';
end;

procedure NewUseCaseTicket_ucCadastroPerfil_1963(piMetaModel: acMetaModel);
var
  lUseCaseTicket: acUseCaseTicket;
begin
  //Criação do UseCaseTicket ucCadastroPerfil (1963)
    lUseCaseTicket := piMetaModel.NewUseCaseTicket('1963', nil, False);
    lUseCaseTicket.Name := 'ucCadastroPerfil';
    lUseCaseTicket.InheritsFrom := 'ucUseCase';
end;

procedure NewUseCaseTicket_ucCadastroUsuarioSistema_101(piMetaModel: acMetaModel);
var
  lUseCaseTicket: acUseCaseTicket;
begin
  //Criação do UseCaseTicket ucCadastroUsuarioSistema (101)
    lUseCaseTicket := piMetaModel.NewUseCaseTicket('101', nil, True);
    lUseCaseTicket.Name := 'ucCadastroUsuarioSistema';
    lUseCaseTicket.InheritsFrom := 'ucUseCase';
end;

procedure RegisterUseCases(piMetaModel: acMetaModel);
var
  lUseCaseTicket: acUseCaseTicket;
  lSubMachineUseCaseTicket: acUseCaseTicket;
  lStateMachine: acUseCaseStateMachine;
  lSubMachineState: utSubMachineState;
  lState: utState;
  lTransition: utTransition;
begin
    NewUseCaseTicket_ucImportaConfiguracaoSistema_1327(piMetaModel);
    NewUseCaseTicket_ucExplorerV4_1432(piMetaModel);
    NewUseCaseTicket_ucCadastroNatureza_1360(piMetaModel);
    NewUseCaseTicket_ucDetalhesAtualizacaoSistema_1359(piMetaModel);
    NewUseCaseTicket_ucControleAcesso_104(piMetaModel);
    NewUseCaseTicket_ucCadastroPerfil_1963(piMetaModel);
    NewUseCaseTicket_ucCadastroUsuarioSistema_101(piMetaModel);
  
    //Gerando StateMachine para o casu de uso 'ucImportaConfiguracaoSistema'
    lUseCaseTicket := piMetaModel.UseCaseTicketByCode['1327'];
    lStateMachine := lUseCaseTicket.StateMachine;
  
    lStateMachine.Name := 'smServer';
    utState.Create(lStateMachine, 'Initializing');
    lSubMachineState := utSubMachineState.Create(lStateMachine, 'UseCaseSubmachine');
    lSubMachineUseCaseTicket := piMetaModel.UseCaseTicketByCode['1327'];
    lSubMachineState.StateMachine := acUseCaseStateMachine.Create(lSubMachineUseCaseTicket, lSubMachineState);
    utFinalState.Create(lStateMachine, 'smBase_FinalState');
  
  //Define o InitialState do StateMachine
    lStateMachine.InitialState := lStateMachine.FindState('Initializing');
  
  //Adiciona as transicoes dos estados
    lState := lStateMachine.FindState('Initializing');
    lTransition := lState.NewOutgoingTransition('READY');
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('UseCaseSubmachine');
    lTransition.AddTrigger('READY');
  
    lState := lStateMachine.FindState('UseCaseSubmachine');
    lTransition := lState.NewOutgoingTransition('ABORT');
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('smBase_FinalState');
    lTransition.AddTrigger('UM_ABORT','4');
    lTransition.AddEffect('EFFECT_Abort');
    lTransition := lState.NewOutgoingTransition('TIMEOUTCHECK');
    lTransition.SourceState := lState;
    lTransition.TargetState := lState;
    lTransition.AddTrigger('RM_TIMEOUT_CHECK','16');
    lTransition.AddEffect('EFFECT_TimeOutCheck');
    lTransition := lState.NewOutgoingTransition('GETTRIGGERSFROMCURRENTSTATE');
    lTransition.SourceState := lState;
    lTransition.TargetState := lState;
    lTransition.AddTrigger('RM_GET_TRIGGERS_FROM_CURRENT_STATE');
    lTransition.AddEffect('EFFECT_GetTriggersFromCurrentState');
    lTransition := lState.NewOutgoingTransition('GETXSDBYTRIGGERFROMCURRENTSTATE');
    lTransition.SourceState := lState;
    lTransition.TargetState := lState;
    lTransition.AddTrigger('RM_GET_XSD_BY_TRIGGER_FROM_CURRENT_STATE');
    lTransition.AddEffect('EFFECT_GetXSDByTriggerFromCurrentState');
  
  
  // SUBSTATEMACHINE smImportaConfiguracaoSistema ///////////////////////
    lStateMachine := lUseCaseTicket.FindStateMachine('smServer');
    lStateMachine := utSubMachineState(lStateMachine.FindState('UseCaseSubmachine')).StateMachine as acUseCaseStateMachine;
    lStateMachine.Name := 'smImportaConfiguracaoSistema';
    utState.Create(lStateMachine, 'AguardandoXML');
    utState.Create(lStateMachine, 'XMLCarregado_AlteracoesMapeadas');
    utFinalState.Create(lStateMachine, 'FinalState1');
  
  //Define o InitialState do StateMachine
    lStateMachine.InitialState := lStateMachine.FindState('AguardandoXML');
  
  //Adiciona as transicoes dos estados
    lState := lStateMachine.FindState('AguardandoXML');
    lTransition := lState.NewOutgoingTransition('RM_CARREGARXML');
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('XMLCarregado_AlteracoesMapeadas');
    lTransition.AddTrigger('RM_CARREGARXML');
    lTransition.AddEffect('EFFECT_CARREGARXML');
    lTransition := lState.NewOutgoingTransition('RM_IMPORTA_CONFIGURACAO');
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('FinalState1');
    lTransition.AddTrigger('RM_IMPORTA_CONFIGURACAO');
    lTransition.AddEffect('EFFECT_IMPORTA_CONFIGURACAO');
  
    lState := lStateMachine.FindState('XMLCarregado_AlteracoesMapeadas');
    lTransition := lState.NewOutgoingTransition('RM_APLICAR_ALTERACOES');
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('FinalState1');
    lTransition.AddTrigger('RM_APLICAR_ALTERACOES');
    lTransition.AddEffect('EFFECT_APLICAR_ALTERACOES');
  
  
  
    //Gerando StateMachine para o casu de uso 'ucExplorerV4'
    lUseCaseTicket := piMetaModel.UseCaseTicketByCode['1432'];
    lStateMachine := lUseCaseTicket.StateMachine;
  
    lStateMachine.Name := 'smServer';
    utState.Create(lStateMachine, 'Initializing');
    lSubMachineState := utSubMachineState.Create(lStateMachine, 'UseCaseSubmachine');
    lSubMachineUseCaseTicket := piMetaModel.UseCaseTicketByCode['1432'];
    lSubMachineState.StateMachine := acUseCaseStateMachine.Create(lSubMachineUseCaseTicket, lSubMachineState);
    utFinalState.Create(lStateMachine, 'smBase_FinalState');
  
  //Define o InitialState do StateMachine
    lStateMachine.InitialState := lStateMachine.FindState('Initializing');
  
  //Adiciona as transicoes dos estados
    lState := lStateMachine.FindState('Initializing');
    lTransition := lState.NewOutgoingTransition('READY');
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('UseCaseSubmachine');
    lTransition.AddTrigger('READY');
  
    lState := lStateMachine.FindState('UseCaseSubmachine');
    lTransition := lState.NewOutgoingTransition('ABORT');
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('smBase_FinalState');
    lTransition.AddTrigger('UM_ABORT','4');
    lTransition.AddEffect('EFFECT_Abort');
    lTransition := lState.NewOutgoingTransition('TIMEOUTCHECK');
    lTransition.SourceState := lState;
    lTransition.TargetState := lState;
    lTransition.AddTrigger('RM_TIMEOUT_CHECK','16');
    lTransition.AddEffect('EFFECT_TimeOutCheck');
    lTransition := lState.NewOutgoingTransition('GETTRIGGERSFROMCURRENTSTATE');
    lTransition.SourceState := lState;
    lTransition.TargetState := lState;
    lTransition.AddTrigger('RM_GET_TRIGGERS_FROM_CURRENT_STATE');
    lTransition.AddEffect('EFFECT_GetTriggersFromCurrentState');
    lTransition := lState.NewOutgoingTransition('GETXSDBYTRIGGERFROMCURRENTSTATE');
    lTransition.SourceState := lState;
    lTransition.TargetState := lState;
    lTransition.AddTrigger('RM_GET_XSD_BY_TRIGGER_FROM_CURRENT_STATE');
    lTransition.AddEffect('EFFECT_GetXSDByTriggerFromCurrentState');
  
  
  // SUBSTATEMACHINE smExplorerV4 ///////////////////////
    lStateMachine := lUseCaseTicket.FindStateMachine('smServer');
    lStateMachine := utSubMachineState(lStateMachine.FindState('UseCaseSubmachine')).StateMachine as acUseCaseStateMachine;
    lStateMachine.Name := 'smExplorerV4';
    utState.Create(lStateMachine, 'Aguardando');
  
  //Define o InitialState do StateMachine
    lStateMachine.InitialState := lStateMachine.FindState('Aguardando');
  
  //Adiciona as transicoes dos estados
    lState := lStateMachine.FindState('Aguardando');
    lTransition := lState.NewOutgoingTransition('RM_EXECUTE_OQL');
    lTransition.SourceState := lState;
    lTransition.TargetState := lState;
    lTransition.AddTrigger('RM_EXECUTE_OQL');
    lTransition.AddEffect('EFFECT_EXECUTE_OQL');
    lTransition := lState.NewOutgoingTransition('RM_GET_OBJECT_DATA');
    lTransition.SourceState := lState;
    lTransition.TargetState := lState;
    lTransition.AddTrigger('RM_GET_OBJECT_DATA');
    lTransition.AddEffect('EFFECT_GET_OBJECT_DATA');
    lTransition := lState.NewOutgoingTransition('RM_EXECUTE_SQL');
    lTransition.SourceState := lState;
    lTransition.TargetState := lState;
    lTransition.AddTrigger('RM_EXECUTE_SQL');
    lTransition.AddEffect('EFFECT_EXECUTE_SQL');
    lTransition := lState.NewOutgoingTransition('RM_GET_MODEL_OBJECT_DATA');
    lTransition.SourceState := lState;
    lTransition.TargetState := lState;
    lTransition.AddTrigger('RM_GET_MODEL_OBJECT_DATA');
    lTransition.AddEffect('EFFECT_GET_MODEL_OBJECT_DATA');
    lTransition := lState.NewOutgoingTransition('RM_GET_OQL_FROM_OBJECT');
    lTransition.SourceState := lState;
    lTransition.TargetState := lState;
    lTransition.AddTrigger('RM_GET_OQL_FROM_OBJECT');
    lTransition.AddEffect('EFFECT_GET_OQL_FROM_OBJECT');
  
  
  
    //Gerando StateMachine para o casu de uso 'ucCadastroNatureza'
    lUseCaseTicket := piMetaModel.UseCaseTicketByCode['1360'];
    lStateMachine := lUseCaseTicket.StateMachine;
  
    lStateMachine.Name := 'smServer';
    utState.Create(lStateMachine, 'Initializing');
    lSubMachineState := utSubMachineState.Create(lStateMachine, 'UseCaseSubmachine');
    lSubMachineUseCaseTicket := piMetaModel.UseCaseTicketByCode['1360'];
    lSubMachineState.StateMachine := acUseCaseStateMachine.Create(lSubMachineUseCaseTicket, lSubMachineState);
    utFinalState.Create(lStateMachine, 'smBase_FinalState');
  
  //Define o InitialState do StateMachine
    lStateMachine.InitialState := lStateMachine.FindState('Initializing');
  
  //Adiciona as transicoes dos estados
    lState := lStateMachine.FindState('Initializing');
    lTransition := lState.NewOutgoingTransition('READY');
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('UseCaseSubmachine');
    lTransition.AddTrigger('READY');
  
    lState := lStateMachine.FindState('UseCaseSubmachine');
    lTransition := lState.NewOutgoingTransition('ABORT');
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('smBase_FinalState');
    lTransition.AddTrigger('UM_ABORT','4');
    lTransition.AddEffect('EFFECT_Abort');
    lTransition := lState.NewOutgoingTransition('TIMEOUTCHECK');
    lTransition.SourceState := lState;
    lTransition.TargetState := lState;
    lTransition.AddTrigger('RM_TIMEOUT_CHECK','16');
    lTransition.AddEffect('EFFECT_TimeOutCheck');
    lTransition := lState.NewOutgoingTransition('GETTRIGGERSFROMCURRENTSTATE');
    lTransition.SourceState := lState;
    lTransition.TargetState := lState;
    lTransition.AddTrigger('RM_GET_TRIGGERS_FROM_CURRENT_STATE');
    lTransition.AddEffect('EFFECT_GetTriggersFromCurrentState');
    lTransition := lState.NewOutgoingTransition('GETXSDBYTRIGGERFROMCURRENTSTATE');
    lTransition.SourceState := lState;
    lTransition.TargetState := lState;
    lTransition.AddTrigger('RM_GET_XSD_BY_TRIGGER_FROM_CURRENT_STATE');
    lTransition.AddEffect('EFFECT_GetXSDByTriggerFromCurrentState');
  
  
  // SUBSTATEMACHINE smCadastroNatureza ///////////////////////
    lStateMachine := lUseCaseTicket.FindStateMachine('smServer');
    lStateMachine := utSubMachineState(lStateMachine.FindState('UseCaseSubmachine')).StateMachine as acUseCaseStateMachine;
    lStateMachine.Name := 'smCadastroNatureza';
    utState.Create(lStateMachine, 'stEditando');
    utState.Create(lStateMachine, 'stConsultando');
    utState.Create(lStateMachine, 'stAguardando');
  
  //Define o InitialState do StateMachine
    lStateMachine.InitialState := lStateMachine.FindState('stEditando');
  
  //Adiciona as transicoes dos estados
    lState := lStateMachine.FindState('stEditando');
    lTransition := lState.NewOutgoingTransition('RM_OBTEM_CONTEXTO');
    lTransition.SourceState := lState;
    lTransition.TargetState := lState;
    lTransition.AddTrigger('RM_OBTEM_CONTEXTO');
    lTransition.AddEffect('EFFECT_MontaContexto');
    lTransition := lState.NewOutgoingTransition('RM_SALVA_OBJETO');
    lTransition.GuardCondition := 'GUARD_ValidaObjeto';
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('stConsultando');
    lTransition.AddTrigger('RM_SALVA_OBJETO');
    lTransition.AddEffect('EFFECT_SalvaObjeto');
    lTransition := lState.NewOutgoingTransition('RM_EXCLUI_OBJETO');
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('stAguardando');
    lTransition.AddTrigger('RM_EXCLUI_OBJETO');
    lTransition.AddEffect('EFFECT_ExcluiObjeto');
    lTransition := lState.NewOutgoingTransition('RM_VALIDA_OBJETO');
    lTransition.GuardCondition := 'GUARD_ValidaObjeto';
    lTransition.SourceState := lState;
    lTransition.TargetState := lState;
    lTransition.AddTrigger('RM_VALIDA_OBJETO');
  
    lState := lStateMachine.FindState('stConsultando');
    lTransition := lState.NewOutgoingTransition('RM_INCLUI_OBJETO');
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('stEditando');
    lTransition.AddTrigger('RM_INCLUI_OBJETO');
    lTransition.AddEffect('EFFECT_IncluiObjeto');
    lTransition := lState.NewOutgoingTransition('RM_EDITA_OBJETO');
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('stEditando');
    lTransition.AddTrigger('RM_EDITA_OBJETO');
    lTransition.AddEffect('EFFECT_MontaContexto');
    lTransition := lState.NewOutgoingTransition('RM_EXCLUI_OBJETO');
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('stAguardando');
    lTransition.AddTrigger('RM_EXCLUI_OBJETO');
    lTransition.AddEffect('EFFECT_ExcluiObjeto');
  
    lState := lStateMachine.FindState('stAguardando');
    lTransition := lState.NewOutgoingTransition('RM_INCLUI_OBJETO');
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('stEditando');
    lTransition.AddTrigger('RM_INCLUI_OBJETO');
    lTransition.AddEffect('EFFECT_IncluiObjeto');
  
  
  
    //Gerando StateMachine para o casu de uso 'ucDetalhesAtualizacaoSistema'
    lUseCaseTicket := piMetaModel.UseCaseTicketByCode['1359'];
    lStateMachine := lUseCaseTicket.StateMachine;
  
    lStateMachine.Name := 'smServer';
    utState.Create(lStateMachine, 'Initializing');
    lSubMachineState := utSubMachineState.Create(lStateMachine, 'UseCaseSubmachine');
    lSubMachineUseCaseTicket := piMetaModel.UseCaseTicketByCode['1359'];
    lSubMachineState.StateMachine := acUseCaseStateMachine.Create(lSubMachineUseCaseTicket, lSubMachineState);
    utFinalState.Create(lStateMachine, 'smBase_FinalState');
  
  //Define o InitialState do StateMachine
    lStateMachine.InitialState := lStateMachine.FindState('Initializing');
  
  //Adiciona as transicoes dos estados
    lState := lStateMachine.FindState('Initializing');
    lTransition := lState.NewOutgoingTransition('READY');
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('UseCaseSubmachine');
    lTransition.AddTrigger('READY');
  
    lState := lStateMachine.FindState('UseCaseSubmachine');
    lTransition := lState.NewOutgoingTransition('ABORT');
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('smBase_FinalState');
    lTransition.AddTrigger('UM_ABORT','4');
    lTransition.AddEffect('EFFECT_Abort');
    lTransition := lState.NewOutgoingTransition('TIMEOUTCHECK');
    lTransition.SourceState := lState;
    lTransition.TargetState := lState;
    lTransition.AddTrigger('RM_TIMEOUT_CHECK','16');
    lTransition.AddEffect('EFFECT_TimeOutCheck');
    lTransition := lState.NewOutgoingTransition('GETTRIGGERSFROMCURRENTSTATE');
    lTransition.SourceState := lState;
    lTransition.TargetState := lState;
    lTransition.AddTrigger('RM_GET_TRIGGERS_FROM_CURRENT_STATE');
    lTransition.AddEffect('EFFECT_GetTriggersFromCurrentState');
    lTransition := lState.NewOutgoingTransition('GETXSDBYTRIGGERFROMCURRENTSTATE');
    lTransition.SourceState := lState;
    lTransition.TargetState := lState;
    lTransition.AddTrigger('RM_GET_XSD_BY_TRIGGER_FROM_CURRENT_STATE');
    lTransition.AddEffect('EFFECT_GetXSDByTriggerFromCurrentState');
  
  
  // SUBSTATEMACHINE smDetalhesAtualizacaoSistema ///////////////////////
    lStateMachine := lUseCaseTicket.FindStateMachine('smServer');
    lStateMachine := utSubMachineState(lStateMachine.FindState('UseCaseSubmachine')).StateMachine as acUseCaseStateMachine;
    lStateMachine.Name := 'smDetalhesAtualizacaoSistema';
    utState.Create(lStateMachine, 'Executando');
    utFinalState.Create(lStateMachine, 'FinalState1');
  
  //Define o InitialState do StateMachine
    lStateMachine.InitialState := lStateMachine.FindState('Executando');
  
  //Adiciona as transicoes dos estados
    lState := lStateMachine.FindState('Executando');
    lTransition := lState.NewOutgoingTransition('RM_RETORNA_XML');
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('FinalState1');
    lTransition.AddTrigger('RM_RETORNA_XML');
    lTransition.AddEffect('EFFECT_RETORNA_XML');
  
  
  
    //Gerando StateMachine para o casu de uso 'ucControleAcesso'
    lUseCaseTicket := piMetaModel.UseCaseTicketByCode['104'];
    lStateMachine := lUseCaseTicket.StateMachine;
  
    lStateMachine.Name := 'smServer';
    utState.Create(lStateMachine, 'Initializing');
    lSubMachineState := utSubMachineState.Create(lStateMachine, 'UseCaseSubmachine');
    lSubMachineUseCaseTicket := piMetaModel.UseCaseTicketByCode['104'];
    lSubMachineState.StateMachine := acUseCaseStateMachine.Create(lSubMachineUseCaseTicket, lSubMachineState);
    utFinalState.Create(lStateMachine, 'smBase_FinalState');
  
  //Define o InitialState do StateMachine
    lStateMachine.InitialState := lStateMachine.FindState('Initializing');
  
  //Adiciona as transicoes dos estados
    lState := lStateMachine.FindState('Initializing');
    lTransition := lState.NewOutgoingTransition('READY');
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('UseCaseSubmachine');
    lTransition.AddTrigger('READY');
  
    lState := lStateMachine.FindState('UseCaseSubmachine');
    lTransition := lState.NewOutgoingTransition('ABORT');
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('smBase_FinalState');
    lTransition.AddTrigger('UM_ABORT','4');
    lTransition.AddEffect('EFFECT_Abort');
    lTransition := lState.NewOutgoingTransition('TIMEOUTCHECK');
    lTransition.SourceState := lState;
    lTransition.TargetState := lState;
    lTransition.AddTrigger('RM_TIMEOUT_CHECK','16');
    lTransition.AddEffect('EFFECT_TimeOutCheck');
    lTransition := lState.NewOutgoingTransition('GETTRIGGERSFROMCURRENTSTATE');
    lTransition.SourceState := lState;
    lTransition.TargetState := lState;
    lTransition.AddTrigger('RM_GET_TRIGGERS_FROM_CURRENT_STATE');
    lTransition.AddEffect('EFFECT_GetTriggersFromCurrentState');
    lTransition := lState.NewOutgoingTransition('GETXSDBYTRIGGERFROMCURRENTSTATE');
    lTransition.SourceState := lState;
    lTransition.TargetState := lState;
    lTransition.AddTrigger('RM_GET_XSD_BY_TRIGGER_FROM_CURRENT_STATE');
    lTransition.AddEffect('EFFECT_GetXSDByTriggerFromCurrentState');
  
  
  // SUBSTATEMACHINE smControleAcesso ///////////////////////
    lStateMachine := lUseCaseTicket.FindStateMachine('smServer');
    lStateMachine := utSubMachineState(lStateMachine.FindState('UseCaseSubmachine')).StateMachine as acUseCaseStateMachine;
    lStateMachine.Name := 'smControleAcesso';
    utState.Create(lStateMachine, 'Inicializando');
    utState.Create(lStateMachine, 'Executando');
  
  //Define o InitialState do StateMachine
    lStateMachine.InitialState := lStateMachine.FindState('Inicializando');
  
  //Adiciona as transicoes dos estados
    lState := lStateMachine.FindState('Inicializando');
    lTransition := lState.NewOutgoingTransition('RM_INICIALIZAR_INTERFACE');
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('Executando');
    lTransition.AddTrigger('RM_INICIALIZAR_INTERFACE');
    lTransition.AddEffect('EFFECT_INICIALIZAR_INTERFACE');
  
    lState := lStateMachine.FindState('Executando');
    lTransition := lState.NewOutgoingTransition('RM_CARREGAR_PERMISSOES');
    lTransition.SourceState := lState;
    lTransition.TargetState := lState;
    lTransition.AddTrigger('RM_CARREGAR_PERMISSOES');
    lTransition.AddEffect('EFFECT_CARREGAR_PERMISSOES');
    lTransition := lState.NewOutgoingTransition('RM_SALVAR');
    lTransition.SourceState := lState;
    lTransition.TargetState := lState;
    lTransition.AddTrigger('RM_SALVAR');
    lTransition.AddEffect('EFFECT_SALVAR');
  
  
  
    //Gerando StateMachine para o casu de uso 'ucCadastroPerfil'
    lUseCaseTicket := piMetaModel.UseCaseTicketByCode['1963'];
    lStateMachine := lUseCaseTicket.StateMachine;
  
    lStateMachine.Name := 'smServer';
    utState.Create(lStateMachine, 'Initializing');
    lSubMachineState := utSubMachineState.Create(lStateMachine, 'UseCaseSubmachine');
    lSubMachineUseCaseTicket := piMetaModel.UseCaseTicketByCode['1963'];
    lSubMachineState.StateMachine := acUseCaseStateMachine.Create(lSubMachineUseCaseTicket, lSubMachineState);
    utFinalState.Create(lStateMachine, 'smBase_FinalState');
  
  //Define o InitialState do StateMachine
    lStateMachine.InitialState := lStateMachine.FindState('Initializing');
  
  //Adiciona as transicoes dos estados
    lState := lStateMachine.FindState('Initializing');
    lTransition := lState.NewOutgoingTransition('READY');
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('UseCaseSubmachine');
    lTransition.AddTrigger('READY');
  
    lState := lStateMachine.FindState('UseCaseSubmachine');
    lTransition := lState.NewOutgoingTransition('ABORT');
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('smBase_FinalState');
    lTransition.AddTrigger('UM_ABORT','4');
    lTransition.AddEffect('EFFECT_Abort');
    lTransition := lState.NewOutgoingTransition('TIMEOUTCHECK');
    lTransition.SourceState := lState;
    lTransition.TargetState := lState;
    lTransition.AddTrigger('RM_TIMEOUT_CHECK','16');
    lTransition.AddEffect('EFFECT_TimeOutCheck');
    lTransition := lState.NewOutgoingTransition('GETTRIGGERSFROMCURRENTSTATE');
    lTransition.SourceState := lState;
    lTransition.TargetState := lState;
    lTransition.AddTrigger('RM_GET_TRIGGERS_FROM_CURRENT_STATE');
    lTransition.AddEffect('EFFECT_GetTriggersFromCurrentState');
    lTransition := lState.NewOutgoingTransition('GETXSDBYTRIGGERFROMCURRENTSTATE');
    lTransition.SourceState := lState;
    lTransition.TargetState := lState;
    lTransition.AddTrigger('RM_GET_XSD_BY_TRIGGER_FROM_CURRENT_STATE');
    lTransition.AddEffect('EFFECT_GetXSDByTriggerFromCurrentState');
  
  
  // SUBSTATEMACHINE smucCadastroPerfil ///////////////////////
    lStateMachine := lUseCaseTicket.FindStateMachine('smServer');
    lStateMachine := utSubMachineState(lStateMachine.FindState('UseCaseSubmachine')).StateMachine as acUseCaseStateMachine;
    lStateMachine.Name := 'smucCadastroPerfil';
    utState.Create(lStateMachine, 'stAguardando');
    utState.Create(lStateMachine, 'stEditando');
    utState.Create(lStateMachine, 'stConsultando');
  
  //Define o InitialState do StateMachine
    lStateMachine.InitialState := lStateMachine.FindState('stAguardando');
  
  //Adiciona as transicoes dos estados
    lState := lStateMachine.FindState('stAguardando');
    lTransition := lState.NewOutgoingTransition('RM_OBTEM_CONTEXTO');
    lTransition.SourceState := lState;
    lTransition.TargetState := lState;
    lTransition.AddTrigger('RM_OBTEM_CONTEXTO');
    lTransition.AddEffect('EFFECT_MontaContexto');
    lTransition := lState.NewOutgoingTransition('RM_INCLUI_OBJETO');
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('stEditando');
    lTransition.AddTrigger('RM_INCLUI_OBJETO');
    lTransition.AddEffect('EFFECT_IncluiObjeto');
    lTransition := lState.NewOutgoingTransition('RM_EXCLUI_OBJETO');
    lTransition.SourceState := lState;
    lTransition.TargetState := lState;
    lTransition.AddTrigger('RM_EXCLUI_OBJETO');
    lTransition.AddEffect('EFFECT_ExcluiObjeto');
    lTransition := lState.NewOutgoingTransition('RM_EDITA_OBJETO');
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('stEditando');
    lTransition.AddTrigger('RM_EDITA_OBJETO');
    lTransition.AddEffect('EFFECT_EditaObjeto');
    lTransition := lState.NewOutgoingTransition('RM_CONSULTA_OBJETO');
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('stConsultando');
    lTransition.AddTrigger('RM_CONSULTA_OBJETO');
    lTransition.AddEffect('Effect_ConsultaObjeto');
  
    lState := lStateMachine.FindState('stEditando');
    lTransition := lState.NewOutgoingTransition('RM_EXCLUI_OBJETO');
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('stAguardando');
    lTransition.AddTrigger('RM_EXCLUI_OBJETO');
    lTransition.AddEffect('EFFECT_ExcluiObjeto');
    lTransition := lState.NewOutgoingTransition('RM_SALVA_OBJETO');
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('stConsultando');
    lTransition.AddTrigger('RM_SALVA_OBJETO');
    lTransition.AddEffect('Effect_SalvaObjeto');
  
    lState := lStateMachine.FindState('stConsultando');
    lTransition := lState.NewOutgoingTransition('RM_INCLUI_OBJETO');
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('stEditando');
    lTransition.AddTrigger('RM_INCLUI_OBJETO');
    lTransition.AddEffect('EFFECT_IncluiObjeto');
    lTransition := lState.NewOutgoingTransition('RM_EDITA_OBJETO');
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('stEditando');
    lTransition.AddTrigger('RM_EDITA_OBJETO');
    lTransition.AddEffect('EFFECT_EditaObjeto');
    lTransition := lState.NewOutgoingTransition('RM_EXCLUI_OBJETO');
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('stAguardando');
    lTransition.AddTrigger('RM_EXCLUI_OBJETO');
    lTransition.AddEffect('EFFECT_ExcluiObjeto');
    lTransition := lState.NewOutgoingTransition('RM_CONSULTA_OBJETO');
    lTransition.SourceState := lState;
    lTransition.TargetState := lState;
    lTransition.AddTrigger('RM_CONSULTA_OBJETO');
    lTransition.AddEffect('Effect_ConsultaObjeto');
  
  
  
    //Gerando StateMachine para o casu de uso 'ucCadastroUsuarioSistema'
    lUseCaseTicket := piMetaModel.UseCaseTicketByCode['101'];
    lStateMachine := lUseCaseTicket.StateMachine;
  
    lStateMachine.Name := 'smServer';
    utState.Create(lStateMachine, 'Initializing');
    lSubMachineState := utSubMachineState.Create(lStateMachine, 'UseCaseSubmachine');
    lSubMachineUseCaseTicket := piMetaModel.UseCaseTicketByCode['101'];
    lSubMachineState.StateMachine := acUseCaseStateMachine.Create(lSubMachineUseCaseTicket, lSubMachineState);
    utFinalState.Create(lStateMachine, 'smBase_FinalState');
  
  //Define o InitialState do StateMachine
    lStateMachine.InitialState := lStateMachine.FindState('Initializing');
  
  //Adiciona as transicoes dos estados
    lState := lStateMachine.FindState('Initializing');
    lTransition := lState.NewOutgoingTransition('READY');
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('UseCaseSubmachine');
    lTransition.AddTrigger('READY');
  
    lState := lStateMachine.FindState('UseCaseSubmachine');
    lTransition := lState.NewOutgoingTransition('ABORT');
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('smBase_FinalState');
    lTransition.AddTrigger('UM_ABORT','4');
    lTransition.AddEffect('EFFECT_Abort');
    lTransition := lState.NewOutgoingTransition('TIMEOUTCHECK');
    lTransition.SourceState := lState;
    lTransition.TargetState := lState;
    lTransition.AddTrigger('RM_TIMEOUT_CHECK','16');
    lTransition.AddEffect('EFFECT_TimeOutCheck');
    lTransition := lState.NewOutgoingTransition('GETTRIGGERSFROMCURRENTSTATE');
    lTransition.SourceState := lState;
    lTransition.TargetState := lState;
    lTransition.AddTrigger('RM_GET_TRIGGERS_FROM_CURRENT_STATE');
    lTransition.AddEffect('EFFECT_GetTriggersFromCurrentState');
    lTransition := lState.NewOutgoingTransition('GETXSDBYTRIGGERFROMCURRENTSTATE');
    lTransition.SourceState := lState;
    lTransition.TargetState := lState;
    lTransition.AddTrigger('RM_GET_XSD_BY_TRIGGER_FROM_CURRENT_STATE');
    lTransition.AddEffect('EFFECT_GetXSDByTriggerFromCurrentState');
  
  
  // SUBSTATEMACHINE smCadastroUsuarioSistema ///////////////////////
    lStateMachine := lUseCaseTicket.FindStateMachine('smServer');
    lStateMachine := utSubMachineState(lStateMachine.FindState('UseCaseSubmachine')).StateMachine as acUseCaseStateMachine;
    lStateMachine.Name := 'smCadastroUsuarioSistema';
    utState.Create(lStateMachine, 'stConsultando');
    utState.Create(lStateMachine, 'stEditando');
    utState.Create(lStateMachine, 'stAguardando');
  
  //Define o InitialState do StateMachine
    lStateMachine.InitialState := lStateMachine.FindState('stConsultando');
  
  //Adiciona as transicoes dos estados
    lState := lStateMachine.FindState('stConsultando');
    lTransition := lState.NewOutgoingTransition('RM_INCLUI_OBJETO');
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('stEditando');
    lTransition.AddTrigger('RM_INCLUI_OBJETO');
    lTransition.AddEffect('EFFECT_IncluiObjeto');
    lTransition := lState.NewOutgoingTransition('RM_EDITA_OBJETO');
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('stEditando');
    lTransition.AddTrigger('RM_EDITA_OBJETO');
    lTransition.AddEffect('EFFECT_MontaContexto');
    lTransition := lState.NewOutgoingTransition('RM_EXCLUI_OBJETO');
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('stAguardando');
    lTransition.AddTrigger('RM_EXCLUI_OBJETO');
    lTransition.AddEffect('EFFECT_ExcluiObjeto');
    lTransition := lState.NewOutgoingTransition('RM_OBTEM_CONTEXTO');
    lTransition.SourceState := lState;
    lTransition.TargetState := lState;
    lTransition.AddTrigger('RM_OBTEM_CONTEXTO');
    lTransition.AddEffect('EFFECT_MontaContexto');
    lTransition := lState.NewOutgoingTransition('RM_SALVA_OBJETO');
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('stAguardando');
    lTransition.AddTrigger('RM_SALVA_OBJETO');
    lTransition.AddEffect('EFFECT_SalvaObjeto');
  
    lState := lStateMachine.FindState('stEditando');
    lTransition := lState.NewOutgoingTransition('RM_OBTEM_CONTEXTO');
    lTransition.SourceState := lState;
    lTransition.TargetState := lState;
    lTransition.AddTrigger('RM_OBTEM_CONTEXTO');
    lTransition.AddEffect('EFFECT_MontaContexto');
    lTransition := lState.NewOutgoingTransition('RM_SALVA_OBJETO');
    lTransition.GuardCondition := 'GUARD_ValidaObjeto';
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('stConsultando');
    lTransition.AddTrigger('RM_SALVA_OBJETO');
    lTransition.AddEffect('EFFECT_SalvaObjeto');
    lTransition := lState.NewOutgoingTransition('RM_EXCLUI_OBJETO');
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('stAguardando');
    lTransition.AddTrigger('RM_EXCLUI_OBJETO');
    lTransition.AddEffect('EFFECT_ExcluiObjeto');
    lTransition := lState.NewOutgoingTransition('RM_VALIDA_OBJETO');
    lTransition.GuardCondition := 'GUARD_ValidaObjeto';
    lTransition.SourceState := lState;
    lTransition.TargetState := lState;
    lTransition.AddTrigger('RM_VALIDA_OBJETO');
  
    lState := lStateMachine.FindState('stAguardando');
    lTransition := lState.NewOutgoingTransition('RM_INCLUI_OBJETO');
    lTransition.SourceState := lState;
    lTransition.TargetState := lStateMachine.FindState('stEditando');
    lTransition.AddTrigger('RM_INCLUI_OBJETO');
    lTransition.AddEffect('EFFECT_IncluiObjeto');
  
  
end;

procedure RegisterModelMappings(piMetaModel: acMetaModel);
begin
    RegisterClassTickets(piMetaModel);
    RegisterClassTicketsExtra(piMetaModel);
    RegisterClassRelationTickets(piMetaModel);
    RegisterUseCases(piMetaModel);
end;


end.
