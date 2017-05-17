Program Homework;
uses ChislaM;

procedure ReadlnFile(var arr:tarray; var len:integer);
var f:text;
        i:integer;
begin
  i:=0;
  assign (f,'product.txt');
  Reset(f);
  While not eof(f) do
  begin
    inc(i);
    Readln(f, arr[i]);
  end;
  len:=i;
  Close(f);
end;

procedure MaxMenes(arr:tarray; len:integer);
var i:integer;
begin
  for i:=1 to len do
  begin
    if arr[i]=maxchis(arr,len) then
        Writeln(i);
  end;
  for i:=1 to len do
  begin
    if arr[i]=maxchis(arr,len) then
    begin
      Case i of
        1: begin Writeln('������'); end;
        2: begin Writeln('���ࠫ�'); end;
        3: begin Writeln('����'); end;
        4: begin Writeln('��५�'); end;
        5: begin Writeln('���'); end;
        6: begin Writeln('���'); end;
        7: begin Writeln('���'); end;
        8: begin Writeln('������'); end;
        9: begin Writeln('�������'); end;
        10: begin Writeln('������'); end;
        11: begin Writeln('�����'); end;
        12: begin Writeln('�������'); end;
      end;
    end;
  end;
end;

procedure UpSredMenes(arr:tarray; len:integer);
var i,z:integer;
begin
  z:=0;
  for i:=1 to len do
  begin
    if arr[i]>sredchis(arr,len) then
        inc(z);
  end;
  Writeln(z);
end;

function RazUp(arr:tarray; len:integer):integer;
var i,z,c:integer;
begin
  z:=arr[1];
  for i:=1 to len do
  begin
    if z<arr[i] then
        inc(c);
    z:=arr[i];
  end;
  Writeln(c);
end;

Procedure Podrat(arr:tarray; len:integer);
var i,z:integer;
begin
  z:=0;
  arr[13]:=arr[1];
  arr[14]:=arr[2];
  for i:=1 to len do
  begin
    if (arr[i]+arr[i+1]+arr[i+2])>z then
        z:=arr[i]+arr[i+1]+arr[i+2];
  end;
  Writeln(z);
end;

procedure Grafic1(arr:tarray; len:integer);
var i,z:integer;
begin
  for i:=1 to len do
  begin
    Write(arr[i]:2);
    Write(' ');
    for z:=1 to arr[i] do
        Write('*');
    Writeln;
  end;
end;

var arr:tarray; len:integer;
begin
  ReadlnFile(arr,len);
  Maxmenes(arr,len);
  writeln(Sredchis(arr,len):0:0);
  UpSredMenes(arr,len);
  RazUp(arr,len);
  Podrat(arr, len);
  Grafic1(arr,len);
  Readln;
end.