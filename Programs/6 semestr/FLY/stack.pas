 Unit Stack;
 interface

      type

        PStackable=^TStackable;
        TStackable = object
          prev: PStackable;
          constructor Init;
          procedure Setprev(p: PStackable);
          function Getprev: PStackable;
	  procedure Show; virtual;
          destructor Done; virtual;
        end;

        PStack = ^TStack;
        TStack = object (TStackable)
          top: PStackable;
          constructor Init;
          function Pop: PStackable;
          procedure Push(p: PStackable);
	  procedure Show; virtual;
          function Empty: Boolean;
          procedure Error(ErrNum:Word);
          destructor Done; virtual;
        end;

 implementation

 {Реализация методов класса Stackable}
      constructor TStackable.Init;
      begin
        prev:=Nil;
      end;

      function TStackable.Getprev: PStackable;
      begin
        Getprev:=prev;
      end;

      procedure TStackable.Setprev(p: PStackable);
      begin
        prev:=p;
      end;
	  
      procedure TStackable.Show;
      begin
        RunError(211);
      end;
	  
      destructor TStackable.Done;
      begin
      end;

 {Реализация методов класса TStack}
      constructor TStack.Init;
      begin
        inherited Init;
        top:=Nil;
      end;

      function TStack.Pop: PStackable;
      begin
       Pop:=top; 
       If Empty Then Error(1)
                Else top:= top^.Getprev;
      end;

      procedure TStack.Push(p: PStackable);
      begin
        p^.Setprev(top); 
        top:=p;
      end;

      procedure TStack.Show;
      Var p: PStackable;
      begin
        If not Empty Then begin
 	  p:= Pop;
	  p^.Show;
	  Show;
	  Push(p);
	end;
      end;

      destructor TStack.Done;
      Var t: PStackable;
      begin
        While not Empty Do begin
          t:= Pop;
          Dispose(t, Done);
        end;
      end;

      function TStack.Empty: Boolean;
      begin
        Empty:= (top=Nil);
      end;

      procedure TStack.Error(ErrNum:Word);
      begin
        Writeln('Stack error #',ErrNum);
      end;
 end.
