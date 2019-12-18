unit Traffic_Light_Controled;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Base: TShape;
    RedLight: TShape;
    YellowLight: TShape;
    GreenLight: TShape;
    Changer: TButton;
    Button_Day_Night: TButton;
    Timer1: TTimer;
    Sun: TShape;
    procedure FormCreate(Sender: TObject);
    procedure ChangerClick(Sender: TObject);
    procedure Button_Day_NightClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  counter:smallint;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Base.Left:=Form1.ClientWidth div 4;
  Base.top:=Form1.ClientHeight div 6;
  RedLight.left:=Base.Left + Base.Width div 2 - RedLight.Width div 2;
  RedLight.top:=Base.top+((Base.Height-RedLight.Height*3) div 6);
  YellowLight.left:=Base.Left + Base.Width div 2 - YellowLight.Width div 2;
  YellowLight.top:=Base.top+Base.Height div 2 - YellowLight.Height div 2;
  GreenLight.left:=Base.Left + Base.Width div 2 - GreenLight.Width div 2;
  GreenLight.top:=Base.top+Base.Height-((Base.Height-GreenLight.Height*3) div 6)-GreenLight.Height;
  counter:=1;
  Changer.left:=Form1.ClientWidth div 2 - Changer.width div 2;
  Changer.top:=Base.top+Base.height div 4 - Changer.height div 2;
  Button_Day_Night.left:=Changer.left;
  Button_Day_Night.top:=Base.top+Base.height - Base.height div 4 - Button_Day_Night.height div 2;
  Sun.left:=Form1.ClientWidth - Form1.ClientWidth div 6 - Sun.width div 2;
  Sun.top:=Form1.ClientHeight div 6 - Sun.height div 2;
end;

procedure TForm1.ChangerClick(Sender: TObject);
begin
 if (Button_Day_Night.Caption='Night') then
   begin
     if (counter=1) then
     begin
       YellowLight.Brush.Color:=clMenu;
       RedLight.Brush.Color:=clRed;
       inc(counter);
       exit;
     end;
     if (counter=2) then
     begin
       YellowLight.Brush.Color:=clYellow;
       inc(counter);
       exit;
     end;
     if (counter=3) then
     begin
       YellowLight.Brush.Color:=clMenu;
       RedLight.Brush.Color:=clMenu;
       GreenLight.Brush.Color:=clLime;
       inc(counter);
       exit;
     end;
     if (counter=4) then
     begin
       GreenLight.Brush.Color:=clMenu;
       YellowLight.Brush.Color:=clYellow;
       counter:=1;
       exit;
     end;
   end;
end;

procedure TForm1.Button_Day_NightClick(Sender: TObject);
begin
  if (Button_Day_Night.Caption='Night') then
  begin
    Button_Day_Night.Caption:='Day';
    YellowLight.Brush.Color:=clMenu;
    RedLight.Brush.Color:=clMenu;
    GreenLight.Brush.Color:=clMenu;
    Timer1.Enabled:=True;
    Sun.Brush.Color:=clBackground;
    exit;
  end;
  if (Button_Day_Night.Caption='Day') then
  begin
    Button_Day_Night.Caption:='Night';
    YellowLight.Brush.Color:=clMenu;
    RedLight.Brush.Color:=clMenu;
    GreenLight.Brush.Color:=clMenu;
    counter:=1;
    Timer1.Enabled:=False;
    Sun.Brush.Color:=clYellow;
    exit;
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if YellowLight.Brush.Color=clYellow then
    YellowLight.Brush.Color:=clMenu
  else
    YellowLight.Brush.Color:=clYellow;
end;

end.
