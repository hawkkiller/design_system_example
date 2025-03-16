import 'package:design_preview/src/core/widget/options/option.dart';
import 'package:flutter/material.dart';

typedef StringOptionInputController = ValueNotifier<String>;

class StringOptionInput extends OptionWidget<String> {
  const StringOptionInput({super.key, required this.label, required super.controller});

  final String label;

  @override
  State<StringOptionInput> createState() => _StringOptionInputState();
}

class _StringOptionInputState extends OptionWidgetState<StringOptionInput, String> {
  late final TextEditingController _textEditingController;

  var _isUpdating = false;

  @override
  void initState() {
    _textEditingController = TextEditingController(text: widget.controller.value);
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  void onOptionValueChanged(String value) {
    if (_isUpdating) return;

    _textEditingController.text = value;
  }

  void _onTextChanged(String value) {
    _isUpdating = true;
    widget.controller.value = value;
    _isUpdating = false;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      decoration: InputDecoration(labelText: widget.label),
      onChanged: _onTextChanged,
    );
  }
}
