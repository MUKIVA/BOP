PROGRAM BubbleSort(INPUT, OUTPUT);
  { Сортируем первую строку INPUT в OUTPUT }
VAR
  Sorted, Ch, Ch1, Ch2: CHAR;
  F1, F2: TEXT;
PROCEDURE CopyFile(VAR F1, F2: TEXT);
  { Копирует F1 в F2 }
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
  CopyFile(INPUT, F1); { Копируем INPUT в F1 }
  Sorted :='Y';
  WHILE Sorted ='N'
  DO
    BEGIN      
      { Копируем F1 в F2,проверяя отсортированность и переставляя первые соседние символы по порядку}
      { Копируем F2 в F1 }
    END;
  { Копируем F1 в OUTPUT }
END.{ BubbleSort }
