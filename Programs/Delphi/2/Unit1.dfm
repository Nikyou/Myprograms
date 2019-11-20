object Form1: TForm1
  Left = 400
  Top = 250
  Width = 1016
  Height = 539
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 64
    Top = 70
    Width = 70
    Height = 70
    Brush.Color = clNavy
    Brush.Style = bsDiagCross
    Shape = stCircle
  end
  object Button1: TButton
    Left = 424
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 264
    Top = 208
  end
end
