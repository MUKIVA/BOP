PROGRAM RSort(INPUT, OUTPUT);
VAR
  Ch: CHAR;
PROCEDURE Split(VAR F1, F2, F3: TEXT);
{Разбивает F1 на F2, F3}
VAR
  Ch, Switch: CHAR;
BEGIN {Split}
  REWRITE(F2);
  REWRITE(F3);
  BEGIN {Копировать F1 попеременно в F2 и F3}
    Switch := '2';
    WHILE NOT EOLN(F1)
    DO
      BEGIN
        READ(F1, Ch);
        IF Switch = '2'
        THEN
          BEGIN
            WRITE(F2, Ch);
            WRITE(OUTPUT, '(', Ch, ')');
            Switch := '3'
          END
        ELSE
          BEGIN
            WRITE(F3, ch);
            WRITE(OUTPUT, ch);
            Switch := '2'
          END
      END
  END;
  WRITELN(F2);
  WRITELN(F3)
END; {Split}
PROCEDURE RecursiveSort(VAR F1: TEXT);
VAR
  F2, F3: TEXT;
  Ch: CHAR;
BEGIN {RecursiveSort}
  RESET(F1);
  IF NOT EOLN(F1)
  THEN
    READ(F1, Ch);
  IF NOT EOLN(F1)
  THEN {Фаил имеет как минимум 2 символа}
    BEGIN
      RESET(F1);
      Split(F1, F2, F3);                          
    END
END;   {RecursiveSort}
BEGIN
  RecursiveSort(INPUT);
END.
