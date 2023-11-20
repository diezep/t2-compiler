import 'package:analexico/models/code_token.dart';
import 'package:analexico/providers/cursor_position.provider.dart';

enum AnalyzerType { lexical, syntactic, semantic }

class LexicalAnalyzer {
  static List<Token> analyze(String input) {
    // Clean text
    String text = input.replaceAll('\n', ' ').replaceAll(RegExp(" +"), " ");

    String tmp = '';
    List<Token> tokens = [];
    text = text.trim();
    for (int i = 0; i < text.length; i++) {
      String extra = i + 1 < text.length ? text[i + 1] : '';
      tmp += text[i];
      tmp = tmp.trim();
      if (Token.isToken(tmp) && Token.isToken(extra, singleCharTokens)) {
        tokens.add(
          Token(
            lexeme: tmp,
            token: Tokens.values.firstWhere((e) => Token.isToken(tmp, [e])),
            line: CursorPosition.linePosition(input, i),
            column: CursorPosition.columnPosition(input, i),
          ),
        );
        tokens.add(
          Token(
            lexeme: extra,
            token:
                singleCharTokens.firstWhere((e) => Token.isToken(extra, [e])),
            line: CursorPosition.linePosition(input, i + 1),
            column: CursorPosition.columnPosition(input, i + 1),
          ),
        );
        i++;
        tmp = '';
      } else if ((Token.isToken(tmp) && !Token.isToken(tmp + extra)) ||
          (Token.isToken(tmp) && (extra == ' ' || extra == '')) ||
          (!Token.isToken(tmp) && !Token.isToken(tmp + extra))) {
        tokens.add(
          Token(
            lexeme: tmp,
            token: Tokens.values.firstWhere((e) => Token.isToken(tmp, [e])),
            line: CursorPosition.linePosition(input, i),
            column: CursorPosition.columnPosition(input, i),
          ),
        );
        if (extra == ' ' || extra == '') i++;

        tmp = '';
      } else if (Token.isToken(tmp) && Token.isToken(tmp + extra)) {
        continue;
      }
    }

    return tokens;
  }

  static bool validate(String text) {
    List<Token> tokens = analyze(text);
    return !tokens.any((element) => element.token == Tokens.unknown);
  }
}
