PROGRAM Encryption(INPUT, OUTPUT);
{Переводит символы из INPUT в код согласно Chiper 
  и печатает новые символы в OUTPUT}
CONST
  Len = 20;
TYPE
  Str = ARRAY [1 .. Len] OF 'A' .. 'Z';
  Chiper = ARRAY ['A' .. 'Z'] OF CHAR;
VAR
  Msg: Str;
  Code: Chiper;
  I: 0 .. Len;
  StrLength: 1 .. Len;
  Error: BOOLEAN;
 
PROCEDURE Initialize(VAR Code: Chiper);
VAR
  ChiperFile: TEXT;
  Ch1, Ch2, Ch3: CHAR;
  UsedChar: SET OF CHAR;
{Присвоить Code шифр замены}
BEGIN {Initialize}
  ASSIGN(ChiperFile, 'Chiper.txt');
  RESET(ChiperFile);
  FOR Ch1 := 'A' TO 'Z'
  DO
    Code[Ch1] := ' ';
  UsedChar := [];
  WHILE NOT EOF(ChiperFile)
  DO
    BEGIN
      IF NOT EOLN(ChiperFile)
      THEN
        READ(ChiperFile, Ch1);
      IF NOT EOLN(ChiperFile)
      THEN
        READ(ChiperFile, Ch2);
      IF NOT EOLN(ChiperFile)
      THEN
        READ(ChiperFile, Ch3)
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

PROCEDURE Encode(VAR S: Str);
{Выводит символы из Code, соответствующие символам из S}
VAR
  Index: 1 .. Len;
BEGIN {Encode}
  FOR Index := 1 TO StrLength
  DO
    IF S[Index] IN ['A' .. 'Z']
    THEN
      IF (Code[S[Index]] = ' ')
      THEN
        WRITE(S[Index])
      ELSE
        WRITE(Code[S[Index]])
    ELSE
      IF S[Index] = ' '
      THEN
          WRITE('%')
        ELSE
          WRITE(S[Index]);
  WRITELN
END;  {Encode}
 
BEGIN {Encryption}
  {Инициализировать Code}
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
          StrLength := I
        END;
      READLN;
      WRITELN;
      {распечатать кодированное сообщение}
      Encode(Msg);
      WRITELN('Длина строки:', StrLength)
    END
END.  {Encryption}

