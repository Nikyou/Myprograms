program Pathfinder_Brawler;
const
DamageB=10;
Count=15000000;
var DMG1,DMG2,DMG3, style, Bleed: real;
AC, MOD1, MOD2, MOD3,PAttack:integer;


function Roll20:integer;
begin
  Roll20:=random(20)+1;
end;

function Roll6:integer;
begin
  Roll6:=random(6)+1;
end;

function Roll4:integer;
begin
  Roll4:=random(4)+1;
end;

Procedure Rolldice;
var c,d20:integer;
begin
  c:=0;
  d20:=Roll20;
  if (d20=20) and ((Roll20+MOD1-PAttack)>=AC) then
  begin
    inc(c);
    DMG1:=DMG1+Roll6+Roll6+Roll6+Roll6+Roll6+DamageB*2+2*PAttack
  end
  else
  begin
    if not (d20=1) then
      if ((d20+MOD1-PAttack)>=AC) then
      begin
        inc(c);
        DMG1:=DMG1+Roll6+Roll6+Roll6+DamageB+2*PAttack;
      end;
  end;
  d20:=Roll20;
  if (d20=20) and ((Roll20+MOD2-PAttack)>=AC) then
  begin
    inc(c);
    DMG2:=DMG2+Roll6+Roll6+Roll6+Roll6+Roll6+DamageB*2+2*PAttack;
  end
  else
  begin
    if not (d20=1) then
      if ((d20+MOD2-PAttack)>=AC) then
      begin
        inc(c);
        DMG2:=DMG2+Roll6+Roll6+Roll6+DamageB+2*PAttack;
      end;
  end;
  d20:=Roll20;
  if (d20=20) and ((Roll20+MOD2-PAttack)>=AC) then
  begin
   inc(c);
   DMG3:=DMG3+Roll6+Roll6+Roll6+Roll6+Roll6+DamageB*2+2*PAttack;
  end
  else
    if not (d20=1) then
      if ((d20+MOD3-PAttack)>=AC) then
      begin
        inc(c);
        DMG3:=DMG3+Roll6+Roll6+Roll6+DamageB+2*PAttack;
      end;
  if c>1 then
    Style:=Style+Roll6+Roll6;
  if c>0 then
    Bleed:=Bleed+Roll4;
end;


var i: longint;
begin
  randomize;
  repeat
    Writeln('1: PAttack is on');
    Writeln('0: PAttack is off');
    Readln(i);
  until (i=1) or (i=0);
  if i=1 then
    PAttack:=2
  else
    PAttack:=0;
  MOD1:=11;
  MOD2:=6;
  MOD3:=10;
  DMG1:=0;
  DMG2:=0;
  DMG3:=0;
  Style:=0;
  Bleed:=0;
  repeat
    Writeln('Write AC:');
    Readln(AC);
  until (AC>0) and (AC<100);
  for i:=1 to Count do
    Rolldice;
  Writeln(((DMG1+DMG2+DMG3+Style+Bleed)/Count):0:0,(DMG1/Count):5:0,(DMG2/Count):5:0,(DMG3/Count):5:0,(Style/Count):5:0,(Bleed/Count):5:0);
  Readln;
end.
