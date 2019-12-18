program Project_Traffic_Light_Controled;

uses
  Forms,
  Traffic_Light_Controled in 'Traffic_Light_Controled.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
