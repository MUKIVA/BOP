UNIT WordStatistic;
INTERFACE
USES
  WordType, TreeUtils;
  PROCEDURE GetStatistic; { Соберает статистику из файла 'in.txt' и записывает результат в файл 'out.txt' }
IMPLEMENTATION
VAR
  FIn, FOut: TEXT;
  Root: Tree;
  AllScore: INTEGER;
  
  PROCEDURE GetStatistic;
  VAR
    Word: WordString;
  BEGIN { GetStatistic }
    WHILE NOT EOF(FIn)
    DO
      BEGIN
        GetWord(FIn, Word);
        IF Word <> ''
        THEN
          PushContent(Word, Root)      
      END;
    GetAllScore(AllScore, Root);
    WRITELN(FOut, 'Всего слов ', AllScore);
    WriteTreeContent(Root, FOut);
    CleanTree(Root) 
  END; { GetStatistic }

BEGIN {WordStatistic}
  {Инициализация}
  Root := NIL;
  ASSIGN(FIn, 'in.txt');
  ASSIGN(FOut, 'out.txt');
  RESET(FIn);
  REWRITE(FOut)
END. {WordStatistic}
