import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart' show ThemeExtension;

class GutterTokens extends ThemeExtension<GutterTokens> {
  const GutterTokens({required double base}) : _base = base;

  final double _base;

  double get level1 => _base * 0.5;
  double get level2 => _base;
  double get level3 => _base * 2;
  double get level4 => _base * 3;
  double get level5 => _base * 4;

  @override
  GutterTokens copyWith({double? base}) {
    return GutterTokens(base: base ?? _base);
  }

  @override
  GutterTokens lerp(ThemeExtension<GutterTokens>? other, double t) {
    if (other is! GutterTokens) return this;
    return GutterTokens(base: lerpDouble(_base, other._base, t)!);
  }
}
