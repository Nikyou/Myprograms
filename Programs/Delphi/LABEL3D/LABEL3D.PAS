unit Label3D;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TLabel3DStyle = (lsLowered, lsRaised);
  TLabel3D = class(TLabel)
  private
    FStyle: TLabel3DStyle;
    Procedure SetStyle(AStyle: TLabel3DStyle);
    Procedure DoDrawText;
  protected
    Procedure Paint; override;
  public
    Constructor Create(AOwner: TComponent); override;
  published
    Property Style: Tlabel3DStyle Read FStyle Write SetStyle Default lsRaised;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TLabel3D]);
end;


Constructor TLabel3D.Create(AOwner: TComponent);
Begin
  Inherited Create(AOwner);
  FStyle:= lsRaised;
End;

Procedure TLabel3D.SetStyle(AStyle: TLabel3DStyle);
Begin
  FStyle:= AStyle;
  Invalidate;
End;

Procedure TLabel3D.Paint;
Begin
  with Canvas Do Begin
    If not Transparent Then Begin
      Brush.Color:= Color;
      Brush.Style:= bsSolid;
      FillRect(ClientRect);
    End;
    Brush.Style:= bsClear;
    DoDrawText;
  End;
End;

Procedure TLabel3D.DoDrawText;
Var SaveColor: TColor;
    X, Y: Integer;
Begin
  Canvas.Font:= Font;
  Y:= (Height - Canvas.TextHeight(Caption)) div 2;
  Case Alignment of
  taLeftJustify:
    X:= 1;
  taCenter:
    X:= (Width - Canvas.TextWidth(Caption)) div 2;
  taRightJustify:
    X:= Width - Canvas.TextWidth(Caption);
  End;
  If Enabled Then Begin
    SaveColor:= Canvas.Font.Color;
    If FStyle=lsLowered Then Begin
      Canvas.Font.Color:= clBtnShadow;
    End
    Else {FStyle=lsRaised} Begin
      Canvas.Font.Color:= clBtnHighLight;
    End;
    Canvas.TextOut(X-1, Y-1, Caption);
    If FStyle=lsLowered Then Begin
      Canvas.Font.Color:= clBtnHighLight;
    End
    Else {FStyle=lsRaised} Begin
      Canvas.Font.Color:= clBtnShadow;
    End;
    Canvas.TextOut(X+1, Y+1, Caption);
    Canvas.Font.Color:= SaveColor;
  End
  Else Begin
    Canvas.Font.Color:= clGrayText;
  End;
  Canvas.TextOut(X, Y, Caption);
End;
end.
