program <%= appname %>;

{$R 'VersionInfo.res' 'VersionInfo.rc'}
{$R 'mmenu.res' 'mmenu.rc'}

uses
  Classes,
  SvcMgr,
  acuNativeSecurityDriver,
  acuConexoSecurityDriver,
  acuSQLDialectDB2,
  acuSQLDialectOracle,
  acuSQLDialectSQLServer,
  acuObject,
  ucuManager,
  acuCollection,
  ucuUseCase,
  nguEvent,
  nguOperation,
  nguPermission,
  utuMessage,
  utuRequest,
  utuRequestQueue,
  utuParamFields,
  mxuConnectionServer,
  utuLinksManager,
  utuLink,
  utuLinkSharedMemory,
  utuLinkSock,
  blcksock,
  synsock,
  mxuUseCaseCommCenter,
  mxuCommCenter,
  utuProtectedList,
  sucuBuscaObjetosBasica,
  utuFactory,
  ucuUseCaseFactory,
  acOQL,
  acuRepositorySQL,
  ucuMain,
  ucuSecurityManager,
  acuUseCaseServer,
  acuContainers,
  acuPersistenceLog,
  acuApplicationLog,
  acuPersistenceEventsToApplicationLogSubscriber,
  utuStateMachine,
  acuSystem,
  acuQuerySQLADO,
  NGUAuditEvent,
  NGUAuditEventData,
  nguSystemConfigUpdateLog,
  nguUser,
  nguCategory,
  nguEntity,
  nguGUITicket,
  nguIcon,
  nguLevel,
  nguSystem,
  nguMessage,
  nguSystemGUITickets,
  nguSystemUseCaseTicket,
  nguUseCaseTicket,
  nguUseCaseTicketOperation,
  nguBusinessEvent,
  NGuBusinessEventDistributed,
  nguBusinessEventSubscriber,
  NGuBusinessEventSubscriberError,
  nguBusinessEventType,
  NGuBusinessSubscriberNotifierEventualTimeWindow,
  NGuBusinessSubscriberNotifierTimeGrid,
  NGuBusinessSubscriberNotifierTimeWindow,
  ucuCadastroBasicoV4,
  SysUtils,
  acuFramework,
  ucuExplorerV4,
  ucuControlPanelConsole,
  ucuProfiler,
  sucuBuscaObjetosServidores,
  ucuControlPanel,
  sucuBuscaObjetosUsuarioV4,
  sucuBuscaLogAtualizacaoSistema,
  sucuBuscaNaturezas,
  ucuCadastroNatureza,
  ucuControleAcesso,
  ucuPropriedadesDoServico,
  ucuDetalhesAtualizacaoSistema,
  ucuImportaConfiguracaoSistema,
  ucuCadastroUsuarioSistema,
  utuSysUtils,
  acuRegisterModelMappings in 'lib\acuRegisterModelMappings.pas',
  nguVersaoBanco in 'ngu\nguVersaoBanco.pas',
  ucu<%= appname %>Main in 'ucu\ucu<%= appname %>Main.pas',
  svu<%= appname %> in 'svu<%= appname %>.pas' {sv<%= appname %>: TService};

var
  lErros : TStringList;

begin
  gDefaultConnetionString := gSystem.ParamByName['Application.Database.' +  gSystem.ParamByName['Application.Database.@ActiveConnectionString']];
  Application.Initialize;
  RegisterModelMappings(PersistenceManager.DefaultMetaModel);
  PersistenceManager.Initialize;

  lErros := TStringList.Create;
  try
    if not PersistenceManager.DefaultMetaModel.ImplementationOK(lErros) then
    begin
      lErros.SaveToFile(IncludeTrailingPathDelimiter(ExtractFileDir(ParamStr(0))) + 'ModelErrors.log');
      raise Exception.Create('Error initalizing service, check ModelErrors.log for details.');
    end;
  finally
    lErros.Free;
  end;
  Application.CreateForm(Tsv<%= appname %>, sv<%= appname %>);
  Application.Run;
end.
