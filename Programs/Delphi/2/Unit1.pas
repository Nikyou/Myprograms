unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Shape1: TShape;
    Timer1: TTimer;
    Button1: TButton;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  vx:integer;

implementation

{$R *.DFM}

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Shape1.left:=Shape1.left+vx;
  if (Shape1.left>=Form1.clientWidth-Shape1.width) then
    vx:=-vx;
  if (Shape1.left<=0) then
    vx:=-vx;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  vx:=100;
end;

end.
