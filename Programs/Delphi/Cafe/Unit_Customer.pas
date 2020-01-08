unit Unit_Customer;

interface

uses
  Classes;

type
  Customer = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

implementation

{ Important: Methods and properties of objects in VCL can only be used in a
  method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure Customer.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ Customer }

procedure Customer.Execute;
begin
  { Place thread code here }
end;

end.
