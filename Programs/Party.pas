Program Party;


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
  _eq:=not(a xor b);
end;


var a,b,c,d:boolean;
begin
  for a:=false to true do
      for c:=false to true do
        for b:=false to true do
          for d:=false to true do
            if (_impl(a,_xor(b,c))) and (_impl(d,_xor(a,b))) and (_impl(c, not b)) and(_eq(d, not c)) and (_impl(b,c)) then
              Writeln (a,' ',b,' ',c,' ',d);
  readln;
end.