PROGRAM SarahRevere(INPUT, OUTPUT);
VAR
  W1, W2, W3, W4: CHAR;
  Looking, Land, Sea: BOOLEAN;
BEGIN {SarahRevere}  
  {�������������}
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';
  Land := FALSE;
  Sea := FALSE;
  Looking := TRUE;
  WHILE Looking AND NOT (Land OR Sea)  
  DO
    BEGIN
      {�������� ����}
      W1 := W2;
      W2 := W3;
      W3 := W4;
      READ(W4);
      WRITELN(W1, W2, W3, W4);
      {�������� ���� �� land}
      {�������� ���� �� sea}
      Looking := W4 <> '#'
    END;
  {�������� ��������� Sarah}
END.  {SarahRevere}
