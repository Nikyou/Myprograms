Program Najti;
const N=100000;
var x: array[1..N] of longint;
        i, z, min, c:integer;
begin
  z:=0;
  i:=1;
  Writeln('������ �᫠, ����� ������� ������ "-1337"');
  while (i>-1337) do
  begin
    inc(z);
    Readln(i);
    if (i>-1337) then x[z]:=i;
  end;
  dec(z);
  Writeln('������ �᫮ ���஥ ��� ����');
  Readln(c);
  for i:=1 to z do
  begin
    if (c=x[i]) then
    begin
    Writeln('����� �᫠:',i);
    inc(min);
    end;
  end;
  If (min=0) then
  begin
    Writeln('����� �ᥫ ���뫮');
  end
  else
  begin
    Writeln('����� �ᥫ �뫮 ',min)
  end;
  Readln;
end.