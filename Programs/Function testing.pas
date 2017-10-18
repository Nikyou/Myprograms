program Function_testing;


function Others(x,y,z:integer):boolean;
begin
  Others:= (x<>y) and (y<>z);
end;

function Two(x,y,z:integer):boolean;
begin
  Two:= ((x=y) xor (y=z)) xor ((x=z) xor (y=z));
end;

function Sign(x,y,z:integer):boolean;
begin
  Sign:=(x=y) and (y=z) and (x<>0);
end;

function XMax(x,y,z:integer):boolean;
begin
  XMax:= (x>y) and (x>z);
end;

function OnePosi(x,y,z:integer):boolean;
begin
  OnePosi:=(x>0) xor ((y>0) or (z>0));
end;

function Five(x:integer):boolean;
begin
  Five:= (x div 10=5);
end;

function OddEq(x,y,z:integer):boolean;
begin
  OddEq:= (x div 2=y div 2) and (y div 2=z div 2);
end;

function Ones(x,y,z:boolean):boolean;
begin
  Ones:= ((x<>y) or (y<>z)) and ((x<>z) or (z<>y)) and ((y<>x) or (x<>z));
end;

function Seqments1(x:real):boolean;
begin
  Seqments1:=not(((x>=1) and (x<=3)) or (x>=5) and (x<=7));
end;

function Anagrama1(s1,s2:string):boolean;
begin

end;

function Anagrama2(s1,s2:string):boolean;
begin

end;

function Similar1(s1,s2:string):boolean;
begin

end;

function Similar2(s1,s2:string):boolean;
begin

end;

function Similar3(s1,s2:string):boolean;
begin

end;

function Similar4(s1,s2:string):boolean;
begin

end;

function Similar5(s1,s2:string):boolean;
begin

end;

function Similar6(s1,s2:string):boolean;
begin

end;

function Similar7(s1,s2:string):boolean;
begin

end;

function Similar8(s1,s2:string):boolean;
begin

end;


var x,y,z: integer;
  q,w,e:boolean;
  b:real;
begin
  Write('x:');
  Readln(x);
  Write('y:');
  Readln(y);
  Write('z:');
  Readln(z);
  for q:=false to true do
    for w:=false to true do
      for e:=false to true do
        begin
          Writeln('q:',q,' ','w:',w,' ','e:',e);
          Writeln(Ones(q,w,e));
        end;
  Writeln('b: ');
  Read(b);
  Write(b);
  readln;
end.