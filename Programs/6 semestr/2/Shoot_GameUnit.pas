Unit Shoot_gameUnit;

Interface

Uses CRT, Graph;

Type
Cordr=record
  x,y:integer;
end;
 
TMark=object
  x,y,side,color:integer;
  Hit:boolean;
  procedure Init(ax,ay,aside,acolor:integer);
  procedure Destroy;
  procedure Create;
  procedure Check(ax,ay,ar:integer);
end;

TBullet=object
  x,y,ys,r,color:integer;
  speed:cordr;
  procedure Init(ax,ay,ar,asx,acolor:integer);
  procedure Destroy;
  procedure Create(ax,ay:integer);
  procedure Move;
  procedure Speedx(ax:integer);
  procedure Speedy(ay:integer);
end;
 

Implementation

procedure TMark.Init(ax,ay,aside,acolor:integer);
begin
  x:=ax;
  y:=ay;
  side:=aside;
  color:=acolor;
  Hit:=false;
end;
   
procedure TBullet.Init(ax,ay,ar,asx,acolor:integer);
begin
  x:=ax;
  y:=ay;
  r:=ar;
  speed.x:=asx;
  speed.y:=0;
  color:=acolor;
end;

procedure TMark.Destroy;
begin
  SetColor(0);
  Rectangle(x,y,x+side,y+side);
  Hit:=true;
end;

procedure TBullet.Destroy;
begin
  SetColor(0);
  Circle(x,y,r);
end;

procedure TMark.Create;
begin
  SetColor(color);
  Rectangle(x,y,x+side,y+side);
  Hit:=false;
end;

procedure TBullet.Create(ax,ay:integer);
begin
  Destroy;
  SetColor(color);
  x:=ax;
  y:=ay;
  Circle(x,y,r);
end;

procedure TMark.Check(ax,ay,ar:integer);
var x1,x2,y0:integer;
begin
  x1:=ax-ar;
  x2:=ax+ar;
  y0:=ay-ar;
  if (y0<=y+side) and (y0>=y) then
    if (x1>=x) and (x2<=x+side) then
    begin
      Destroy;
      Hit:=true;
    end;
end;

procedure TBullet.Move;
begin
  Destroy;
  x:=x+speed.x;
  if (speed.y=0) then
    ys:=y
  else
    ys:=ys+speed.y;
  if (x>GetMaxX) then
    x:=1;
  if (ys<0) then
    ys:=0;
  Create(x,ys);
end;

procedure TBullet.Speedx(ax:integer);
begin
  x:=1;
  ys:=y;
  speed.x:=ax;
  speed.y:=0;
end;

procedure TBullet.Speedy(ay:integer);
begin
  speed.y:=-ay;
  speed.x:=0;
end;

end.
