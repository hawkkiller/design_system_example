import 'package:flutter/material.dart';

class RadiusTokens extends ThemeExtension<RadiusTokens> {
  const RadiusTokens({
    required this.level1,
    required this.level2,
    required this.level3,
    required this.level4,
    required this.level5,
  });
  
  final Radius level1;
  final Radius level2;
  final Radius level3;
  final Radius level4;
  final Radius level5;

  @override
  ThemeExtension<RadiusTokens> copyWith({
    Radius? level1,
    Radius? level2,
    Radius? level3,
    Radius? level4,
    Radius? level5,
  }) {
    return RadiusTokens(
      level1: level1 ?? this.level1,
      level2: level2 ?? this.level2,
      level3: level3 ?? this.level3,
      level4: level4 ?? this.level4,
      level5: level5 ?? this.level5,
    );
  }

  @override
  RadiusTokens lerp(ThemeExtension<RadiusTokens>? other, double t) {
    StadiumBorder();
    if (other is! RadiusTokens) return this;

    return RadiusTokens(
      level1: Radius.lerp(level1, other.level1, t) ?? level1,
      level2: Radius.lerp(level2, other.level2, t) ?? level2,
      level3: Radius.lerp(level3, other.level3, t) ?? level3,
      level4: Radius.lerp(level4, other.level4, t) ?? level4,
      level5: Radius.lerp(level5, other.level5, t) ?? level5,
    );
  }

  @override
  String toString() {
    return 'RadiusTokens('
        'level1: $level1, '
        'level2: $level2, '
        'level3: $level3, '
        'level4: $level4, '
        'level5: $level5, '
        ')';
  }
}
