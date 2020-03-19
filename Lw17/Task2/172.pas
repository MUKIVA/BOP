PROGRAM TestReadNumber(INPUT, OUTPUT);
VAR
  Num: INTEGER;
PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
VAR
  Ch: CHAR;
{Считывает текущий символ из файла, если он - цифра, возвращает его преобразуя в значение типа INTEGER. Если считанный символ не цифра возвращает -1}
BEGIN {ReadDigit}
  D := -1;
  IF NOT EOLN(F)
  THEN
    READ(Ch);
  IF ((Ch >= '0') AND (Ch <= '9'))
  THEN
    BEGIN 
      IF Ch = '0' THEN D := 0 ELSE
      IF Ch = '1' THEN D := 1 ELSE
      IF Ch = '2' THEN D := 2 ELSE
      IF Ch = '3' THEN D := 3 ELSE
      IF Ch = '4' THEN D := 4 ELSE
      IF Ch = '5' THEN D := 5 ELSE
      IF Ch = '6' THEN D := 6 ELSE
      IF Ch = '7' THEN D := 7 ELSE
      IF Ch = '8' THEN D := 8 ELSE
      IF Ch = '9' THEN D := 3 
    END
END; {ReadDigit}
PROCEDURE ReadNumber(VAR F: TEXT; VAR N: INTEGER);
VAR
  I: INTEGER;
{Преобразует строку цифр из файла до первого нецифрового символа,  в соответствующее целое число N}
BEGIN {ReadNumber}
  N := 0;
  I := 0;
  WHILE (NOT EOLN(F)) AND (I <> -1) AND (N <> -1)
  DO
    BEGIN
      ReadDigit(F, I);
      IF ((N * 10 + I) <= (MAXINT DIV 10))
      THEN
        BEGIN
          IF I <> -1
          THEN
            N := N * 10 + I
        END
      ELSE
        N := -1
    END
END; {ReadNumber}
BEGIN {TestReadNumber}
  Num := 0;
  ReadNumber(INPUT, Num);
  WRITELN(Num);
END. {TestReadNumber}
