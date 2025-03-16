import '../../uikit.dart';
import 'package:flutter/material.dart';

class UiButtonStyle extends ButtonStyle {
  const UiButtonStyle({
    required this.tokens,
    Color? backgroundColor,
    Color? disabledBackgroundColor,
    Color? foregroundColor,
    Color? disabledForegroundColor,
    Color? overlayColor,
    OutlinedBorder? shape,
    OutlinedBorder? disabledShape,
  }) : _backgroundColor = backgroundColor,
       _disabledBackgroundColor = disabledBackgroundColor,
       _foregroundColor = foregroundColor,
       _disabledForegroundColor = disabledForegroundColor,
       _overlayColor = overlayColor,
       _shape = shape,
       _disabledShape = disabledShape;

  final Tokens tokens;
  final Color? _backgroundColor;
  final Color? _disabledBackgroundColor;
  final Color? _foregroundColor;
  final Color? _disabledForegroundColor;
  final Color? _overlayColor;
  final OutlinedBorder? _shape;
  final OutlinedBorder? _disabledShape;

  /// Returns [enabled] if [disabled] is `null`,
  /// otherwise returns a [WidgetStateProperty] with [WidgetState.disabled]
  /// set to [disabled] and [WidgetState.any] set to [enabled].
  static WidgetStateProperty<T?>? defaultValue<T>(T? enabled, T? disabled) {
    if (disabled == null) {
      return WidgetStatePropertyAll<T?>(enabled);
    }

    return WidgetStateProperty<T?>.fromMap(<WidgetStatesConstraint, T?>{
      WidgetState.disabled: disabled,
      WidgetState.any: enabled,
    });
  }

  @override
  WidgetStateProperty<Color?>? get backgroundColor => defaultValue(
    _backgroundColor,
    _disabledBackgroundColor ?? _backgroundColor?.withValues(alpha: 0.5),
  );

  @override
  WidgetStateProperty<Color?>? get foregroundColor => defaultValue(
    _foregroundColor,
    _disabledForegroundColor ?? _foregroundColor?.withValues(alpha: 0.5),
  );

  @override
  WidgetStateProperty<Color?>? get iconColor => foregroundColor;

  @override
  WidgetStateProperty<OutlinedBorder?>? get shape => defaultValue(_shape, _disabledShape);

  @override
  WidgetStateProperty<Color?>? get overlayColor => switch ((_foregroundColor, _overlayColor)) {
    (null, null) => null,
    (_, Color(a: 0.0)) => WidgetStatePropertyAll<Color?>(_overlayColor),
    (_, final Color color) ||
    (final Color color, _) => WidgetStateProperty<Color?>.fromMap(<WidgetState, Color?>{
      WidgetState.pressed: color.withValues(alpha: 0.1),
      WidgetState.hovered: color.withValues(alpha: 0.08),
      WidgetState.focused: color.withValues(alpha: 0.1),
    }),
  };

  @override
  WidgetStateProperty<TextStyle?>? get textStyle => WidgetStatePropertyAll<TextStyle?>(
    tokens.typography.labelLarge.copyWith(color: _foregroundColor, height: 1.05),
  );
}

sealed class UiButton extends StatelessWidget {
  const UiButton({super.key, this.enabled = true, this.onPressed});

  final bool enabled;
  final VoidCallback? onPressed;

  /// Returns `true` if [enabled] is `true` and [onPressed] is not `null`.
  bool get isEnabled => enabled && onPressed != null;

  /// Returns [onPressed] if [isEnabled] is `true`, otherwise returns `null`.
  VoidCallback? get effectiveOnPressed => isEnabled ? onPressed : null;

  const factory UiButton.primary(
    String content, {
    Widget? icon,
    VoidCallback? onPressed,
    bool enabled,
    Key? key,
  }) = _UiButtonPrimary;

  const factory UiButton.secondary(
    String content, {
    Widget? icon,
    VoidCallback? onPressed,
    bool enabled,
    Key? key,
  }) = _UiButtonSecondary;

  const factory UiButton.destructive(
    String content, {
    Widget? icon,
    VoidCallback? onPressed,
    bool enabled,
    Key? key,
  }) = _UiButtonDestructive;

  const factory UiButton.icon(Widget icon, {Key? key, VoidCallback? onPressed, bool enabled}) =
      _UiButtonIcon;

  Widget buildButton(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return buildButton(context);
  }
}

class _UiButtonPrimary extends UiButton {
  const _UiButtonPrimary(this.label, {super.key, super.onPressed, this.icon, super.enabled});

  final Widget? icon;
  final String label;

  @override
  Widget buildButton(BuildContext context) {
    final colors = context.colors;

    return FilledButton.icon(
      label: _ButtonContent(text: label),
      icon: icon,
      onPressed: effectiveOnPressed,
      style: UiButtonStyle(
        tokens: context.tokens,
        backgroundColor: colors.primary,
        foregroundColor: colors.primaryForeground,
        overlayColor: colors.primaryForeground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(context.radius.level1)),
      ),
    );
  }
}

class _UiButtonSecondary extends UiButton {
  const _UiButtonSecondary(this.label, {super.key, super.onPressed, this.icon, super.enabled});

  final String label;
  final Widget? icon;

  @override
  Widget buildButton(BuildContext context) {
    final colors = context.colors;

    return FilledButton.icon(
      label: _ButtonContent(text: label),
      icon: icon,
      onPressed: effectiveOnPressed,
      style: UiButtonStyle(
        tokens: context.tokens,
        backgroundColor: colors.secondary,
        foregroundColor: colors.secondaryForeground,
        overlayColor: colors.secondaryForeground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(context.radius.level1)),
      ),
    );
  }
}

class _UiButtonDestructive extends UiButton {
  const _UiButtonDestructive(this.label, {super.key, super.onPressed, this.icon, super.enabled});

  final String label;
  final Widget? icon;

  @override
  Widget buildButton(BuildContext context) {
    final colors = context.colors;

    return FilledButton.icon(
      label: _ButtonContent(text: label),
      icon: icon,
      onPressed: effectiveOnPressed,
      style: UiButtonStyle(
        tokens: context.tokens,
        backgroundColor: colors.destructive,
        foregroundColor: colors.destructiveForeground,
        overlayColor: colors.destructiveForeground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(context.radius.level1)),
      ),
    );
  }
}

class _UiButtonIcon extends UiButton {
  const _UiButtonIcon(this.icon, {super.key, super.onPressed, super.enabled});

  final Widget icon;

  @override
  Widget buildButton(BuildContext context) {
    final colors = context.colors;

    return IconButton(
      icon: icon,
      onPressed: effectiveOnPressed,
      style: UiButtonStyle(
        tokens: context.tokens,
        backgroundColor: colors.background,
        foregroundColor: colors.foreground,
        overlayColor: colors.foreground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(context.radius.level1),
          side: BorderSide(color: colors.primary),
        ),
        disabledShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(context.radius.level1),
          side: BorderSide(color: colors.primary.withValues(alpha: .38)),
        ),
      ),
    );
  }
}

class _ButtonContent extends StatelessWidget {
  const _ButtonContent({this.text});

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [if (text != null) Text(text!)],
    );
  }
}
