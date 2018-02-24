Program Chanses;


function Steps(d:longint; p:real):longint;
var i:integer;
begin
  for i:=1 to 100000 do
  begin
    if d=0 then
    begin
      Steps:=i;
      break;
    end;
    if random<p then
        dec(d)
    else
        inc(d);
  end;
end;


var d:longint;
p:real;
begin
  p:=0.51;
  d:=66;
  Writeln(Steps(d,p));
  Readln;
end;