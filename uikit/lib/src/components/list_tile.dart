import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

sealed class UiListTile extends StatelessWidget {
  const UiListTile({super.key});

  const factory UiListTile.standard({
    required String title,
    VoidCallback? onTap,
    Widget? leading,
    Key? key,
  }) = _UiListTile;

  const factory UiListTile.checkbox({
    required String title,
    required bool value,
    ValueChanged<bool>? onChanged,
    Key? key,
  }) = _UiListTileCheckbox;
}

class _UiListTile extends UiListTile {
  const _UiListTile({required this.title, this.onTap, this.leading, super.key});

  final String title;
  final Widget? leading;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      titleTextStyle: context.typography.labelLarge,
      onTap: onTap,
      leading: leading,
      iconColor: context.colors.primaryForeground,
      hoverColor: context.colors.primary.withValues(alpha: .12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(context.tokens.radius.level1)),
      contentPadding: EdgeInsets.symmetric(horizontal: context.padding.level1),
      dense: true,
    );
  }
}

class _UiListTileCheckbox extends UiListTile {
  const _UiListTileCheckbox({required this.title, required this.value, this.onChanged, super.key});

  final String title;
  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return UiListTile.standard(
      title: title,
      leading: IgnorePointer(child: UiCheckbox(value: value, onChanged: onChanged)),
      onTap: onChanged != null ? () => onChanged!(!value) : null,
    );
  }
}