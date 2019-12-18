program Project_Remote_Controler;

uses
  Forms,
  Remote_Controler in 'Remote_Controler.pas' {Call};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TCall, Call);
  Application.Run;
end.
