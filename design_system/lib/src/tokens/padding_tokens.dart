import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart' show ThemeExtension;

class PaddingTokens extends ThemeExtension<PaddingTokens> {
  const PaddingTokens({
    required this.level1,
    required this.level2,
    required this.level3,
    required this.level4,
    required this.level5,
  });

  final double level1;
  final double level2;
  final double level3;
  final double level4;
  final double level5;

  @override
  PaddingTokens copyWith({double? level1, double? level2, double? level3, double? level4, double? level5}) {
    return PaddingTokens(
      level1: level1 ?? this.level1,
      level2: level2 ?? this.level2,
      level3: level3 ?? this.level3,
      level4: level4 ?? this.level4,
      level5: level5 ?? this.level5,
    );
  }

  @override
  PaddingTokens lerp(ThemeExtension<PaddingTokens>? other, double t) {
    if (other is! PaddingTokens) return this;
    return PaddingTokens(
      level1: lerpDouble(level1, other.level1, t)!,
      level2: lerpDouble(level2, other.level2, t)!,
      level3: lerpDouble(level3, other.level3, t)!,
      level4: lerpDouble(level4, other.level4, t)!,
      level5: lerpDouble(level5, other.level5, t)!,
    );
  }
}
