 Program Call_OOP3;
 Uses WinCrt, Graph, OOP3;

 Const NK=7;
 Var gd,gm: Integer;
     hat: PQuasiStack;
     K, RR: Word;

 Procedure cwork(p:pointer);
 Var c: PFigure absolute p;
 begin
   c^.Crowl(-18+Random(25),-15+Random(21));
   If not (c^.Inside) Then Begin
       hat^.Delete(c);
       Dispose(c,done);
       Dec(K);
   End;
 end;


 Begin
   gd:=Detect;
   InitGraph(gd,gm,'');
   Randomize;
   K:=0;
   RR:=GetMaxY div 4;
   hat:= New(PQuasiStack, Init);
   Repeat
     While K<=Random(NK) Do
     Begin
       hat^.Push( New(PCircle, Init ( Random(GetMaxX-RR)+RR div 2,
                                      Random(GetMaxY-RR)+RR div 2,
                                      Random(RR))));
       Inc(K);
     End;
     hat^.foreach(@cwork);
   Until KeyPressed;
   Dispose(hat, Done);
   CloseGraph;
 End.
