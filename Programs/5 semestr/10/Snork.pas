program Snork;
uses Graph,CRT;
Type Cord=Record
        x,y:integer;
     end;
     SqField=Record
       cord1:Cord;
       cord2:Cord;
       pos:char;
     end;
     GameField=Array [1..100,1..100] of SqField;
var nx,ny,LongX,LongY,MaxX,MaxY,Wide,Long,Turn:integer;


procedure GenerateField(var Field:GameField);
var c:integer;
i:longint;
current:SqField;
begin
  current.cord1.x:=1;
  current.cord1.y:=MaxY-1;
  current.cord2.x:=LongX;
  current.cord2.y:=MaxY-LongY;
  Field[1,1]:=current;
  Field[1,1].pos:='F';
  for c:=1 to Long do
    for i:=1 to Wide do
    begin
      if not ((i=1) and (c=1)) then
        if i=1 then
        begin
          current.cord1.y:=current.cord1.y-1-LongY;
          current.cord2.y:=current.cord2.y-1-LongY;
          Field[i,c]:=current;
        end
        else
        begin
          field[i,c].cord1.x:=field[i-1,c].cord1.x+1+LongX;
          field[i,c].cord2.x:=field[i-1,c].cord2.x+1+LongX;
          field[i,c].cord1.y:=field[i-1,c].cord1.y;
          field[i,c].cord2.y:=field[i-1,c].cord2.y;
        end;
    end;
  i:=Wide*Long;
  Setcolor(Green);
  Rectangle(0,MaxY,field[Wide,Long].cord2.x+1,field[Wide,Long].cord2.y-1);
  for i:=1 to Wide-1 do
    Line((1+Longx)*i,MaxY,(1+Longx)*i,MaxY-(1+LongY)*Long);
  for i:=1 to Long-1 do
    Line(0,MaxY-(1+LongY)*i,(1+Longx)*Wide,MaxY-(1+LongY)*i);
end;

procedure Calculation(var Field:GameField);
var i,c,j,n:integer;
begin
  Field[2,1].pos:='G';
  Field[1,2].pos:='G';
  n:=2;
  for i:=2 to Wide+Long do
  begin
    if (i-Turn-1)=n then
    begin
      c:=0;
      for j:=i downto 1 do
      begin
        inc(c);
        if (((j>0) and (j<=Wide)) and (c<=Long)) then
         Field[j,c].pos:='G';
      end;
      n:=i;
    end;
  end;
  Field[Wide,Long].pos:='S';
  for j:=1 to Long do
    for i:=1 to Wide do
      if not ((Field[i,j].pos='F') or (Field[i,j].pos='G') or (Field[i,j].pos='S')) then
        Field[i,j].pos:='B';
end;

procedure TakeTurn(var xprev,yprev:integer; player:integer; var Field:GameField);
var xg,yg,rx,ry:integer;
good,supergood:boolean;
i:longint;
begin
  if player=1 then
    SetFillStyle(SolidFill,Red)
  else
    SetFillStyle(SolidFill,Blue);
  good:=false;
  supergood:=false;
  i:=0;
  if (((xprev=1) and (yprev=2)) or ((xprev=2) and (yprev=1))) then
  begin
    xprev:=1;
    yprev:=1;
    xg:=1;
    yg:=1;
    Bar(Field[xg,yg].cord1.x,Field[xg,yg].cord1.y,Field[xg,yg].cord2.x,Field[xg,yg].cord2.y);
    exit;
  end;
  repeat
    inc(i);
    rx:=random(Turn*2)-Turn;
    ry:=random(Turn*2)-Turn;
    if ((((((abs(rx))+abs(ry)))<=Turn) and (((abs(rx))+(abs(ry)))>0)) and ((xprev+rx+yprev+ry)<(xprev+yprev))) then
    begin
      if (((xprev+rx)>0) and ((yprev+ry)>0)) and (((xprev+rx)<=Wide) and ((yprev+ry)<=Long)) then
      begin
        xg:=xprev+rx;
        yg:=yprev+ry;
        good:=true;
        if (Field[xg,yg].pos='G') then
          supergood:=true;
      end;
    end;
  until ((supergood) or ((i=(Turn*Turn)) and (good)));
  xprev:=xg;
  yprev:=yg;
  Bar(Field[xg,yg].cord1.x,Field[xg,yg].cord1.y,Field[xg,yg].cord2.x,Field[xg,yg].cord2.y);
end;


var GD,GM,i,xprev,yprev,MaxWide,MaxLong:integer;
PrevSq:SqField;
Field:GameField;
begin
  randomize;
  GD:=Detect;
  InitGraph(GD, GM,'');
  MaxX:=GetMaxX;
  MaxY:=GetMaxY;
  i:=1;
  Wide:=0;
  Long:=0;
  MaxWide:=10;
  MaxLong:=10;
  xprev:=0;
  yprev:=0;
  for i:=1 to 60 do
  begin
    if ((((MaxX-((MaxWide+1)*MaxLong))-MaxWide+2) div (MaxWide+1))>=2) then
      inc(MaxWide);
    if ((((MaxY-(MaxWide*(MaxLong+1)))-MaxLong+2) div (MaxLong+1))>=2) then
      inc(MaxLong);
  end;
  if (MaxWide>100) then
    MaxWide:=100;
  if (MaxLong>100) then
    MaxLong:=100;
  Writeln('Write width from 10 to ',MaxWide,'. Write 0 for random.');
  repeat
    readln(i);
  until (i=0) or ((i>=10) and (i<=MaxWide));
  if i=0 then
    Wide:=Random(MaxWide-9)+10
  else
    Wide:=i;
  i:=1;
  Writeln('Write length from 10 to ',MaxLong,'. Write 0 for random.');
  repeat
    readln(i);
  until (i=0) or ((i>=10) and (i<=MaxLong));
  if i=0 then
    Long:=Random(MaxLong-9)+10
  else
    Long:=i;
  Writeln('Write turn length from 3 to 8. Write 0 for random.');
  repeat
    readln(i);
  until (i=0) or ((i>=3) and (i<=8));
  if i=0 then
    Turn:=Random(5)+3
  else
    Turn:=i;
  nx:=Wide+1;
  ny:=Long+1;
  LongX:=trunc((MaxX-nx)/Wide);
  LongY:=trunc((MaxY-ny)/Long);
  Writeln('Wide: ', Wide,'  Long: ',Long,'  Turn: ', Turn);
  GenerateField(Field);
  Calculation(Field);
  for i:=Long downto 1 do
  begin
  Writeln;
    for xprev:=1 to Wide do
      Write(Field[xprev,i].pos,' ');
  end;
  Writeln;
  xprev:=Wide;
  yprev:=Long;
  i:=0;
  repeat
    Delay(800);
    if not ((xprev=1) and (yprev=1)) then
      TakeTurn(xprev,yprev,1,Field);
    if (((xprev=1) and (yprev=1)) and (i=0)) then
    begin
      i:=1;
      Writeln('Second player win!');
    end;
    Delay(800);
    if not ((xprev=1) and (yprev=1)) then
      TakeTurn(xprev,yprev,2,Field);
    if (((xprev=1) and (yprev=1)) and (i=0)) then
    begin
      i:=1;
      Writeln('First player win!');
    end;
  until i=1;
  Readln;
  CloseGraph;
end.
