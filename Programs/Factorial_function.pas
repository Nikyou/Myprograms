Program Factorial_function;

function Factorial (x: integer):longint;
var i, c:integer;
        sum:longint;
begin
  i:=0;
  c:=0;
  sum:=1;
  While not(i=x) do
  begin
    inc(i);
    if not (c=x) then
    begin
     inc(c);
     sum:=sum*c;
    end;
  end;
  Factorial:=sum
end;

var x:integer;
        y:longint;
begin
  Writeln ('������ �᫮(�� 12-�)');
  repeat
  Readln(x);
  until ((x>0) and (x<13));
  y:=Factorial(x);
  Writeln(y);
  Readln;
end.