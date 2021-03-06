object ServerForm: TServerForm
  Left = 1240
  Top = 143
  BorderStyle = bsDialog
  Caption = 'Server'
  ClientHeight = 394
  ClientWidth = 199
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object CountLabel: TLabel
    Left = 8
    Top = 8
    Width = 140
    Height = 29
    Caption = 'Connections:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Counter: TLabel
    Left = 160
    Top = 8
    Width = 13
    Height = 29
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object FileNameLabel: TLabel
    Left = 8
    Top = 40
    Width = 169
    Height = 25
    AutoSize = False
  end
  object ExitButton: TButton
    Left = 56
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Exit'
    TabOrder = 0
    OnClick = ExitButtonClick
  end
  object PictureList: TListBox
    Left = 8
    Top = 120
    Width = 185
    Height = 257
    ItemHeight = 13
    Items.Strings = (
      'Blue Lace 16.bmp'
      'Coffee Bean.bmp'
      'FeatherTexture.bmp'
      'Gone Fishing.bmp'
      'Prairie Wind.bmp'
      'River Sumida.bmp'
      'Santa Fe Stucco.bmp'
      'Zapotec.bmp'
      'dog.bmp')
    TabOrder = 1
  end
  object ServerSocket1: TServerSocket
    Active = True
    Port = 10048
    ServerType = stNonBlocking
    OnClientConnect = ServerSocket1ClientConnect
    OnClientDisconnect = ServerSocket1ClientDisconnect
    OnClientRead = ServerSocket1ClientRead
    Left = 152
    Top = 72
  end
end
