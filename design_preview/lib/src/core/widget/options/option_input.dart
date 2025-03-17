import 'package:design_preview/src/core/widget/options/option.dart';
import 'package:flutter/material.dart';

typedef OptionController<T> = ValueNotifier<T>;

class OptionInput<T> extends OptionWidget<T> {
  const OptionInput({
    super.key,
    required this.label,
    required super.controller,
    required this.values,
  });

  final String label;
  final List<T> values;

  @override
  State<OptionInput<T>> createState() => _OptionInputState<T>();
}

class _OptionInputState<T> extends OptionWidgetState<OptionInput<T>, T> {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.controller,
      builder: (context, _) {
        return DropdownMenu(
          initialSelection: widget.controller.value,
          dropdownMenuEntries:
              widget.values
                  .map((value) => DropdownMenuEntry<T>(label: value.toString(), value: value))
                  .toList(),
        );
      },
    );
  }
}
