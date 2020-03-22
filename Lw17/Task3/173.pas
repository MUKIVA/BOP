PROGRAM Stat(INPUT, OUTPUT);
VAR
  Min, Max, Count, Sum, Num: INTEGER;
PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
VAR
  Ch: CHAR;
{Считывает текущий символ из файла, если он - цифра, возвращает его преобразуя в значение типа INTEGER. Если считанный символ не цифра возвращает -1}
BEGIN {ReadDigit}
  D := -1;
  IF NOT EOLN(F)
  THEN
    BEGIN
      READ(Ch);
      IF Ch = '0' THEN D := 0 ELSE
      IF Ch = '1' THEN D := 1 ELSE
      IF Ch = '2' THEN D := 2 ELSE
      IF Ch = '3' THEN D := 3 ELSE
      IF Ch = '4' THEN D := 4 ELSE
      IF Ch = '5' THEN D := 5 ELSE
      IF Ch = '6' THEN D := 6 ELSE
      IF Ch = '7' THEN D := 7 ELSE
      IF Ch = '8' THEN D := 8 ELSE
      IF Ch = '9' THEN D := 9 
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
  Min := MAXINT DIV 10;
  Max := 0;
  Count := 0;
  Sum := 0;
  Num := 0; 
  WHILE NOT EOLN(INPUT) AND ((Sum + Num <= MAXINT DIV 10) AND (Count + 1 <= MAXINT DIV 10)) AND (Num <> -1)
  DO
    BEGIN
      ReadNumber(INPUT, Num);
      Sum := Sum + Num;
      Count := Count + 1;  
      IF Min > Num
      THEN
        Min := Num;
      IF Max < Num
      THEN
        Max := Num;
    END;
  IF (Sum > MAXINT DIV 10) AND (Count > MAXINT DIV 10) OR (Count = 0) OR (Sum = 0)
  THEN
    WRITELN('Переполнение или в строке нет ни одной цифры')
  ELSE
    BEGIN
      WRITELN('Максимальное число: ', Max);
      WRITELN('Минимальное число: ', Min);
      Sum := (Sum * 100) DIV Count;
      WRITE('Среднее арифметическое: ', Sum DIV 100, '.', Sum MOD 100)     
    END    
END. {TestReadNumber}
