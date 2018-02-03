program Array_choose_sum;
var a:array [1..1000] of longint;
b,c,i, n:integer;
begin
  n:=7;
  for i:=1 to n do
  begin
    a[i]:=random(20);
    write(a[i],' ');
  end;
  b:=0;
  for i:=1 to n do
  begin
    c:=a[i];
    a[i]:=b+a[i];
    b:=c;
  end;
  writeln;
  for i:=1 to n do
  begin
    write(a[i], ' ');
  end;
  readln;
end.