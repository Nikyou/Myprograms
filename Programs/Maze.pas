Program Maze;
uses crt;
const NMax=120; MMax=360;
type TField=array[1..NMax,1..MMax] of integer;
var field: TField;
        N,M: integer;
  startx,starty, playerx,playery: integer;

procedure ReadField;
var f:text;
i,j:integer;
begin
  Assign (f,'Field.txt');
  Reset(f);
  Readln(f,N);
  Readln(f,M);
  if (N>NMax) or (M>MMax) or (N<1) or (M<1) then
  begin
    WriteLn ('Wrong field size');
    ReadLn;
    Halt;
  end;
  for i:=1 to N do
  begin
    for j:=1 to M do
    begin
      Read (f, field[i,j]);
      if (field [i,j]<0) or (field[i,j]>3) then
        Halt;
    end;
    Readln(f);
  end;
  Close(f);
end;

procedure WriteField;
var i,j: integer;
begin
 for i:=1 to N do
 begin
   for j:=1 to M do
   begin
     GotoXY(j,i);
     Case field[i,j] of
       0: begin Write(' '); end;
       1: begin Write('#'); end;
       2: begin Write('S'); startx:=j; starty:=i; end;
       3: begin Write('F'); end;
     end;
   end;
 end;
end;

procedure SetGame;
begin
  playerx:=startx;
  playery:=starty;
  Cursoroff;
end;

procedure Proceskey(uskey:char);
begin
  case uskey of
    'w':
    begin
      if (field [playery-1,playerx]<>1) then
      begin
        playery:=playery-1;
      end;
    end;
    's':
    begin
      if (field [playery+1,playerx]<>1) then
      begin
        playery:=playery+1;
      end;
    end;
    'a':
    begin
      if (field [playery,playerx-1]<>1) then
      begin
        playerx:=playerx-1;
      end;
    end;
    'd':
    begin
      if (field [playery,playerx+1]<>1) then
      begin
        playerx:=playerx+1;
      end;
    end;
    #27: begin Halt; end;
  end;
end;

function Finish:integer;
begin
  if (field [playery,playerx]=3) then
  begin
    Finish:=1;
  end
  else
        Finish:=0;
end;

var uskey:char;
begin
  Clrscr;
  ReadField;
  WriteField;
  SetGame;
  While (Finish=0) do
  begin
    uskey:=Readkey;
    GotoXY(playerx,playery);
    Write(' ');
    ProcesKey(uskey);
    GotoXY(playerx,playery);
    Write('S');
  end;
  Clrscr;
  WriteLn('You win');
  Readln;
end.
