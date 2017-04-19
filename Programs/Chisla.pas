program Chisla;
var x, i: integer;
        c, b, sum:longint;
begin
  Writeln ('‚¢¥¤¨â¥ áª®«ìª® ç¨á¥« ‚ë å®â¨â¥ ã¢¨¤¥âì(®â 2 ¤® 44)');
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
