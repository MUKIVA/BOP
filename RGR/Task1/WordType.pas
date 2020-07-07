UNIT WordType;
INTERFACE
CONST
  MaxWordLenght = 52;
TYPE
  WordString = STRING(MaxWordLenght);
  PROCEDURE GetWord(VAR FIn: TEXT; VAR StringOut: WordString); { Получение слова в виде строки }
IMPLEMENTATION
USES
  ConstUnit;

  
  PROCEDURE CaseToLower(VAR Ch: CHAR);
  BEGIN { CaseToLower }
    IF (Ch IN UpperRusChar) OR (Ch IN UpperLatChar)
    THEN
      Ch := CHR(ORD(Ch) + 32);
    IF (Ch = 'Ё') OR (Ch = 'ё')
    THEN
      Ch := 'е' 
  END; { CaseToLower }
  
  PROCEDURE NextWord(VAR FIn: TEXT; VAR Ch: CHAR);
  { Перемещает курсор на начало нового слова и считывает первый символ слова в Ch }
  BEGIN { NextWord }
    WHILE (NOT (EOF(FIn))) AND (NOT (Ch IN ValidCharSet))
    DO
      READ(FIn, Ch)
  END; { NextWord }

  PROCEDURE GetWord(VAR FIn: TEXT; VAR StringOut: WordString);
  { Копирует слово в строку до первого не входящего в ValidCharSet символа }
  VAR
    Ch: CHAR;
  BEGIN
    NextWord(FIn, Ch);
    StringOut := '';
    WHILE (NOT (EOF(FIn))) AND (Ch IN ValidCharSet)
    DO
      BEGIN
        {Перевод символа в нижний регистр и смена ё на е}
        CaseToLower(Ch);
        {Сохранение символа в строке}
        StringOut := StringOut + Ch;
        {Переход к следующему символу}
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
  { Инициализация }
   
END. { WordType }
