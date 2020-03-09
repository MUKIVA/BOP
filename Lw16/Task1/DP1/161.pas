PROGRAM SortMonth(INPUT, OUTPUT);
USES
  DateIO;
VAR
  Mo1, Mo2: Month;
BEGIN
  ReadMonth(INPUT, Mo1);
  WriteMonth(OUTPUT, Mo1);
END.
