unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, EaterUnit;

type
  PForks = ^TForks;
  TForks = Array [0..99] of Boolean;

  TForm1 = class(TForm)
    EventList: TListBox;
    Timer: TTimer;
    StartingButton: TButton;
    procedure StartingButtonClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    Eaters: Array [1..10000] of TEater;
  public
    { Public declarations }
    Forks: PForks;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.StartingButtonClick(Sender: TObject);
Var i: Integer;
begin
  If StartingButton.Caption = 'Start' Then Begin
    StartingButton.Caption := 'Stop';
    Timer.Enabled:= True;
  End
  Else Begin // press "Stop"
    For i:= 1 To 10000 Do Begin
      If Assigned (Eaters[i]) Then Eaters[i].Terminate;
    End;
    StartingButton.Caption := 'Start';
    Timer.Enabled:= False;
  End;
end;

procedure TForm1.TimerTimer(Sender: TObject);
Var i: Integer;
begin
  If Random<0.2 Then Begin
    i:= 1;
    While Assigned(Eaters[i]) Do Inc(i);
    Eaters[i]:= TEater.Create ( EventList.Items, Forks);
  End;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Randomize;
  New(Forks);
  FillChar (Forks^, SizeOf(Forks^), True);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  StartingButton.Caption:= 'Stop';
  StartingButtonClick(StartingButton);
end;

end.
