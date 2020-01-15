object ClientForm: TClientForm
  Left = 536
  Top = 88
  Width = 403
  Height = 550
  Caption = 'Client'
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
  object Image1: TImage
    Left = 128
    Top = 8
    Width = 225
    Height = 185
  end
  object ConnectButton: TButton
    Left = 24
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Connect'
    TabOrder = 0
    OnClick = ConnectButtonClick
  end
  object GetPictureButton: TButton
    Left = 24
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Get Picture'
    TabOrder = 1
    OnClick = GetPictureButtonClick
  end
  object DisconnectButton: TButton
    Left = 24
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Disconnect'
    TabOrder = 2
    OnClick = DisconnectButtonClick
  end
  object PictureList: TListBox
    Left = 128
    Top = 200
    Width = 225
    Height = 305
    ItemHeight = 13
    TabOrder = 3
  end
  object GetListButton: TButton
    Left = 24
    Top = 56
    Width = 73
    Height = 25
    Caption = 'Get List'
    TabOrder = 4
    OnClick = GetListButtonClick
  end
  object ClearListButton: TButton
    Left = 24
    Top = 88
    Width = 75
    Height = 25
    Caption = 'ClearList'
    TabOrder = 5
    OnClick = ClearListButtonClick
  end
  object ClientSocket: TClientSocket
    Active = False
    Address = '127.0.0.1'
    ClientType = ctNonBlocking
    Port = 10048
    OnRead = ClientSocketRead
    Left = 200
    Top = 40
  end
  object Timer: TTimer
    Interval = 100
    OnTimer = TimerTimer
    Left = 152
    Top = 40
  end
end
