import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class Defaults {
  static final margin = MarginTokens(
    level1: 4.0,
    level2: 8.0,
    level3: 16.0,
    level4: 24.0,
    level5: 32.0,
  );
  static final padding = PaddingTokens(
    level1: 4.0,
    level2: 8.0,
    level3: 16.0,
    level4: 24.0,
    level5: 32.0,
  );
  static final gutter = GutterTokens(base: 16.0);
  static final radius = RadiusTokens(
    level1: Radius.circular(4.0),
    level2: Radius.circular(8.0),
    level3: Radius.circular(16.0),
    level4: Radius.circular(24.0),
    level5: Radius.circular(32.0),
  );

  static final darkColors = ColorTokens(
    background: const Color(0xFF09090B), // 240 10% 3.9%
    foreground: const Color(0xFFFAFAFA), // 0 0% 98%
    primary: const Color(0xFFFAFAFA), // 0 0% 98%
    primaryForeground: const Color(0xFF18181B), // 240 5.9% 10%
    secondary: const Color(0xFF27272A), // 240 3.7% 15.9%
    secondaryForeground: const Color(0xFFFAFAFA), // 0 0% 98%
    accent: const Color(0xFF27272A), // 240 3.7% 15.9%
    accentForeground: const Color(0xFFFAFAFA), // 0 0% 98%
    destructive: const Color(0xFF7F1D1D), // 0 62.8% 30.6%
    destructiveForeground: const Color(0xFFFAFAFA), // 0 0% 98%
    ring: const Color(0xFFD4D4D8), // 240 4.9% 83.9%
    selection: const Color(0xFFD4D4D8), // Using ring color as a placeholder for selection
  );

  static final lightColors = ColorTokens(
    background: const Color(0xFFFAFAFA), // 0 0% 98%
    foreground: const Color(0xFF18181B), // 240 5.9% 10%
    primary: const Color(0xFF18181B), // 240 5.9% 10%
    primaryForeground: const Color(0xFFFAFAFA), // 0 0% 98%
    secondary: const Color(0xFFD4D4D8), // 240 4.9% 83.9%
    secondaryForeground: const Color(0xFF18181B), // 240 5.9% 10%
    accent: const Color(0xFFD4D4D8), // 240 4.9% 83.9%
    accentForeground: const Color(0xFF18181B), // 240 5.9% 10%
    destructive: const Color(0xFF7F1D1D), // 0 62.8% 30.6%
    destructiveForeground: const Color(0xFFFAFAFA), // 0 0% 98%
    ring: const Color(0xFF18181B), // 240 5.9% 10%
    selection: const Color(0xFFD4D4D8), // Using ring color as a placeholder for selection
  );

  static final lightTypography = buildTypography(lightColors);
  static final darkTypography = buildTypography(darkColors);

  static TypographyTokens buildTypography(ColorTokens colorTokens) {
    return TypographyTokens(
      displayLarge: TextStyle(
        fontSize: 57,
        fontWeight: FontWeight.normal,
        color: colorTokens.foreground,
      ),
      displayMedium: TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.normal,
        color: colorTokens.foreground,
      ),
      displaySmall: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.normal,
        color: colorTokens.foreground,
      ),
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.normal,
        color: colorTokens.foreground,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.normal,
        color: colorTokens.foreground,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.normal,
        color: colorTokens.foreground,
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.normal,
        color: colorTokens.foreground,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: colorTokens.foreground,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: colorTokens.foreground,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: colorTokens.foreground,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: colorTokens.foreground,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: colorTokens.foreground,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: colorTokens.foreground,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: colorTokens.foreground,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: colorTokens.foreground,
      ),
    );
  }

  static final tokens = Tokens(
    margin: margin,
    padding: padding,
    gutter: gutter,
    radius: radius,
    typography: lightTypography,
    colors: lightColors,
  );

  static final darkTokens = Tokens(
    margin: margin,
    padding: padding,
    gutter: gutter,
    radius: radius,
    typography: darkTypography,
    colors: darkColors,
  );

  static final lightTheme = buildThemeData(tokens, Brightness.light);
  static final darkTheme = buildThemeData(darkTokens, Brightness.dark);
}
