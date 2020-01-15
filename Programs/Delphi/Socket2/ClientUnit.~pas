unit ClientUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ScktComp, ExtDlgs;

type
  TClientForm = class(TForm)
    ClientSocket: TClientSocket;
    Timer: TTimer;
    Image1: TImage;
    ConnectButton: TButton;
    GetPictureButton: TButton;
    DisconnectButton: TButton;
    PictureList: TListBox;
    GetListButton: TButton;
    ClearListButton: TButton;
    procedure ConnectButtonClick(Sender: TObject);
    procedure GetPictureButtonClick(Sender: TObject);
    procedure DisconnectButtonClick(Sender: TObject);
    procedure ClientSocketRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure TimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GetListButtonClick(Sender: TObject);
    procedure ClearListButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ClientForm: TClientForm;
  StartGetData: Boolean;
  BmpFile: File;

implementation

{$R *.DFM}

procedure TClientForm.ConnectButtonClick(Sender: TObject);
begin
  ClientSocket.Open;
end;

procedure TClientForm.GetPictureButtonClick(Sender: TObject);
begin
  StartGetData:= True;
  ClientSocket.Socket.SendText(PictureList.Items[PictureList.ItemIndex]);
end;

procedure TClientForm.GetListButtonClick(Sender: TObject);
begin
  StartGetData:= False;
  ClientSocket.Socket.SendText('*');
end;

procedure TClientForm.DisconnectButtonClick(Sender: TObject);
begin
  ClientSocket.Close;
  Close;
end;

procedure TClientForm.ClientSocketRead(Sender: TObject;
  Socket: TCustomWinSocket);
var Buf: PChar;
    Length: Integer;
begin
  If PictureList.Items.Count = 0 Then Begin
    PictureList.Items.SetText(PChar(Socket.ReceiveText));
  End
  Else Begin
    Timer.Enabled:= False;
    Length:= Socket.ReceiveLength;
    GetMem(Buf, Length);
    Socket.ReceiveBuf(Buf^, Length);
    AssignFile(BmpFile, 'tmp.bmp');
    If StartGetData Then Begin
      Rewrite(BmpFile, 1);
      StartGetData:= False;
    End
    Else Begin
      Reset(BmpFile, 1);
      Seek(BmpFile, FileSize(BmpFile));
    End;
    BlockWrite(BmpFile, Buf^, Length);
    CloseFile(BmpFile);
    FreeMem (Buf, Length);
    Timer.Enabled:= True;
  End;
end;

procedure TClientForm.TimerTimer(Sender: TObject);
begin
  Timer.Enabled:= False;
  Image1.Picture.LoadFromFile('tmp.bmp');
  Erase(BmpFile);
end;

procedure TClientForm.FormCreate(Sender: TObject);
begin
  Timer.Interval:= 100;
  Timer.Enabled:= False;
end;

procedure TClientForm.ClearListButtonClick(Sender: TObject);
begin
  PictureList.Clear;
end;

end.
