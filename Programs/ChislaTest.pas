program TestChisla;
uses ChislaM;
var length:Integer;
    nums:TArray;
begin
  ReadarrChis(nums,length);
  writeln('Сумма=',SumChis(nums,length):0:0);
  Writeln('Максимум=',MaxChis(nums,length):0:0);
  Writeln('Минимум=',MinChis(nums,length):0:0);
  Writeln('Cреднее=',SredChis(nums,length):0:0);
  Readln;
end.
