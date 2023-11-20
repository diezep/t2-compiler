import 'package:analexico/analyzers/lexical/providers.dart';
import 'package:analexico/main.dart';
import 'package:analexico/models/code_token.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LexicalBar extends ConsumerStatefulWidget {
  const LexicalBar({super.key});

  @override
  ConsumerState<LexicalBar> createState() => _LexicalBarState();
}

class _LexicalBarState extends ConsumerState<LexicalBar> {
  void _onTap() {
    if (ref.read(showDetails) &&
        ref.read(barTabIndex) == BarTab.lexical.index) {
      ref.read(showDetails.notifier).update((state) => state = false);
    } else {
      ref
          .read(barTabIndex.notifier)
          .update((state) => state = BarTab.lexical.index);
      ref.read(showDetails.notifier).update((state) => state = !state);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isValid = ref.watch(lexicalValidProvider);
    List<Token> tokens = ref.watch(lexicalAnalyzerProvider);
    return Tooltip(
      message: isValid ? 'Válido' : 'Inválido',
      child: InkWell(
        onTap: _onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.smart_button_rounded,
              color: isValid ? Colors.green : Colors.red,
            ),
            const SizedBox(width: 2),
            Text(
              tokens.length.toString(),
              style: TextStyle(
                color: isValid ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 4),
            const Text('Léxico', style: TextStyle(color: Colors.white))
          ],
        ),
      ),
    );
  }
}
