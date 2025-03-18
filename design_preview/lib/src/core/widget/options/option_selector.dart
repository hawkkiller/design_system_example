import 'package:flutter/material.dart';

class OptionSelectorItem<T> {
  OptionSelectorItem({required this.value, String? label})
    : label = label ?? value.toString();

  final T value;
  final String label;
}

class OptionSelector<T> extends StatelessWidget {
  const OptionSelector({
    super.key,
    required this.label,
    required this.controller,
    required this.values,
  });

  final String label;
  final ValueNotifier<T> controller;
  final List<OptionSelectorItem<T>> values;

  DropdownMenuEntry<T> _buildItem(OptionSelectorItem<T> item) {
    return DropdownMenuEntry(value: item.value, label: item.label);
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        return DropdownMenu<T>(
          initialSelection: controller.value,
          label: Text(label),
          dropdownMenuEntries: values.map(_buildItem).toList(),
          onSelected: (value) {
            if (value == null) return;
            controller.value = value;
          },
        );
      },
    );
  }
}
