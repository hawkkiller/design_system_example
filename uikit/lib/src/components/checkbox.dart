import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class UiCheckbox extends StatelessWidget {
  const UiCheckbox({super.key, required this.value, this.onChanged});

  final bool value;
  final ValueChanged<bool>? onChanged;

  bool get enabled => onChanged != null;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: enabled ? (newValue) => onChanged!(newValue!) : null,
      checkColor: context.colors.primaryForeground,
      overlayColor: WidgetStateProperty.all(context.colors.primary.withValues(alpha: .12)),
      fillColor: WidgetStateColor.fromMap({
        WidgetState.disabled: context.colors.background,
        WidgetState.selected: context.colors.primary,
        WidgetState.any: Colors.transparent,
      }),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(context.tokens.radius.level1)),
      side: WidgetStateBorderSide.fromMap({
        WidgetState.disabled: BorderSide(color: context.colors.primary.withValues(alpha: .38)),
        WidgetState.selected: null,
        WidgetState.any: BorderSide(color: context.colors.primary),
      }),
    );
  }
}
