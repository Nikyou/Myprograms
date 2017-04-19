Program Chetnie_chisla;

function Prov(x:longint):integer;
var y:integer;
begin
  if (x mod 2=0) then
  begin
    y:=1;
  end
  else
  begin
    y:=0;
  end;
  Prov:=y;
end;

var x:longint;
        y:integer;
begin
  Writeln('Введите число');
  Readln(x);
  y:=Prov(x);
  Writeln(y);
  readln;
end.