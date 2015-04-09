object sv<%= appname %>: Tsv<%= appname %>
  OldCreateOrder = False
  OnCreate = ServiceCreate
  DisplayName = 'svApp'
  BeforeInstall = ServiceBeforeInstall
  AfterInstall = ServiceAfterInstall
  AfterUninstall = ServiceAfterUninstall
  OnStart = ServiceStart
  OnStop = ServiceStop
  Height = 150
  Width = 215
end
