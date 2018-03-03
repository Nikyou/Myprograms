Program mnojestvo;


function One(s:string):string;
var
  i:integer;
  c:char;
  b:set of char;
begin
  One:='';
  b:=[];
  for i:=1 to length(s) do
     Include(b, s[i]);
  for c in b do
     One:=One+c;
end;

function Two(s:string):string;
var
  i:integer;
  b:set of char;
begin
  Two:='';
  b:=[];
  for i:=1 to length(s) do
     if not (s[i] in b) then
     begin
       include(b, s[i]);
       Two:=Two+s[i];
     end;
end;

function Three(s:string):string;
var
  i:integer;
  b,c:set of char;
begin
  Three:='';
  b:=[chr(0)..chr(255)];
  c:=[];
  for i:=1 to length(s) do
  begin
    if not (s[i] in b) then
        if not (s[i] in c) then
        begin
          Three:=Three+s[i];
          include(c, s[i]);
        end;
    if s[i] in b then
       exclude(b, s[i]);
  end;
end;

function Four(s:string):string;
var
  i:integer;
  b,c:set of char;
  d:char;
begin
  Four:='';
  b:=[];
  c:=[];
  for i:=1 to length(s) do
  begin
    if s[i] in b then
    begin
      exclude(b, s[i]);
      include(c, s[i]);
    end;
    if not (s[i] in b) then
       if not (s[i] in c) then
          include(b, s[i]);
  end;
  for d in b do
     Four:=Four+d;
end;

function Five(s:string):string;
var
  i:integer;
  b,c:set of char;
  d:char;
begin
  Five:='';
  b:=[];
  c:=[chr(1)..chr(255)];
  for i:=1 to length(s) do
  begin
    if s[i] in b then
       exclude(b, s[i]);
    if not (s[i] in c) then
    begin
      if not (s[i] in b) then
         include(b, s[i]);
      if s[i] in c then
         exclude(c, s[i]);
    end;
    if not (s[i] in b) then
       if s[i] in c then
          exclude(c, s[i]);
  end;
  for d in b do
     Five:=Five+d;
end;


var s:string;
begin
  s:='AISOGJYsafjdhsASFHIAUCuifgahsfio';
  Writeln('Original ', s);
//  Writeln('One ', One(s));
//  Writeln('Two ', Two(s));
//  Writeln('Three ', Three(s));
  Writeln('Four ', Four(s));
  Writeln('Five ', Five(s));
  Readln;
end.