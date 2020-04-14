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
  FatalError: BOOLEAN;
PROCEDURE WriteName(VAR InF:TEXT);
VAR
  Ch: CHAR;
  IsNotName: BOOLEAN;
  FileOfName: TEXT;
BEGIN {WriteName}
  IsNotName := FALSE;
  REWRITE(FileOFName);
  IF (NOT EOLN(InF))
  THEN
    READ(InF, Ch);    
  WHILE (NOT EOLN(InF)) AND (Ch = ' ')
  DO
    READ(InF, Ch);
  WHILE (NOT EOLN(InF)) AND (Ch <> ' ') AND NOT(IsNotName)
  DO
    BEGIN
      WRITE(FileOfName, Ch);
      READ(InF, Ch);
      IsNotName := (Ch >= '0') AND (Ch <= '9')
    END;
  WRITELN(FileOfName);
  RESET(FileOfName);
  IF NOT(IsNotName)
  THEN
    BEGIN
      WHILE NOT EOLN(FileOfName)
      DO
        BEGIN
          READ(FileOfName, Ch);
          WRITE(OUTPUT, Ch)
        END;
      WRITE(' ')  
    END
  ELSE
    WRITE('Некорректное имя ')
END; {WriteName}
BEGIN {AverageScore}
  ClassTotal := 0;
  WRITELN('Student averages:');
  Student := 1;
  FatalError := FALSE;
  WHILE (Student <= ClassSize) AND NOT(FatalError)
  DO 
    BEGIN
      TotalScore := 0;
      WhichScore := 1;
      WriteName(INPUT);
      WHILE (WhichScore <= NumberOfScores) AND NOT(FatalError)
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
      IF NOT(FatalError)
      THEN
        BEGIN
          TotalScore := TotalScore * 10;
          Ave := TotalScore DIV NumberOfScores;
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
  IF NOT(FatalError)
  THEN
    BEGIN
      WRITELN ('Class average:');
      ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
      WRITELN(ClassTotal DIV 10, '.', ClassTotal MOD 10:1)
    END
  ELSE
    WRITELN('Fatal Error')  
END.  {AverageScore}

