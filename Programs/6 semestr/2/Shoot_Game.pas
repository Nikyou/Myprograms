Program Shoot_game;
Uses CRT, Shoot_gameUnit, Graph;
Const T=25;
N=15;
Sides=24;
CSpeed=6;

Type
Marks=Array [1..N] of TMark;

var MaxX,MaxY,gd,gm,i,finish: integer;
M:Marks;
B:TBullet;
begin
  randomize;
  gd:=Detect;
  InitGraph(gd,gm,'');
  ClearViewPort;
  MaxX:=GetMaxX;
  MaxY:=GetMaxY;
  for i:=1 to N do
    M[i].Init(random(MaxX)+1-Sides,random(MaxY-MaxY div 4)+1, Sides, random(16));
  for i:=1 to N do
    M[i].Create;
  B.init(1,MaxY-MaxY div 8, CSpeed div 2, CSpeed, red);
  repeat
    finish:=0;
    for i:=1 to N do
      if not (M[i].Hit=true) then
      begin
        M[i].Create;
        inc(finish);
      end;
    delay(T);
    B.Move;
    if (Keypressed) then
    begin
      if ord(readkey)= 32 then
      begin
        B.speedy(CSpeed);
        repeat
          delay(T);
          B.Move;
          for i:=1 to N do
          begin
            M[i].Check(B.x,B.ys,B.r);
          end;
        until B.ys=0;
        B.speedx(CSpeed);
      end;
    end;
  until finish=0;
  Readln;
end.
