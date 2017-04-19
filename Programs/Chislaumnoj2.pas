Program Chislaumnoj2;
const N=100000;
var x: array[1..N] of longint;
        i, z, c:integer;
begin
  z:=0;
  i:=1;
  Writeln('Введите сколько раз хотите умножить на 2');
  x[1]:=1;
  Readln(z);
  Writeln(x[i]);
  for i:=2 to z do
  begin
    x[i]:=x[i-1]*2;
    Writeln(x[i]);
  end;
  Readln;
end.