Program Randomizes;
var i,x,y:integer; f:text;
begin
  randomize;
  Assign (f, 'product.txt');
  Rewrite (f);
  i:=0;
  x:=0;
  Repeat
    y:=random(21);
    Write(f,y);
    inc(i);
    inc(x);
    if i=1 then
    begin
      i:=0;
      Writeln(f);
    end;
  until x=12;
  Close(f);
  Readln;
end.