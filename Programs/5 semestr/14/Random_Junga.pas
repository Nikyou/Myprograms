program Random_Junga;

Type //Variables= set of integer;
Numb= set of 1..255;
Arr=Array [1..32400] of integer;

var N:shortint;

procedure Junga(var V:numb; max:integer; var Arra:Arr);
var a,r,i,rpos:integer;
p:boolean;
b:longint;
begin
  a:=0;
  b:=0;
  repeat
    i:=0;
    p:=false;
    r:=Random(255)+1;
    if r in V then
    begin
      if Arra[1]=0 then
      begin
        V:=V-[r];
        Arra[1]:=r;
        p:=true;
        inc(a);
      end;
      While ((p=false) and (i<32400)) and (b<2147083647) do
      begin
        inc(b);
        inc(i);
        rpos:=random(max)+1;
        if (Arra[rpos]=0) and ((((rpos-N<=0) or (Arra[rpos-N]<>0)) and (Arra[rpos-1]<>0)) or ((((rpos-1 mod N)=0) or (Arra[rpos-1]<>0)) and (Arra[rpos-N]<>0))) then
          if (((rpos-N<=0) or (Arra[rpos-N]<r)) and (((rpos-1 mod N)=0) or (Arra[rpos-1]<r))) then
          begin
            V:=V-[r];
            Arra[rpos]:=r;
            p:=true;
            inc(a);
          end;
      end;
    end;
  until ((a=N) or (b=2147083647) or (V=[]));
end;


var V:Numb;
i,max:integer;
Arra:Arr;
begin
  randomize;
  V:=[];
  for i:=1 to 255 do
    V:=V+[i];
  Writeln('Type number from 1 to 180');
  repeat
    Readln(N);
  until (N>0) and (N<=180);
  max:=N*N;
  for i:=1 to max do
  begin
    Arra[i]:=0;
  end;
  Junga(V,max,Arra);
  for i:=1 to max do
  begin
    if ((i-1 mod N)=0) then
      writeln;

//    if not (Arra[i]=0) then
      Write(Arra[i],'  ');

  end;
  Readln;
end.
