program getpicture;

uses
  Forms,
  ClientUnit in 'ClientUnit.pas' {ClientForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TClientForm, ClientForm);
  Application.Run;
end.
