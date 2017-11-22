program Task;
uses Football;
type TMymatch=record
     match:Tmatch;
     goals1, goals2:array[1..10] of TGoal
var f:file;
  matches:array[1..250] of TMymatch;

begin
  Assign(f, DataFile);
  Reset(f,1);
  for i:=1 to eof(f) do
  begin
    BlockRead(f, Matches[i].match, sizeof(tmatch));
    for c:=1 to Matches[i].goals1 do
    begin
      BlockRead(f,Matches[i].goals1[c], sizeof(tgoal));
    end;
    for c:=1 to Matches[i].goals2 do
    begin
      BlockRead(f,Matches[i].goals2[c], sizeof(tgoal));
    end;
  end;
end.