unit EaterUnit;

interface

uses
  Classes, SysUtils, extctrls;

const ForksAmount = 100;

type
  PForks = ^TForks;
  TForks = Array [0..ForksAmount-1] of Boolean;

  TEater = class(TThread)
  private
    { Private declarations }
    FList: TStrings;
    FForks: PForks;
    T: TTimer;
    k: Integer;         // forks #k and #(k+1)
    success: Boolean;
    procedure Outcomereport;
    procedure Start;
  protected
    procedure Execute; override;
  public
    procedure Tick (Sender: TObject);
    constructor Create (List: TStrings; Forks: Pointer);
  end;

implementation
{ TEater }

constructor TEater.Create (List: TStrings; Forks: Pointer);
Begin
  inherited Create(True);
  FForks:= PForks(Forks);
  FList:= List;
  FreeOnTerminate:= False;
  T:= TTimer.Create(nil);
End;

procedure TEater.Start;
Begin
  k:= Random(99);
  success:= FForks^[k] and FForks^[k+1];
  If success Then Begin
    FForks^[k]:= False;
    FForks^[k+1]:= False;
    FList.Add('Forks #'+ IntToStr(k) + ' and #' + IntToStr(k+1) + ' are busy.');
  End
  Else Begin
    FList.Add('Failure on forks #'+ IntToStr(k) + ' and #' + IntToStr(k+1));
  End;
End;

procedure TEater.OutComeReport;
Begin
  FForks^[k]:= True;
  FForks^[k+1]:= True;
  FList.Add('Forks #'+ IntToStr(k) + ' and #' + IntToStr(k+1) + ' are free.');
End;

procedure TEater.Execute;
begin
  Synchronize(Start);
  If success Then Begin
    T.OnTimer:= Tick;
    T.Interval:= 1000 + Random(3000);
    T.Enabled:= True;
    Repeat Until (Terminated);
    Synchronize (OutcomeReport);
  End;
end;

procedure TEater.Tick(Sender: TObject);
Begin
  T.Enabled:= False;
  T.Destroy;
  Terminate;
End;

end.
