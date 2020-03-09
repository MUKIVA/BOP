PROGRAM EditCode(INPUT, OUTPUT);
VAR 
  Ch1, Ch2, Ch3, Ch4, Ch5, Ch6: CHAR;
  CheckBegin, CheckEnd, CheckBracket, CheckBAE: CHAR;
BEGIN {EditCode}
  Ch1 := ' ';
  Ch2 := ' ';
  Ch3 := ' ';
  Ch4 := ' ';
  Ch5 := ' ';
  Ch6 := ' ';
  CheckBegin := 'Y';
  CheckEnd := 'Y';
  CheckBracket := 'Y';
  CheckBAE := 'N';
  IF NOT EOLN
  THEN
    WHILE CheckBAE = 'N'
    DO
      BEGIN {Цикл}
        Ch1 := Ch2;
        Ch2 := Ch3;
        Ch3 := Ch4;
        Ch4 := Ch5;
        Ch5 := Ch6;
        READ(Ch6);
        IF (Ch6 = ' ')
        THEN
          WHILE Ch6 = ' '
          DO
            READ(Ch6);
        BEGIN {Копирование}
          IF (Ch1 <> ' ')
          THEN  
            IF Ch1 = ','
            THEN
              WRITE(Ch1, ' ')
            ELSE
              WRITE(Ch1)
          ELSE
            IF (Ch1 = ' ') AND (CheckBracket = 'N')
            THEN
              WRITE(Ch1);  
        END; {Копирование}                 
        BEGIN {Проверка на BEGIN}
          IF (Ch2 = 'B') AND (Ch3 = 'E') AND (Ch4 = 'G') AND (Ch5 = 'I') AND (Ch6 = 'N') AND (CheckBegin = 'Y')
          THEN
            BEGIN
              WHILE (Ch1 <> 'N') AND (CheckBAE = 'N')
              DO
                BEGIN
                  Ch1 := Ch2;
                  Ch2 := Ch3;
                  Ch3 := Ch4;
                  Ch4 := Ch5;
                  Ch5 := Ch6;
                  WRITE(Ch1);
                  READ(Ch6);
                  BEGIN
                    IF Ch6 = ' '
                    THEN
                      WHILE Ch6 = ' '
                      DO
                        READ(Ch6)
                  END;
                  BEGIN {Проверка на ;}
                    IF (Ch2 = ';') AND (Ch3 <> ';') AND (CheckBracket = 'Y') 
                    THEN
                    BEGIN
                      WRITELN;
                      WRITE('  ')
                    END                         
                  END; {Проверка на ;}         
                  BEGIN       
                    IF (Ch3 = 'E') AND (Ch4 = 'N') AND (Ch5 = 'D') AND (Ch6 = '.')
                    THEN
                      CheckBAE := 'Y'  
                  END  
                END;
              IF (CheckBAE = 'N') AND (CheckBracket = 'Y')
              THEN
                BEGIN
                  WRITELN;
                  WRITE('  ');
                  CheckBegin := 'N'   
                END                
            END;                   
          END; {Проверка на BEGIN}
          BEGIN {Проверка ;}
            IF (Ch1 = ';') AND (Ch2 <> ';') AND (CheckBracket = 'Y') AND (Ch2 <> ' ') 
            THEN
              BEGIN
                WRITELN;
                WRITE('  ')
              END                         
          END; {Проверка ;}
          BEGIN {Разрешение на скобки}
            IF (Ch2 = '''') AND (CheckBracket = 'Y')
            THEN
              CheckBracket := 'N'
            ELSE
              IF (Ch2 = '''') AND (CheckBracket = 'N')
              THEN
                CheckBracket := 'Y'          
          END; {Разрешение на скобки}
          BEGIN {Разрешение на END.}
            IF (Ch2 = '(') AND (CheckBracket = 'Y')  
            THEN
              CheckEnd := 'N';
            IF (Ch2 = ')') AND (CheckBracket = 'Y') 
            THEN
              CheckEnd := 'Y'            
          END; {Разрешение на END.}
          BEGIN {Проверка END}
          IF (Ch3 = 'E') AND (Ch4 = 'N') AND (Ch5 = 'D') AND (Ch6 = '.') AND (CheckEnd = 'Y')
          THEN
            BEGIN
              WRITE(Ch2);
              WRITELN;
              WRITE(Ch3, Ch4, Ch5, Ch6);
              CheckBAE := 'Y'
            END
          END {Проверка END}        
      END; {Цикл}
  WRITELN;
  WRITE('  ')   
END. {EditCode}
