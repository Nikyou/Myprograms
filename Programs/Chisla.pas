program Chisla;
var x, i: integer;
        c, b, sum:longint;
begin
  Writeln ('������ ᪮�쪮 �ᥫ �� ��� 㢨����(�� 2 �� 44)');
  repeat
  Readln(x);
  until ((x>2) and (x<45));
  i:=0;
  Sum:=1;
  c:=1;
  While (i<x) do
  begin
    inc(i);
    b:=c;
    c:=sum;
    sum:=b+c;
    Write(b,' ');
  end;
  Readln;
end.
