PROGRAM BubbleSort(INPUT, OUTPUT);
  { ��������� ������ ������ INPUT � OUTPUT }
VAR
  Sorted, Ch, Ch1, Ch2:CHAR;
  F1, F2:TEXT;
PROCEDURE CopyFile(VAR Fi1, Fi2: TEXT);
VAR
  Ch: CHAR;
BEGIN { �������� INPUT � F1 }
  RESET(Fi1);
  REWRITE(Fi2);
  WHILE NOT EOLN(Fi1)
  DO
    BEGIN
      READ(Fi1, Ch);
      WRITE(Fi2, Ch)
    END;
  WRITELN(Fi2)
END;
PROCEDURE CopySort(VAR Fi1, Fi2: TEXT);
VAR
  Ch1, Ch2: CHAR;
BEGIN
  READ(Fi1, Ch1);
  Sorted := 'Y';
  WHILE NOT EOLN(Fi1)
  DO
    BEGIN
      READ(Fi1, Ch2);
      IF Ch1 <= Ch2
      THEN
        BEGIN
          WRITE(Fi2, Ch1);
          Ch1 := Ch2;
        END
      ELSE
        BEGIN
          WRITE(Fi2, Ch2);
          Sorted := 'N'
        END
    END;
  WRITELN(Fi2, Ch1)
END;
BEGIN { BubbleSort }
  CopyFile(INPUT, F1); { �������� INPUT � F1 }
  Sorted :='N';
  WHILE Sorted ='N'
  DO
    BEGIN
      RESET(F1);
      REWRITE(F2);
      CopySort(F1, F2);{ �������� F1 � F2,�������� ����������������� � ����������� ������ �������� ������� �� �������}
      CopyFile(F2, F1){ �������� F2 � F1 }
    END;
  CopyFile(F1, OUTPUT)  { �������� F1 � OUTPUT }
END.{ BubbleSort }

