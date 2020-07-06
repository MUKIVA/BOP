UNIT WordType;
INTERFACE
CONST
  MaxWordLenght = 52;
TYPE
  WordString = STRING(MaxWordLenght);
  PROCEDURE GetWord(VAR FIn: TEXT; VAR StringOut: WordString); { ��������� ����� � ���� ������ }
IMPLEMENTATION
CONST
  LowerRusChar = ['�' .. '�'];
  UpperRusChar = ['�' .. '�'];
  UpperLatChar = ['A' .. 'Z'];
  LowerLatChar = ['a' .. 'z'];
  ValidCharSet = LowerRusChar + UpperRusChar + UpperLatChar + LowerLatChar + ['�', '�'];

  
  PROCEDURE CaseToLower(VAR Ch: CHAR);
  BEGIN { CaseToLower }
    IF (Ch IN UpperRusChar) OR (Ch IN UpperLatChar)
    THEN
      Ch := CHR(ORD(Ch) + 32);
    IF (Ch = '�') OR (Ch = '�')
    THEN
      Ch := '�' 
  END; { CaseToLower }
  
  PROCEDURE NextWord(VAR FIn: TEXT);
  BEGIN { NextWord }
    WHILE (NOT (EOF(FIn))) AND (NOT (FIn^ IN ValidCharSet))
    DO
      GET(FIn)
  END; { NextWord }

  PROCEDURE GetWord(VAR FIn: TEXT; VAR StringOut: WordString);
  BEGIN
    NextWord(FIn);
    StringOut := '';
    WHILE (NOT (EOF(FIn))) AND (FIn^ IN ValidCharSet)
    DO
      BEGIN
        {������� ������� � ������ ������� � ����� � �� �}
        CaseToLower(FIn^);
        {���������� ������� � ������}
        StringOut := StringOut + FIn^;
        {������� � ���������� �������}
        GET(FIn)      
      END     
  END;
  
BEGIN { WordType }
  { ������������� }
   
END. { WordType }
