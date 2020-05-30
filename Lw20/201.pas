PROGRAM PseudoGraphic(INPUT, OUTPUT);
CONST
  MatrixSize = 5;
  MinCoordinate = 1;
  MaxCoordinate = MatrixSize * MatrixSize;
TYPE
  MatrixCoord = SET OF MinCoordinate .. MaxCoordinate;
VAR
 Ch: CHAR;
PROCEDURE WriteMatrix(Ch: CHAR);
VAR
  CoordinateSet : MatrixCoord;
  Pos: INTEGER;
  Error: BOOLEAN;
BEGIN {WriteMatrix}
  Error := FALSE;
  CASE Ch OF 
    'A': CoordinateSet := [1, 6, 7, 11, 13, 16, 17, 18, 19, 21, 25];
    'B': CoordinateSet := [1, 2, 3, 4, 6, 10, 11, 12, 13, 14, 16, 20, 21, 22, 23, 24];
    'C': CoordinateSet := [2, 3, 4, 5, 6, 11, 16, 22, 23, 24, 25];
    'D': CoordinateSet := [1, 2, 3, 4, 6, 10, 11, 15, 16, 20, 21, 22, 23, 24];
    'E': CoordinateSet := [1, 2, 3, 4, 5, 6, 11, 12, 13, 14, 15, 16, 21, 22, 23, 24, 25];
    'F': CoordinateSet := [1, 2, 3, 4, 5, 6, 11, 12, 13, 16, 21];
    'G': CoordinateSet := [2, 3, 4, 6, 11, 13, 14, 15, 16, 20, 22, 23, 24];
    'H': CoordinateSet := [1, 5, 6, 10, 11, 12, 13, 14, 15, 16, 20, 21, 25];
    'I': CoordinateSet := [2, 3, 4, 8, 13, 18, 22, 23, 24];
    'J': CoordinateSet := [1, 2, 3, 4, 5, 8, 13, 16, 18, 22];
    'K': CoordinateSet := [1, 4, 6, 8, 11, 12, 16, 18, 21, 24];
    'L': CoordinateSet := [1, 6, 11, 16, 21, 22, 23, 24, 25];
    'M': CoordinateSet := [1, 5, 6, 7, 9, 10, 11, 13, 15, 16, 20, 21, 25];
    'N': CoordinateSet := [1, 5, 6, 7, 10, 11, 13, 15, 16, 19, 20, 21, 25];
    'O': CoordinateSet := [2, 3, 4, 6, 10, 11, 15, 16, 20, 22, 23, 24];
    'P': CoordinateSet := [1, 2, 3, 6, 9, 11, 12, 13, 16, 21];
    'Q': CoordinateSet := [2, 3, 4, 6, 10, 11, 15, 16, 19, 22, 23, 25];
    'R': CoordinateSet := [1, 2, 6, 8, 11, 12, 16, 18, 21, 24];
    'S': CoordinateSet := [2, 3, 4, 5, 6, 12, 13, 14, 20, 21, 22, 23, 24];
    'T': CoordinateSet := [1, 2, 3, 4, 5, 8, 13, 18, 23];
    'U': CoordinateSet := [1, 5, 6, 10, 11, 15, 16, 20, 22, 23, 24];
    'V': CoordinateSet := [1, 5, 7, 9, 12, 14, 18];
    'W': CoordinateSet := [1, 5, 6, 10, 11, 13, 15, 16, 18, 20, 22, 24];
    'X': CoordinateSet := [1, 5, 7, 9, 13, 17, 19, 21, 25];
    'Y': CoordinateSet := [1, 5, 7, 9, 13, 18, 23];
    'Z': CoordinateSet := [1, 2, 3, 4, 5, 9, 13, 17, 21, 22, 23, 24, 25]    
  ELSE
    Error := TRUE;
  END;
  IF NOT Error
  THEN
    BEGIN 
      FOR Pos := 1 TO MaxCoordinate
      DO
        BEGIN
          IF Pos IN CoordinateSet
          THEN
            WRITE('*')
          ELSE
            WRITE(' ');
          IF (Pos MOD MatrixSize = 0)
          THEN
            WRITELN;  
        END
    END
  ELSE
    WRITE('Invalid char!')
END; {WriteMatrix}
BEGIN {PseudoGraphic} 
  IF NOT EOLN
  THEN
    BEGIN
      READLN(Ch);
      WriteMatrix(Ch)
    END
  ELSE
    WRITELN('Пустая строка')
END. {PseudoGraphic}

  
