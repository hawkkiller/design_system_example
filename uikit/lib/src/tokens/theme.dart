import '../../uikit.dart';
import 'package:flutter/material.dart';

ThemeData buildThemeData(Tokens tokens, Brightness brightness) {
  return ThemeData(
    brightness: brightness,
    extensions: [tokens],
    colorScheme: ColorScheme.fromSeed(
      seedColor: tokens.colors.primary,
      brightness: brightness,
      dynamicSchemeVariant: DynamicSchemeVariant.neutral,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: tokens.colors.selection,
      selectionColor: tokens.colors.selection,
      selectionHandleColor: tokens.colors.selection,
    ),
  );
}
