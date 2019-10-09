Program FlyingFigures;

Uses Graph, winCRT, figures, stack;

Var 
  gd, gm: Integer;
  s: PFigureStack;
  
Begin
  gd:= 0;
  InitGraph(gd, gm, '');
  s:= New(PFigureStack, Init(0.03));
  Repeat
    s^.Tick;
  Until KeyPressed;
  Dispose(s, Done);
  CloseGraph();
End.