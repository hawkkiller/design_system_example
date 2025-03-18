import 'package:design_preview/design_preview.dart';
import 'package:example/src/core/sidebar.dart';
import 'package:example/src/core/widget_preview.dart';
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class StandardTextfieldTab extends StatefulWidget with WidgetTab {
  const StandardTextfieldTab({super.key});

  @override
  String get title => 'Standard';

  @override
  State<StandardTextfieldTab> createState() => _StandardTextfieldTabState();
}

class _StandardTextfieldTabState extends State<StandardTextfieldTab> {
  late final _labelOption = TextEditingController(text: 'Label');
  late final _valueController = TextEditingController(text: 'Hello!');
  late final _listenable = Listenable.merge([_labelOption]);

  @override
  void dispose() {
    super.dispose();
    _labelOption.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WidgetPreview(
      constraints: BoxConstraints.tightFor(width: 400),
      listenable: _listenable,
      builder: (context) {
        return UiTextInput.outlined(labelText: _labelOption.text, controller: _valueController);
      },
      sidebarBuilder: (context) {
        return Sidebar(
          children: [
            OptionTextField(controller: _labelOption, label: 'Label'),
            OptionTextField(controller: _valueController, label: 'Value'),
          ],
        );
      },
    );
  }
}
