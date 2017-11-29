program RandomNumbers;
var i:integer;
f:text;
begin
  Assign(f,'Numbers1.txt');
  Rewrite(f);
  for i:= 1 to random(99) do
  begin
    Write(f,random(999));
    if random(6)=1 then
      Writeln(f)
    else
      Write(f,',');
  end;
  Write(f,'0',',');
  Close(f);
end.
