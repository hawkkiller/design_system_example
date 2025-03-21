import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class UiButtonStyle extends ButtonStyle {
  const UiButtonStyle({
    required this.tokens,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? overlayColor,
    OutlinedBorder? shape,
    OutlinedBorder? disabledShape,
  }) : _backgroundColor = backgroundColor,
       _foregroundColor = foregroundColor,
       _overlayColor = overlayColor,
       _shape = shape,
       _disabledShape = disabledShape;

  final Tokens tokens;
  final Color? _backgroundColor;
  final Color? _foregroundColor;
  final Color? _overlayColor;
  final OutlinedBorder? _shape;
  final OutlinedBorder? _disabledShape;

  static WidgetStateProperty<T?>? enabledOr<T>(T? enabled, T? disabled) {
    if (disabled == null) {
      return WidgetStatePropertyAll(enabled);
    }

    return WidgetStateProperty<T?>.fromMap({
      WidgetState.disabled: disabled,
      WidgetState.any: enabled,
    });
  }

  @override
  WidgetStateProperty<Color?>? get backgroundColor =>
      enabledOr(_backgroundColor, _backgroundColor?.withValues(alpha: 0.5));

  @override
  WidgetStateProperty<Color?>? get foregroundColor =>
      enabledOr(_foregroundColor, _foregroundColor?.withValues(alpha: 0.5));

  @override
  WidgetStateProperty<Color?>? get iconColor => foregroundColor;

  @override
  WidgetStateProperty<OutlinedBorder?>? get shape => enabledOr(_shape, _disabledShape);

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
}

class _UiButtonPrimary extends UiButton {
  const _UiButtonPrimary(this.label, {super.key, super.onPressed, this.icon, super.enabled});

  final Widget? icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return FilledButton.icon(
      label: Text(label),
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
  Widget build(BuildContext context) {
    final colors = context.colors;

    return FilledButton.icon(
      label: Text(label),
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
  Widget build(BuildContext context) {
    final colors = context.colors;

    return FilledButton.icon(
      label: Text(label),
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
  Widget build(BuildContext context) {
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
