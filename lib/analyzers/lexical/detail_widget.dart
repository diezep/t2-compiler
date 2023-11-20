import 'package:analexico/analyzers/lexical/providers.dart';
import 'package:analexico/models/code_token.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LexicalDetails extends ConsumerWidget {
  const LexicalDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Token> tokens = ref.watch(lexicalAnalyzerProvider);
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Table(
        border: TableBorder.all(color: Colors.white),
        children: [
          const TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Lexema', style: TextStyle(color: Colors.white)),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Token', style: TextStyle(color: Colors.white)),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Línea', style: TextStyle(color: Colors.white)),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Columna', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
          ...tokens.map(
            (token) => TableRow(
              children: [
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SelectableText(token.lexeme,
                        style: const TextStyle(color: Colors.white)),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(token.token?.name ?? '',
                        style: const TextStyle(color: Colors.white)),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(token.line.toString(),
                        style: const TextStyle(color: Colors.white)),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(token.column.toString(),
                        style: const TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
