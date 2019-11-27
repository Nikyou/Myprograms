object Form1: TForm1
  Left = 324
  Top = 203
  BorderStyle = bsSingle
  BorderWidth = 8
  Caption = 'Form1'
  ClientHeight = 302
  ClientWidth = 388
  Color = clActiveBorder
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clFuchsia
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object levellabel: TLabel
    Left = 304
    Top = 240
    Width = 20
    Height = 44
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 48
    Font.Name = 'MS Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 177
    Height = 105
    Alignment = taCenter
    AutoSize = False
    Caption = 'red'
    Color = clBtnFace
    ParentColor = False
    OnMouseDown = LabelMouseDown
    OnMouseUp = LabelMouseUp
  end
  object Label2: TLabel
    Left = 200
    Top = 8
    Width = 177
    Height = 105
    Alignment = taCenter
    AutoSize = False
    Caption = 'blue'
    Color = clBtnFace
    ParentColor = False
    OnMouseDown = LabelMouseDown
    OnMouseUp = LabelMouseUp
  end
  object Label3: TLabel
    Left = 8
    Top = 128
    Width = 177
    Height = 105
    Alignment = taCenter
    AutoSize = False
    Caption = 'green'
    Color = clBtnFace
    ParentColor = False
    OnMouseDown = LabelMouseDown
    OnMouseUp = LabelMouseUp
  end
  object Label0: TLabel
    Left = 200
    Top = 128
    Width = 177
    Height = 105
    Alignment = taCenter
    AutoSize = False
    Caption = 'yellow'
    Color = clBtnFace
    ParentColor = False
    OnMouseDown = LabelMouseDown
    OnMouseUp = LabelMouseUp
  end
  object NextButton: TButton
    Left = 144
    Top = 248
    Width = 97
    Height = 41
    Caption = 'Pusk!'
    TabOrder = 0
    OnClick = NextButtonClick
  end
  object Blinker: TTimer
    OnTimer = BlinkerTimer
    Left = 176
    Top = 112
  end
end
