PROGRAM Split(INPUT,OUTPUT);
  {�������� INPUT � OUTPUT,������� ��������,� ����� ������ ��������}
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
  {��������� INPUT � Odds � Evens}
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
            {��������� Ch, �������� � ����, ��������� ����� Next, ����������� Next}
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
