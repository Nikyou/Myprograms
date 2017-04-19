program ProverkaNaPolindrom;
const N=100000;

function Proverka(arr:string):integer;
var i:longint;
        arr1:string;
begin
  arr1:='';
  for i:= length(arr) downto 1 do
    arr1:=arr1+arr[i];
  If arr=arr1 then
  begin
    Proverka:=1;
  end
  else
  begin
    Proverka:=0;
  end;
end;

var arr:string;
begin
  Readln (arr);
  Writeln(arr);
  Proverka(arr);
  Writeln(arr);
  If Proverka(arr)=1 then
  begin
    WriteLn(arr, '- полиндром');
  end
  else
  begin
      Writeln(arr, '- неполиндром');
  end;
  ReadLn;
end.
