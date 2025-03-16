import 'package:design_preview/src/core/widget/options/option.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef NumberOptionInputController = ValueNotifier<num>;

class NumberOptionInput extends OptionWidget<num> {
  const NumberOptionInput({super.key, required this.label, required super.controller});

  final String label;

  @override
  State<NumberOptionInput> createState() => _StringOptionInputState();
}

class _StringOptionInputState extends OptionWidgetState<NumberOptionInput, num> {
  late final TextEditingController _textEditingController;

  var _isUpdating = false;

  @override
  void initState() {
    _textEditingController = TextEditingController(text: widget.controller.value.toString());
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  void onOptionValueChanged(num value) {
    if (_isUpdating) return;
    _textEditingController.text = value.toString();
  }

  void _onTextChanged(String value) {
    _isUpdating = true;
    widget.controller.value = value.isEmpty ? 0 : num.tryParse(value) ?? 0;
    _isUpdating = false;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      decoration: InputDecoration(labelText: widget.label),
      onChanged: _onTextChanged,
      keyboardType: TextInputType.number,
      
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
      ],
    );
  }
}
