import 'package:example/src/core/theme_option.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key, required this.children, this.addThemeOption = true});

  final bool addThemeOption;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        if (addThemeOption) ...[ThemeOptionInput(), Divider(height: 24)],
        for (final child in children) ...[child, const SizedBox(height: 16)],
      ],
    );
  }
}
