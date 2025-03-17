import 'package:design_preview/design_preview.dart';
import 'package:example/src/core/sidebar.dart';
import 'package:example/src/core/widget_preview.dart';
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class SecondaryButtonTab extends StatefulWidget with WidgetTab {
  const SecondaryButtonTab({super.key});

  @override
  String get title => 'Secondary';

  @override
  State<SecondaryButtonTab> createState() => _SecondaryButtonTabState();
}

class _SecondaryButtonTabState extends State<SecondaryButtonTab> {
  final labelController = StringOptionController('Secondary Button');
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
        return Sidebar(
          children: [
            StringOptionInput(controller: labelController, label: 'Button Label'),
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
