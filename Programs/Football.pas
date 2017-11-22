Unit Football;

Interface
Type

  TTeamTitle = String[30];

  TMatch = Record
             team1: TTeamTitle;
             goals1: Byte;
             team2: TTeamTitle;
             goals2: Byte;
           End;

  TName = String[14];

  TGoal = Record
            name: TName;
            minute: Byte;
          End;
Const
  DataFile = 'football.dat';

Implementation

Begin
End.
