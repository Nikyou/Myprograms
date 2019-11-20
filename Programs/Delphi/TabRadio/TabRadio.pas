unit TabRadio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Spin, ComCtrls;

type
  TForm1 = class(TForm)
    TabControl1: TTabControl;
    SpinEdit1: TSpinEdit;
    Button1: TButton;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
var i:integer;
begin
  if SpinEdit1.value>0 then
  begin
    TabControl1.Tabs.clear;
    for i:=1 to SpinEdit1.value do
    begin
      TabControl1.Tabs.Add(inttostr(i));
    end;
  end;
  RadioGroup1.Items.clear;
  RadioGroup1.Items.add('1');
  Label2.caption:='On page number 1';
end;

procedure TForm1.TabControl1Change(Sender: TObject);
var i:integer;
begin
 RadioGroup1.Items.clear;
 for i:=1 to TabControl1.tabindex+1 do
 begin
   RadioGroup1.Items.add(inttostr(i));
 end;
 Label2.caption:='On page number '+inttostr(TabControl1.tabindex+1);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Label2.top:=tabcontrol1.height-Label2.height-4;
  Label1.top:=Label2.top-2*Label1.height;
  Radiogroup1.top:=2*Label1.height;
  Radiogroup1.height:=Label1.top-Radiogroup1.top;
end;

end.
