Unit Figures;


interface
uses Graph, Stack;

type

  PFigureStack = ^TFigureStack;
  TFigureStack = object (TStack)
    p: Real;
    constructor Init(p0: Real);
    procedure Tick;
    destructor Done; virtual;
  end;

  PFigure=^TFigure;
  TFigure = object (TStackable)
    x, y, vx, vy: Integer;
    constructor Init(x0, y0: Integer; vx0, vy0: Integer);
    procedure Show; virtual;
    procedure Hide; virtual;
    procedure Tick;
    function InScreen(): Boolean; virtual;
    destructor Done; virtual;
  end;

  PCircle=^TCircle;
  TCircle = object (TFigure)
    R: Integer;
    constructor Init(x0, y0: Integer; vx0, vy0: Integer; R0: Integer);
    procedure Show; virtual;
    procedure Hide; virtual;
    function InScreen(): Boolean; virtual;
    destructor Done; virtual;
  end;

  PSquare=^TSquare;
  TSquare = object (TFigure)
    Side: Integer;
    constructor Init(x0, y0: Integer; vx0, vy0: Integer; Side0: Integer);
    procedure Show; virtual;
    procedure Hide; virtual;
    function InScreen(): Boolean; virtual;
    destructor Done; virtual;
  end;

implementation

  {Реализация методов класса TFigureStack}
  constructor TFigureStack.Init(p0: Real);
  begin
    inherited Init;
    Randomize;
    p:= p0;
  end;

  procedure TFigureStack.Tick;
  Var f: PFigure;
      tmp: PFigureStack;
      ux, uy: Integer;
  begin
    If not Empty Then begin
      f:= PFigure(Pop);
      f^.Tick;
      Tick;
      Push(f);
    end;
    If Random<p Then begin
      ux:= 5 + Random(7);
      If Random(2) = 0 Then ux:= -ux;
      uy:= 5 + Random(7);
      If Random(2) = 0 Then uy:= -uy;
      If Random(2)=0 Then Begin
        f:= New(PCircle, Init( GetMaxX div 2, GetMaxY div 2, ux, uy, 5));
      End
      Else Begin
        f:= New(PSquare, Init( GetMaxX div 2 - 2, GetMaxY div 2 - 2, ux, uy, 5));
      End;
	  f^.Show;
	  Push(f);
    end;
    tmp:= New (PFigureStack, Init(0));
    While not Empty Do Begin
      f:= PFigure(Pop());
      If f^.InScreen Then Begin
        tmp^.Push(f);
      End
      Else Begin
        Dispose(f, Done);
      End;
    End;
    While not tmp^.Empty Do Begin
      Push(tmp^.Pop());
    End;
	Dispose(tmp, Done);
  end;

  destructor TFigureStack.Done; 
  begin
    inherited;	
  end;

  {Реализация методов класса TFigure}
  constructor TFigure.Init(x0, y0: Integer; vx0, vy0: Integer);
  begin
    Inherited Init;
    x:= x0;    y:= y0;
    vx:= vx0;  vy:= vy0;
  end;

  procedure TFigure.Show;
  begin
    RunError(211);	
  end;

  procedure TFigure.Hide;
  begin
    RunError(211);	
  end;

  procedure TFigure.Tick;
  begin
    Hide;
    x:= x+vx;
    y:= y+vy;	
    Show;
  end;

  function TFigure.InScreen(): Boolean;
  begin
    RunError(211);	
  end;

  destructor TFigure.Done;
  begin
  end;

  {Реализация методов класса TCircle}
  constructor TCircle.Init(x0, y0: Integer; vx0, vy0: Integer; R0: Integer);
  begin
    inherited Init(x0, y0, vx0, vy0);
    R:= R0;
  end;  
	
  procedure TCircle.Show; 
  begin
    Circle(x, y, R);
  end;  
	
  procedure TCircle.Hide; 
  var t: Word;
  begin
    t:= GetColor;
    SetColor(GetBkColor());
    Circle(x, y, R);
    SetColor(t);
  end;  

  function TCircle.InScreen(): Boolean; 
  begin
    InScreen:= (x>=R) and (y>=R) and (x+R<=GetMaxX) and (y+R<=GetMaxY);
  end;  
  
  destructor TCircle.Done;
  begin
    Hide();
  end;  

  {Реализация методов класса TSquare}
  constructor TSquare.Init(x0, y0: Integer; vx0, vy0: Integer; Side0: Integer);
  begin
    inherited Init(x0, y0, vx0, vy0);
    Side:= Side0;
  end;  
	
  procedure TSquare.Show; 
  begin
    Rectangle(x, y, x+Side, y+Side);
  end;  
	
  procedure TSquare.Hide; 
  var t: Word;
  begin
    t:= GetColor;
    SetColor(GetBkColor());
    Rectangle(x, y, x+Side, y+Side);
    SetColor(t);
  end;  

  function TSquare.InScreen(): Boolean; 
  begin
    InScreen:= (x>=0) and (y>=0) and (x+Side<=GetMaxX) and (y+Side<=GetMaxY);
  end;  
  
  destructor TSquare.Done;
  begin
    Hide();
  end;  

end.
