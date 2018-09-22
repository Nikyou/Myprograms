program Chameleon;
uses graph, WinCrt;
var Gd, Gm: integer;
   MaxX, MaxY, n, r, MaxYdiv2: smallint;
   Const K=6;
begin
  Gd:=0;
  Gm:=0;
  InitGraph (Gd, Gm, '');
  MaxX:=GetMaxX;
  MaxY:=GetMaxY;
  MaxYdiv2:= MaxY div 2;
  r:=K;
  n:=MaxX-K;
  Repeat
    Circle (r, MaxYdiv2, r);
    Circle (n, MaxYdiv2, r);
    r:=r+K;
    n:=n-K;
  until r>=MaxYdiv2;
  ReadKey;
  CloseGraph;
end.
