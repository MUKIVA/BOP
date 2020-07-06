UNIT TreeUtils;
INTERFACE
USES
  WordType;
TYPE
  Tree = ^NodeType;
  NodeType = RECORD
               Word: WordString;
               Score: INTEGER;
               LLink, RLink: Tree;
             END;
  PROCEDURE WriteTreeContent(VAR Ptr: Tree; VAR FOut: TEXT); { Печатает в алфавитном порядке содержимое дерева в файл FOut  }
  PROCEDURE CleanTree(VAR Ptr: Tree); { Отчищает заполненные ячейки дерева }
  PROCEDURE PushContent(Data: WordString; VAR Ptr: Tree); { Записывает слово в дерево }
  PROCEDURE GetAllScore(VAR ScoreNumber: INTEGER; VAR Ptr: Tree); { Получение всех вхождений в дерево }
IMPLEMENTATION
  
  PROCEDURE GetAllScore(VAR ScoreNumber: INTEGER; VAR Ptr: Tree);
  { Собирает информацию о количестве слов со всех узлов }
  VAR 
    TempScore: INTEGER;
  BEGIN { GetAllScore }
    ScoreNumber := 0;
    TempScore := 0;
    IF Ptr <> NIL
    THEN
      BEGIN
        ScoreNumber := Ptr^.Score;
        GetAllScore(TempScore, Ptr^.LLink);
        ScoreNumber := ScoreNumber + TempScore;
        GetAllScore(TempScore, Ptr^.RLink);
        ScoreNumber := ScoreNumber + TempScore      
      END     
  END; { GetAllScore }
   
  PROCEDURE WriteTreeContent(VAR Ptr: Tree; VAR FOut: TEXT);
  { Выводит информацию из Ptr в FOut}
  BEGIN { WriteTreeContent }
    IF Ptr <> NIL
    THEN
      BEGIN
        WriteTreeContent(Ptr^.LLink, FOut);
        WRITELN(FOut, Ptr^.Word, ' ', Ptr^.Score);
       // WRITELN(OUTPUT, Ptr^.Word, ' ', Ptr^.Score);        
        WriteTreeContent(Ptr^.RLink, FOut)
      END
  END; { WriteTreeContent }
  
  PROCEDURE CleanTree(VAR Ptr: Tree);
  { Отчищает все узлы Ptr }
  BEGIN { CleanTree }
    IF Ptr <> NIL
    THEN
      BEGIN
        CleanTree(Ptr^.LLink);
        CleanTree(Ptr^.RLink)        
      END;
    DISPOSE(Ptr);
    Ptr := NIL
  END; { CleanTree }
   
  PROCEDURE PushContent(Data: WordString; VAR Ptr: Tree);
  { Заполняет узел строкой Data }
  BEGIN { PushContent }
    IF Ptr = NIL
    THEN
      BEGIN
        NEW(Ptr);
        Ptr^.Word := Data;
        Ptr^.Score := 1;
        Ptr^.LLink := NIL;
        Ptr^.RLink := NIl;
      END
    ELSE
      BEGIN
        IF Data = Ptr^.Word
        THEN
          Ptr^.Score := Ptr^.Score + 1
        ELSE
          IF Data < Ptr^.Word 
          THEN
            PushContent(Data, Ptr^.LLink)
          ELSE
            PushContent(Data, Ptr^.RLink) 
      END 
  END; { PushContent }
    
BEGIN { TreeUtils }
END. { TreeUtils }
