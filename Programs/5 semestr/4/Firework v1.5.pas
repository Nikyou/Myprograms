program Firework;
Uses Graph, Crt;
Type Cord=Record
        x,y:integer;
     end;
     Cordtmp=Record
        xleft,xnow,yleft,ynow:integer;
     end;
     Speed=Record
        x,y:integer;
     End;
     PFire=^TFire;
     TFire=Record
        id,color,exp: Integer;
        cd, oldcd:Cord;
        sp:Speed;
        next:PFire;
	tmp1,tmp2:Cordtmp;
     end;
var tmpc:cordtmp;
Const
MaxF=49;
StartF=5;
ExpF= 200{5};
Speed1=300;
Speed2=-150;
Chance1=100 {1};
Chance2=100;
RadF=5;
RadExp=10;
DelayT=0;


Procedure StartFirework(start:PFire; MaxX, MaxY:integer);
var i:integer;
sled:PFire;
begin
  Sled:=start;
  for i:=1 to StartF do
  begin
    Sled^.cd.x:={MaxX div 2} random(MaxX)+1;
    Sled^.cd.y:={MaxY div 2} random(MaxY)+1;
    Sled^.sp.x:=Random(Speed1)+Speed2;
    Sled^.sp.y:=Random(Speed1)+Speed2;
    Sled^.color:=Random(15)+1;
    Sled^.tmp1:=tmpc;
    Sled^.tmp2:=tmpc;
	Sled^.exp:=0;
    if not (i=StartF) then begin
        New(Sled^.next);
        Sled:=Sled^.next;
    end;
  end;
  Sled^.next:=NIL;
end;

Procedure Explosion(var start:PFire);
var i:integer;
sled:PFire;
OldCord:Cord;
begin
  OldCord:=start^.cd;
  sled:=start;
  sled^.sp.x:=Random(Speed1)+Speed2;
  sled^.sp.y:=Random(Speed1)+Speed2;
  sled^.color:=Random(15)+1;
  Sled^.tmp1:=tmpc;
  Sled^.tmp2:=tmpc;
  Sled^.exp:=1;
  While not (sled^.next=NIL) do
        sled:=sled^.next;
  if not (ExpF=1) then
    for i:=1 to ExpF-1 do
    begin
      New(Sled^.next);
      Sled:=Sled^.next;
      Sled^.cd:=OldCord;
      Sled^.sp.x:=Random(Speed1)+Speed2;
      Sled^.sp.y:=Random(Speed1)+Speed2;
      Sled^.color:=Random(15)+1;
      Sled^.tmp1:=tmpc;
      Sled^.tmp2:=tmpc;
	  Sled^.exp:=0;
    end;
  New(sled^.next);
  sled^.next:=NIL;
end;


var start, sled: PFire;
GD,GM,i,MaxX,MaxY:integer;
begin
  randomize;
  tmpc.xnow:=0;
  tmpc.xleft:=0;
  tmpc.ynow:=0;
  tmpc.yleft:=0;
  GD:= Detect;
  InitGraph(GD, GM,'');
  MaxX:=GetMaxX;
  MaxY:=GetMaxY;
  i:=StartF;
  New(start);
  StartFirework(start,MaxX,MaxY);
  Writeln('Press key to end');
  repeat
    sled:=start;
    repeat
      Setcolor(0);
      if (Sled^.exp=1) then
      begin
        Circle(sled^.oldcd.x, sled^.oldcd.y, RadExp);
        Sled^.exp:=0;
      end;
      if (((sled^.oldcd.x<>sled^.cd.x) or (sled^.oldcd.y<>sled^.cd.y)) and ((sled^.tmp1.xleft=0) and (sled^.tmp1.yleft=0))) then
      begin
        Line(sled^.oldcd.x, sled^.oldcd.y, sled^.cd.x, sled^.cd.y);
        Circle(sled^.cd.x, sled^.cd.y, RadF);
      end;
      if ((sled^.tmp2.xleft<>0) or (sled^.tmp2.yleft<>0)) then
      begin
        circle(sled^.cd.x, sled^.cd.y, RadF);
		Line(sled^.oldcd.x, sled^.oldcd.y, sled^.tmp1.xnow, sled^.tmp1.ynow);
		Line(sled^.tmp1.xnow, sled^.tmp1.ynow, sled^.tmp2.xnow, sled^.tmp2.ynow);
      	Line(sled^.tmp2.xnow, sled^.tmp2.ynow, sled^.cd.x, sled^.cd.y);
        sled^.tmp2:=tmpc;
        sled^.tmp1:=tmpc;
      end;
      if ((sled^.tmp1.xleft<>0) or (sled^.tmp1.yleft<>0)) then
      begin
        circle(sled^.cd.x,sled^.cd.y,RadF);
		Line(sled^.oldcd.x, sled^.oldcd.y, sled^.tmp1.xnow, sled^.tmp1.ynow);
       	Line(sled^.tmp1.xnow, sled^.tmp1.ynow, sled^.cd.x, sled^.cd.y);
        sled^.tmp1:=tmpc;
      end;
      Setcolor(sled^.color);
      if not (i=MaxF) then
        if ((Random(Chance2)+1)<=(Chance1)) then
        begin
          Circle(sled^.cd.x, sled^.cd.y, RadExp);
          Explosion(sled);
       //   inc(i);
        end;
      sled^.oldcd.x:=sled^.cd.x;
      sled^.oldcd.y:=sled^.cd.y;
      if  (((sled^.cd.x+sled^.sp.x)<0) or ((sled^.cd.x+sled^.sp.x)>MaxX) or  ((sled^.cd.y+sled^.sp.y)<0) or ((sled^.cd.y+sled^.sp.y)>MaxY)) then
      begin
        if  (((sled^.cd.x+sled^.sp.x)<0) or ((sled^.cd.x+sled^.sp.x)>MaxX)) then
        begin
          if ((sled^.cd.x+sled^.sp.x)>MaxX) then
          begin
            sled^.tmp1.xleft:=MaxX-sled^.cd.x-sled^.sp.x;
            sled^.tmp1.xnow:=MaxX;
          end;
          if ((sled^.cd.x+sled^.sp.x)<0) then
          begin
            sled^.tmp1.xleft:=abs(sled^.cd.x+sled^.sp.x);
            sled^.tmp1.xnow:=0;
          end;
        sled^.sp.x:=-sled^.sp.x;
        end
        else
        begin
          sled^.tmp1.xleft:=sled^.sp.x;
          sled^.tmp1.xnow:=sled^.cd.x+sled^.sp.x;
        end;
        if  (((sled^.cd.y+sled^.sp.y)<0) or ((sled^.cd.y+sled^.sp.y)>MaxY)) then
        begin
          if ((sled^.cd.y+sled^.sp.y)>MaxY) then
          begin
            sled^.tmp1.yleft:=MaxY-sled^.cd.y-sled^.sp.y;
            sled^.tmp1.ynow:=MaxY;
          end;
          if ((sled^.cd.y+sled^.sp.y)<0) then
          begin
            sled^.tmp1.yleft:=abs(sled^.cd.y+sled^.sp.y);
            sled^.tmp1.ynow:=0;
          end;
        sled^.sp.y:=-sled^.sp.y;
        end
        else
        begin
          sled^.tmp1.yleft:=sled^.sp.y;
          sled^.tmp1.ynow:=sled^.cd.y+sled^.sp.y;
        end;
        if (((sled^.tmp1.xleft+sled^.tmp1.xnow)<MaxX) and ((sled^.tmp1.xleft+sled^.tmp1.xnow)>0) and ((sled^.tmp1.yleft+sled^.tmp1.ynow)<MaxY) and ((sled^.tmp1.yleft+sled^.tmp1.ynow)>0)) then
        begin
          Line(sled^.cd.x, sled^.cd.y, sled^.tmp1.xnow, sled^.tmp1.ynow);
          Line(sled^.tmp1.xnow, sled^.tmp1.ynow, sled^.tmp1.xnow+sled^.tmp1.xleft, sled^.tmp1.ynow+sled^.tmp1.yleft);
          sled^.cd.x:=sled^.tmp1.xnow+sled^.tmp1.xleft;
          sled^.cd.y:=sled^.tmp1.ynow+sled^.tmp1.yleft;
          Circle(sled^.cd.x, sled^.cd.y, RadF);
        end;
		if (((sled^.tmp1.xleft+sled^.tmp1.xnow)>MaxX) and ((sled^.tmp1.xleft+sled^.tmp1.xnow)<0) and ((sled^.tmp1.yleft+sled^.tmp1.ynow)>MaxY) and ((sled^.tmp1.yleft+sled^.tmp1.ynow)<0)) then
        begin
	   	  if  (((sled^.tmp1.xleft+sled^.tmp1.xnow)<0) or ((sled^.tmp1.xleft+sled^.tmp1.xnow)>MaxX)) then
          begin
          if ((sled^.tmp1.xleft+sled^.tmp1.xnow)>MaxX) then
          begin
            sled^.tmp2.xleft:=MaxX-sled^.tmp1.xleft-sled^.tmp1.xnow;
            sled^.tmp2.xnow:=MaxX;
          end;
          if ((sled^.tmp1.xleft+sled^.tmp1.xnow)<0) then
          begin
            sled^.tmp2.xleft:=abs(sled^.tmp1.xleft+sled^.tmp1.xnow);
            sled^.tmp2.xnow:=0;
            end;
          sled^.sp.x:=-sled^.sp.x;
          end
          else
          begin
            sled^.tmp2.xleft:=sled^.tmp1.xleft;
            sled^.tmp2.xnow:=sled^.tmp1.xleft+sled^.tmp1.xnow;
          end;
          if  (((sled^.tmp1.yleft+sled^.tmp1.ynow)<0) or ((sled^.tmp1.yleft+sled^.tmp1.ynow)>MaxY)) then
          begin
          if ((sled^.tmp1.yleft+sled^.tmp1.ynow)>MaxY) then
            begin
              sled^.tmp2.yleft:=MaxY-sled^.tmp1.yleft-sled^.tmp1.ynow;
              sled^.tmp2.ynow:=MaxY;
            end;
            if ((sled^.tmp1.yleft+sled^.tmp1.ynow)<0) then
            begin
              sled^.tmp2.yleft:=abs(sled^.tmp1.yleft+sled^.tmp1.ynow);
              sled^.tmp2.ynow:=0;
            end;
          sled^.sp.y:=-sled^.sp.y;
          end
          else
          begin
            sled^.tmp2.yleft:=sled^.tmp1.yleft;
            sled^.tmp2.ynow:=sled^.tmp1.yleft+sled^.tmp1.ynow;
          end;
            Line(sled^.cd.x, sled^.cd.y, sled^.tmp1.xnow, sled^.tmp1.ynow);
            Line(sled^.tmp1.xnow, sled^.tmp1.ynow, sled^.tmp2.xnow, sled^.tmp2.ynow);
            Line(sled^.tmp2.xnow, sled^.tmp2.ynow, sled^.tmp2.xnow+sled^.tmp2.xleft, sled^.tmp2.ynow+sled^.tmp2.yleft);
            sled^.cd.x:=sled^.tmp2.xnow+sled^.tmp2.xleft;
            sled^.cd.y:=sled^.tmp2.ynow+sled^.tmp2.yleft;
            Circle(sled^.cd.x, sled^.cd.y, RadF);
        end;
      end
      else
      begin
        Line(sled^.cd.x,sled^.cd.y,sled^.cd.x+sled^.sp.x,sled^.cd.y+sled^.sp.y);
        sled^.cd.x:=sled^.cd.x+sled^.sp.x;
        sled^.cd.y:=sled^.cd.y+sled^.sp.y;
        Circle(sled^.cd.x, sled^.cd.y, RadF);
      end;
      delay(DelayT);
      sled:=sled^.next;
    until sled=NIL;
  until KeyPressed;
  while not (start^.next=NIL) do
  begin
    While not (sled^.next=NIL) do
          sled:=sled^.next;
    Dispose(sled);
    sled:=start;
  end;
  dispose(start);
  CloseGraph;
end.
