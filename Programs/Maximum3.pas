Program maximum3;
const N=100000;
var x: array[1..N] of longint;
        i, z, c, y, max1, max2, max3:longint;
begin
  z:=0;
  i:=1;
  Writeln('������ �᫠, ����� ������� ������ "-1"');
  while (i>-1) do
  begin
    inc(z);
    Readln(i);
    if (i>-1) then x[z]:=i;
  end;
  dec(z);
  max1:=-333;
  max2:=-333;
  max3:=-333;
  for i:=1 to z do
  begin
    if (max1<>c) then c:=max1;
    if (max1<x[i]) then max1:=x[i];
    if ((max2<x[i]) and (max2<>max1)) then max2:=c;
    if ((max3<x[i]) and (max3<max2) and (max3<max1)) then max3:=x[i];
  end;
  Writeln('���ᨬ� �1:',max1,', ���ᨬ� �2:',max2,', ���ᨬ� �3:',max3);
  Readln;
end.