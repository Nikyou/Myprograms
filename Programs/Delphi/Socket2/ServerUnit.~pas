unit ServerUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ScktComp, ExtDlgs;

type
  TServerForm = class(TForm)
    ServerSocket1: TServerSocket;
    ExitButton: TButton;
    CountLabel: TLabel;
    Counter: TLabel;
    FileNameLabel: TLabel;
    PictureList: TListBox;
    procedure ExitButtonClick(Sender: TObject);
    procedure ServerSocket1ClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ServerForm: TServerForm;

implementation

{$R *.DFM}

procedure TServerForm.ExitButtonClick(Sender: TObject);
begin
  If (ServerSocket1.Socket.ActiveConnections = 0) or
     (MessageDlg('There exist active connections. Disconnect?',
                 mtWarning, [mbYes, mbNo], 0) = mrYes)
  Then Begin
    ServerSocket1.Close;
    Close;
  End;
end;

procedure TServerForm.ServerSocket1ClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  With Counter Do Begin
    Caption:= IntToStr(ServerSocket1.Socket.ActiveConnections);
  End;
end;

procedure TServerForm.ServerSocket1ClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  With Counter Do Begin
    Caption:= IntToStr(ServerSocket1.Socket.ActiveConnections-1);
  End;
end;

procedure TServerForm.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
Var SStream: TStringStream;
    FStream: TFileStream;
    s: String;
begin
  s:= Socket.ReceiveText;
  If s='*' Then Begin
    SStream:= TStringStream.Create(PictureList.Items.Text);
    Socket.SendStream(SStream);
  End
  Else Begin
    FStream:= TFileStream.Create(s, fmOpenRead);
    Socket.SendStream(FStream);
  End;
end;

end.
