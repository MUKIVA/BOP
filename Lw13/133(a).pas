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
  CopyOut(INPUT,Ch);
  WRITELN
END.
