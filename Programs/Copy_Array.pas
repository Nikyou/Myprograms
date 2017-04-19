program copy_array;
const N=1000;
type TArray=array[1..N]of longint;

procedure Copyarr(var x,c:tarray; z:integer);
var i:integer;
begin
  for i:=1 to z do
  begin
    c[i]:=x[i];
  end;
end;

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

var z:integer;
        x,c:tarray;
begin
  z:=0;
  Readarr(x, z);
  Copyarr(x,c, z);
  Writearr(x, z);
  Writearr(c, z);
  Readln;
end.