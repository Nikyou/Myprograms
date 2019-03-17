program RandomNumbersGeneratorInFile;
Const
N=20;
R1=200;
R2=-100;
var f:text;
i,c:longint;
b:char;
begin
  Assign(f,'RandomNumbers.txt');
  Rewrite(f);
  Writeln(f,N);
  repeat
   Writeln('"R" for random');
   Writeln('"S" for stable');
   Readln(b);
   if (b='R') or (b='r') then
     randomize;
  until (b='r') or (b='R') or (b='s') or (b='S');
  for i:=1 to N do
  begin
    c:=random(R1)+R2;
    Writeln(f, c);
  end;
  Close(f);
  Readln;
end.
