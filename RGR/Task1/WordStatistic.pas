UNIT WordStatistic;
INTERFACE
USES
  WordType, TreeUtils;
  PROCEDURE GetStatistic; { �������� ���������� �� ����� 'in.txt' � ���������� ��������� � ���� 'out.txt' }
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
    WRITELN(FOut, '����� ���� ', AllScore);
    WriteTreeContent(Root, FOut);
    CleanTree(Root) 
  END; { GetStatistic }

BEGIN {WordStatistic}
  {�������������}
  Root := NIL;
  ASSIGN(FIn, 'in.txt');
  ASSIGN(FOut, 'out.txt');
  RESET(FIn);
  REWRITE(FOut)
END. {WordStatistic}
