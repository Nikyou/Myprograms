Program Film;
Uses CRT, FilmUnit;
Const T=150;
N=10;

var x,y,MaxX,MaxY: integer;
finish: boolean;
Actor: TLetter;
begin
  Cursoroff;
  x:=1;
  y:=0;
  MaxX:=WindMaxX-1;
  MaxY:=WindMaxY-1;
  finish:=false;
  Actor.init(1,1, 'A');
  Write(Actor.symb);
  GotoXY(1,1);
  repeat
    Actor.Moveto(Actor.x+x, Actor.y+y, N);
    if ((Actor.x=MaxX) and (y=0)) then
    begin
      x:=0;
      y:=1;
    end;
    if ((Actor.y=MaxY) and (y=1)) then
    begin
      x:=-1;
      y:=0;
    end;
    if ((Actor.x=1) and (x=-1)) then
    begin
      x:=0;
      y:=-1;
    end;
    if ((Actor.x=1) and (Actor.y=1)) then
    begin
      Actor.Hide;
      GotoXY(MaxX div 2,MaxY div 2);
      Actor.x:=MaxX div 2;
      Actor.y:=MaxY div 2;
      Write(Actor.symb);
      GotoXY(Actor.x,Actor.y);
      Actor.Blink(N,T*5);
      finish:=true
    end;
  until finish;
  Readln;
end.
