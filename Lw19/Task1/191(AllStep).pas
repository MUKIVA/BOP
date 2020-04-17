PROGRAM Prime(INPUT, OUTPUT);
CONST
  MinNum = 2;
  MaxNum = 100;
TYPE
  Bunch = SET OF MinNum .. MaxNum;  
VAR
  BunchOfNumber, BunchOfDelNumber, PrimeBunch: Bunch;
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
PROCEDURE WriteStep(VAR Sieve: Bunch; VAR SievOfDel: Bunch; VAR Multiple: INTEGER);
BEGIN {WriteStep}
  WRITE('{ ');
  WriteBunch(Sieve);
  WRITE(' } { ');
  WriteBunch(SievOfDel);
  WRITE(' } ');
  WRITELN(Multiple)  
END; {WriteStep} 
BEGIN {Prime}
 BunchOfNumber := [MinNum .. MaxNum];
 BunchOfDelNumber := [];
 PrimeBunch := [];
 DelNum := 2;
 CurrentNumber := 2;
 WRITELN('Решето/Удаляем/Кратное');
 WHILE BunchOfNumber <> []
 DO
   BEGIN 
     IF CurrentNumber IN BunchOfNumber
     THEN
       BEGIN
         PrimeBunch := PrimeBunch + [CurrentNumber];
         WHILE DelNum <= MaxNum
         DO
           BEGIN
             IF DelNum MOD CurrentNumber = 0 
             THEN
               BunchOfDelNumber := BunchOfDelNumber + [DelNum];                
             DelNum := DelNum + CurrentNumber
           END;
          WriteStep(BunchOfNumber, BunchOfDelNumber, CurrentNumber)
       END;
     BunchOfNumber := BunchOfNumber - BunchOfDelNumber;    
     CurrentNumber := CurrentNumber + 1;
     DelNum := CurrentNumber
   END;
 WRITE('Простые числа в диапазоне до 100 будут: ');
 WriteBunch(PrimeBunch)
END. {Prime}
