program Cafe2;

uses
  Forms,
  Cafe1 in 'Cafe1.pas' {Form1},
  Unit_Customer in 'Unit_Customer.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
