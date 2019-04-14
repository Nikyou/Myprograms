program Snork;
uses Graph;
Type Cord=Record
        x,y:integer;
     end;
     SqField=Record
       cord1:Cord;
       cord2:Cord;
       pos:char;
     end;
     GameField=Array [1..30,1..30] of SqField;
var nx,ny,LongX,LongY,MaxX,MaxY,Wide,Long,Turn:integer;


procedure GenerateField(var Field:GameField);
var c,i:integer;
current:SqField;
begin
  current.cord1.x:=1;
  current.cord1.y:=MaxY-1;
  current.cord2.x:=1+LongX;
  current.cord2.y:=MaxY-1-LongY;
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
    c:=0;
    if (i-turn+1)=n then
      for j:=i-turn+1 downto 1 do
      begin
      inc(c);
        if (((j>0) and (j<Wide)) and (c<Long)) then
          Field[j,c].pos:='G';
      end;
    n:=i;
  end;
  Field[Wide,Long].pos:='S';
  for j:=1 to Long do
    for i:=1 to Wide do
      if not ((Field[i,j].pos='F') or (Field[i,j].pos='G') or (Field[i,j].pos='S')) then
        Field[i,j].pos:='B';
end;


var GD,GM,i:integer;
PrevSq:SqField;
Field:GameField;
begin
  randomize;
  GD:=Detect;
  InitGraph(GD, GM,'');
  MaxX:=GetMaxX;
  MaxY:=GetMaxY;
//  Writeln('X: ', MaxX);
//  Writeln('Y: ', MaxY);
  Wide:=Random(27)+4;
  Long:=Random(27)+4;
  nx:=Wide+1;
  ny:=Long+1;
  LongX:=trunc((MaxX-nx)/Wide);
  LongY:=trunc((MaxY-ny)/Long);
  Turn:=Random(5)+3;
  Writeln('Wide: ', Wide,'  Long: ',Long,'  Turn: ', Turn);
  GenerateField(Field);                            {Sdelal pole, samoy igri net}
  Calculation(Field);
  Readln;
  CloseGraph;
end.
