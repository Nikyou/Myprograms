unit Beacon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls;

type
  TBeacon = class(TPanel)
  Shape: TShape;
  Timer: TTimer;
  private
    FEnabled: boolean;
    FTimeOn: integer;
    FTimeOff: integer;
    FColorOn: TColor;
    FColorOff: TColor;
    { Private declarations }
  protected
    Procedure SetColorOn(AColor: TColor);
    Procedure SetColorOff(AColor: TColor);
    { Protected declarations }
  public
    Constructor Create (AOwner: TCompoment); override;
    { Public declarations }
  published
    Property Enabled: Boolean read FEnabled write FEnabled default False;
    Property TimeOn: integer read FTimeOn write FTimeOn default 1000;
    Property TimeOff: integer read FTimeOff write FTimeOff default 1000;
    Property ColorOn: TColor read FColorOn write SetColorOn default clWhite;
    Property ColorOff: TColor read FColorOff write SetColorOff default clMenu;
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TBeacon]);
end;

Constructor TBeacon.Create(AOwner: TCompoment);
begin
  Inherited Create(AOwner);
  FEnabled:=False;
  FTimeOn:=1000;
  FTimeOff:=1000;
  FColorOn:=clWhite;
  FColorOff:=clMenu;
end;

Procedure SetColorOn(AColor: TColor);
begin
  FColorOn:=AColor;
  Invalidate;
end;

Procedure SetColorOff(AColor: TColor);
begin
  FColorOff:=AColor;
  Invalidate;
end;
end.
