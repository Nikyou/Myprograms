Program min_array;
const N=1000;
type TArray=array[1..N]of integer;

procedure Readarr(var x:tarray;var z:integer);
var i:integer;
begin
  i:=0;
  repeat
    inc(i);
    Readln(x[i]);
  until x[i]=0;
  z:=i-1;
end;

procedure Writearr(c:tarray; z:integer);
var i:integer;
begin
  for i:=1 to z do
  begin
    Write(c[i], ' ');
  end;
  Writeln;
end;

procedure Swap(var x,y:integer);
var tp:integer;
begin
  tp:=x;
  x:=y;
  y:=tp;
end;

function IndexMin(numbers:Tarray; start,finish:integer):integer;
var x,i:integer;
begin
  x:=start;
  for i:=start to finish do
  begin
    if(numbers[i]<numbers[x]) then
      x:=i;
  end;
  IndexMin:=x;
end;

procedure Sort(var numbers:tarray; len:integer);
var i:integer;
begin
  for i:=1 to len-1 do
    Swap(numbers[i], numbers[IndexMin(numbers,i,len)]);
end;

var len:integer;
        z:tarray;
begin
  Readarr(z,len);
  Sort(z,len);
  Writearr(z,len);
  Readln;
end.
