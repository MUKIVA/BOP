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
  Ave, TotalScore, ClassTotal, ScoreValidation: INTEGER;
  FileOfName: TEXT;
  FatalError, IsNotName: BOOLEAN;
PROCEDURE CopyText(VAR InF: TEXT; VAR OutF: TEXT);
{Копирует строку с текущей позиции курсора из InF в OutF до пробела или конца строки}
VAR
  Ch: CHAR;
BEGIN { CopyText }
  REWRITE(OutF);
  WHILE (NOT EOLN(InF)) AND (Ch <>  ' ')
  DO
    BEGIN
      READ(InF, Ch);
      WRITE(OutF, Ch)
    END
END; { CopyText }
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
  WRITELN(NameF, Ch)       
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
      {Êîïèðîâàíèå èç INP â FileOfName èìåíè}
      CopyName(INPUT, FileOfName);
      {Ïðîâåðêà èìåíè íà êîððåêòíîñòü}
      CheckName(FileOfName, IsNotName);
      WHILE (WhichScore <= NumberOfScores) AND NOT(FatalError) AND NOT(IsNotName)
      DO
        BEGIN
          IF NOT EOLN
          THEN
            READ(ScoreValidation)
          ELSE
            FatalError := TRUE;
          IF (ScoreValidation >= 0) AND (ScoreValidation <= 100)
          THEN
            NextScore := ScoreValidation
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
          {Âûâîä èìåíè èç FileOfName â OUTPUT}
          RESET(FileOfName);
          CopyText(FileOfName, OUTPUT);
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

