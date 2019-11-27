unit gam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  EMyException = class(Exception)
                 end;
  TForm1 = class(TForm)
    NextButton: TButton;
    levellabel: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label0: TLabel;
    Blinker: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure NextButtonClick(Sender: TObject);
    procedure LabelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LabelMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BlinkerTimer(Sender: TObject);
  protected
    Function GetLevel: Integer;
    Procedure SetLevel(n: Integer);
  private
    { Private declarations }
    seq: Array [1..1000] of Byte;
    pressno, blinkno: Integer;
    Procedure TurnLabel(OnOff: Boolean);
    property level: Integer read GetLevel write SetLevel;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

Procedure TForm1.TurnLabel(OnOff: Boolean);
Begin
  Label0.Enabled:= OnOff;
  Label1.Enabled:= OnOff;
  Label2.Enabled:= OnOff;
  Label3.Enabled:= OnOff;
End;

Function TForm1.GetLevel: Integer;
Begin
  GetLevel:= StrToInt(levellabel.caption);
End;

Procedure TForm1.SetLevel(n: Integer);
Begin
  levellabel.caption:= IntToStr(n);
End;

procedure TForm1.FormCreate(Sender: TObject);
Var i: Integer;
begin
  Randomize;
  For i:= 1 to 1000 do Begin
    seq[i]:= random(4);
  End;
  blinkno:= 0;
  level:=1;
  Blinker.enabled:= False;
  Blinker.Interval:= 5;
  TurnLabel(False);
end;

procedure TForm1.NextButtonClick(Sender: TObject);
begin
  Blinker.Enabled:= True;
end;

procedure TForm1.LabelMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var nomer: Byte;
begin
  Inc(pressno);
  try
    If (Sender as TLabel).Name='Label1' Then Begin
      (Sender as Tlabel).color:= clRed;
      nomer:= 1;
    End Else
    If (Sender as TLabel).Name='Label2' Then Begin
      (Sender as Tlabel).color:= clBlue;
      nomer:= 2;
    End Else
    If (Sender as TLabel).Name='Label3' Then Begin
      (Sender as Tlabel).color:= clGreen;
      nomer:= 3;
    End Else
    If (Sender as TLabel).Name='Label0' Then Begin
      (Sender as Tlabel).color:= clYellow;
      nomer:= 0;
    End;
    if seq[pressno]<>nomer Then Begin
      raise EMyException.Create('ERROR!!! on level '+IntToStr(level));
    End;
  except
    on EMyException do begin
      level:= 1;
      pressno:= 0;
      NextButton.Caption:= 'Pusk!';
      NextButton.Enabled:= True;
      TurnLabel(False);
      raise;
    end;
  end;
end;

procedure TForm1.LabelMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TLabel(Sender).color:= clBtnFace;
  if pressno=level Then Begin
    TurnLabel(False);
    showmessage('Urra!');
    NextButton.Caption:= 'Pusk!';
    NextButton.Enabled:= True;
    level:= level+1;
  End;
end;

procedure TForm1.BlinkerTimer(Sender: TObject);
Const OnTime = 200; OffTime=50;
begin
  If blinkno=0 Then Begin
    Blinker.Interval:= OffTime;
    NextButton.Enabled:= False;
  End;
  try
    If Blinker.Interval=OffTime Then Begin
      Inc(blinkno);
      If blinkno>level Then
        raise Exception.Create('');
      Case seq[blinkno] of
      0: Label0.Color:= clYellow;
      1: Label1.Color:= clRed;
      2: Label2.Color:= clBlue;
      3: Label3.Color:= clGreen;
      End;
      Blinker.Interval:= OnTime;
    End
    Else Begin {Interval=OnTime}
      Case seq[blinkno] of
      0: Label0.Color:= clBtnFace;
      1: Label1.Color:= clBtnFace;
      2: Label2.Color:= clBtnFace;
      3: Label3.Color:= clBtnFace;
      End;
      Blinker.Interval:= OffTime;
    End;
  except
    on Exception do Begin
      Blinker.Enabled:= False;
      NextButton.Caption:= 'Press sequence';
      TurnLabel(True);
      pressno:= 0;
      blinkno:= 0;
    End;
  End;
end;

end.
