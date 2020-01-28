object FormRec: TFormRec
  Left = 849
  Top = 191
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1055#1088#1103#1084#1086#1091#1075#1086#1083#1100#1085#1080#1082#1080
  ClientHeight = 539
  ClientWidth = 594
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Visible = True
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PaintBoxRec: TPaintBox
    Left = 0
    Top = 0
    Width = 593
    Height = 537
    OnMouseDown = PaintBoxRecMouseDown
    OnMouseMove = PaintBoxRecMouseMove
    OnMouseUp = PaintBoxRecMouseUp
    OnPaint = PaintBoxRecPaint
  end
  object MainMenu: TMainMenu
    Left = 24
    Top = 24
    object CrRec: TMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100
      OnClick = CrRecClick
    end
    object Edit: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Enabled = False
      OnClick = EditClick
    end
    object MenuUn: TMenuItem
      Caption = #1054#1073#1098#1077#1076#1080#1085#1080#1090#1100
      Enabled = False
      OnClick = MenuUnClick
    end
    object MenuDisUn: TMenuItem
      Caption = #1055#1077#1088#1077#1089#1077#1095#1100
      Enabled = False
      OnClick = MenuDisUnClick
    end
    object DelRec: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Enabled = False
      OnClick = DelRecClick
    end
  end
end
