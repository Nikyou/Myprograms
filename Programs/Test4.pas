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
   Writeln('��ਬ��� - ',PerimTriuglM(a,b,c):0:0);
   Writeln('���頤� - ',PloshTriuglM(a,b,c):0:0);
   TypeTriuglM(a,b,c);
   VidTriuglM(a,b,c);
 end
 else
 begin
   Writeln('������ ��㣮�쭨�� �� �������');
 end;
 Readln;
end.