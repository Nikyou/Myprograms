Unit TriuglM;
interface
function PerimTriuglM(a,b,c:real): real;
function PloshTriuglM(a,b,c:real): real;
function IsRealTriuglM(a,b,c:real): integer;
procedure TypeTriuglM(a,b,c:real);
procedure VidTriuglM(a,b,c:real);

implementation
function PerimTriuglM(a,b,c:real): real;
begin
  PerimTriuglM:=a+b+c;
end;

function PloshTriuglM(a,b,c:real): real;
begin
  PloshTriuglM:=Sqrt(PerimTriuglM(a,b,c)/2*(PerimTriuglM(a,b,c)/2-a)*(PerimTriuglM(a,b,c)/2-b)*(PerimTriuglM(a,b,c)/2-c));
end;

function IsRealTriuglM(a,b,c:real): integer;
begin
  IsRealTriuglM:=1;
  If not ((a+b>c) and (b+c>a) and (c+a>b)) then
  begin
   IsRealTriuglM:=0;
  end;
end;

procedure TypeTriuglM(a,b,c:real);
begin
  If ((a+b>c) and (b+c>a) and (c+a>b)) then
  begin
   if ((a<>b) and (b<>c) and (a<>c)) then
   begin
     Writeln('��㣮�쭨� ࠧ����஭���')
   end;
   if ((a=b) and (b=c)) then
   begin
     Writeln('��㣮�쭨� ࠢ����஭���')
   end
   else
   begin
     if ((a=b) or (b=c) or (c=a)) then
     begin
      Writeln('��㣮�쭨� ࠢ�����७��')
     end;
   end;
  end;
end;

procedure VidTriuglM(a,b,c:real);
var temp:real;
begin
  If ((a>b) and (a>c)) then
  begin
   temp:=c;
   c:=a;
   a:=temp;
  end;
  If ((b>c) and (b>a)) then
  begin
   temp:=c;
   c:=b;
   b:=temp;
  end;
  If (c*c=a*a+b*b) then
  begin
    Writeln('��㣮�쭨� ��אַ㣮���');
  end;
  If (c*c<a*a+b*b) then
  begin
    Writeln('��㣮�쭨� ����㣮���');
  end;
  If (c*c>a*a+b*b) then
  begin
    Writeln('��㣮�쭨� �㯮㣮���');
  end;
end;

begin

end.