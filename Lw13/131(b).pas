PROGRAM BubbleSort(INPUT, OUTPUT);
  { ��������� ������ ������ INPUT � OUTPUT }
VAR
  Sorted, Ch, Ch1, Ch2:CHAR;
  F1, F2:TEXT;
PROCEDURE CopyFile(VAR F1, F2: TEXT);
  { �������� F1 � F2 }
VAR
  Ch: CHAR;
BEGIN {CopyFile}
  RESET(F1);
  REWRITE(F2);
  WHILE NOT EOLN(F1)
  DO
    BEGIN
      READ(F1, Ch);
      WRITE(F2, Ch)
    END;
  WRITELN(F2)
END; {CopyFile}
PROCEDURE CopySort(VAR F1, F2: TEXT);
  { �������� � ����������� �� F1 � F2}
VAR
  Ch1, Ch2: CHAR;
BEGIN  {CopySort}
  READ(F1, Ch1);
  Sorted := 'Y';
  WHILE NOT EOLN(F1)
  DO
    BEGIN
      READ(F1, Ch2);
      IF Ch1 <= Ch2
      THEN
        BEGIN
          WRITE(F2, Ch1);
          WRITE(OUTPUT, Ch1);
          Ch1 := Ch2;
        END
      ELSE
        BEGIN
          WRITE(F2, Ch2);
          WRITE(OUTPUT, Ch2);
          Sorted := 'Y'
        END
    END;
  WRITELN(F2, Ch1);
  WRITELN(OUTPUT, Ch1)
END; {CopySort}
BEGIN { BubbleSort }
  CopyFile(INPUT, F1); { �������� INPUT � F1 }
  Sorted :='N';
  WHILE Sorted ='N'
  DO
    BEGIN
      RESET(F1);
      REWRITE(F2);
      CopySort(F1, F2){ �������� F1 � F2,�������� ����������������� � ����������� ������ �������� ������� �� �������}
      { �������� F2 � F1 }
    END
  { �������� F1 � OUTPUT }
END.{ BubbleSort }
