program koren_rekurs;
var res,x:real;
begin
  x:=sqrt(0.5);
  res:=x;
  repeat
    x:=sqrt(0.5+(x*0.5));
    res:=res*x;
  until (x>(1-1e-9));
  Writeln(2/res);
  readln;
end.
