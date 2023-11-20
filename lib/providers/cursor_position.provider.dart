import 'package:flutter_riverpod/flutter_riverpod.dart';

class CursorPosition {
  static int columnPosition(String text, int position) {
    int column = 1;
    var lines = text.split('\n');
    while (position > lines.first.length) {
      position -= lines.first.length + 1;
      lines.removeAt(0);
      column = 1;
    }
    column += position;
    return column;
  }

  static int linePosition(String text, int position) {
    int line = 1;
    var lines = text.split('\n');
    while (position > lines.first.length) {
      position -= lines.first.length + 1;
      lines.removeAt(0);
      line++;
    }
    return line;
  }
}

final columnPositionProvider = StateProvider<int>((ref) => 0);
final linePositionProvider = StateProvider<int>((ref) => 0);
