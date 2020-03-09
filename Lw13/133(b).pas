PROGRAM Split(INPUT,OUTPUT);
  {Копирует INPUT в OUTPUT,сначала нечетные,а затем четные элементы}
VAR
  Ch,Next: CHAR;
  Odds,Evens: TEXT;
{PROCEDURE CopyOut(VAR F1: TEXT; VAR Ch: CHAR);}
PROCEDURE CopyOut(VAR F1: TEXT; VAR Ch: CHAR);
BEGIN {CopyOut}
  RESET(F1);
  WHILE NOT EOLN(F1)
  DO
    BEGIN
      READ(F1, Ch);
      WRITE(OUTPUT, Ch)
    END;
  WRITELN(OUTPUT)
END; {CopyOut}

BEGIN
  {Разделяет INPUT в Odds и Evens}
   BEGIN
    ASSIGN(Odds,'Odds.dat');
    ASSIGN(Evens,'Evens.dat');
    REWRITE(Odds);
    REWRITE(Evens);
    Next := 'O';
    WHILE NOT EOLN(INPUT)
    DO
      BEGIN
        WHILE NOT EOLN(INPUT)
        DO
          BEGIN
            {Прочитать Ch, записать в файл, выбранный через Next, переключить Next}
            READ(INPUT, Ch);
            WRITE(OUTPUT, Next);
            IF NEXT = 'O'
            THEN
              BEGIN
                WRITE(Odds, Ch);
                Next := 'E'
              END
            ELSE
              BEGIN
                WRITE(Evens, Ch);
                Next := 'O'
              END
          END;
     //   READLN(INPUT);
        WRITELN(Odds);
        WRITELN(Evens)
      END;
    WRITELN(Odds);
    WRITELN(Evens)
  END;
 // CopyOut(Odds,Ch);
 // CopyOut(Evens,Ch);
  WRITELN
END.
