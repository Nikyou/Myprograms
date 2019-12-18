unit Remote_Controler;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ShellAPI;

type
  TCall = class(TForm)
    StartButton: TButton;
    StopButton: TButton;
    SearchListBox: TListBox;
    procedure StartButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Call: TCall;
  CalcHandle: hWnd;

implementation

{$R *.DFM}

procedure TCall.StartButtonClick(Sender: TObject);
var Name: Array[0..25] of Char;
begin
  CalcHandle:= Handle;
  Repeat
    CalcHandle:= GetNextWindow(CalcHandle, GW_HWNDNEXT);
    GetWindowText(CalcHandle, Name, 40);
  Until (Calchandle=0) or (Name='project traffic light controled');
  CalcHandle:= Handle;
  Repeat
    CalcHandle:= GetNextWindow(CalcHandle, GW_HWNDPREV);
    GetWindowText(CalcHandle, Name, 40);
  Until (Calchandle=0) or (Name='project traffic light controled');
  If (Name='project traffic light controled') Then Begin
    SendMessage(CalcHandle, WM_CLOSE, 0,0);
  end;
end;

end.

