PROGRAM Prime(INPUT, OUTPUT);
CONST
  MinNum = 2;
  MaxNum = 100;
VAR
  BunchOfNumber: SET OF MinNum .. MaxNum;
  CurrentNumber, DelNum: INTEGER;  
BEGIN {Prime}
 BunchOfNumber := [MinNum .. MaxNum];
 DelNum := 2;
 CurrentNumber := 2;
 WRITE('Простые числа в диапазоне до 100 будут: ');
 WHILE CurrentNumber <= MaxNum
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
             DelNum := DelNum + 1
           END;
         WRITE(CurrentNumber, ' ')  
       END;
     DelNum := 2;
     CurrentNumber := CurrentNumber + 1 
   END
END. {Prime}
