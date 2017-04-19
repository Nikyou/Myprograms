Program Cubick;
procedure Cub(x:char; z:integer);
var c, i:integer;
begin
  c:=0;
  repeat
    for i:=1 to z do
    begin
      Write(x, ' ');
      if i=z then
      begin
        inc(c);
        writeln;
      end;
    end;
  until c=z;
end;
var z:integer;
        x:char;
begin
  Readln(x);
  Readln(z);
  Cub(x,z);
  Readln;
end.