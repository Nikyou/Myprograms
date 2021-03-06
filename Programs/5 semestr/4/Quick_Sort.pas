program Quick_Sort;
const Max=10000;
  Med=5;
  R2=100;
  R1=R2*2;
type  TArray=Array [1..Max] of longint;
  Medsort=Record
    i,n:longint;
  end;
  Median=array [1..Med] of Medsort;


procedure QSort(var a:TArray; M:longint);
  procedure Sort(L,R:longint);
  var Medi:Median;
  i,k,j,p:longint;
  temp:medsort;
  begin
    if not (L>=R) then
    begin
      if (R-L+1)<Med then
      begin
        for i:=1 to R-L+1 do
        begin
          j:=L+Random(R-L);
          Medi[i].n:=a[j];
          Medi[i].i:=j;
        end;
        i:=1;
        repeat
          inc(i);
          if medi[i].n>medi[i-1].n then
          begin
            temp:=medi[i];
            medi[i]:=medi[i-1];
            medi[i-1]:=temp;
            i:=1;
          end;
        until i=R-L+1;
        k:=medi[((R-L+1) div 2)+1].n;
        j:=medi[((R-L+1) div 2)+1].i;
      end
      else
      begin
        for i:=1 to R-L+1 do
        begin
          j:=L+Random(R-L);
          Medi[i].n:=a[j];
          Medi[i].i:=j;
        end;
        i:=1;
        repeat
          inc(i);
          if medi[i].n>medi[i-1].n then
          begin
            temp:=medi[i];
            medi[i]:=medi[i-1];
            medi[i-1]:=temp;
            i:=1;
          end;
        until i=Med;
        k:=medi[3].n;
        j:=medi[3].i;
      end;
      for i:=L to R do
      begin
        if ((a[i]<k) and (i>j)) or ((a[i]>=k) and (i<j)) then
        begin
          p:=a[j];
          a[j]:=a[i];
          a[i]:=p;
          j:=i;
        end;
      end;
      Sort(L, j);
      Sort(j+1, R);
    end;
  end;
begin
  Sort(1, M);
end;

var  i,m:longint;
Mas:TArray;
begin
  randomize;
  Writeln('Write quantity: ');
  Readln(m);
  for i:=1 to m do
    Mas[i]:=Random(R1)-R2;
  for i:=1 to m do
    Writeln(i,': ', Mas[i]);
  QSort(Mas,m);
  for i:=1 to m do
    Writeln(i,': ', Mas[i]);
  Readln;
end.