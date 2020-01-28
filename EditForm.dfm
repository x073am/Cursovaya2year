object FormEdit: TFormEdit
  Left = 497
  Top = 135
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1056#1072#1079#1084#1077#1088' '#1087#1088#1103#1084#1086#1091#1075#1086#1083#1100#1085#1080#1082#1072
  ClientHeight = 154
  ClientWidth = 284
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LabelWidth: TLabel
    Left = 48
    Top = 32
    Width = 68
    Height = 24
    Caption = #1064#1080#1088#1080#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabelHeght: TLabel
    Left = 48
    Top = 72
    Width = 66
    Height = 24
    Caption = #1042#1099#1089#1086#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object EditWidth: TEdit
    Left = 168
    Top = 32
    Width = 97
    Height = 21
    TabOrder = 1
    Text = '70'
    OnKeyPress = EditWidthKeyPress
  end
  object EditHeight: TEdit
    Left = 168
    Top = 72
    Width = 97
    Height = 21
    TabOrder = 2
    Text = '70'
    OnKeyPress = EditHeightKeyPress
  end
  object mrOk: TButton
    Left = 168
    Top = 104
    Width = 97
    Height = 25
    Caption = 'Ok'
    TabOrder = 0
    OnClick = mrOkClick
  end
end
