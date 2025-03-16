import 'package:flutter/material.dart';

abstract class OptionWidget<T> extends StatefulWidget {
  const OptionWidget({required this.controller, super.key});

  final ValueNotifier<T> controller;
}

abstract class OptionWidgetState<T extends OptionWidget<V>, V> extends State<T> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_optionControllerListener);
  }

  @override
  void didUpdateWidget(covariant T oldWidget) {
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_optionControllerListener);
      widget.controller.addListener(_optionControllerListener);
      onOptionValueChanged(widget.controller.value);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_optionControllerListener);
    super.dispose();
  }

  void onOptionValueChanged(V value);

  void _optionControllerListener() {
    onOptionValueChanged(widget.controller.value);
  }
}

