program Craps
var i,w:longint;
a,b,c:integer;
begin
  w:=0;
  for i:=1 to 1000000 do
  begin
    a:=random(6)+1;
    b:=random(6)+1;
    if (a+b) in[7,11] then
        inc(w);
    if not ((a+b) in[2,3,12,7,11] then
    begin
    c:=a+b;
    repeat
      a:=random(6)+1;
      b:=random(6)+1;
      if (a+b)=c then
        inc(w);
    until ((a+b)=c) or ((a+b)=7)
    end;
  end;
  Writeln((w/1000000)*100):0:100;
  Readln;
end.