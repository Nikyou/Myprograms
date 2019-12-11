unit CheckLabel3dUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Label3D;

type
  TForm1 = class(TForm)
    InfoLabel3D: TLabel3D;
    procedure InfoLabel3DClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.InfoLabel3DClick(Sender: TObject);
begin
  If InfoLabel3D.Style = lsRaised Then Begin
    InfoLabel3D.Style:= lsLowered;
    InfoLabel3D.Caption:= 'Lowered';
  End
  Else { If InfoLabel3D.Style = lsLowered} Begin
    InfoLabel3D.Style:= lsRaised;
    InfoLabel3D.Caption:= 'Raised';
  End;
end;

end.
