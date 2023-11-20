import 'package:analexico/analyzers/lexical/analyzer.dart';
import 'package:analexico/models/code_token.dart';
import 'package:analexico/providers/code.provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

List<Token> lexicalAnalyzer(LexicalAnalyzerRef ref) {
  return LexicalAnalyzer.analyze(ref.watch(codeProvider));
}

bool lexicalValid(LexicalValidRef ref) {
  return LexicalAnalyzer.validate(ref.watch(codeProvider));
}
