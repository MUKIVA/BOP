PROGRAM Split(INPUT,OUTPUT);
  {Копирует INPUT в OUTPUT,сначала нечетные,а затем четные элементы}
VAR
  Ch,Next: CHAR;
  Odds,Evens: TEXT;
{PROCEDURE CopyOut(VAR F1: TEXT; VAR Ch: CHAR);}
 
BEGIN
  {Разделяет INPUT в Odds и Evens}
  CopyOut(Odds,Ch);
  CopyOut(Evens,Ch);
  WRITELN
END.
