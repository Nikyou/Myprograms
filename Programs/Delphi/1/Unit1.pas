unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    MyButton1: TButton;
    MyButton2: TButton;
    procedure MyButton1Click(Sender: TObject);
    procedure MyButton2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}



procedure TForm1.MyButton1Click(Sender: TObject);
begin
  MyButton1.Enabled:=False;
  MyButton2.Enabled:=True;
end;

procedure TForm1.MyButton2Click(Sender: TObject);
begin
  MyButton1.Enabled:=True;
  MyButton2.Enabled:=False;
end;

end.
