Program Randomizes;
uses crt;

procedure Writefile(var f:text);
var y,i:integer;
        x:longint;
begin
  Assign (f, 'FromField.txt');
  Rewrite (f);
  randomize;
  i:=0;
  x:=0;
  Repeat
    y:=random(2);
    Write(f,y,' ');
    inc(i);
    inc(x);
    if i=48 then
    begin
      i:=0;
      Writeln(f);
    end;
  until x=864;
  Close(f);
end;

var f:text;
begin
  Writefile (f);
  Writeln('1');
  Readln;
end.