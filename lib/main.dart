import 'package:analexico/analyzers/lexical/bar_widget.dart';
import 'package:analexico/providers/cursor_position.provider.dart';
import 'package:analexico/providers/text_controller.provider.dart';
import 'package:analexico/widgets/details_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final showDetails = StateProvider<bool>((ref) => false);

enum BarTab { lexical, syntactic, semantic }

final barTabIndex = StateProvider<int>((ref) => BarTab.lexical.index);

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Compilador', home: CodeEditor());
  }
}

class CodeEditor extends ConsumerStatefulWidget {
  const CodeEditor({super.key});

  @override
  ConsumerState<CodeEditor> createState() => _CodeEditorState();
}

class _CodeEditorState extends ConsumerState<CodeEditor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Compilador'),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.info_outline),
        ),
      ),
      endDrawer: const DetailsBar(),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              child: TextField(
                decoration: const InputDecoration.collapsed(hintText: ''),
                controller: ref.watch(textControllerProvider),
                expands: true,
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
            ),
          ),
          const BottomBar()
        ],
      ),
    );
  }
}

class BottomBar extends ConsumerWidget {
  const BottomBar({super.key});

  final bool validInput = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int line = ref.watch(linePositionProvider);
    int column = ref.watch(columnPositionProvider);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            child: Text(
              'Linea: $line    Columna: $column',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const Wrap(
            spacing: 16,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              LexicalBar(),
            ],
          ),
        ],
      ),
    );
  }
}
