object Form1: TForm1
  Left = 326
  Top = 99
  Width = 352
  Height = 693
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
  object Log: TListBox
    Left = 0
    Top = 0
    Width = 209
    Height = 654
    ItemHeight = 13
    TabOrder = 0
  end
  object Start_Stop: TButton
    Left = 216
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 1
    OnClick = Start_StopClick
  end
  object List: TCheckListBox
    Left = 296
    Top = 0
    Width = 40
    Height = 654
    Enabled = False
    IntegralHeight = True
    ItemHeight = 13
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '12')
    TabOrder = 2
  end
end
