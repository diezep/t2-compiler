/*
0 --- Tipo de dato    1 --- Identificador           2 --- constante      3 ---   ;                        4 ---   ,  
 5 ---  (                      6 ---   )                              7 ---  {                      8 ---  }                        9 ---  =       
 9 ---  if                    10 --- while                     11 --- return             12 ---  else                13 --- for
14 --- opAdición    15 ---opMultiplicacion   16 --- opLogico       17 --- opRelacional  18 -- $
 */

const List<Tokens> singleCharTokens = [
  Tokens.leftParenthesis,
  Tokens.rightParenthesis,
  Tokens.specialCharacter,
];

enum Tokens {
  reservedWord(
    'Palabra reservada',
    r'^(if|else|while|for|return)$',
    0xFFbf2153,
  ),
  type('Tipo de dato', r'^(num|str|bool)$', 0xff4842f5),
  identifier('Identificador', r'^[a-zA-Z][a-zA-Z0-9]*$', 0xfff5b042),
  number('Constante', r'^[0-9]+(\.[0-9]+)?$', 0xff3da127),
  string('Cadena', r'^\".*\"$', 0xffa17827),
  leftParenthesis('(', r'^\($', 0xff000000),
  rightParenthesis(')', r'^\)$', 0xff000000),
  logicalOperator(
    'Operador lógico',
    r'^(&&|\|\|)$',
    0xff000000,
  ),
  relationalOperator(
    'Operador relacional',
    r'^(==|!=|>|>=|<|<=)$',
    0xff000000,
  ),
  arithmeticOperator(
    'Operador aritmético',
    r'^(\+|\-|\*|\/|\%)$',
    0xff000000,
  ),
  assignmentOperator(
    'Operador de asignación',
    r'^\=$',
    0xff000000,
  ),
  semicolon(';', r'^\;$', 0xff000000),
  comma(',', r'^\,$', 0xff000000),
  leftBrace('{', r'^\{$', 0xff000000),
  rightBrace('}', r'^\}$', 0xff000000),
  specialCharacter('Caracter especial', r'^(\;|\,|\{|\})$', 0xFF000000),
  unknown('Desconocido', r'^.*$', 0xFF00FF00);

  const Tokens(this.name, this.pattern, this.color);

  final String name;
  final String pattern;
  final int color;
}

class Token {
  Token({
    required this.lexeme,
    required this.line,
    required this.column,
    this.token,
  });

  final Tokens? token;
  final String lexeme;
  final int line;
  final int column;

  @override
  String toString() {
    return 'Token(lexeme: $lexeme, token: $token, line: $line, column: $column)';
  }

  static bool isToken(String lexeme, [List<Tokens> tokens = Tokens.values]) {
    return tokens.any((element) {
      return RegExp(element.pattern).hasMatch(lexeme);
    });
  }
}
