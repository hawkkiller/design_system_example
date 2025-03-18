import 'package:flutter/material.dart';

class OptionSelector<T> extends StatelessWidget {
  const OptionSelector({
    super.key,
    required this.label,
    required this.controller,
    required this.values,
  });

  final String label;
  final ValueNotifier<T> controller;
  final List<T> values;

  DropdownMenuItem<T> _buildItem(T value) {
    return DropdownMenuItem<T>(value: value, child: Text(value.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        return DropdownButton<T>(
          value: controller.value,
          items: values.map(_buildItem).toList(growable: false),
          hint: Text(label),
          onChanged: (value) {
            if (value != null) {
              controller.value = value;
            }
          },
        );
      },
    );
  }
}
