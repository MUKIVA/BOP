PROGRAM Prime(INPUT, OUTPUT);
CONST
  MinNum = 2;
  MaxNum = 100;
TYPE
  Bunch = SET OF MinNum .. MaxNum;
VAR
  BunchOfNumber: Bunch;
  CurrentNumber, DelNum: INTEGER;
PROCEDURE WriteBunch(VAR Bun: Bunch);
VAR
  CurrNum: INTEGER;
BEGIN {WriteBunch}
  CurrNum := 2;
  WHILE CurrNum <= MaxNum
  DO
    BEGIN
      IF CurrNum IN Bun
      THEN
        WRITE(CurrNum, ' ');
      CurrNum := CurrNum + 1
    END
END; {WriteBunch}  
BEGIN {Prime}
 BunchOfNumber := [MinNum .. MaxNum];
 DelNum := MinNum;
 CurrentNumber := MinNum;
 WRITE('Простые числа в диапазоне до 100 будут: ');
 WHILE CurrentNumber * CurrentNumber <= maxNum
 DO
   BEGIN 
     IF CurrentNumber IN BunchOfNumber
     THEN
       BEGIN
         WHILE DelNum <= MaxNum
         DO
           BEGIN
             IF DelNum MOD CurrentNumber = 0 
             THEN
               BunchOfNumber := BunchOfNumber - [DelNum];
             DelNum := DelNum + CurrentNumber
           END;
         WRITE(CurrentNumber, ' ')  
       END;
     CurrentNumber := CurrentNumber + 1;
     DelNum := CurrentNumber; 
   END;
   WriteBunch(BunchOfNumber)
END. {Prime}
