Program Circle;
Var r, p: Real;
    S, Per: Real;
Begin
        WriteLn('Радиус');
        ReadLn(r);
        p:=3.14;
        S:=p*(r*r);
        WriteLn('Площадь круга:');
        Writeln(S:0:2);
        Per:=2*p*r;
        Writeln('Длина окружности:');
        Writeln(Per:0:2);
        Readln;
End.