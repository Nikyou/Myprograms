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
    y:=random(3);
    inc(i);
    inc(x);
    if (x<b) or (x>(a*b-b)) then
      Write(f,1,' ')
    else
      if (i=1) or (i=b) then
        Write(f,1,' ')
      else
      begin
        if y<1 then
          Write(f,0,' ');
        if y=2 then
          Write(f,1,' ');
      end;
    if i=b then
    begin
      i:=0;
      Writeln(f);
    end;
  until x=a*b;
  Close(f);
end;

var f:text;
begin
  Writefile (f);
  Writeln('1');
  Readln;
end.
