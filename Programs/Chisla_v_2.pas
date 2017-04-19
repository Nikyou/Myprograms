Program Chisla_v_2;
const N=1000;
type TArray=array[1..N]of longint;

procedure Chis(var c:tarray; z:integer);
var i:integer;
begin
  c[1]:=1;
  c[2]:=1;
  for i:=3 to z do
  begin
    c[i]:=c[i-1]+c[i-2];
  end;
end;

procedure Writechis(c:tarray; z:integer);
var i:integer;
begin
  for i:=1 to z do
  begin
    Write(c[i], ' ');
  end;
end;

var z:integer;
        c:tarray;
begin
  Readln(z);
  Chis(c, z);
  Writechis(c, z);
  Readln;
end.