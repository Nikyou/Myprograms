program Chameleon;
uses graph, WinCrt;
var Gd, Gm, rc: integer;
   MaxX, MaxY, rx1, rx2, rx3, ry1, ry2, ry3: smallint;
   i: longint;
begin
  randomize;
  Gd:=0;
  Gm:=0;
  InitGraph (Gd, Gm, '');
  MaxX:=GetMaxX; {1599}
  MaxY:=GetMaxY; {836}      {1336764}
  for i:=1 to 13367 do
  begin
    rx1:=random(MaxX);
    ry1:=random(MaxY);
    rx2:=random(MaxX);
    ry2:=random(MaxY);
    rx3:=random(MaxX);
    ry3:=random(MaxY);
    rc:=random(16);
    SetColor(rc);
    Line(rx1, ry1, rx2, ry2);
    If random(100)=0 then FloodFill(rx3,ry3,random(16));
  end;
  ReadKey;
  CloseGraph;
end.
