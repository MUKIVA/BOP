PROGRAM SortMonth(INPUT, OUTPUT);
USES
  DateIO;
VAR
  Mo1, Mo2: Month;
BEGIN
  ReadMonth(INPUT, Mo1);
  ReadMonth(INPUT, Mo2);
  IF (Mo1 = NoMonth) OR (Mo2 = NoMonth)
  THEN
    WRITELN('Данные некоректны')
  ELSE
    IF Mo1 = Mo2
    THEN
      BEGIN
        WRITELN('Оба месяца ');
        WriteMonth(OUTPUT, Mo2)
      END
    ELSE
      BEGIN
        WriteMonth(OUTPUT, Mo1);
        IF Mo1 < Mo2
        THEN
          WRITE(' Предшествует ')
        ELSE
          WRITE(' Следует ');
        WriteMonth(OUTPUT, Mo2);
        WRITELN(OUTPUT);
      END    
END.
