unit Sort;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    Button1: TButton;
    LabelInt: TLabel;
    LabelReal: TLabel;
    LabelNotNumber: TLabel;
    ListBoxInt: TListBox;
    ListBoxReal: TListBox;
    ListBoxNotNumber: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
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
var f:system.text;
s:string;
begin
  if opendialog1.Execute then
  begin
    showmessage(opendialog1.filename);
  end;
  Assignfile(f,opendialog1.filename);
  reset(f);
  repeat
    readln(f,s);
    try
      strtoint(s);
      ListBoxInt.items.add(s);
    except
      on Econverterror do
      begin
        try
          strtofloat(s);
          ListBoxReal.items.add(s);
        except
          on Econverterror do
            ListBoxNotNumber.items.add(s);
        end;
      end;
    end;
  until eof(f);
  closefile(f);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ListBoxInt.left:=0;
  ListBoxInt.top:=form1.clientheight div 20;
  ListBoxInt.width:=form1.clientwidth div 3;
  ListBoxInt.height:=form1.clientheight-form1.clientheight div 20 - form1.clientheight div 10;
  ListboxReal.top:=ListBoxInt.top;
  ListboxReal.left:=ListBoxInt.width;
  ListboxReal.height:=ListBoxInt.height;
  ListboxReal.width:=ListBoxInt.width;
  ListBoxNotNumber.top:=ListBoxInt.top;
  ListBoxNotNumber.left:=ListboxReal.left+ListBoxReal.width;
  ListBoxNotNumber.height:=ListBoxInt.height;
  ListBoxNotNumber.width:=ListBoxInt.width;
  Labelint.top:=ListBoxInt.top div 2 - Labelint.height div 2;
  Labelint.left:=ListBoxInt.left+ListBoxInt.width div 2 - Labelint.width div 2;
  Labelreal.top:=ListBoxreal.top div 2 - Labelreal.height div 2;
  Labelreal.left:=ListBoxreal.left+ListBoxreal.width div 2 - Labelreal.width div 2;
  Labelnotnumber.top:=ListBoxnotnumber.top div 2 - Labelnotnumber.height div 2;
  Labelnotnumber.left:=ListBoxnotnumber.left+ListBoxnotnumber.width div 2 - Labelnotnumber.width div 2;
  Button1.top:=form1.clientheight - form1.clientheight div 20 - Button1.height div 2;
  Button1.left:=0;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  ListBoxInt.left:=0;
  ListBoxInt.top:=form1.clientheight div 20;
  ListBoxInt.width:=form1.clientwidth div 3;
  ListBoxInt.height:=form1.clientheight-form1.clientheight div 20 - form1.clientheight div 10;
  ListboxReal.top:=ListBoxInt.top;
  ListboxReal.left:=ListBoxInt.width;
  ListboxReal.height:=ListBoxInt.height;
  ListboxReal.width:=ListBoxInt.width;
  ListBoxNotNumber.top:=ListBoxInt.top;
  ListBoxNotNumber.left:=ListboxReal.left+ListBoxReal.width;
  ListBoxNotNumber.height:=ListBoxInt.height;
  ListBoxNotNumber.width:=ListBoxInt.width;
  Labelint.top:=ListBoxInt.top div 2 - Labelint.height div 2;
  Labelint.left:=ListBoxInt.left+ListBoxInt.width div 2 - Labelint.width div 2;
  Labelreal.top:=ListBoxreal.top div 2 - Labelreal.height div 2;
  Labelreal.left:=ListBoxreal.left+ListBoxreal.width div 2 - Labelreal.width div 2;
  Labelnotnumber.top:=ListBoxnotnumber.top div 2 - Labelnotnumber.height div 2;
  Labelnotnumber.left:=ListBoxnotnumber.left+ListBoxnotnumber.width div 2 - Labelnotnumber.width div 2;
  Button1.top:=form1.clientheight - form1.clientheight div 20 - Button1.height div 2;
  Button1.left:=0;
end;

end.
