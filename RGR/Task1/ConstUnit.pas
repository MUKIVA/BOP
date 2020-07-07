UNIT ConstUnit;
INTERFACE
CONST
  LowerRusChar = ['à' .. 'ÿ'];
  UpperRusChar = ['À' .. 'ß'];
  UpperLatChar = ['A' .. 'Z'];
  LowerLatChar = ['a' .. 'z'];
  ValidCharSet = LowerRusChar + UpperRusChar + UpperLatChar + LowerLatChar + ['¨', '¸'];
  
IMPLEMENTATION

BEGIN { ConstUnit }
END. { ConstUnit }
