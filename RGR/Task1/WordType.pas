UNIT WordType;
INTERFACE
CONST
  MaxWordLenght = 52;
TYPE
  WordString = STRING(MaxWordLenght);
  PROCEDURE GetWord(VAR FIn: TEXT; VAR StringOut: WordString); { Получение слова в виде строки }
IMPLEMENTATION
CONST
  LowerRusChar = ['а' .. 'я'];
  UpperRusChar = ['А' .. 'Я'];
  UpperLatChar = ['A' .. 'Z'];
  LowerLatChar = ['a' .. 'z'];
  ValidCharSet = LowerRusChar + UpperRusChar + UpperLatChar + LowerLatChar + ['Ё', 'ё'];

  
  PROCEDURE CaseToLower(VAR Ch: CHAR);
  BEGIN { CaseToLower }
    IF (Ch IN UpperRusChar) OR (Ch IN UpperLatChar)
    THEN
      Ch := CHR(ORD(Ch) + 32);
    IF (Ch = 'Ё') OR (Ch = 'ё')
    THEN
      Ch := 'е' 
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
        {Перевод символа в нижний регистр и смена ё на е}
        CaseToLower(FIn^);
        {Сохранение символа в строке}
        StringOut := StringOut + FIn^;
        {Переход к следующему символу}
        GET(FIn)      
      END     
  END;
  
BEGIN { WordType }
  { Инициализация }
   
END. { WordType }
