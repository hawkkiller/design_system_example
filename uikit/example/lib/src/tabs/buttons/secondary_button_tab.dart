import 'package:design_preview/design_preview.dart';
import 'package:example/src/core/widget_preview.dart';
import 'package:uikit/uikit.dart';
import 'package:flutter/material.dart';

class SecondaryButtonTab extends StatefulWidget with WidgetTab {
  const SecondaryButtonTab({super.key});

  @override
  String get title => 'Secondary';

  @override
  State<SecondaryButtonTab> createState() => _SecondaryButtonTabState();
}

class _SecondaryButtonTabState extends State<SecondaryButtonTab> {
  final labelController = StringOptionInputController('Secondary Button');
  final isEnabled = ValueNotifier<bool>(true);
  late final _formListenable = Listenable.merge([labelController, isEnabled]);

  @override
  Widget build(BuildContext context) {
    return WidgetPreview(
      listenable: _formListenable,
      builder: (context) {
        return UiButton.secondary(
          labelController.value,
          onPressed: () {},
          icon: Icon(Icons.add),
          enabled: isEnabled.value,
        );
      },
      sidebarBuilder: (context) {
        return ListView(
          padding: EdgeInsets.all(context.padding.level2),
          children: [
            StringOptionInput(controller: labelController, label: 'Button Label'),
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
