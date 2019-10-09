Program Squares15;
{Вариант 15b1 с ошибками - нет Constructor и Virtual}
Uses Graph, WinCrt, Square;

Type

  TColoredSquare = object(TSquare)
    Color: Integer;
    Procedure Init(AX, AY:Integer; ASide: Word; AColor: Integer);
    Function GetColor: Integer;
    Procedure PutColor(AColor: Integer);
    Procedure Show;
  End;

{Реализация методов класса ColoredSquare}
  Procedure TColoredSquare.Init(AX, AY:Integer; ASide: Word; AColor: Integer);
  Begin
    inherited Init(AX, AY, ASide);
    Color:= AColor;
  End;

  Function TColoredSquare.GetColor: Integer;
  Begin
    GetColor:= Color;
  End;

  Procedure TColoredSquare.PutColor(AColor: Integer);
  Begin
    Hide;
    Color:= AColor;
    Show;
  End;

  Procedure TColoredSquare.Show;
  Var currentcolor: Integer;
  Begin
    currentcolor:= Graph.GetColor;
    Graph.SetColor(color);
    inherited Show;
    Graph.SetColor(currentcolor);
  End;

Var gd,gm: Integer;
    i: Word;
    s: Array [1..15] of TColoredSquare;

Begin
  gd:=Detect;
  InitGraph(gd,gm,'');
  ClearViewPort;
  For i:=1 To 15 Do Begin
    s[i].Init(1,1,3*i+20,i);
  End;
  While Keypressed Do ReadKey;
  Randomize;
  Repeat
    i:=Random(15)+1;
    s[i].MoveTo(Random(GetMaxX-s[i].GetSide),
                Random(GetMaxY-s[i].GetSide));
    Delay(10);
  Until Keypressed;
  ReadKey;
  CloseGraph;
End.
