inherited it<%= crudname %>: Tit<%= crudname %>
  Caption = '<%= crudname %>'
  ClientHeight = 646
  ClientWidth = 993
  Font.Name = 'Trebuchet MS'
  ExplicitWidth = 1009
  ExplicitHeight = 684
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnPrincipal: TPanel
    Width = 993
    Height = 589
    BevelOuter = bvNone
    Color = 15855852
    ParentBackground = False
    ExplicitWidth = 993
    ExplicitHeight = 589
  end
  inherited pnMenuSuperior: TPanel
    Width = 993
    ExplicitWidth = 993
    inherited jvGradientSuperior: TJvGradient
      Width = 993
      ExplicitWidth = 1158
    end
    inherited FlowPanel1: TFlowPanel
      Width = 993
      Color = clWindow
      ParentBackground = False
      ExplicitWidth = 993
      inherited sbNovo: TJvSpeedButton
        HotTrackFont.Name = 'Trebuchet MS'
      end
      inherited sbSalvar: TJvSpeedButton
        HotTrackFont.Name = 'Trebuchet MS'
      end
      inherited sbEditar: TJvSpeedButton
        HotTrackFont.Name = 'Trebuchet MS'
      end
      inherited sbExcluir: TJvSpeedButton
        HotTrackFont.Name = 'Trebuchet MS'
      end
      inherited sbSair: TJvSpeedButton
        HotTrackFont.Name = 'Trebuchet MS'
      end
    end
  end
  inherited pnDivisor: TPanel
    Width = 993
    ExplicitWidth = 993
  end
end