PROGRAM WithoutLast(INPUT, OUTPUT);
VAR
  Ch: CHAR;
BEGIN
  IF NOT EOLN
  THEN
    READ(Ch);
  WHILE NOT EOLN
  DO
    BEGIN
      WRITE(Ch);
      READ(Ch)  
    END;
  WRITELN  
END.
