program ProjectA;
{$APPTYPE CONSOLE}
uses
  SysUtils;

type
  ESampleException = class(Exception);
  ESomethingElse = class(Exception);
var
  ErrorCondition: Boolean;

procedure C;
begin
  writeln('Enter C');
  if (ErrorCondition) then begin
    writeln('Raising exception in C');
    raise ESampleException.Create('Error!');
  end;
  writeln('Exit C');
end;

procedure B1;
begin
  writeln('Enter B');
  C;
  writeln('Exit B');
end;

procedure B2;
var
  P: Pointer;
begin
  writeln('Enter NewB');
  GetMem(P, 1000);
  try
    writeln('Enter NewB''s try block');
    C;
    writeln('End of NewB''s try block');
  finally
    writeln('Inside NewB''s finally block');
    FreeMem(P, 1000);
  end;
  writeln('Exit NewB');
end;
 
procedure B3;
var  p, q: Pointer;
     f: File;
begin
  writeln('Enter B');
  p:= nil;
  q:= nil;
  AssignFile(f, 'test.dat');
  try
    writeln('Enter B''s try-finally block');
    try
      writeln('Enter B''s try-except block');
      reset(f, 1);
    except
      on EInOutError do begin
        writeln('Create file');
        rewrite(f, 1);
      end;
    end;
    GetMem(p, 1000);
    GetMem(q, 1000);
    C;
    writeln('end of B''s try block');
  finally
    writeln('Inside B''s finally block');
    if Assigned(p) then FreeMem(p, 1000);
    if Assigned(q) then FreeMem(q, 1000);
    CloseFile(f);
  end;
  writeln('exit B');
end;

procedure A;
begin
  writeln('Enter A');
  try
    writeln('Enter A''s try block');
    B3;
    writeln('After B call');
  except
    on ESampleExceptin do
      writeln('Inside A''s ESampleException handler');
    on ESomethingElse do
      writeln('Inside A''s ESomethingElse handler');
  end;
  writeln('Exit A');
end;

begin
  writeln('Begin main');
  ErrorCondition:= True;
  A;
  writeln('End main');
  readln;
end.

