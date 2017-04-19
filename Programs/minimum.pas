Program minimum;
const N=100000;
var x: array[1..N] of longint;
        i, z, min:integer;
begin
  z:=0;
  i:=1;
  Writeln('Введите числа, когда закончите введите "-1"');
  while (i>-1) do
  begin
    inc(z);
    Readln(i);
    if (i>-1) then x[z]:=i;
  end;
  dec(z);
  min:=x[1];
  for i:=1 to z do
  begin
    if (min>x[i]) then min:=x[i];
  end;
  Writeln('Минимум:',min);
  Readln;
end.