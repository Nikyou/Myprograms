object Form1: TForm1
  Left = 511
  Top = 210
  Width = 858
  Height = 554
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MyButton1: TButton
    Left = 200
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Pusk'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = MyButton1Click
  end
  object MyButton2: TButton
    Left = 360
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Pusk'
    Enabled = False
    TabOrder = 1
    OnClick = MyButton2Click
  end
end
