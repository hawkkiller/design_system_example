import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        for (final child in children) ...[child, const SizedBox(height: 8)],
      ],
    );
  }
}
