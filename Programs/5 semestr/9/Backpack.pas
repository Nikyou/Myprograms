program backpack;
Type Rocks=Array[1..10] of integer;


function prov(b,i:integer;roc:rocks):boolean;
var c:integer;
begin
  prov:=false;
  for c:=i+1 to 10 do
  begin
    if ((b-roc[c])=0) then
    begin
      prov:=true;
      exit;
    end;
    if ((b-roc[c])>0) then
       if (prov(b-roc[c],c,roc)) then
         prov:=true
  end;
end;

function Checkw(b:integer;roc:rocks):boolean;
var i:integer;
begin
  i:=0;
  Checkw:=false;
  if (prov(b,i,roc)) then
    Checkw:=true;
end;


var roc:Rocks;
i,b,r: integer;
begin
  randomize;
  for i:=1 to 10 do
  begin
    r:=random(40)+1;
    if (r>20) then
      if (r>30) then
        roc[i]:=r-30
      else
        roc[i]:=r-20
    else
      roc[i]:=r;
  end;
  b:=16;
  Writeln('Backpack: ',b);
  for i:=1 to 10 do
    Writeln(i,': ',roc[i],'  ');
  If  (Checkw(b,roc)) then
    Writeln('All good')
  Else
    Writeln('Not good');
  Readln;
end.