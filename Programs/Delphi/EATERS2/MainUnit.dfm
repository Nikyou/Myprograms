object Form1: TForm1
  Left = 192
  Top = 114
  Width = 305
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object EventList: TListBox
    Left = 0
    Top = 0
    Width = 241
    Height = 446
    Align = alLeft
    ItemHeight = 13
    TabOrder = 0
  end
  object StartingButton: TButton
    Left = 243
    Top = 49
    Width = 41
    Height = 33
    Anchors = [akRight, akBottom]
    Caption = 'Start'
    TabOrder = 1
    OnClick = StartingButtonClick
  end
  object Timer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = TimerTimer
    Left = 104
    Top = 48
  end
end
