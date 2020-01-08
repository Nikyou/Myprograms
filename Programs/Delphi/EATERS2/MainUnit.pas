unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, contnrs, EaterUnit;

type
  TForm1 = class(TForm)
    EventList: TListBox;
    Timer: TTimer;
    StartingButton: TButton;
    procedure StartingButtonClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ThreadTerminated(Sender: TObject);
  private
    { Private declarations }
    Eaters: TObjectList;
  public
    { Public declarations }
    Forks: Pointer;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.StartingButtonClick(Sender: TObject);
begin
  If StartingButton.Caption = 'Start' Then Begin
    StartingButton.Caption := 'Stop';
    Timer.Enabled:= True;
  End
  Else Begin // press "Stop"
    Timer.Enabled:= False;
    StartingButton.Caption := 'Start';
    While Eaters.Count>0 Do Begin
      (Eaters.Items[0] as TEater).Terminate;
      Eaters.Extract(Eaters.First());
    End;
  End;
end;

procedure TForm1.TimerTimer(Sender: TObject);
var t: TEater;
begin
  If Random<0.2 Then Begin
    t:= TEater.Create(EventList.Items, Forks);
    t.OnTerminate:= ThreadTerminated;
    Eaters.Add(t);
    t.Resume;
  End;
end;

procedure TForm1.ThreadTerminated(Sender: TObject);
begin
  Eaters.Remove(Sender as TEater);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Randomize;
  Eaters:= TObjectList.Create;
  GetMem(Forks, ForksAmount);
  FillChar (Forks^, ForksAmount, True);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  StartingButton.Caption:= 'Stop';
  StartingButtonClick(Self);
  FreeMem(Forks, ForksAmount);
  Eaters.Destroy;
end;

end.
