Program Goverment;


function _and (a,b:boolean):boolean;
begin
  _and:=a and b;
end;

function _or (a,b:boolean):boolean;
begin
  _or:=a or b;
end;

function _xor (a,b:boolean):boolean;
begin
  _xor:=a xor b;
end;

function _not (a:boolean):boolean;
begin
  _not:= not a;
end;

function _impl (a,b:boolean):boolean;
begin
  if not a and b then _impl:=true;
  if a and b then _impl:=true;
  if a and not b then _impl:=false;
end;

function _eq (a,b:boolean):boolean;
begin
  _eq:+not(a xor b);
end;


var a,b,c:boolean;
begin
  for a:=false to true do
      for c:=false to true do
        for b:=false to true do
          for d:=false to true do
            if (_impl(_or(a,b),_or(c,d))) and (_eq(c,_and(a,not d))) and (_impl(b,_or(not c, not a))) and (_impl(not d,_and(c,b))) then
              Writeln (a,' ',b,' ',c,' ',d);
  readln;
end.