program TestChisla;
uses ChislaM;
var length:Integer;
    nums:TArray;
begin
  ReadarrChis(nums,length);
  writeln('�㬬�=',SumChis(nums,length):0:0);
  Writeln('���ᨬ�=',MaxChis(nums,length):0:0);
  Writeln('������=',MinChis(nums,length):0:0);
  Writeln('C।���=',SredChis(nums,length):0:0);
  Readln;
end.
