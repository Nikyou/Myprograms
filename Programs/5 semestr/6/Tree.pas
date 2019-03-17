program Tree;
Type PNode=^TNode;
     TNode=Record
       data:longint;
       count:longint;
       right:PNode;
       left:PNode;
     end;


procedure AddToTree(var root:PNode; data:longint);
var sled:PNode; prev: PNode;
begin
  if root=Nil then
  begin
    New(root);
    root^.data:=data;
    root^.count:=1;
    root^.left:=NIL;
    root^.right:=NIL;
    exit;
  end;
  sled:=root;
  While (sled <> NiL) do
  begin
    prev := sled;
    if (sled^.data = data) then begin
      inc(sled^.count);
      exit;
    end;
    if data>sled^.data then
      sled:=sled^.right
    else
      sled:=sled^.left;
  end;
  if sled=NIL then
  begin
    New(sled);
    sled^.data:=data;
    sled^.count:=1;
    sled^.left:=NIL;
    sled^.right:=NIL;
    if (prev^.data > sled^.data) then
      prev^.left := sled
    else
      prev^.right := sled;
  end;
end;

procedure  RemoveFromTree(var root:PNode; data:longint);
var sled:PNode;
begin
  if root^.data=data then
  begin
    if not (root^.count=0) then
      dec(root^.count);
    exit;
  end;
  sled:=root;
  While (sled <> NiL) do
  begin
    if (sled^.data = data) then
      break;
    if data>sled^.data then
      sled:=sled^.right
    else
      sled:=sled^.left;
  end;
  if data=sled^.data then
    if not (sled^.count=0) then
      inc(sled^.count);
end;

procedure PrintTree(root:PNode);
var i:longint;
begin
  if not (root=NIL) then
  begin
    PrintTree(root^.left);
    for i:=1 to root^.count do
      Writeln(root^.data);
    PrintTree(root^.right);
  end;
end;

procedure DeleteTree(var root:PNode);
begin
  if not (root<>NIL) then
  begin
    DeleteTree(root^.left);
    DeleteTree(root^.right);
    Dispose(root);
  end;
end;


var N,c,i:longint;
f:text;
root:PNode;
begin
  Assign(f,'RandomNumbers.txt');
  Reset(f);
  Readln(f,N);
  for i:=1 to N do
  begin
    Readln(f,c);
    AddToTree(root,c);
  end;
  Close(f);
  PrintTree(root);
  DeleteTree(root);
  Readln;
end.