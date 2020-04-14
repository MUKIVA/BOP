PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;
  ClassSize = 4;
TYPE
  Score = 0 .. 100;
VAR
  WhichScore: 1 .. NumberOfScores;
  Student: 1 .. ClassSize;
  NextScore: Score;
  Ave, TotalScore, ClassTotal: INTEGER;
  FileOfName: TEXT;
  FatalError, IsNotName: BOOLEAN;
PROCEDURE CopyName(VAR InF: TEXT; VAR NameF: TEXT);
VAR
  Ch: CHAR;
BEGIN { CopyName }
  RESET(InF);
  REWRITE(NameF);
  IF NOT EOLN(InF)
  THEN
    READ(InF, Ch);
  WHILE Ch = ' '
  DO
    READ(InF, Ch);
  WHILE (Ch <> ' ') AND (NOT EOLN(InF))
  DO
    BEGIN
      WRITE(NameF, Ch);
      READ(InF, Ch)
    END;
  WRITE(NameF, Ch)       
END; { CopyName }
PROCEDURE CheckName(VAR NameF: TEXT; VAR IsNotName: BOOLEAN);
VAR
  Ch: CHAR;
BEGIN {CheckName}
  IsNotName := FALSE;
  RESET(NameF);
  WHILE (NOT EOLN(NameF)) AND NOT(IsNotName)
  DO
    BEGIN
      READ(NameF, Ch);
      IsNotName := ((Ch >= '0') AND (Ch <= '9'));
    END
END; {CheckName}
BEGIN {AverageScore}
  ClassTotal := 0;
  WRITELN('Student averages:');
  Student := 1;
  IsNotName := FALSE;
  FatalError := FALSE;
  WHILE (Student <= ClassSize) AND NOT(FatalError) AND NOT(IsNotName)
  DO 
    BEGIN
      TotalScore := 0;
      WhichScore := 1;
      {Копирование из INP в FileOfName имени}
      CopyName(INPUT, FileOfName);
      {Проверка имени на корректность}
      CheckName(FileOfName, IsNotName);
      WHILE (WhichScore <= NumberOfScores) AND NOT(FatalError) AND NOT(IsNotName)
      DO
        BEGIN
          IF NOT EOLN
          THEN
            READ(NextScore)
          ELSE
            FatalError := TRUE;
          TotalScore := TotalScore + NextScore;
          WhichScore := WhichScore + 1;
        END;
      READLN;  
      IF NOT(FatalError) AND NOT(IsNotName)
      THEN
        BEGIN
          TotalScore := TotalScore * 10;
          Ave := TotalScore DIV NumberOfScores;
          {Вывод имени из FileOfName в OUTPUT}
          CopyName(FileOfName, OUTPUT);
          IF Ave MOD 10 >= 5
          THEN
            WRITELN(Ave DIV 10 + 1)
          ELSE
            WRITELN(Ave DIV 10);
          ClassTotal := ClassTotal + TotalScore;
          Student := Student + 1
        END  
    END;
  WRITELN;
  IF NOT(FatalError) AND NOT(IsNotName)
  THEN
    BEGIN
      WRITELN ('Class average:');
      ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
      WRITELN(ClassTotal DIV 10, '.', ClassTotal MOD 10:1)
    END
  ELSE
    WRITELN('Fatal Error')  
END.  {AverageScore}

