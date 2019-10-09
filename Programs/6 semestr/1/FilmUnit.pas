Unit FilmUnit;

Interface

Uses CRT;

Type
  TLetter=object
    x,y:integer;
    symb:char;
    procedure Init(ax,ay:integer; asymb:char);
    procedure Hide;
    procedure Show;
    procedure Moveto(ax,ay,t:integer);
    procedure Blink(n,t:integer);
   end;
   
Implementation

  procedure TLetter.Init(ax,ay:integer; asymb:char);
  begin
     x:=ax;
     y:=ay;
     symb:=asymb;
   end;
   
   procedure TLetter.Hide;
   begin
     GotoXY(x,y);
     Write(' ');
   end;
   
   procedure TLetter.Show;
   begin
     GotoXY(x,y);
     Write(symb);
   end;
   
   procedure TLetter.Moveto(ax,ay,t:integer);
   begin
     Hide;
     x:=ax;
     y:=ay;
     Show;
     delay(t);
   end;
   
   procedure TLetter.Blink(n,t:integer);
   var i:integer;
   begin
     for i:=1 to n do
     begin
       delay(t div 2);
       Hide;
       delay(t div 2);
       Show;
     end;
   end;
end.
