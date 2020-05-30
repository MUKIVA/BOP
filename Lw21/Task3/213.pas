PROGRAM Decryption(INPUT, OUTPUT);
{Переводит символы из INPUT в код согласно Chiper 
  и печатает новые символы в OUTPUT}
CONST
  Len = 20;
TYPE
  Str = ARRAY [1 .. Len] OF 'A' .. 'Z';
  Chiper = ARRAY ['A' .. 'Z'] OF CHAR;
  StrLen = 0 .. Len;
VAR
  Msg: Str;
  Code: Chiper;
  I: StrLen;
  Error: BOOLEAN;
  UsedChar: SET OF CHAR;
 
PROCEDURE Initialize(VAR Code: Chiper);
VAR
  ChiperFile: TEXT;
  Ch1, Ch2, Ch3: CHAR;
{Присвоить Code шифр замены}
BEGIN {Initialize}
  ASSIGN(ChiperFile, 'Chiper.txt');
  RESET(ChiperFile);
  UsedChar := [];
  WHILE NOT EOF(ChiperFile)
  DO
    BEGIN
      IF NOT EOLN(ChiperFile)
      THEN
        READ(ChiperFile, Ch1, Ch2, Ch3)
      ELSE
        BEGIN
          Error := TRUE;
          WRITE('ERROR: Некорректные данные в файле')
        END;
      IF ((Ch1 IN ['A' .. 'Z']) AND (Ch2 = '=') AND (NOT(Ch3 IN UsedChar)))
      THEN
        BEGIN
          UsedChar := UsedChar + [Ch3];
          Code[Ch1] := Ch3
        END 
      ELSE
        BEGIN
          Error := TRUE;
          WRITE('ERROR: Некорректные данные в файле') 
        END;
      READLN(ChiperFile); 
    END;
  CLOSE(ChiperFile)  
END;  {Initialize}

PROCEDURE Decode(VAR S: Str; Lenght: StrLen);
{Выводит символы из Code, соответствующие символам из S}
VAR
  Index: 1 .. Len;
  FindChar: 'A' .. 'Z';
BEGIN {Decode}
  FOR Index := 1 TO Lenght
  DO
    IF S[Index] IN UsedChar
    THEN
      FOR FindChar := 'A' TO 'Z'
      DO
        BEGIN
          IF Code[FindChar] = S[Index]
          THEN
            WRITE(FindChar)
        END
    ELSE
      IF S[Index] = '%'
      THEN
        WRITE(' ')
      ELSE   
        WRITE(S[Index]);
  WRITELN
END;  {Decode}
 
BEGIN {Decryption}
  {Инициализировать Code}
  UsedChar := [];
  Error := FALSE;
  Initialize(Code);
  WHILE NOT EOLN
  DO
    BEGIN
      {читать строку в Msg и распечатать ее}
      I := 0;
      WHILE NOT EOLN AND (I < Len) AND NOT(Error)
      DO
        BEGIN
          I := I + 1;
          READ(Msg[I]);
          WRITE(Msg[I]);
        END;
      READLN;
      WRITELN;
      {распечатать кодированное сообщение}
      Decode(Msg, I);
      WRITELN('Длина строки:', I)
    END
END.  {Decryption}

