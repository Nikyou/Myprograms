program Even_noteven;
var a:array [1..1000] of longint;
b,c,i, n:integer;
begin
  n:=7;
  for i:=1 to n do
  begin
    a[i]:=random(20);
    write(a[i],' ');
  end;
  b:=1;
  for i:=1 to n do
  begin
    if not (a[i] mod 2=0) then
      while not (a[i] mod 2=0) do
      begin
        if (i+b)>n then
                break;
        c:=a[i+b];
        a[i+b]:=a[i];
        a[i]:=c;
        inc(b);
      end;
    b:=1;
  end;
  writeln;
  for i:=1 to n do
  begin
    write(a[i], ' ');
  end;
  readln;
end.