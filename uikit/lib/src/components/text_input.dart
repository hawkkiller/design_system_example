import 'package:uikit/uikit.dart';
import 'package:flutter/material.dart';

sealed class UiTextInput extends StatelessWidget {
  const UiTextInput({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.enabled = true,
    this.autocorrect = true,
    this.autofocus = false,
    this.enableSuggestions = true,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.focusNode,
  });

  const factory UiTextInput.outlined({
    Key? key,
    TextEditingController? controller,
    String? hintText,
    String? labelText,
    String? helperText,
    String? errorText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool obscureText,
    bool enabled,
    bool autocorrect,
    bool autofocus,
    bool enableSuggestions,
    TextInputType keyboardType,
    TextInputAction textInputAction,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onSubmitted,
    VoidCallback? onEditingComplete,
    FocusNode? focusNode,
  }) = _UiTextInputOutlined;

  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool enabled;
  final bool autocorrect;
  final bool autofocus;
  final bool enableSuggestions;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onEditingComplete;
  final FocusNode? focusNode;
}

final class _UiTextInputOutlined extends UiTextInput {
  const _UiTextInputOutlined({
    super.key,
    super.controller,
    super.hintText,
    super.labelText,
    super.helperText,
    super.errorText,
    super.prefixIcon,
    super.suffixIcon,
    super.obscureText,
    super.enabled,
    super.autocorrect,
    super.autofocus,
    super.enableSuggestions,
    super.keyboardType,
    super.textInputAction,
    super.onChanged,
    super.onSubmitted,
    super.onEditingComplete,
    super.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: context.typography.bodyMedium.copyWith(color: context.colors.foreground),
      cursorErrorColor: context.colors.destructive,
      cursorColor: context.colors.primary,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        errorText: errorText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabled: enabled,
        filled: false,
        errorStyle: context.typography.bodyMedium.copyWith(color: context.colors.destructive),
        hintStyle: WidgetStateTextStyle.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return context.typography.bodyMedium.copyWith(
              color: context.colors.foreground.withValues(alpha: .38),
            );
          }

          return context.typography.bodyMedium.copyWith(
            color: context.colors.foreground.withValues(alpha: .5),
          );
        }),
        floatingLabelStyle: WidgetStateTextStyle.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return context.typography.bodyMedium.copyWith(
              color: context.colors.foreground.withValues(alpha: .38),
            );
          }

          if (states.contains(WidgetState.focused)) {
            return context.typography.bodyMedium.copyWith(color: context.colors.primary);
          }

          return context.typography.bodyMedium.copyWith(
            color: context.colors.foreground.withValues(alpha: .5),
          );
        }),
        labelStyle: WidgetStateTextStyle.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return context.typography.bodyMedium.copyWith(
              color: context.colors.foreground.withValues(alpha: .38),
            );
          }

          if (states.contains(WidgetState.focused)) {
            return context.typography.bodyMedium.copyWith(color: context.colors.primary);
          }

          return context.typography.bodyMedium.copyWith(
            color: context.colors.foreground.withValues(alpha: .5),
          );
        }),
        border: WidgetStateInputBorder.fromMap({
          WidgetState.disabled: OutlineInputBorder(
            borderSide: BorderSide(color: context.colors.foreground.withValues(alpha: .12)),
          ),
          WidgetState.focused: OutlineInputBorder(
            borderSide: BorderSide(color: context.colors.primary),
          ),
          WidgetState.error: OutlineInputBorder(
            borderSide: BorderSide(color: context.colors.destructive),
          ),
          WidgetState.any: OutlineInputBorder(
            borderSide: BorderSide(color: context.colors.primary.withValues(alpha: .5)),
          ),
        }),
      ),
    );
  }
}
