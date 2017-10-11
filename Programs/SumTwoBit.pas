Program sumTwoBit;

function Sum (a,b:string):string;
var x:string;
        p,i:integer;
begin
  p:=0;
  x:='00000000';
  for i:=8 downto 1 do
  begin
    if (a[i]='0') and (b[i]='0') then
    begin
      if p=1 then
      begin
        x[i]:='1';
        p:=0;
      end;
    end;
    if ((a[i]='0') and (b[i]='1')) or ((a[i]='1') and (b[i]='0')) then
    begin
        if p=1 then
          x[i]:='0'
        else
          x[i]:='1';
    end;
    if (a[i]='1') and (b[i]='1') then
    begin
      if p=1 then
        x[i]:='1'
      else
      begin
        x[i]:='0';
        p:=1;
      end;
    end;
  end;
  Sum:=x;
end;

function ToEight (n:string):string;
var i:integer;
begin
  for i:=1 to (8-(length(n))) do
    n:='0'+n;
  Toeight:=n;
end;


var c,d:string;
begin
  Readln(c);
  Readln(d);
  c:=ToEight(c);
  d:=ToEight(d);
  Writeln(Sum(c,d));
  Readln;
end.
