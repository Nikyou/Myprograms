program Dinner;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {Form1},
  EaterUnit in 'EaterUnit.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
