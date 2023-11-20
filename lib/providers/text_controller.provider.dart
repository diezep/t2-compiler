import 'package:analexico/models/code_token.dart';
import 'package:analexico/providers/code.provider.dart';
import 'package:analexico/providers/cursor_position.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rich_text_controller/rich_text_controller.dart';

final textControllerProvider = Provider<RichTextController>((ref) {
  var controller = RichTextController(
    onMatch: (_) {},
    patternMatchMap: Map.fromEntries(
      Tokens.values.sublist(0, Tokens.values.length - 1).map((e) => MapEntry(
            RegExp(e.pattern.substring(1, e.pattern.length - 1)),
            TextStyle(
              color: Color(e.color),
              fontWeight: FontWeight.bold,
              decorationColor: Color(e.color),
            ),
          )),
    ),
  );
  controller.addListener(() {
    ref.read(codeProvider.notifier).update((state) => state = controller.text);
    ref.read(columnPositionProvider.notifier).update((state) {
      return CursorPosition.columnPosition(
          controller.text, controller.selection.baseOffset);
    });
    ref.read(linePositionProvider.notifier).update((state) {
      return CursorPosition.linePosition(
          controller.text, controller.selection.baseOffset);
    });
  });
  return controller;
});
