import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class Tokens extends ThemeExtension<Tokens> {
  const Tokens({
    required this.margin,
    required this.padding,
    required this.gutter,
    required this.colors,
    required this.typography,
    required this.radius,
  });

  final MarginTokens margin;
  final PaddingTokens padding;
  final GutterTokens gutter;
  final ColorTokens colors;
  final TypographyTokens typography;
  final RadiusTokens radius;

  @override
  Tokens copyWith({
    MarginTokens? margin,
    PaddingTokens? padding,
    GutterTokens? gutter,
    ColorTokens? colors,
    TypographyTokens? typography,
    RadiusTokens? radius,
  }) {
    return Tokens(
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      gutter: gutter ?? this.gutter,
      colors: colors ?? this.colors,
      typography: typography ?? this.typography,
      radius: radius ?? this.radius,
    );
  }

  @override
  Tokens lerp(ThemeExtension<Tokens>? other, double t) {
    if (other is! Tokens) return this;

    return Tokens(
      margin: margin.lerp(other.margin, t),
      padding: padding.lerp(other.padding, t),
      gutter: gutter.lerp(other.gutter, t),
      colors: colors.lerp(other.colors, t),
      typography: typography.lerp(other.typography, t),
      radius: radius.lerp(other.radius, t),
    );
  }

  @override
  String toString() {
    return 'Tokens('
        'margin: $margin, '
        'padding: $padding, '
        'gutter: $gutter, '
        'colors: $colors, '
        'typography: $typography, '
        'radius: $radius'
        ')';
  }
}

extension BuildContextTokens on BuildContext {
  Tokens get tokens => Theme.of(this).extension<Tokens>() ?? Defaults.tokens;
  ColorTokens get colors => tokens.colors;
  TypographyTokens get typography => tokens.typography;
  MarginTokens get margin => tokens.margin;
  PaddingTokens get padding => tokens.padding;
  GutterTokens get gutter => tokens.gutter;
  RadiusTokens get radius => tokens.radius;
}
