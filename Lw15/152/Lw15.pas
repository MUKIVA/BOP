PROGRAM Rev(INPUT, OUTPUT);
USES 
  Count3;
VAR
  Ch1, Ch2, Ch3: CHAR;
BEGIN
  Start;
  Ch1 := ' ';
  Ch2 := ' ';
  Ch3 := ' ';
  WHILE NOT EOLN
  DO
    BEGIN
      Ch1 := Ch2;
      Ch2 := Ch3;
      READ(Ch3);
      IF ((Ch2 > Ch1) AND (Ch2 > Ch3)) OR ((Ch2 < Ch1) AND (Ch2 < Ch3))
      THEN
        Bump  
    END;
  Value(Ch1, Ch2, Ch3);
  WRITELN('���������� ��������:', Ch1, Ch2, Ch3)
END.

         
