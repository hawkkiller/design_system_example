import 'package:design_preview/design_preview.dart';
import 'package:uikit/uikit.dart';
import 'package:flutter/material.dart';

class PrimaryButtonTab extends StatefulWidget with WidgetTab {
  const PrimaryButtonTab({super.key});

  @override
  String get title => 'Primary';

  @override
  State<PrimaryButtonTab> createState() => _PrimaryButtonTabState();
}

class _PrimaryButtonTabState extends State<PrimaryButtonTab> {
  final labelController = TextEditingController(text: 'Primary Button');
  final isEnabled = ValueNotifier<bool>(true);
  late final _formListenable = Listenable.merge([labelController, isEnabled]);

  @override
  Widget build(BuildContext context) {
    return PreviewWidget(
      listenable: _formListenable,
      builder: (context) {
        return UiButton.primary(
          labelController.text,
          onPressed: () {},
          icon: Icon(Icons.add),
          enabled: isEnabled.value,
        );
      },
      sidebarBuilder: (context) {
        return ListView(
          padding: EdgeInsets.all(context.padding.level2),
          children: [
            UiTextInput.outlined(controller: labelController, labelText: 'Button Label'),
            SizedBox(height: context.margin.level2),
            UiListTile.checkbox(
              title: 'Enabled',
              value: isEnabled.value,
              onChanged: (value) => isEnabled.value = value,
            ),
          ],
        );
      },
    );
  }
}
