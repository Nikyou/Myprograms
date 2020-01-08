unit EaterUnit;

interface

uses
  Classes, SysUtils;

type
  PForks = ^TForks;
  TForks = Array [0..99] of Boolean;

  TEater = class(TThread)
  private
    { Private declarations }
    FList: TStrings;
    FForks: PForks;
    k: Integer;         // forks #k and #(k+1)
    success: Boolean;
    procedure Outcomereport;
    procedure Start;
  protected
    procedure Execute; override;
  public
    constructor Create (List: TStrings; Forks: Pointer);
  end;

implementation
{ TEater }

constructor TEater.Create (List: TStrings; Forks: Pointer);
Begin
  inherited Create(True);
  FForks:= PForks(Forks);
  FList:= List;
  FreeOnTerminate:= True;
  Resume;
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
Var i: Integer;
begin
  if Terminated Then Exit;
  Synchronize(Start);
  If success Then Begin
    Repeat
      For i:= 1 to 1000000 do Begin
        if Terminated Then Begin
          Synchronize (OutcomeReport);
          Exit;
        End;
      End;
    Until Random (5000)= 0;
    Synchronize (OutcomeReport);
  End;
end;

end.
