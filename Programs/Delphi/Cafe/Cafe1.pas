unit Cafe1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CheckLst, StdCtrls;

type
  TForm1 = class(TForm)
    Log: TListBox;
    Start_Stop: TButton;
    List: TCheckListBox;
    procedure FormCreate(Sender: TObject);
    procedure Start_StopClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  Customer = class(TThread)
    Name:string;
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;
var
  Form1: TForm1;

implementation

{$R *.DFM}

function Picktarget(Sender: TObject,n:integer):boolean;
begin
  Log.items.add(Sender.Name,' tries to pick #',inttostr(n),'and #',inttostr(n+1));
  if List.checked[n-1]=false then
  begin
    Log.items.add(Sender.Name,' succesfuly to picked #',inttostr(n),'and #',inttostr(n+1));
    List.checked[n-1]:=true;
    List.checked[n]:=true;
    Picktarget:=true;
  end
  else
  begin
    Log.items.add(Sender.Name,' failed to picked #',inttostr(n),'and #',inttostr(n+1));
    Picktarget:=false;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var i:integer;
begin
  List.Items.clear;
  for i:=1 to 50 do
    List.Items.add(inttostr(i));
  Log.items.add(List.Items[3]);
  List.checked[3]:=true;
end;

procedure TForm1.Start_StopClick(Sender: TObject);
begin
  If caption='Start' then
  begin

  end
  else
  begin

  end;
end;

procedure Customer.Execute;
var n:integer;
begin
  n:=random(50)+1;
  if Synchronize(Picktarget(self,n))=false then

end;

end.
