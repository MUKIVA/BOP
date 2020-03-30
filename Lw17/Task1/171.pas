PROGRAM TestReadDigit(INPUT, OUTPUT);
VAR
  Sum, Digit: INTEGER;
PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
VAR
  Ch: CHAR;
{—читывает текущий символ из файла, если он - цифра, возвращает его преобразу€ в значение типа INTEGER. ≈сли считанный символ не цифра возвращает -1}
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
      IF Ch = '9' THEN D := 3 
    END
END; {ReadDigit}
BEGIN {TestReadDigit}
  Sum := 0;
  Digit := 0;
  WHILE (NOT EOLN(INPUT)) AND (Digit <> -1)   
  DO
    BEGIN 
      ReadDigit(INPUT, Digit);
      IF Digit <> -1
      THEN 
        Sum := Sum + Digit 
    END;
  WRITELN(Sum)
END. {TestReadDigit}
