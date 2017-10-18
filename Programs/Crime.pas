Program Crime;


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


var a,b,c:boolean;
begin
  for a:=false to true do
    for b:=false to true do
      for c:=false to true do
        if not (_xor(a,_impl(b,c))) and (_impl(not a, not b)) and (_impl(c,b))then
          Writeln(a,' ',b,' ',c);
  readln;
end.