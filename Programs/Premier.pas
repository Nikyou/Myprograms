program Premier;
var x, i, c, sum: integer;
begin
  Writeln ('������ �᫮');
  repeat
  Readln(x);
  until (x>0);
  i:=0;
  c:=0;
  sum:=0;
  While not(i=x) do
  begin
    inc(i);
    if not (c=x) then
    begin
     inc(c);
     sum:=sum+c*c;
    end;
  end;
  WriteLn('�㬬�:',sum);
  Readln;
end.