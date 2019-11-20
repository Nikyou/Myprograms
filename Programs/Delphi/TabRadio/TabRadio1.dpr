program TabRadio1;

uses
  Forms,
  TabRadio in 'TabRadio.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
