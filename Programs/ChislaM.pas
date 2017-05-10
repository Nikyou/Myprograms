unit ChislaM;
Interface

const N=100000;
Type TArray=array[1..N] of Integer;
function SumChis(arr:TArray;length:Integer):Real;
function MaxChis(arr:TArray;length:Integer):Real;
function MinChis(arr:TArray;length:Integer):Real;
function SredChis(arr:TArray;length:Integer):Real;
procedure ReadArrChis(var x:TArray;var z:Integer);

Implementation

function SumChis(arr:TArray;length:Integer):Real;
var i:Integer;
    res:Real;
begin
  res:=0;
  for i:=1 to length do
  begin
    res:=res+arr[i];
  end;
  SumChis:=res;
end;
function MaxChis(arr:TArray;length:Integer):Real;
var i:Integer;
    Max:Integer;
begin
  max:=arr[1];
  for i:=1 to length do
  begin
    if(max<arr[i])then
    max:=arr[i];
  end;
  MaxChis:=max;
end;
function MinChis(arr:TArray;length:Integer):Real;
var i:Integer;
    min:Integer;
begin
  min:=arr[1];
  for i:=1 to length do
  begin
    if(min>arr[i])then
    min:=arr[i];
  end;
  MinChis:=min;
end;
function SredChis(arr:TArray;length:Integer):Real;
var i:Integer;
    res:Real;
begin
  res:=0;
  for i:=1 to length do
  begin
    res:=res+arr[i];
  end;
  SredChis:=res/length;
end;
procedure ReadArrChis(var x:TArray; var z:Integer);
var i:integer;
begin
  i:=1;
  z:=0;
  while (i<>-656) do
  begin
    inc(z);
    Readln(i);
    if (i<>-656) then x[z]:=i;
  end;
  dec(z);
  end;

begin
end.
