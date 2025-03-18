import 'package:flutter/material.dart';

class OptionTextField extends StatelessWidget {
  const OptionTextField({super.key, required this.controller, required this.label});

  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: label, border: const OutlineInputBorder()),
    );
  }
}
