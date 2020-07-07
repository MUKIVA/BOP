UNIT WordType;
INTERFACE
CONST
  MaxWordLenght = 52;
TYPE
  WordString = STRING(MaxWordLenght);
  PROCEDURE GetWord(VAR FIn: TEXT; VAR StringOut: WordString); { ��������� ����� � ���� ������ }
IMPLEMENTATION
USES
  ConstUnit;

  
  PROCEDURE CaseToLower(VAR Ch: CHAR);
  BEGIN { CaseToLower }
    IF (Ch IN UpperRusChar) OR (Ch IN UpperLatChar)
    THEN
      Ch := CHR(ORD(Ch) + 32);
    IF (Ch = '�') OR (Ch = '�')
    THEN
      Ch := '�' 
  END; { CaseToLower }
  
  PROCEDURE NextWord(VAR FIn: TEXT; VAR Ch: CHAR);
  { ���������� ������ �� ������ ������ ����� � ��������� ������ ������ ����� � Ch }
  BEGIN { NextWord }
    WHILE (NOT (EOF(FIn))) AND (NOT (Ch IN ValidCharSet))
    DO
      READ(FIn, Ch)
  END; { NextWord }

  PROCEDURE GetWord(VAR FIn: TEXT; VAR StringOut: WordString);
  { �������� ����� � ������ �� ������� �� ��������� � ValidCharSet ������� }
  VAR
    Ch: CHAR;
  BEGIN
    NextWord(FIn, Ch);
    StringOut := '';
    WHILE (NOT (EOF(FIn))) AND (Ch IN ValidCharSet)
    DO
      BEGIN
        {������� ������� � ������ ������� � ����� � �� �}
        CaseToLower(Ch);
        {���������� ������� � ������}
        StringOut := StringOut + Ch;
        {������� � ���������� �������}
        READ(FIn, Ch)      
      END;
    IF Ch IN ValidCharSet
    THEN
      BEGIN
        CaseToLower(Ch);
        StringOut := StringOut + Ch  
      END 
  END;
  
BEGIN { WordType }
  { ������������� }
   
END. { WordType }
