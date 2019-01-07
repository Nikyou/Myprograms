Program Randomizes;
uses crt;

procedure Writefile(var f:text);
var a,b,y,i:integer;
        x:longint;
begin
  a:=20;
  b:=50;
  Assign (f, 'FromField.txt');
  Rewrite (f);
  randomize;
  i:=0;
  x:=0;
  Writeln(f,a,' ');
  Writeln(f,b,' ');
  Repeat
    y:=random(2);
    Write(f,y,' ');
    inc(i);
    inc(x);
    if x<b then
      Write(f,1,' ');
    if i=b then
    begin
      i:=0;
      Writeln(f);
    end;
    if x>(a*b-b) then
      Write(f,1,' ');
    if i=1 or i=b then
      Write(f,1,' ');
  until x=a*b;
  Close(f);
end;

var f:text;
begin
  Writefile (f);
  Writeln('1');
  Readln;
end.
