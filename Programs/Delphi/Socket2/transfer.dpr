program transfer;

uses
  Forms,
  ServerUnit in 'ServerUnit.pas' {ServerForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TServerForm, ServerForm);
  Application.Run;
end.
