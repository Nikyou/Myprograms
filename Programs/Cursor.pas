program Cursor;
uses crt;

var uskey:char;
        posx,posy, v,a,b,c,m: integer;
begin
  randomize;
  cursoroff;
  clrscr;
  a:=random(14)+1;
  textbackground(a);
  repeat
   inc(m);
   repeat
    delay(50);
    inc(v);
    b:=wherex;
    c:=wherey+1;
    gotoxy(b,c);
    write(' ');
   until v=10;
   v:=0;
   write(' ');
   write(' ');
   repeat
    delay(50);
    inc(v);
    b:=wherex;
    c:=wherey-1;
    gotoxy(b,c);
    write(' ');
   until v=10;
   v:=0;
   write(' ');
   write(' ');
   if m=6 then
   begin
    a:=random(14)+1;
    textbackground(a);
    m:=0;
   end;
   if keypressed then
         break;
  until 1=0;
end.