PROGRAM BubbleSort(INPUT, OUTPUT);
  { ��������� ������ ������ INPUT � OUTPUT }
VAR
  Sorted, Ch, Ch1, Ch2: CHAR;
  F1, F2: TEXT;
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
      WRITE(F2, Ch);
      WRITE(OUTPUT, Ch)
    END;
  WRITELN(F2)
END; {CopyFile}
BEGIN { BubbleSort }
  CopyFile(INPUT, F1); { �������� INPUT � F1 }
  Sorted :='Y';
  WHILE Sorted ='N'
  DO
    BEGIN      
      { �������� F1 � F2,�������� ����������������� � ����������� ������ �������� ������� �� �������}
      { �������� F2 � F1 }
    END;
  { �������� F1 � OUTPUT }
END.{ BubbleSort }
