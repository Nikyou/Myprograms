program CheckLabel3D;

uses
  Forms,
  CheckLabel3dUnit in 'CheckLabel3dUnit.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
