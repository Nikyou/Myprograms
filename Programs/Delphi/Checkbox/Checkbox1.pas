unit Checkbox1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, contnrs, ExtCtrls;

Const
H=20;

type
  TForm1 = class(TForm)
    CheckBox1: TCheckBox;
    ProgressBar1: TProgressBar;
    Button1: TButton;
    Timer1: TTimer;
    ProgressBar2: TProgressBar;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    TCheckboxlist: Tlistlist;
    Constructor Create(AOwner: TComponent); override;
  end;

var
  Form1: TForm1;
  List: TCheckboxlist;


implementation

{$R *.DFM}

constructor TForm1.Create(AOwner: TComponent);
begin
  Inherited Create(AOwner);
  List:= Tlistlist.create(self);
  list.OwnsObjects;=true;
end;

procedure TForm1.Button1Click(Sender: TObject);
var maxx,maxy,i,n,rx, ry:integer;
begin
  if not (List=nil) then
    List.destroy;
  Timer1.enabled:=false;
  maxx:=Form1.clientwidth - Form1.clientwidth div 10;
  maxy:=Form1.clientheight - Form1.clientheight div 10;
  if maxx<maxy then
    n:=(maxx-10*H) div 11
  else
    n:=(maxy-10*H) div 11;
  rx:=0;
  ry:=1;
  for i:=1 to 100 do
  begin
    inc(rx);
    if (rx=11) then
    begin
      rx:=1;
      inc(ry);
    end;
    list.add(TCheckBox.create(nil));
    with TCheckBox(list.last()) do
    begin
      parent;=self;
      height:=H; width:=H;
      left:=(rx-1)*H+(n*rx);
      top:=(ry-1)*H+(n*ry);
      checked:=false;
    end;
  end;
  Timer1.enabled:=true;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ProgressBar1.top:=Form1.clientheight-Form1.clientheight div 10 - ProgressBar1.height div 2;
  ProgressBar1.left:=0;
  ProgressBar1.width:=Form1.clientwidth;
  ProgressBar2.top:=ProgressBar1.top + ProgressBar1.height + 10;
  ProgressBar2.left:=0;
  ProgressBar2.width:=Form1.clientwidth;
  Button1.top:=0;
  Button1.left:=Form1.clientwidth-Button1.width;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  ProgressBar1.top:=Form1.clientheight-Form1.clientheight div 10 - ProgressBar1.height div 2;
  ProgressBar1.left:=0;
  ProgressBar1.width:=Form1.clientwidth;
  ProgressBar2.top:=ProgressBar1.top + ProgressBar1.height + 10;
  ProgressBar2.left:=0;
  ProgressBar2.width:=Form1.clientwidth;
  Button1.top:=0;
  Button1.left:=Form1.clientwidth-Button1.width;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if ProgressBar1.Position = 0 then
  begin
    Timer1.enabled:=false;
  end
  else
    ProgressBar1.Position:=ProgressBar1.Position-40;
end;

end.