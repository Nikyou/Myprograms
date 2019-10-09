 Unit OOP3;
 interface

      uses Stack, Graph, WinCrt;

      type
        Proc = Procedure (p: pointer);

        PLocation = ^TLocation;
        TLocation = object(TStackable)
          X, Y: Integer;
          constructor Init(InitX, InitY:Integer);
          function GetX:Integer;
          function GetY:Integer;
          destructor Done; virtual;
        end;

        PFigure = ^TFigure;
        TFigure = object(TLocation)
          Visible: Boolean;
          constructor Init(InitX, InitY:Integer);
          destructor Done; virtual;
          procedure Show; virtual;
          procedure Hide; virtual;
          function IsVisible: Boolean;
          procedure Crowl(dX,dY: Integer); virtual;
          procedure MoveTo(NewX, NewY: Integer);
          function Inside: Boolean; virtual;
        end;

        PCircle = ^TCircle;
        TCircle = object(TFigure)
          Radius:Integer;
          constructor Init(InitX, InitY, InitRadius:Integer);
          destructor Done; virtual;
          procedure Show; virtual;
          procedure Hide; virtual;
          procedure Resize(Step:Integer); virtual;
          procedure Crowl(dX,dY: Integer); virtual;
          function Inside: Boolean; virtual;
        end;

        PQuasiStack = ^TQuasiStack;
        TQuasiStack = object(TStack)
          procedure ForEach(p:proc);
          procedure Delete(p:pStackable);
        end;

 implementation

 {Реализация методов класса Location}
      constructor TLocation.Init(InitX, InitY:Integer);
      begin
        X := InitX;
        Y := InitY;
        inherited Init;
      end;

      function TLocation.GetX:Integer;
      begin
        GetX := X;
      end;

      function TLocation.GetY:Integer;
      begin
        GetY := Y;
      end;

      destructor TLocation.Done;
      begin
      end;

{Реализация методов класса TFigure}
      constructor TFigure.Init(InitX, InitY:Integer);
      begin
        inherited Init(InitX, InitY);
        Visible := False;
      end;

      destructor TFigure.Done;
      begin
        Hide;
      end;

      function TFigure.IsVisible:Boolean;
      begin
        IsVisible := Visible;
      end;

      procedure TFigure.Show;
      begin
        RunError(211); {Run-time error: Call to abstract method}
      end;

      procedure TFigure.Hide;
      begin
        RunError(211); {Run-time error: Call to abstract method}
      end;

      procedure TFigure.Crowl(dX, dY: Integer);
      begin
        RunError(211); {Run-time error: Call to abstract method}
      end;

      function TFigure.Inside: Boolean;
      begin
        RunError(211); {Run-time error: Call to abstract method}
      end;

      procedure TFigure.MoveTo(NewX, NewY:Integer);
      begin
        Hide;  X := NewX;  Y := NewY;  Show;
      end;

 {Реализация методов класса Circle}
      constructor TCircle.Init(InitX, InitY, InitRadius:Integer);
      begin
        inherited Init(InitX, InitY);
        Radius := InitRadius;
      end;

      procedure TCircle.Show;
      begin
        Visible := True;
        Graph.Circle(X, Y, Radius);
      end;

      procedure TCircle.Hide;
      var TempColor:Word;
      begin
        TempColor := Graph.GetColor;
        Graph.SetColor(GetBkColor());
        Visible := False;
        Graph.Circle(X, Y, Radius);
        Graph.SetColor(TempColor);
      end;

      procedure TCircle.Crowl(dX,dY: Integer);
      var dr,i, X0, Y0: Integer;
          sx, sy: Real;
      begin
        dr:=Round(Sqrt(Sqr(dX)+Sqr(dY)));
        If dr>0 Then Begin
          X0:=X; Y0:=Y;
          for i:=1 to dr Do Begin
            Resize(1);
            Delay(1);
          End;
          sx:= Int(dX)/Int(dr);
          sy:= Int(dy)/Int(dr);
          for i:=1 to dr Do Begin
            Resize(-1);
            MoveTo(X0+Round(i*sx),Y0+Round(i*sy));
            Delay(1);
          End;
        End;
      end;

      destructor TCircle.Done;
      begin
        Hide;
      end;

      procedure TCircle.Resize(Step:Integer);
      begin
        Hide;
        Inc(Radius,Step); if Radius<0 then Radius:=0;
        Show;
      end;

      function TCircle.Inside: Boolean;
      Begin
        Inside:= (X>Radius) and (X<Graph.GetMaxX-Radius) and
                 (Y>Radius) and (Y<Graph.GetMaxY-Radius);
      End;

 {Реализация методов класса TQuasiStack}
      procedure TQuasiStack.ForEach(p:proc);
      Var  ip, oldip: PStackable;
      begin
        ip:=top;
        While ip<>nil do begin
          oldip:=ip;  ip:=ip^.getprev; p(oldip);
        end;
      end;

      procedure TQuasiStack.Delete(p:pStackable);
      Var
        ip, oldip : pStackable;
      begin
        ip:=top; oldip:=Nil;
        While (ip<>p) and (ip<>nil) do begin
          oldip:=ip; ip:=ip^.getprev;
        end;
        If ip=nil then begin
          Error(2); Exit;
        end;
        If oldip<>nil then oldip^.SetPrev(ip^.GetPrev)
                      else top:=ip^.GetPrev;
      end;

 end.
