Program Schoti;
Const K=6;
N=100;
MAX=201;
MIN=-MAX;
TIK=1;
Type TArray= Array[1..N] of integer;

function Next(a:TArray):TArray;
var c,s,i:integer;
begin
  c:=1;
  s:=1;
  repeat
    for i:=1 to K do
    begin
      if a[c]>a[i] then
          c:=i;
    end;
    Next[s]:=c;
    a[c]:=MAX;
    inc(s);
  until s>K;
end;

function Prev(a:TArray):TArray;
var c,s,i: integer;
begin
  c:=k;
  s:=1;
  repeat
    for i:=K downto 1 do
    begin
      if a[c]<a[i] then
          c:=i;
    end;
    Prev[s]:=c;
    a[c]:=MIN;
    inc(s);
  until s>K;
end;


var start, nextm, prevm: TArray;
        i: integer;
begin
  randomize;
  for i:=1 to K do
        start[i]:=random(MAX-1)+TIK;
  nextm:=Next(start);
  prevm:=Prev(start);
  for i:=1 to K do
        Write(i,': ',start[i],'  ');
  Writeln;
  for i:=1 to K do
        Write(nextm[i],': ',start[nextm[i]],'  ');
  Writeln;
  for i:=1 to K do
        Write(prevm[i],': ',start[prevm[i]],'  ');
  Readln;
end.