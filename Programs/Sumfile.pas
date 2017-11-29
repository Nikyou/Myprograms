Program Sumfile;
uses sysutils;
var f:text;
a:string;
b:char;
sum:longint;

begin
  Assign(f,'Numbers1.txt');
  reset(f);
  a:='';
  sum:=0;
  While not seekeof(f) do
  begin
    Read(f,b);
    if not ((b=',') or (b=#10) or (b=#13))    then
      a:=a+b
    else
    begin
    sum:=sum+strtoint(a);
    a:='';
    end;
    if (b=#10) or (b=#13) then
      readln(f);
  end;
  close(f);
  Writeln(sum);
  Readln;
end.