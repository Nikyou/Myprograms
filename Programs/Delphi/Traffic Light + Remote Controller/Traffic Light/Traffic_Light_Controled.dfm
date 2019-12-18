object Form1: TForm1
  Left = 216
  Top = 114
  Width = 972
  Height = 524
  Caption = 'Traffic Light Controled'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Base: TShape
    Left = 345
    Top = 59
    Width = 117
    Height = 329
    Brush.Color = clScrollBar
  end
  object RedLight: TShape
    Left = 102
    Top = 72
    Width = 101
    Height = 97
    Brush.Color = clMenu
    Shape = stCircle
  end
  object YellowLight: TShape
    Left = 104
    Top = 234
    Width = 102
    Height = 102
    Brush.Color = clMenu
    Shape = stCircle
  end
  object GreenLight: TShape
    Left = 117
    Top = 377
    Width = 102
    Height = 102
    Brush.Color = clMenu
    Shape = stCircle
  end
  object Sun: TShape
    Left = 800
    Top = 26
    Width = 130
    Height = 130
    Brush.Color = clYellow
    Shape = stCircle
  end
  object Changer: TButton
    Left = 637
    Top = 150
    Width = 61
    Height = 20
    Caption = 'Change'
    TabOrder = 0
    OnClick = ChangerClick
  end
  object Button_Day_Night: TButton
    Left = 650
    Top = 312
    Width = 61
    Height = 20
    Caption = 'Night'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button_Day_NightClick
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 720
    Top = 496
  end
end
