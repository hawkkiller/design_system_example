import '../../design_system.dart';
import 'package:flutter/material.dart';

ThemeData buildThemeData(Tokens tokens) {
  return ThemeData(
    extensions: [tokens],
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: tokens.colors.selection,
      selectionColor: tokens.colors.selection,
      selectionHandleColor: tokens.colors.selection,
    ),
  );
}
