Unit Square1;

Interface

Uses Graph;

Type
  TLocation = object
    X, Y: Integer;
    Constructor Init(InitX, InitY:Integer);
    Procedure PutX(AX: Integer);
    Procedure PutY(AY: Integer);
    Function GetX:Integer;
    Function GetY:Integer;
  End;

  TSquare = object(TLocation)
    Side: Word;
    Constructor Init(InitX, InitY:Integer; InitSide: Word);
    Procedure PutX(AX: Integer);
    Procedure PutY(AY: Integer);
    Function GetSide: Word;
    Procedure PutSide(ASide: Word);
    Procedure Show; virtual;
    Procedure Hide; virtual;
    Procedure MoveTo(NewX, NewY:Integer);
  End;

Implementation

{��������� ��⮤�� ����� TLocation}

  Constructor TLocation.Init(InitX, InitY:Integer);
  Begin
    X:= InitX;
    Y:= InitY;
  End;

  Procedure TLocation.PutX(AX: Integer);
  Begin
    X:= AX;
  End;

  Procedure TLocation.PutY(AY: Integer);
  Begin
    Y:= AY;
  End;

  Function TLocation.GetX:Integer;
  Begin
    GetX:= X;
  End;

  Function TLocation.GetY:Integer;
  Begin
    GetY:= Y;
  End;

{��������� ��⮤�� ����� TSquare}
  Constructor TSquare.Init(InitX, InitY:Integer; InitSide: Word);
  Begin
    TLocation.Init(InitX, InitY);
    Side:=InitSide;
  End;

  Procedure TSquare.Show;
  Begin
    Rectangle(X,Y,X+Side,Y+Side);
  End;

  Procedure TSquare.Hide;
  Var color:Word;
  Begin
    color:=GetColor;
    SetColor(GetBkColor());
    Rectangle(X,Y,X+Side,Y+Side);
    SetColor(color);
  End;

  Procedure TSquare.PutX(AX: Integer);
  Begin
    Hide;
    inherited;
    Show;
  End;

  Procedure TSquare.PutY(AY: Integer);
  Begin
    Hide;
    inherited;
    Show;
  End;

  Function TSquare.GetSide:Word;
  Begin
    GetSide:= Side;
  End;

  Procedure TSquare.PutSide(ASide:Word);
  Begin
    Hide;
    Side:= ASide;
    Show;
  End;

  Procedure TSquare.MoveTo(NewX, NewY:Integer);
  Begin
    Hide;
    X:= NewX;  Y:= NewY;
    Show;
  End;

End.
