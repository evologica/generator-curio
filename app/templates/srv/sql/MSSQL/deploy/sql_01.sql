-- SCRIPT CREATION DATE/TIME 27/09/2013 @ 1711



--DROP CONSTRAINTS AND INDEXES FROM DBASSOCIATIONMAP (RELATIONS)

-- RELATION ngUseCaseTicketOperation(0..*) <--Usecase Operations has levels--> (0..*)ngLevel
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('FS10Levels') AND parent_object_id = OBJECT_ID('IESITOPLEV'))
ALTER TABLE IESITOPLEV DROP CONSTRAINT FS10Levels

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('FS11UseCaseOperations') AND parent_object_id = OBJECT_ID('IESITOPLEV'))
ALTER TABLE IESITOPLEV DROP CONSTRAINT FS11UseCaseOperations

-- RELATION NGBusinessEventSubscriber(0..*) <--Subscriber''s Events Type of Interest--> (0..*)NGBusinessEventType
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('F279EventsType') AND parent_object_id = OBJECT_ID('INTETINTER'))
ALTER TABLE INTETINTER DROP CONSTRAINT F279EventsType

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('F280Subscribers') AND parent_object_id = OBJECT_ID('INTETINTER'))
ALTER TABLE INTETINTER DROP CONSTRAINT F280Subscribers

-- RELATION NGBusinessEventSubscriber(0..*) <--Subscriber''s Unnotified Events--> (0..*)NGBusinessEvent
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('F279UnnotifiedEvents') AND parent_object_id = OBJECT_ID('INTDTUNNOT'))
ALTER TABLE INTDTUNNOT DROP CONSTRAINT F279UnnotifiedEvents

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('F278UnnotifiedEvents') AND parent_object_id = OBJECT_ID('INTDTUNNOT'))
ALTER TABLE INTDTUNNOT DROP CONSTRAINT F278UnnotifiedEvents

-- RELATION ngProfile(0..*) <--Profile has Usecase Operations--> (0..*)ngUseCaseTicketOperation
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('F1518UseCaseOperations') AND parent_object_id = OBJECT_ID('IESTTOPPRO'))
ALTER TABLE IESTTOPPRO DROP CONSTRAINT F1518UseCaseOperations

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('FS10UseCaseOperations') AND parent_object_id = OBJECT_ID('IESTTOPPRO'))
ALTER TABLE IESTTOPPRO DROP CONSTRAINT FS10UseCaseOperations

-- RELATION NGBusinessEventSubscriber(0..1) <--Subscriber''s Active Error--> (1..1)NGBusinessEventSubscriberError
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('F279ActiveError') AND parent_object_id = OBJECT_ID('INTKTSUBER'))
ALTER TABLE INTKTSUBER DROP CONSTRAINT F279ActiveError

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('F743ActiveError') AND parent_object_id = OBJECT_ID('INTKTSUBER'))
ALTER TABLE INTKTSUBER DROP CONSTRAINT F743ActiveError

-- RELATION NGBusinessEventSubscriber(0..*) <--Subscriber''s Notified Events--> (0..*)NGBusinessEvent
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('F279NotifiedEvents') AND parent_object_id = OBJECT_ID('INTMTNOTEV'))
ALTER TABLE INTMTNOTEV DROP CONSTRAINT F279NotifiedEvents

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('F278NotifiedEvents') AND parent_object_id = OBJECT_ID('INTMTNOTEV'))
ALTER TABLE INTMTNOTEV DROP CONSTRAINT F278NotifiedEvents

-- RELATION NGBusinessEventSubscriber(0..*) <--Subscriber''s Ignored Events--> (0..*)NGBusinessEvent
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('F279IgnoredEvents') AND parent_object_id = OBJECT_ID('INTITIGNOR'))
ALTER TABLE INTITIGNOR DROP CONSTRAINT F279IgnoredEvents

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('F278IgnoredEvents') AND parent_object_id = OBJECT_ID('INTITIGNOR'))
ALTER TABLE INTITIGNOR DROP CONSTRAINT F278IgnoredEvents

-- RELATION NGNatureza(0..*) <--User nature can access systems--> (0..*)ngSystem
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('F132Systems') AND parent_object_id = OBJECT_ID('SEGETSINAU'))
ALTER TABLE SEGETSINAU DROP CONSTRAINT F132Systems

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('FS5Systems') AND parent_object_id = OBJECT_ID('SEGETSINAU'))
ALTER TABLE SEGETSINAU DROP CONSTRAINT FS5Systems

--DROP CONSTRAINTS AND INDEXES FROM DBACLASSMAP

-- CLASS ngAuditEventData
-- RELATION ngAuditEvent(0..*) <--Audit Event has Data--> (1..1)ngAuditEventData
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('F363SISDIDAUDI') AND parent_object_id = OBJECT_ID('SISDTEVNDA'))
ALTER TABLE SISDTEVNDA DROP CONSTRAINT F363SISDIDAUDI

-- CLASS NGBusinessEvent
-- RELATION NGBusinessEventType(0..*) <--Event has type--> (1..1)NGBusinessEvent
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('F278INTAIDEVNT') AND parent_object_id = OBJECT_ID('INTATBUEVN'))
ALTER TABLE INTATBUEVN DROP CONSTRAINT F278INTAIDEVNT

-- CLASS NGBusinessEventDistributed
-- RELATION NGBusinessEvent(0..1) <--Distributed BusinessEvent--> (1..1)NGBusinessEventDistributed
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('F744INTLIDBUEV') AND parent_object_id = OBJECT_ID('INTLTBUEVD'))
ALTER TABLE INTLTBUEVD DROP CONSTRAINT F744INTLIDBUEV

-- CLASS NGBusinessEventSubscriberError
-- RELATION NGBusinessEventSubscriber(0..*) <--Subscriber''s Errors--> (1..1)NGBusinessEventSubscriberError
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('F743INTJIDSUBS') AND parent_object_id = OBJECT_ID('INTJTSBERR'))
ALTER TABLE INTJTSBERR DROP CONSTRAINT F743INTJIDSUBS

-- RELATION NGBusinessEvent(0..*) <--SubscriberError has Event--> (1..1)NGBusinessEventSubscriberError
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('F743INTJIDBUEV') AND parent_object_id = OBJECT_ID('INTJTSBERR'))
ALTER TABLE INTJTSBERR DROP CONSTRAINT F743INTJIDBUEV

-- CLASS NGBusinessSubscriberNotifierEventualTimeWindow
-- RELATION NGBusinessEventSubscriber(0..*) <--Subscriber has eventual notifier time windows--> (1..1)NGBusinessSubscriberNotifierEventualTimeWindow
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('F742INTHIDSUBS') AND parent_object_id = OBJECT_ID('INTHTETMWI'))
ALTER TABLE INTHTETMWI DROP CONSTRAINT F742INTHIDSUBS

-- CLASS NGBusinessSubscriberNotifierTimeGrid
-- RELATION NGBusinessEventSubscriber(0..*) <--Subscriber has notifier time grids--> (1..1)NGBusinessSubscriberNotifierTimeGrid
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('F740INTFIDSUBS') AND parent_object_id = OBJECT_ID('INTFTTMGRD'))
ALTER TABLE INTFTTMGRD DROP CONSTRAINT F740INTFIDSUBS

-- CLASS NGBusinessSubscriberNotifierTimeWindow
-- RELATION NGBusinessSubscriberNotifierTimeGrid(0..*) <--Time grid has time windows--> (1..1)NGBusinessSubscriberNotifierTimeWindow
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('F741INTGIDTMGR') AND parent_object_id = OBJECT_ID('INTGTTMWIN'))
ALTER TABLE INTGTTMWIN DROP CONSTRAINT F741INTGIDTMGR

-- CLASS ngEvent
-- RELATION ngUseCaseTicketOperation(0..*) <--Use Case Operations have security events--> (1..1)ngEvent
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('FS8SEGCIDCUOP') AND parent_object_id = OBJECT_ID('SEGCTEVSEG'))
ALTER TABLE SEGCTEVSEG DROP CONSTRAINT FS8SEGCIDCUOP

-- RELATION ngSystem(0..*) <--System has security events--> (1..1)ngEvent
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('FS8SEGCIDSIST') AND parent_object_id = OBJECT_ID('SEGCTEVSEG'))
ALTER TABLE SEGCTEVSEG DROP CONSTRAINT FS8SEGCIDSIST

-- RELATION NGUser(0..*) <--User has security events--> (1..1)ngEvent
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('FS8SEGCIDRESP') AND parent_object_id = OBJECT_ID('SEGCTEVSEG'))
ALTER TABLE SEGCTEVSEG DROP CONSTRAINT FS8SEGCIDRESP

-- RELATION NGUser(0..*) <--User generate security events--> (1..1)ngEvent
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('FS8SEGCIDUSUA') AND parent_object_id = OBJECT_ID('SEGCTEVSEG'))
ALTER TABLE SEGCTEVSEG DROP CONSTRAINT FS8SEGCIDUSUA

-- CLASS ngGEDArquivamento
-- RELATION ngGEDRecipiente(0..*) <--documento é contido em caixa--> (1..1)ngGEDArquivamento
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('F2194ID_CAIXA') AND parent_object_id = OBJECT_ID('GED_ARQQUIVAMENTO'))
ALTER TABLE GED_ARQQUIVAMENTO DROP CONSTRAINT F2194ID_CAIXA

-- RELATION ngGEDDocumento(0..1) <--Documento é arquivado--> (1..1)ngGEDArquivamento
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('F2194ID_DOCUMENTO') AND parent_object_id = OBJECT_ID('GED_ARQQUIVAMENTO'))
ALTER TABLE GED_ARQQUIVAMENTO DROP CONSTRAINT F2194ID_DOCUMENTO

-- CLASS ngGEDDocumento
-- RELATION ngGEDTipoDocumento(0..*) <--documento é de um tipo--> (1..1)ngGEDDocumento
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('F2189ID_TIP_DOCUMENTO') AND parent_object_id = OBJECT_ID('GED_DOCUMENTO'))
ALTER TABLE GED_DOCUMENTO DROP CONSTRAINT F2189ID_TIP_DOCUMENTO

-- CLASS ngGEDEmpresa
-- RELATION ngGEDEmpresa(0..1) <--é filial de--> (1..1)ngGEDEmpresa
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('F2203ID_MATRIZ') AND parent_object_id = OBJECT_ID('GED_EMPRESA'))
ALTER TABLE GED_EMPRESA DROP CONSTRAINT F2203ID_MATRIZ

-- CLASS ngGEDPropriedade
-- RELATION ngGEDTipoValor(0..*) <----> (1..1)ngGEDPropriedade
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('F2190ID_TIPO_VALOR') AND parent_object_id = OBJECT_ID('GED_TIP_PROP_DOCUMENTO'))
ALTER TABLE GED_TIP_PROP_DOCUMENTO DROP CONSTRAINT F2190ID_TIPO_VALOR

-- RELATION ngGEDTipoDocumento(0..*) <--tipo de documento possui propriedades--> (1..1)ngGEDPropriedade
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('F2190ID_TIP_DOCUMENTO') AND parent_object_id = OBJECT_ID('GED_TIP_PROP_DOCUMENTO'))
ALTER TABLE GED_TIP_PROP_DOCUMENTO DROP CONSTRAINT F2190ID_TIP_DOCUMENTO

-- CLASS ngGEDSetor
-- RELATION ngGEDEmpresa(0..*) <----> (1..1)ngGEDSetor
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('F2202ID_EMPRESA') AND parent_object_id = OBJECT_ID('GED_SETOR'))
ALTER TABLE GED_SETOR DROP CONSTRAINT F2202ID_EMPRESA

-- CLASS ngGEDValorPropriedade
-- RELATION ngGEDPropriedade(0..*) <--Propriedade é de um tipo--> (1..1)ngGEDValorPropriedade
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('F2191ID_TIP_PROP_DOCUMENTO') AND parent_object_id = OBJECT_ID('GED_PROP_DOCUMENTO'))
ALTER TABLE GED_PROP_DOCUMENTO DROP CONSTRAINT F2191ID_TIP_PROP_DOCUMENTO

-- RELATION ngGEDDocumento(0..*) <--documento possui propriedades--> (1..1)ngGEDValorPropriedade
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('F2191ID_DOCUMENTO') AND parent_object_id = OBJECT_ID('GED_PROP_DOCUMENTO'))
ALTER TABLE GED_PROP_DOCUMENTO DROP CONSTRAINT F2191ID_DOCUMENTO

-- CLASS ngLevel
-- RELATION ngSystem(0..*) <--System has Levels--> (1..1)ngLevel
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('FS11IESHIDSIST') AND parent_object_id = OBJECT_ID('IESHTLEVEL'))
ALTER TABLE IESHTLEVEL DROP CONSTRAINT FS11IESHIDSIST

-- CLASS ngMessage
-- RELATION ngSystem(0..*) <--System has Message--> (1..1)ngMessage
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('F515IESRIDSIST') AND parent_object_id = OBJECT_ID('IESRTMESSG'))
ALTER TABLE IESRTMESSG DROP CONSTRAINT F515IESRIDSIST

-- CLASS ngPermission
-- RELATION ngUseCaseTicketOperation(0..*) <--UseCase Operation has permissions--> (1..1)ngPermission
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('FS7SEGBIDCUOP') AND parent_object_id = OBJECT_ID('SEGBTPERMI'))
ALTER TABLE SEGBTPERMI DROP CONSTRAINT FS7SEGBIDCUOP

-- RELATION ngSystem(0..*) <--System has permissions--> (1..1)ngPermission
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('FS7SEGBIDSIST') AND parent_object_id = OBJECT_ID('SEGBTPERMI'))
ALTER TABLE SEGBTPERMI DROP CONSTRAINT FS7SEGBIDSIST

-- RELATION NGUser(0..*) <--User has Permissions--> (1..1)ngPermission
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('FS7SEGBIDUSUA') AND parent_object_id = OBJECT_ID('SEGBTPERMI'))
ALTER TABLE SEGBTPERMI DROP CONSTRAINT FS7SEGBIDUSUA

-- CLASS ngSystemGUITickets
-- RELATION ngUseCaseTicket(0..*) <--UseCase has system GUIs--> (1..1)ngSystemGUITickets
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('F129IESPIDCASO') AND parent_object_id = OBJECT_ID('IESPTSISIN'))
ALTER TABLE IESPTSISIN DROP CONSTRAINT F129IESPIDCASO

-- RELATION ngSystem(0..*) <--System has GUIs--> (1..1)ngSystemGUITickets
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('F129IESPIDSIST') AND parent_object_id = OBJECT_ID('IESPTSISIN'))
ALTER TABLE IESPTSISIN DROP CONSTRAINT F129IESPIDSIST

-- RELATION ngGUITicket(0..*) <--System GUIs have GUI--> (1..1)ngSystemGUITickets
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('F129IESPIDINTE') AND parent_object_id = OBJECT_ID('IESPTSISIN'))
ALTER TABLE IESPTSISIN DROP CONSTRAINT F129IESPIDINTE

-- CLASS ngSystemUseCaseTicket
-- RELATION ngUseCaseTicket(0..*) <--Usecas has systems--> (1..1)ngSystemUseCaseTicket
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('FS14IESEIDCASO') AND parent_object_id = OBJECT_ID('IESETSISCU'))
ALTER TABLE IESETSISCU DROP CONSTRAINT FS14IESEIDCASO

-- RELATION ngSystem(0..*) <--System has Usecases--> (1..1)ngSystemUseCaseTicket
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('FS14IESEIDSIST') AND parent_object_id = OBJECT_ID('IESETSISCU'))
ALTER TABLE IESETSISCU DROP CONSTRAINT FS14IESEIDSIST

-- CLASS ngUseCaseTicket
-- RELATION ngIcon(0..*) <--Usecases have an icon--> (1..1)ngUseCaseTicket
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('FS1IESBIDCUIC') AND parent_object_id = OBJECT_ID('IESBTCASOU'))
ALTER TABLE IESBTCASOU DROP CONSTRAINT FS1IESBIDCUIC

-- RELATION ngEntity(0..*) <--Entity has Usecases--> (1..1)ngUseCaseTicket
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('FS1IESBIDENTI') AND parent_object_id = OBJECT_ID('IESBTCASOU'))
ALTER TABLE IESBTCASOU DROP CONSTRAINT FS1IESBIDENTI

-- RELATION ngCategory(0..*) <--Usecases have a category--> (1..1)ngUseCaseTicket
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('FS1IESBIDCATE') AND parent_object_id = OBJECT_ID('IESBTCASOU'))
ALTER TABLE IESBTCASOU DROP CONSTRAINT FS1IESBIDCATE

-- CLASS ngUseCaseTicketOperation
-- RELATION ngUseCaseTicket(0..*) <--Usecase has usecase operations--> (1..1)ngUseCaseTicketOperation
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('FS10IESGIDCASO') AND parent_object_id = OBJECT_ID('IESGTCUOPE'))
ALTER TABLE IESGTCUOPE DROP CONSTRAINT FS10IESGIDCASO

-- RELATION ngOperation(0..*) <--UseCase operations has operation--> (1..1)ngUseCaseTicketOperation
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('FS10IESGIDOPER') AND parent_object_id = OBJECT_ID('IESGTCUOPE'))
ALTER TABLE IESGTCUOPE DROP CONSTRAINT FS10IESGIDOPER

-- CLASS NGUser
-- RELATION NGNatureza(0..*) <--User has nature--> (1..1)NGUser
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('FS6SEGAIDNAUS') AND parent_object_id = OBJECT_ID('SEGATUSUAR'))
ALTER TABLE SEGATUSUAR DROP CONSTRAINT FS6SEGAIDNAUS

-- CLASS ngUserProfile
-- RELATION ngProfile(0..*) <--Profile has Users--> (1..1)ngUserProfile
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('F1540IESUIDPROF') AND parent_object_id = OBJECT_ID('IESUTUSERP'))
ALTER TABLE IESUTUSERP DROP CONSTRAINT F1540IESUIDPROF

-- RELATION NGUser(0..*) <--User has Profiles--> (1..1)ngUserProfile
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('F1540IESUIDUSUA') AND parent_object_id = OBJECT_ID('IESUTUSERP'))
ALTER TABLE IESUTUSERP DROP CONSTRAINT F1540IESUIDUSUA

--CREATE TABLES FROM DBASSOCIATIONMAP (RELATIONS)

-- RELATION ngUseCaseTicketOperation(0..*) <--Usecase Operations has levels--> (0..*)ngLevel
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('IESITOPLEV') AND type in ('U'))
DROP TABLE IESITOPLEV

-- RELATION NGBusinessEventSubscriber(0..*) <--Subscriber''s Events Type of Interest--> (0..*)NGBusinessEventType
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('INTETINTER') AND type in ('U'))
DROP TABLE INTETINTER

-- RELATION NGBusinessEventSubscriber(0..*) <--Subscriber''s Unnotified Events--> (0..*)NGBusinessEvent
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('INTDTUNNOT') AND type in ('U'))
DROP TABLE INTDTUNNOT

-- RELATION ngProfile(0..*) <--Profile has Usecase Operations--> (0..*)ngUseCaseTicketOperation
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('IESTTOPPRO') AND type in ('U'))
DROP TABLE IESTTOPPRO

-- RELATION NGBusinessEventSubscriber(0..1) <--Subscriber''s Active Error--> (1..1)NGBusinessEventSubscriberError
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('INTKTSUBER') AND type in ('U'))
DROP TABLE INTKTSUBER

-- RELATION NGBusinessEventSubscriber(0..*) <--Subscriber''s Notified Events--> (0..*)NGBusinessEvent
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('INTMTNOTEV') AND type in ('U'))
DROP TABLE INTMTNOTEV

-- RELATION NGBusinessEventSubscriber(0..*) <--Subscriber''s Ignored Events--> (0..*)NGBusinessEvent
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('INTITIGNOR') AND type in ('U'))
DROP TABLE INTITIGNOR

-- RELATION NGNatureza(0..*) <--User nature can access systems--> (0..*)ngSystem
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SEGETSINAU') AND type in ('U'))
DROP TABLE SEGETSINAU--CREATE TABLES FROM DBCLASSMAP

-- CLASS ngAuditEvent
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SISCTAUDIT') AND type in ('U'))
DROP TABLE SISCTAUDIT

-- CLASS ngAuditEventData
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SISDTEVNDA') AND type in ('U'))
DROP TABLE SISDTEVNDA

-- CLASS NGBusinessEvent
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('INTATBUEVN') AND type in ('U'))
DROP TABLE INTATBUEVN

-- CLASS NGBusinessEventDistributed
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('INTLTBUEVD') AND type in ('U'))
DROP TABLE INTLTBUEVD

-- CLASS NGBusinessEventSubscriber
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('INTBTSUBSC') AND type in ('U'))
DROP TABLE INTBTSUBSC

-- CLASS NGBusinessEventSubscriberError
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('INTJTSBERR') AND type in ('U'))
DROP TABLE INTJTSBERR

-- CLASS NGBusinessEventType
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('INTCTEVNTP') AND type in ('U'))
DROP TABLE INTCTEVNTP

-- CLASS NGBusinessSubscriberNotifierEventualTimeWindow
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('INTHTETMWI') AND type in ('U'))
DROP TABLE INTHTETMWI

-- CLASS NGBusinessSubscriberNotifierTimeGrid
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('INTFTTMGRD') AND type in ('U'))
DROP TABLE INTFTTMGRD

-- CLASS NGBusinessSubscriberNotifierTimeWindow
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('INTGTTMWIN') AND type in ('U'))
DROP TABLE INTGTTMWIN

-- CLASS ngCategory
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('IESDTCATEG') AND type in ('U'))
DROP TABLE IESDTCATEG

-- CLASS ngEntity
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('IESCTENTID') AND type in ('U'))
DROP TABLE IESCTENTID

-- CLASS ngEvent
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SEGCTEVSEG') AND type in ('U'))
DROP TABLE SEGCTEVSEG

-- CLASS ngGEDArquivamento
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('GED_ARQQUIVAMENTO') AND type in ('U'))
DROP TABLE GED_ARQQUIVAMENTO

-- CLASS ngGEDDocumento
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('GED_DOCUMENTO') AND type in ('U'))
DROP TABLE GED_DOCUMENTO

-- CLASS ngGEDEmpresa
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('GED_EMPRESA') AND type in ('U'))
DROP TABLE GED_EMPRESA

-- CLASS ngGEDPropriedade
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('GED_TIP_PROP_DOCUMENTO') AND type in ('U'))
DROP TABLE GED_TIP_PROP_DOCUMENTO

-- CLASS ngGEDRecipiente
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('GED_CAIXA_DOCUMENTO') AND type in ('U'))
DROP TABLE GED_CAIXA_DOCUMENTO

-- CLASS ngGEDSetor
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('GED_SETOR') AND type in ('U'))
DROP TABLE GED_SETOR

-- CLASS ngGEDTipoDocumento
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('GED_TIP_DOCUMENTO') AND type in ('U'))
DROP TABLE GED_TIP_DOCUMENTO

-- CLASS ngGEDTipoValor
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('GED_TIPO_VALOR') AND type in ('U'))
DROP TABLE GED_TIPO_VALOR

-- CLASS ngGEDValorPropriedade
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('GED_PROP_DOCUMENTO') AND type in ('U'))
DROP TABLE GED_PROP_DOCUMENTO

-- CLASS ngGUITicket
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('IESOTINTER') AND type in ('U'))
DROP TABLE IESOTINTER

-- CLASS ngIcon
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('IESFTCUICO') AND type in ('U'))
DROP TABLE IESFTCUICO

-- CLASS ngLevel
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('IESHTLEVEL') AND type in ('U'))
DROP TABLE IESHTLEVEL

-- CLASS ngMessage
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('IESRTMESSG') AND type in ('U'))
DROP TABLE IESRTMESSG

-- CLASS NGNatureza
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SEGDTNAUSU') AND type in ('U'))
DROP TABLE SEGDTNAUSU

-- CLASS ngOperation
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('IESJTOPERA') AND type in ('U'))
DROP TABLE IESJTOPERA

-- CLASS ngPermission
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SEGBTPERMI') AND type in ('U'))
DROP TABLE SEGBTPERMI

-- CLASS ngProfile
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('IESSTPROFI') AND type in ('U'))
DROP TABLE IESSTPROFI

-- CLASS ngSystem
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('IESATSISTE') AND type in ('U'))
DROP TABLE IESATSISTE

-- CLASS ngSystemConfigUpdateLog
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('IESQTUPLOG') AND type in ('U'))
DROP TABLE IESQTUPLOG

-- CLASS ngSystemGUITickets
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('IESPTSISIN') AND type in ('U'))
DROP TABLE IESPTSISIN

-- CLASS ngSystemUseCaseTicket
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('IESETSISCU') AND type in ('U'))
DROP TABLE IESETSISCU

-- CLASS ngUseCaseTicket
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('IESBTCASOU') AND type in ('U'))
DROP TABLE IESBTCASOU

-- CLASS ngUseCaseTicketOperation
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('IESGTCUOPE') AND type in ('U'))
DROP TABLE IESGTCUOPE

-- CLASS NGUser
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('SEGATUSUAR') AND type in ('U'))
DROP TABLE SEGATUSUAR

-- CLASS ngUserProfile
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('IESUTUSERP') AND type in ('U'))
DROP TABLE IESUTUSERP--CREATE TABLES FROM DBCLASSMAP

-- CLASS ngAuditEvent
CREATE TABLE SISCTAUDIT (
SISCIDAUDI                                        INT PRIMARY KEY,
SISCTRANID                                        VARCHAR(38) NOT NULL,
SISCDATETI                                        DATETIME NOT NULL,
SISCUSERNA                                        VARCHAR(30) NOT NULL,
SISCEVNTYP                                        VARCHAR(10) NOT NULL,
SISCUCNAME                                        VARCHAR(100) NOT NULL,
SISCCLNAME                                        VARCHAR(100) NOT NULL,
SISCOBJOID                                        VARCHAR(40) NOT NULL,
SISCCONTEX                                        VARCHAR(255) NULL
);

-- CLASS ngAuditEventData
CREATE TABLE SISDTEVNDA (
SISDIDEVND                                        INT PRIMARY KEY,
SISDDATNAM                                        VARCHAR(100) NOT NULL,
SISDOLDVAL                                        VARCHAR(4000) NULL,
SISDNEWVAL                                        VARCHAR(4000) NULL,
SISDIDAUDI                                        INT NOT NULL
);

-- CLASS NGBusinessEvent
CREATE TABLE INTATBUEVN (
INTAIDBUEV                                        INT PRIMARY KEY,
INTADATAAA                                        TEXT NOT NULL,
INTAPUBLDT                                        DATETIME NOT NULL,
INTAIDEVNT                                        INT NOT NULL
);

-- CLASS NGBusinessEventDistributed
CREATE TABLE INTLTBUEVD (
INTLIDBUED                                        INT PRIMARY KEY,
INTLDISTDT                                        DATETIME NOT NULL,
INTLIDBUEV                                        INT NOT NULL
);

-- CLASS NGBusinessEventSubscriber
CREATE TABLE INTBTSUBSC (
INTBIDSUBS                                        INT PRIMARY KEY,
INTBCODEE                                         INT NOT NULL,
INTBNAMEE                                         VARCHAR(50) NOT NULL
);

-- CLASS NGBusinessEventSubscriberError
CREATE TABLE INTJTSBERR (
INTJIDSBER                                        INT PRIMARY KEY,
INTJDTERRO                                        DATETIME NOT NULL,
INTJDESCRI                                        VARCHAR(512) NOT NULL,
INTJIDSUBS                                        INT NOT NULL,
INTJIDBUEV                                        INT NOT NULL
);

-- CLASS NGBusinessEventType
CREATE TABLE INTCTEVNTP (
INTCIDEVNT                                        INT PRIMARY KEY,
INTCCODEEE                                        INT NOT NULL,
INTCNAMEEE                                        VARCHAR(50) NOT NULL
);

-- CLASS NGBusinessSubscriberNotifierEventualTimeWindow
CREATE TABLE INTHTETMWI (
INTHIDETMW                                        INT PRIMARY KEY,
INTHVDATTT                                        DATETIME NOT NULL,
INTHSTARTA                                        INT NOT NULL,
INTHENDATT                                        INT NOT NULL,
INTHCODEEE                                        VARCHAR(20) NOT NULL,
INTHCLOSAT                                        INT NULL,
INTHOPENAT                                        INT NULL,
INTHIDSUBS                                        INT NOT NULL
);

-- CLASS NGBusinessSubscriberNotifierTimeGrid
CREATE TABLE INTFTTMGRD (
INTFIDTMGR                                        INT PRIMARY KEY,
INTFVDFROM                                        DATETIME NOT NULL,
INTFVDTOOO                                        DATETIME NULL,
INTFIDSUBS                                        INT NOT NULL
);

-- CLASS NGBusinessSubscriberNotifierTimeWindow
CREATE TABLE INTGTTMWIN (
INTGIDTMWI                                        INT PRIMARY KEY,
INTGSTARTA                                        INT NOT NULL,
INTGENDATT                                        INT NOT NULL,
INTGCODEEE                                        VARCHAR(20) NOT NULL,
INTGOPENAT                                        INT NULL,
INTGCLOSAT                                        INT NULL,
INTGIDTMGR                                        INT NOT NULL
);

-- CLASS ngCategory
CREATE TABLE IESDTCATEG (
IESDIDCATE                                        INT PRIMARY KEY,
IESDNMCATE                                        VARCHAR(20) NULL,
IESDCDCATE                                        INT NOT NULL,
IESDCDSITU                                        CHAR(1) NOT NULL
);

-- CLASS ngEntity
CREATE TABLE IESCTENTID (
IESCIDENTI                                        INT PRIMARY KEY,
IESCNMENTI                                        VARCHAR(20) NULL,
IESCCDENTI                                        INT NULL,
IESCTIENTI                                        VARCHAR(20) NOT NULL,
IESCCDSITU                                        CHAR(1) NOT NULL
);

-- CLASS ngEvent
CREATE TABLE SEGCTEVSEG (
SEGCIDESEG                                        INT PRIMARY KEY,
SEGCDTLANC                                        DATETIME NULL,
SEGCTPEVEN                                        CHAR(1) NULL,
SEGCIDCUOP                                        INT NOT NULL,
SEGCIDSIST                                        INT NOT NULL,
SEGCIDRESP                                        INT NOT NULL,
SEGCIDUSUA                                        INT NOT NULL
);

-- CLASS ngGEDArquivamento
CREATE TABLE GED_ARQQUIVAMENTO (
ID_ARQUIVAMENTO                                   INT PRIMARY KEY,
DATA_ARQUIVAMENTO                                 DATETIME NOT NULL,
ID_CAIXA                                          INT NOT NULL,
ID_DOCUMENTO                                      INT NOT NULL
);

-- CLASS ngGEDDocumento
CREATE TABLE GED_DOCUMENTO (
ID_DOCUMENTO                                      INT PRIMARY KEY,
ID_TIP_DOCUMENTO                                  INT NOT NULL
);

-- CLASS ngGEDEmpresa
CREATE TABLE GED_EMPRESA (
ID_EMPRESA                                        INT PRIMARY KEY,
NOME_EMPRESA                                      VARCHAR(70) NOT NULL,
CNPJ                                              VARCHAR(70) NOT NULL,
ID_MATRIZ                                         INT NOT NULL
);

-- CLASS ngGEDPropriedade
CREATE TABLE GED_TIP_PROP_DOCUMENTO (
ID_TIP_PROP_DOCUMENTO                             INT PRIMARY KEY,
DES_TIP_PROPRIEDADE                               VARCHAR(70) NOT NULL,
ID_TIPO_VALOR                                     INT NOT NULL,
ID_TIP_DOCUMENTO                                  INT NOT NULL
);

-- CLASS ngGEDRecipiente
CREATE TABLE GED_CAIXA_DOCUMENTO (
ID_CAIXA                                          INT PRIMARY KEY,
COD_CAIXA                                         VARCHAR(20) NOT NULL,
DES_CAIXA                                         VARCHAR(70) NOT NULL
);

-- CLASS ngGEDSetor
CREATE TABLE GED_SETOR (
ID_SETOR                                          INT PRIMARY KEY,
NOME_SETOR                                        VARCHAR(70) NOT NULL,
ID_EMPRESA                                        INT NOT NULL
);

-- CLASS ngGEDTipoDocumento
CREATE TABLE GED_TIP_DOCUMENTO (
ID_TIP_DOCUMENTO                                  INT PRIMARY KEY,
TITULO_TIP_DOCUMENTO                              VARCHAR(70) NOT NULL,
DES_TIP_DOCUMENTO                                 VARCHAR(300) NULL
);

-- CLASS ngGEDTipoValor
CREATE TABLE GED_TIPO_VALOR (
ID_TIPO_VALOR                                     INT PRIMARY KEY,
DES_TIP_PROPRIEDADE                               VARCHAR(70) NOT NULL
);

-- CLASS ngGEDValorPropriedade
CREATE TABLE GED_PROP_DOCUMENTO (
ID_PROPRIEDADE                                    INT PRIMARY KEY,
VALOR_PROPRIEDADE                                 VARCHAR(70) NULL,
ID_TIP_PROP_DOCUMENTO                             INT NOT NULL,
ID_DOCUMENTO                                      INT NOT NULL
);

-- CLASS ngGUITicket
CREATE TABLE IESOTINTER (
IESOIDINTE                                        INT PRIMARY KEY,
IESONMINTE                                        VARCHAR(50) NULL,
IESOCDINTE                                        INT NULL,
IESODSINTE                                        VARCHAR(250) NULL,
IESOCDSITU                                        CHAR(1) NOT NULL
);

-- CLASS ngIcon
CREATE TABLE IESFTCUICO (
IESFIDCUIC                                        INT PRIMARY KEY,
IESFDSCUIC                                        VARCHAR(50) NOT NULL,
IESFCDCUIC                                        INT NOT NULL,
IESFIMCUIC                                        IMAGE NULL,
IESFCDSITU                                        CHAR(1) NOT NULL
);

-- CLASS ngLevel
CREATE TABLE IESHTLEVEL (
IESHIDLEVE                                        INT PRIMARY KEY,
IESHCDLEVE                                        INT NULL,
IESHDSLEVE                                        VARCHAR(50) NULL,
IESHCDSITU                                        CHAR(1) NOT NULL,
IESHIDSIST                                        INT NOT NULL
);

-- CLASS ngMessage
CREATE TABLE IESRTMESSG (
IESRIDMESS                                        INT PRIMARY KEY,
IESRCDMESS                                        INT NOT NULL,
IESRDSMESS                                        VARCHAR(300) NOT NULL,
IESRSGMESS                                        VARCHAR(100) NOT NULL,
IESRCDSITU                                        CHAR(1) NOT NULL,
IESRDSDETA                                        VARCHAR(4000) NULL,
IESRSHOCOD                                        CHAR(1) NULL,
IESRDSMEUS                                        VARCHAR(300) NULL,
IESRIDSIST                                        INT NOT NULL
);

-- CLASS NGNatureza
CREATE TABLE SEGDTNAUSU (
SEGDIDNAUS                                        INT PRIMARY KEY,
SEGDCDNAUS                                        INT NULL,
SEGDDSNAUS                                        VARCHAR(50) NULL
);

-- CLASS ngOperation
CREATE TABLE IESJTOPERA (
IESJIDOPER                                        INT PRIMARY KEY,
IESJDSOPER                                        VARCHAR(20) NULL,
IESJCDOPER                                        INT NOT NULL,
IESJCDSITU                                        CHAR(1) NOT NULL
);

-- CLASS ngPermission
CREATE TABLE SEGBTPERMI (
SEGBIDPERM                                        INT PRIMARY KEY,
SEGBIDCUOP                                        INT NOT NULL,
SEGBIDSIST                                        INT NOT NULL,
SEGBIDUSUA                                        INT NOT NULL
);

-- CLASS ngProfile
CREATE TABLE IESSTPROFI (
IESSIDPROF                                        INT PRIMARY KEY,
IESSCDPROF                                        INT NOT NULL,
IESSNMPROF                                        VARCHAR(40) NOT NULL,
IESSDSPROF                                        VARCHAR(100) NULL
);

-- CLASS ngSystem
CREATE TABLE IESATSISTE (
IESAIDSIST                                        INT PRIMARY KEY,
IESANMSIST                                        VARCHAR(10) NULL,
IESADSSIST                                        VARCHAR(50) NULL,
IESAVERSAO                                        VARCHAR(10) NULL,
IESACDSIST                                        INT NOT NULL,
IESACDSITU                                        CHAR(1) NOT NULL
);

-- CLASS ngSystemConfigUpdateLog
CREATE TABLE IESQTUPLOG (
IESQIDUPLO                                        INT PRIMARY KEY,
IESQXMLOG                                         TEXT NOT NULL,
IESQUDATE                                         DATETIME NOT NULL,
IESQCDLOGI                                        VARCHAR(50) NOT NULL
);

-- CLASS ngSystemGUITickets
CREATE TABLE IESPTSISIN (
IESPIDSISI                                        INT PRIMARY KEY,
IESPCDSITU                                        CHAR(1) NOT NULL,
IESPIDCASO                                        INT NOT NULL,
IESPIDSIST                                        INT NOT NULL,
IESPIDINTE                                        INT NOT NULL
);

-- CLASS ngSystemUseCaseTicket
CREATE TABLE IESETSISCU (
IESEIDSISC                                        INT PRIMARY KEY,
IESECDSITU                                        CHAR(1) NULL,
IESEIDCASO                                        INT NOT NULL,
IESEIDSIST                                        INT NOT NULL
);

-- CLASS ngUseCaseTicket
CREATE TABLE IESBTCASOU (
IESBIDCASO                                        INT PRIMARY KEY,
IESBDSCASO                                        VARCHAR(250) NULL,
IESBNMCASO                                        VARCHAR(50) NULL,
IESBCDCASO                                        INT NULL,
IESBTPCASO                                        CHAR(1) NULL,
IESBCDSITU                                        CHAR(1) NULL,
IESBIDCUIC                                        INT NOT NULL,
IESBIDENTI                                        INT NOT NULL,
IESBIDCATE                                        INT NOT NULL
);

-- CLASS ngUseCaseTicketOperation
CREATE TABLE IESGTCUOPE (
IESGIDCUOP                                        INT PRIMARY KEY,
IESGCDSITU                                        CHAR(1) NOT NULL,
IESGCDACEX                                        VARCHAR(20) NULL,
IESGIDCASO                                        INT NOT NULL,
IESGIDOPER                                        INT NOT NULL
);

-- CLASS NGUser
CREATE TABLE SEGATUSUAR (
SEGAIDUSUA                                        INT PRIMARY KEY,
SEGACDUSUA                                        VARCHAR(25) NOT NULL,
SEGASENHAU                                        VARCHAR(12) NULL,
SEGAPRSETC                                        VARCHAR(20) NULL,
SEGADTCADU                                        DATETIME NOT NULL,
SEGADTULSE                                        DATETIME NULL,
SEGAINCANC                                        CHAR(1) NOT NULL,
SEGACDREFE                                        VARCHAR(25) NULL,
SEGAFORMSE                                        INT NULL,
SEGASALTSE                                        VARCHAR(128) NULL,
SEGAMOBILE                                        VARCHAR(16) NULL,
SEGAEEMAIL                                        VARCHAR(256) NULL,
SEGALEMAIL                                        VARCHAR(256) NULL,
SEGASENHAQ                                        VARCHAR(256) NULL,
SEGASENHAA                                        VARCHAR(256) NULL,
SEGABLOQUE                                        CHAR(1) NULL,
SEGAULTLGN                                        DATETIME NULL,
SEGAULTBLQ                                        DATETIME NULL,
SEGAFSACOU                                        INT NULL,
SEGAFSAWST                                        DATETIME NULL,
SEGAFSAACO                                        INT NULL,
SEGAFSAAWS                                        DATETIME NULL,
SEGACOMMEN                                        TEXT NULL,
SEGAULTACT                                        DATETIME NULL,
SEGAIDNAUS                                        INT NOT NULL,
SEGACDHERA                                        INT NOT NULL
);

-- CLASS ngUserProfile
CREATE TABLE IESUTUSERP (
IESUIDUSEP                                        INT PRIMARY KEY,
IESUIDPROF                                        INT NOT NULL,
IESUIDUSUA                                        INT NOT NULL
);

--CREATE TABLES FROM DBASSOCIATIONMAP (RELATIONS)

-- RELATION ngUseCaseTicketOperation(0..*) <--Usecase Operations has levels--> (0..*)ngLevel
CREATE TABLE IESITOPLEV (
IESIIDCUOP                                        INT NOT NULL,
IESIIDLEVE                                        INT NOT NULL
);

-- RELATION NGBusinessEventSubscriber(0..*) <--Subscriber''s Events Type of Interest--> (0..*)NGBusinessEventType
CREATE TABLE INTETINTER (
INTBIDSUBS                                        INT NOT NULL,
INTCIDEVNT                                        INT NOT NULL
);

-- RELATION NGBusinessEventSubscriber(0..*) <--Subscriber''s Unnotified Events--> (0..*)NGBusinessEvent
CREATE TABLE INTDTUNNOT (
INTBIDSUBS                                        INT NOT NULL,
INTAIDBUEV                                        INT NOT NULL
);

-- RELATION ngProfile(0..*) <--Profile has Usecase Operations--> (0..*)ngUseCaseTicketOperation
CREATE TABLE IESTTOPPRO (
IESSIDPROF                                        INT NOT NULL,
IESGIDCUOP                                        INT NOT NULL
);

-- RELATION NGBusinessEventSubscriber(0..1) <--Subscriber''s Active Error--> (1..1)NGBusinessEventSubscriberError
CREATE TABLE INTKTSUBER (
INTBIDSUBS                                        INT NOT NULL,
INTJIDSBER                                        INT NOT NULL
);

-- RELATION NGBusinessEventSubscriber(0..*) <--Subscriber''s Notified Events--> (0..*)NGBusinessEvent
CREATE TABLE INTMTNOTEV (
INTBIDSUBS                                        INT NOT NULL,
INTAIDBUEV                                        INT NOT NULL
);

-- RELATION NGBusinessEventSubscriber(0..*) <--Subscriber''s Ignored Events--> (0..*)NGBusinessEvent
CREATE TABLE INTITIGNOR (
INTBIDSUBS                                        INT NOT NULL,
INTAIDBUEV                                        INT NOT NULL
);

-- RELATION NGNatureza(0..*) <--User nature can access systems--> (0..*)ngSystem
CREATE TABLE SEGETSINAU (
SEGEIDNAUS                                        INT NOT NULL,
SEGEIDSIST                                        INT NOT NULL
);

--ADD CONSTRAINTS AND INDEXES FROM DBACLASSMAP

-- CLASS ngAuditEventData
-- RELATION ngAuditEvent(0..*) <--Audit Event has Data--> (1..1)ngAuditEventData
ALTER TABLE SISDTEVNDA ADD CONSTRAINT F363SISDIDAUDI FOREIGN KEY (SISDIDAUDI) REFERENCES SISCTAUDIT(SISCIDAUDI);

CREATE INDEX I363SISDIDAUDI ON SISDTEVNDA (SISDIDAUDI);

-- CLASS NGBusinessEvent
-- RELATION NGBusinessEventType(0..*) <--Event has type--> (1..1)NGBusinessEvent
ALTER TABLE INTATBUEVN ADD CONSTRAINT F278INTAIDEVNT FOREIGN KEY (INTAIDEVNT) REFERENCES INTCTEVNTP(INTCIDEVNT);

CREATE INDEX I278INTAIDEVNT ON INTATBUEVN (INTAIDEVNT);

-- CLASS NGBusinessEventDistributed
-- RELATION NGBusinessEvent(0..1) <--Distributed BusinessEvent--> (1..1)NGBusinessEventDistributed
ALTER TABLE INTLTBUEVD ADD CONSTRAINT F744INTLIDBUEV FOREIGN KEY (INTLIDBUEV) REFERENCES INTATBUEVN(INTAIDBUEV);

CREATE INDEX I744INTLIDBUEV ON INTLTBUEVD (INTLIDBUEV);

-- CLASS NGBusinessEventSubscriberError
-- RELATION NGBusinessEventSubscriber(0..*) <--Subscriber''s Errors--> (1..1)NGBusinessEventSubscriberError
ALTER TABLE INTJTSBERR ADD CONSTRAINT F743INTJIDSUBS FOREIGN KEY (INTJIDSUBS) REFERENCES INTBTSUBSC(INTBIDSUBS);

CREATE INDEX I743INTJIDSUBS ON INTJTSBERR (INTJIDSUBS);

-- RELATION NGBusinessEvent(0..*) <--SubscriberError has Event--> (1..1)NGBusinessEventSubscriberError
ALTER TABLE INTJTSBERR ADD CONSTRAINT F743INTJIDBUEV FOREIGN KEY (INTJIDBUEV) REFERENCES INTATBUEVN(INTAIDBUEV);

CREATE INDEX I743INTJIDBUEV ON INTJTSBERR (INTJIDBUEV);

-- CLASS NGBusinessSubscriberNotifierEventualTimeWindow
-- RELATION NGBusinessEventSubscriber(0..*) <--Subscriber has eventual notifier time windows--> (1..1)NGBusinessSubscriberNotifierEventualTimeWindow
ALTER TABLE INTHTETMWI ADD CONSTRAINT F742INTHIDSUBS FOREIGN KEY (INTHIDSUBS) REFERENCES INTBTSUBSC(INTBIDSUBS);

CREATE INDEX I742INTHIDSUBS ON INTHTETMWI (INTHIDSUBS);

-- CLASS NGBusinessSubscriberNotifierTimeGrid
-- RELATION NGBusinessEventSubscriber(0..*) <--Subscriber has notifier time grids--> (1..1)NGBusinessSubscriberNotifierTimeGrid
ALTER TABLE INTFTTMGRD ADD CONSTRAINT F740INTFIDSUBS FOREIGN KEY (INTFIDSUBS) REFERENCES INTBTSUBSC(INTBIDSUBS);

CREATE INDEX I740INTFIDSUBS ON INTFTTMGRD (INTFIDSUBS);

-- CLASS NGBusinessSubscriberNotifierTimeWindow
-- RELATION NGBusinessSubscriberNotifierTimeGrid(0..*) <--Time grid has time windows--> (1..1)NGBusinessSubscriberNotifierTimeWindow
ALTER TABLE INTGTTMWIN ADD CONSTRAINT F741INTGIDTMGR FOREIGN KEY (INTGIDTMGR) REFERENCES INTFTTMGRD(INTFIDTMGR);

CREATE INDEX I741INTGIDTMGR ON INTGTTMWIN (INTGIDTMGR);

-- CLASS ngEvent
-- RELATION ngUseCaseTicketOperation(0..*) <--Use Case Operations have security events--> (1..1)ngEvent
ALTER TABLE SEGCTEVSEG ADD CONSTRAINT FS8SEGCIDCUOP FOREIGN KEY (SEGCIDCUOP) REFERENCES IESGTCUOPE(IESGIDCUOP);

CREATE INDEX IS8SEGCIDCUOP ON SEGCTEVSEG (SEGCIDCUOP);

-- RELATION ngSystem(0..*) <--System has security events--> (1..1)ngEvent
ALTER TABLE SEGCTEVSEG ADD CONSTRAINT FS8SEGCIDSIST FOREIGN KEY (SEGCIDSIST) REFERENCES IESATSISTE(IESAIDSIST);

CREATE INDEX IS8SEGCIDSIST ON SEGCTEVSEG (SEGCIDSIST);

-- RELATION NGUser(0..*) <--User has security events--> (1..1)ngEvent
ALTER TABLE SEGCTEVSEG ADD CONSTRAINT FS8SEGCIDRESP FOREIGN KEY (SEGCIDRESP) REFERENCES SEGATUSUAR(SEGAIDUSUA);

CREATE INDEX IS8SEGCIDRESP ON SEGCTEVSEG (SEGCIDRESP);

-- RELATION NGUser(0..*) <--User generate security events--> (1..1)ngEvent
ALTER TABLE SEGCTEVSEG ADD CONSTRAINT FS8SEGCIDUSUA FOREIGN KEY (SEGCIDUSUA) REFERENCES SEGATUSUAR(SEGAIDUSUA);

CREATE INDEX IS8SEGCIDUSUA ON SEGCTEVSEG (SEGCIDUSUA);

-- CLASS ngGEDArquivamento
-- RELATION ngGEDRecipiente(0..*) <--documento é contido em caixa--> (1..1)ngGEDArquivamento
ALTER TABLE GED_ARQQUIVAMENTO ADD CONSTRAINT F2194ID_CAIXA FOREIGN KEY (ID_CAIXA) REFERENCES GED_CAIXA_DOCUMENTO(ID_CAIXA);

CREATE INDEX I2194ID_CAIXA ON GED_ARQQUIVAMENTO (ID_CAIXA);

-- RELATION ngGEDDocumento(0..1) <--Documento é arquivado--> (1..1)ngGEDArquivamento
ALTER TABLE GED_ARQQUIVAMENTO ADD CONSTRAINT F2194ID_DOCUMENTO FOREIGN KEY (ID_DOCUMENTO) REFERENCES GED_DOCUMENTO(ID_DOCUMENTO);

CREATE INDEX I2194ID_DOCUMENTO ON GED_ARQQUIVAMENTO (ID_DOCUMENTO);

-- CLASS ngGEDDocumento
-- RELATION ngGEDTipoDocumento(0..*) <--documento é de um tipo--> (1..1)ngGEDDocumento
ALTER TABLE GED_DOCUMENTO ADD CONSTRAINT F2189ID_TIP_DOCUMENTO FOREIGN KEY (ID_TIP_DOCUMENTO) REFERENCES GED_TIP_DOCUMENTO(ID_TIP_DOCUMENTO);

CREATE INDEX I2189ID_TIP_DOCUMENTO ON GED_DOCUMENTO (ID_TIP_DOCUMENTO);

-- CLASS ngGEDEmpresa
-- RELATION ngGEDEmpresa(0..1) <--é filial de--> (1..1)ngGEDEmpresa
ALTER TABLE GED_EMPRESA ADD CONSTRAINT F2203ID_MATRIZ FOREIGN KEY (ID_MATRIZ) REFERENCES GED_EMPRESA(ID_EMPRESA);

CREATE INDEX I2203ID_MATRIZ ON GED_EMPRESA (ID_MATRIZ);

-- CLASS ngGEDPropriedade
-- RELATION ngGEDTipoValor(0..*) <----> (1..1)ngGEDPropriedade
ALTER TABLE GED_TIP_PROP_DOCUMENTO ADD CONSTRAINT F2190ID_TIPO_VALOR FOREIGN KEY (ID_TIPO_VALOR) REFERENCES GED_TIPO_VALOR(ID_TIPO_VALOR);

CREATE INDEX I2190ID_TIPO_VALOR ON GED_TIP_PROP_DOCUMENTO (ID_TIPO_VALOR);

-- RELATION ngGEDTipoDocumento(0..*) <--tipo de documento possui propriedades--> (1..1)ngGEDPropriedade
ALTER TABLE GED_TIP_PROP_DOCUMENTO ADD CONSTRAINT F2190ID_TIP_DOCUMENTO FOREIGN KEY (ID_TIP_DOCUMENTO) REFERENCES GED_TIP_DOCUMENTO(ID_TIP_DOCUMENTO);

CREATE INDEX I2190ID_TIP_DOCUMENTO ON GED_TIP_PROP_DOCUMENTO (ID_TIP_DOCUMENTO);

-- CLASS ngGEDSetor
-- RELATION ngGEDEmpresa(0..*) <----> (1..1)ngGEDSetor
ALTER TABLE GED_SETOR ADD CONSTRAINT F2202ID_EMPRESA FOREIGN KEY (ID_EMPRESA) REFERENCES GED_EMPRESA(ID_EMPRESA);

CREATE INDEX I2202ID_EMPRESA ON GED_SETOR (ID_EMPRESA);

-- CLASS ngGEDValorPropriedade
-- RELATION ngGEDPropriedade(0..*) <--Propriedade é de um tipo--> (1..1)ngGEDValorPropriedade
ALTER TABLE GED_PROP_DOCUMENTO ADD CONSTRAINT F2191ID_TIP_PROP_DOCUMENTO FOREIGN KEY (ID_TIP_PROP_DOCUMENTO) REFERENCES GED_TIP_PROP_DOCUMENTO(ID_TIP_PROP_DOCUMENTO);

CREATE INDEX I2191ID_TIP_PROP_DOCUMENTO ON GED_PROP_DOCUMENTO (ID_TIP_PROP_DOCUMENTO);

-- RELATION ngGEDDocumento(0..*) <--documento possui propriedades--> (1..1)ngGEDValorPropriedade
ALTER TABLE GED_PROP_DOCUMENTO ADD CONSTRAINT F2191ID_DOCUMENTO FOREIGN KEY (ID_DOCUMENTO) REFERENCES GED_DOCUMENTO(ID_DOCUMENTO);

CREATE INDEX I2191ID_DOCUMENTO ON GED_PROP_DOCUMENTO (ID_DOCUMENTO);

-- CLASS ngLevel
-- RELATION ngSystem(0..*) <--System has Levels--> (1..1)ngLevel
ALTER TABLE IESHTLEVEL ADD CONSTRAINT FS11IESHIDSIST FOREIGN KEY (IESHIDSIST) REFERENCES IESATSISTE(IESAIDSIST);

CREATE INDEX IS11IESHIDSIST ON IESHTLEVEL (IESHIDSIST);

-- CLASS ngMessage
-- RELATION ngSystem(0..*) <--System has Message--> (1..1)ngMessage
ALTER TABLE IESRTMESSG ADD CONSTRAINT F515IESRIDSIST FOREIGN KEY (IESRIDSIST) REFERENCES IESATSISTE(IESAIDSIST);

CREATE INDEX I515IESRIDSIST ON IESRTMESSG (IESRIDSIST);

-- CLASS ngPermission
-- RELATION ngUseCaseTicketOperation(0..*) <--UseCase Operation has permissions--> (1..1)ngPermission
ALTER TABLE SEGBTPERMI ADD CONSTRAINT FS7SEGBIDCUOP FOREIGN KEY (SEGBIDCUOP) REFERENCES IESGTCUOPE(IESGIDCUOP);

CREATE INDEX IS7SEGBIDCUOP ON SEGBTPERMI (SEGBIDCUOP);

-- RELATION ngSystem(0..*) <--System has permissions--> (1..1)ngPermission
ALTER TABLE SEGBTPERMI ADD CONSTRAINT FS7SEGBIDSIST FOREIGN KEY (SEGBIDSIST) REFERENCES IESATSISTE(IESAIDSIST);

CREATE INDEX IS7SEGBIDSIST ON SEGBTPERMI (SEGBIDSIST);

-- RELATION NGUser(0..*) <--User has Permissions--> (1..1)ngPermission
ALTER TABLE SEGBTPERMI ADD CONSTRAINT FS7SEGBIDUSUA FOREIGN KEY (SEGBIDUSUA) REFERENCES SEGATUSUAR(SEGAIDUSUA);

CREATE INDEX IS7SEGBIDUSUA ON SEGBTPERMI (SEGBIDUSUA);

-- CLASS ngSystemGUITickets
-- RELATION ngUseCaseTicket(0..*) <--UseCase has system GUIs--> (1..1)ngSystemGUITickets
ALTER TABLE IESPTSISIN ADD CONSTRAINT F129IESPIDCASO FOREIGN KEY (IESPIDCASO) REFERENCES IESBTCASOU(IESBIDCASO);

CREATE INDEX I129IESPIDCASO ON IESPTSISIN (IESPIDCASO);

-- RELATION ngSystem(0..*) <--System has GUIs--> (1..1)ngSystemGUITickets
ALTER TABLE IESPTSISIN ADD CONSTRAINT F129IESPIDSIST FOREIGN KEY (IESPIDSIST) REFERENCES IESATSISTE(IESAIDSIST);

CREATE INDEX I129IESPIDSIST ON IESPTSISIN (IESPIDSIST);

-- RELATION ngGUITicket(0..*) <--System GUIs have GUI--> (1..1)ngSystemGUITickets
ALTER TABLE IESPTSISIN ADD CONSTRAINT F129IESPIDINTE FOREIGN KEY (IESPIDINTE) REFERENCES IESOTINTER(IESOIDINTE);

CREATE INDEX I129IESPIDINTE ON IESPTSISIN (IESPIDINTE);

-- CLASS ngSystemUseCaseTicket
-- RELATION ngUseCaseTicket(0..*) <--Usecas has systems--> (1..1)ngSystemUseCaseTicket
ALTER TABLE IESETSISCU ADD CONSTRAINT FS14IESEIDCASO FOREIGN KEY (IESEIDCASO) REFERENCES IESBTCASOU(IESBIDCASO);

CREATE INDEX IS14IESEIDCASO ON IESETSISCU (IESEIDCASO);

-- RELATION ngSystem(0..*) <--System has Usecases--> (1..1)ngSystemUseCaseTicket
ALTER TABLE IESETSISCU ADD CONSTRAINT FS14IESEIDSIST FOREIGN KEY (IESEIDSIST) REFERENCES IESATSISTE(IESAIDSIST);

CREATE INDEX IS14IESEIDSIST ON IESETSISCU (IESEIDSIST);

-- CLASS ngUseCaseTicket
-- RELATION ngIcon(0..*) <--Usecases have an icon--> (1..1)ngUseCaseTicket
ALTER TABLE IESBTCASOU ADD CONSTRAINT FS1IESBIDCUIC FOREIGN KEY (IESBIDCUIC) REFERENCES IESFTCUICO(IESFIDCUIC);

CREATE INDEX IS1IESBIDCUIC ON IESBTCASOU (IESBIDCUIC);

-- RELATION ngEntity(0..*) <--Entity has Usecases--> (1..1)ngUseCaseTicket
ALTER TABLE IESBTCASOU ADD CONSTRAINT FS1IESBIDENTI FOREIGN KEY (IESBIDENTI) REFERENCES IESCTENTID(IESCIDENTI);

CREATE INDEX IS1IESBIDENTI ON IESBTCASOU (IESBIDENTI);

-- RELATION ngCategory(0..*) <--Usecases have a category--> (1..1)ngUseCaseTicket
ALTER TABLE IESBTCASOU ADD CONSTRAINT FS1IESBIDCATE FOREIGN KEY (IESBIDCATE) REFERENCES IESDTCATEG(IESDIDCATE);

CREATE INDEX IS1IESBIDCATE ON IESBTCASOU (IESBIDCATE);

-- CLASS ngUseCaseTicketOperation
-- RELATION ngUseCaseTicket(0..*) <--Usecase has usecase operations--> (1..1)ngUseCaseTicketOperation
ALTER TABLE IESGTCUOPE ADD CONSTRAINT FS10IESGIDCASO FOREIGN KEY (IESGIDCASO) REFERENCES IESBTCASOU(IESBIDCASO);

CREATE INDEX IS10IESGIDCASO ON IESGTCUOPE (IESGIDCASO);

-- RELATION ngOperation(0..*) <--UseCase operations has operation--> (1..1)ngUseCaseTicketOperation
ALTER TABLE IESGTCUOPE ADD CONSTRAINT FS10IESGIDOPER FOREIGN KEY (IESGIDOPER) REFERENCES IESJTOPERA(IESJIDOPER);

CREATE INDEX IS10IESGIDOPER ON IESGTCUOPE (IESGIDOPER);

-- CLASS NGUser
-- RELATION NGNatureza(0..*) <--User has nature--> (1..1)NGUser
ALTER TABLE SEGATUSUAR ADD CONSTRAINT FS6SEGAIDNAUS FOREIGN KEY (SEGAIDNAUS) REFERENCES SEGDTNAUSU(SEGDIDNAUS);

CREATE INDEX IS6SEGAIDNAUS ON SEGATUSUAR (SEGAIDNAUS);

-- CLASS ngUserProfile
-- RELATION ngProfile(0..*) <--Profile has Users--> (1..1)ngUserProfile
ALTER TABLE IESUTUSERP ADD CONSTRAINT F1540IESUIDPROF FOREIGN KEY (IESUIDPROF) REFERENCES IESSTPROFI(IESSIDPROF);

CREATE INDEX I1540IESUIDPROF ON IESUTUSERP (IESUIDPROF);

-- RELATION NGUser(0..*) <--User has Profiles--> (1..1)ngUserProfile
ALTER TABLE IESUTUSERP ADD CONSTRAINT F1540IESUIDUSUA FOREIGN KEY (IESUIDUSUA) REFERENCES SEGATUSUAR(SEGAIDUSUA);

CREATE INDEX I1540IESUIDUSUA ON IESUTUSERP (IESUIDUSUA);

--ADD CONSTRAINTS AND INDEXES FROM DBASSOCIATIONMAP (RELATIONS)

-- RELATION ngUseCaseTicketOperation(0..*) <--Usecase Operations has levels--> (0..*)ngLevel
ALTER TABLE IESITOPLEV ADD CONSTRAINT FS10Levels FOREIGN KEY (IESIIDCUOP) REFERENCES IESGTCUOPE(IESGIDCUOP);

ALTER TABLE IESITOPLEV ADD CONSTRAINT FS11UseCaseOperations FOREIGN KEY (IESIIDLEVE) REFERENCES IESHTLEVEL(IESHIDLEVE);

CREATE UNIQUE INDEX IS10Levels ON IESITOPLEV (IESIIDCUOP, IESIIDLEVE);

CREATE UNIQUE INDEX IS11UseCaseOperations ON IESITOPLEV (IESIIDLEVE, IESIIDCUOP);

-- RELATION NGBusinessEventSubscriber(0..*) <--Subscriber''s Events Type of Interest--> (0..*)NGBusinessEventType
ALTER TABLE INTETINTER ADD CONSTRAINT F279EventsType FOREIGN KEY (INTBIDSUBS) REFERENCES INTBTSUBSC(INTBIDSUBS);

ALTER TABLE INTETINTER ADD CONSTRAINT F280Subscribers FOREIGN KEY (INTCIDEVNT) REFERENCES INTCTEVNTP(INTCIDEVNT);

CREATE UNIQUE INDEX I279EventsType ON INTETINTER (INTBIDSUBS, INTCIDEVNT);

CREATE UNIQUE INDEX I280Subscribers ON INTETINTER (INTCIDEVNT, INTBIDSUBS);

-- RELATION NGBusinessEventSubscriber(0..*) <--Subscriber''s Unnotified Events--> (0..*)NGBusinessEvent
ALTER TABLE INTDTUNNOT ADD CONSTRAINT F279UnnotifiedEvents FOREIGN KEY (INTBIDSUBS) REFERENCES INTBTSUBSC(INTBIDSUBS);

ALTER TABLE INTDTUNNOT ADD CONSTRAINT F278UnnotifiedEvents FOREIGN KEY (INTAIDBUEV) REFERENCES INTATBUEVN(INTAIDBUEV);

CREATE UNIQUE INDEX I279UnnotifiedEvents ON INTDTUNNOT (INTBIDSUBS, INTAIDBUEV);

-- RELATION ngProfile(0..*) <--Profile has Usecase Operations--> (0..*)ngUseCaseTicketOperation
ALTER TABLE IESTTOPPRO ADD CONSTRAINT F1518UseCaseOperations FOREIGN KEY (IESSIDPROF) REFERENCES IESSTPROFI(IESSIDPROF);

ALTER TABLE IESTTOPPRO ADD CONSTRAINT FS10UseCaseOperations FOREIGN KEY (IESGIDCUOP) REFERENCES IESGTCUOPE(IESGIDCUOP);

CREATE UNIQUE INDEX I1518UseCaseOperations ON IESTTOPPRO (IESSIDPROF, IESGIDCUOP);

-- RELATION NGBusinessEventSubscriber(0..1) <--Subscriber''s Active Error--> (1..1)NGBusinessEventSubscriberError
ALTER TABLE INTKTSUBER ADD CONSTRAINT F279ActiveError FOREIGN KEY (INTBIDSUBS) REFERENCES INTBTSUBSC(INTBIDSUBS);

ALTER TABLE INTKTSUBER ADD CONSTRAINT F743ActiveError FOREIGN KEY (INTJIDSBER) REFERENCES INTJTSBERR(INTJIDSBER);

CREATE UNIQUE INDEX I279ActiveError ON INTKTSUBER (INTBIDSUBS, INTJIDSBER);

-- RELATION NGBusinessEventSubscriber(0..*) <--Subscriber''s Notified Events--> (0..*)NGBusinessEvent
ALTER TABLE INTMTNOTEV ADD CONSTRAINT F279NotifiedEvents FOREIGN KEY (INTBIDSUBS) REFERENCES INTBTSUBSC(INTBIDSUBS);

ALTER TABLE INTMTNOTEV ADD CONSTRAINT F278NotifiedEvents FOREIGN KEY (INTAIDBUEV) REFERENCES INTATBUEVN(INTAIDBUEV);

CREATE UNIQUE INDEX I279NotifiedEvents ON INTMTNOTEV (INTBIDSUBS, INTAIDBUEV);

-- RELATION NGBusinessEventSubscriber(0..*) <--Subscriber''s Ignored Events--> (0..*)NGBusinessEvent
ALTER TABLE INTITIGNOR ADD CONSTRAINT F279IgnoredEvents FOREIGN KEY (INTBIDSUBS) REFERENCES INTBTSUBSC(INTBIDSUBS);

ALTER TABLE INTITIGNOR ADD CONSTRAINT F278IgnoredEvents FOREIGN KEY (INTAIDBUEV) REFERENCES INTATBUEVN(INTAIDBUEV);

CREATE UNIQUE INDEX I279IgnoredEvents ON INTITIGNOR (INTBIDSUBS, INTAIDBUEV);

-- RELATION NGNatureza(0..*) <--User nature can access systems--> (0..*)ngSystem
ALTER TABLE SEGETSINAU ADD CONSTRAINT F132Systems FOREIGN KEY (SEGEIDNAUS) REFERENCES SEGDTNAUSU(SEGDIDNAUS);

ALTER TABLE SEGETSINAU ADD CONSTRAINT FS5Systems FOREIGN KEY (SEGEIDSIST) REFERENCES IESATSISTE(IESAIDSIST);

CREATE UNIQUE INDEX I132Systems ON SEGETSINAU (SEGEIDNAUS, SEGEIDSIST);

-- END OF SCRIPT --