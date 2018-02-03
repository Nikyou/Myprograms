program desmit;
var a,b,x:real;
begin
  x:=3;
  a:=2;
  repeat
    b:=(a+(x/a))/2;
    a:=b;
  until ((b*b)<=3);
  writeln(b);
  Writeln(b*b);
  readln;
end.
