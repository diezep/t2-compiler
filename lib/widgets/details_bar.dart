import 'package:analexico/analyzers/lexical/detail_widget.dart';
import 'package:analexico/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsBar extends ConsumerStatefulWidget {
  const DetailsBar({super.key});

  @override
  ConsumerState<DetailsBar> createState() => _DetailsBarState();
}

class _DetailsBarState extends ConsumerState<DetailsBar> {
  void _onTapClose() {
    ref.read(showDetails.notifier).update((state) => state = !state);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: ref.watch(barTabIndex),
      child: Container(
        width: 400,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: Colors.grey.shade900,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(text: 'Léxico'),
                    Tab(text: 'Sintáctico'),
                    Tab(text: 'Semántico'),
                  ],
                ),
                IconButton(
                  color: Colors.white,
                  onPressed: _onTapClose,
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const LexicalDetails(),
                  Container(
                    child: const Text('Syntactic'),
                  ),
                  Container(
                    child: const Text('Semantic'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
