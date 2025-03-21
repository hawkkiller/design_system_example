import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class ThemeOptionInput extends StatelessWidget {
  const ThemeOptionInput({super.key});

  static final _entries = <DropdownMenuEntry<ThemeData>>[
    DropdownMenuEntry<ThemeData>(value: Defaults.lightTheme, label: 'Light'),
    DropdownMenuEntry<ThemeData>(value: Defaults.darkTheme, label: 'Dark'),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = ThemeOptionInherited.of(context);

    return DropdownMenu<ThemeData>(
      dropdownMenuEntries: _entries,
      initialSelection: theme ?? _entries.first.value,
      onSelected: (value) {
        if (value == null) return;
        ThemeOptionInherited.setTheme(context, value);
      },
    );
  }
}

class ThemeOptionInherited extends StatefulWidget {
  const ThemeOptionInherited({super.key, required this.child});

  final Widget child;

  static void setTheme(BuildContext context, ThemeData theme) {
    final _ThemeOptionInherited? inherited =
        context.getElementForInheritedWidgetOfExactType<_ThemeOptionInherited>()?.widget
            as _ThemeOptionInherited?;
    inherited?.state.setTheme(theme);
  }

  static ThemeData? of(BuildContext context, {bool listen = true}) {
    final _ThemeOptionInherited? inherited =
        listen
            ? context.dependOnInheritedWidgetOfExactType<_ThemeOptionInherited>()
            : context.getElementForInheritedWidgetOfExactType<_ThemeOptionInherited>()?.widget
                as _ThemeOptionInherited?;
    return inherited?.theme;
  }

  @override
  State<ThemeOptionInherited> createState() => ThemeOptionInheritedState();
}

class ThemeOptionInheritedState extends State<ThemeOptionInherited> {
  ThemeData? _theme;

  void setTheme(ThemeData theme) {
    if (_theme != theme) {
      setState(() {
        _theme = theme;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _ThemeOptionInherited(theme: _theme, state: this, child: widget.child);
  }
}

class _ThemeOptionInherited extends InheritedWidget {
  const _ThemeOptionInherited({required this.theme, required super.child, required this.state});

  final ThemeOptionInheritedState state;
  final ThemeData? theme;

  @override
  bool updateShouldNotify(_ThemeOptionInherited oldWidget) {
    return theme != oldWidget.theme;
  }
}
