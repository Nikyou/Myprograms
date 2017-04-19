program DeleteBoljshieBukvi;
const N=100000;

procedure Zamen(var arr:string);
var i:longint;
begin
  i:=0;
  repeat
    inc(i);
    if (ord(arr[i])>64) and (ord(arr[i])<91) then
    begin
      delete(arr,i,1);
      dec(i);
    end;
  until i=length(arr);
end;

var arr:string;
begin
  Readln (arr);
  Writeln(arr);
  Zamen(arr);
  Writeln(arr);
  ReadLn;
end.
