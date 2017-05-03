Program test4;
uses TriuglM;
var a,b,c:real;
begin
 Writeln('a=');
 Readln(a);
 Writeln('b=');
 Readln(b);
 Writeln('c=');
 Readln(c);
 If IsRealTriuglM(a,b,c)=1 then
 begin
   Writeln('Периметр - ',PerimTriuglM(a,b,c):0:0);
   Writeln('Площадь - ',PloshTriuglM(a,b,c):0:0);
   TypeTriuglM(a,b,c);
   VidTriuglM(a,b,c);
 end
 else
 begin
   Writeln('Такого триугольника не существует');
 end;
 Readln;
end.