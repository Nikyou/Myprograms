Program Class_random;

function Common_bd(n:integer):boolean;
var a:array[1..365] of integer;
        i,b:integer;
begin
  Common_bd:=false;
  for i:=1 to n do
  begin
    a[i]:=random(365)+1;
  end;
  for i:=1 to n-1 do
    for b:=i+1 to n do
    begin
      if a[i]=a[b] then
        Common_bd:=true;
    end;
end;


var n,a,b,i:longint;
begin
  randomize;
  n:=31;
  a:=100000;
  b:=0;
  for i:=1 to a do
  begin
    if common_bd(n) then
        inc(b);
  end;
  Writeln((b/a)*100:0:2);
  Readln;
end.
