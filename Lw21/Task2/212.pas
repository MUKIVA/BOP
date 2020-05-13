PROGRAM Encryption(INPUT, OUTPUT);
{��������� ������� �� INPUT � ��� �������� Chiper 
  � �������� ����� ������� � OUTPUT}
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
{��������� Code ���� ������}
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
          WRITE('ERROR: ������������ ������ � �����')
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
          WRITE('ERROR: ������������ ������ � �����') 
        END;
      READLN(ChiperFile); 
    END;
  CLOSE(ChiperFile)  
END;  {Initialize}

PROCEDURE Encode(VAR S: Str);
{������� ������� �� Code, ��������������� �������� �� S}
VAR
  Index: 1 .. Len;
BEGIN {Encode}
  FOR Index := 1 TO Len
  DO
    IF S[Index] IN ['A' .. 'Z']
    THEN
      WRITE(Code[S[Index]])
    ELSE
      IF S[Index] = ' '
      THEN
          WRITE('%20')
        ELSE
          WRITE(S[Index]);
  WRITELN
END;  {Encode}
 
BEGIN {Encryption}
  {���������������� Code}
  Error := FALSE;
  Initialize(Code);
  WHILE NOT EOLN
  DO
    BEGIN
      {������ ������ � Msg � ����������� ��}
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
      {����������� ������������ ���������}
      Encode(Msg);
      WRITE('����� ������:', StrLength)
    END
END.  {Encryption}

