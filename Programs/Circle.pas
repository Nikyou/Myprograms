Program Circle;
Var r, p: Real;
    S, Per: Real;
Begin
        WriteLn('������');
        ReadLn(r);
        p:=3.14;
        S:=p*(r*r);
        WriteLn('���頤� ��㣠:');
        Writeln(S:0:2);
        Per:=2*p*r;
        Writeln('����� ���㦭���:');
        Writeln(Per:0:2);
        Readln;
End.