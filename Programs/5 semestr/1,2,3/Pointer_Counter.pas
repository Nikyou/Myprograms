program Pointer_counter;
Type PItem=^TItem;
     TItem=Record
       data:longint;
       next:PItem;
     end;


function Counter(start:PItem):longint;
var last:PItem;
begin
  Counter:=0;
  if (start^.next<>NIL) then
        inc(Counter);
  last:=start^.next;
  While not (last^.next=NIL) do
  begin
    if (last^.next<>NIL) then
        inc(Counter);
    last:=last^.next;
  end;
end;


var  f:Text;
     last,start:PItem;
begin
  New(start);
  last := start;
  Assign(f,'For_Pointer_test.txt');
  Reset(f);
  repeat
    readln(f,last^.data);
    New(last^.next);
    last:=last^.next;
  until eof(f);
  Close(f);
  Writeln(Counter(start));
  While not (start^.next=NIL) do
  begin
    last:=start;
    While not (last^.next^.next=NIL) do
      last:=last^.next;
    Dispose(last^.next^.next);
    last^.next:=NIL;
  end;
  dispose(start);
  Readln;
end.