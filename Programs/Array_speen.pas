program Array_speen;
var a:array [1..1000] of longint;
b,i, n:integer;
begin
  n:=7;
  for i:=1 to n do
  begin
    a[i]:=random(20);
    write(a[i],' ');
  end;
  for i:=1 to n do
  begin
    if (n-i)=0 then
      break;
    b:=a[n-i];
    a[n-i+1]:=b;
  end;
  writeln;
  for i:=1 to n do
  begin
    write(a[i], ' ');
  end;
  readln;
end.