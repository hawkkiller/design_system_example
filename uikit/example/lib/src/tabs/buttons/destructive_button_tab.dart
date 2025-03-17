import 'package:design_preview/design_preview.dart';
import 'package:example/src/core/sidebar.dart';
import 'package:example/src/core/theme_option.dart';
import 'package:example/src/core/widget_preview.dart';
import 'package:uikit/uikit.dart';
import 'package:flutter/material.dart';

class DestructiveButtonTab extends StatefulWidget with WidgetTab {
  const DestructiveButtonTab({super.key});

  @override
  String get title => 'Destructive';

  @override
  State<DestructiveButtonTab> createState() => _DestructiveButtonTabState();
}

class _DestructiveButtonTabState extends State<DestructiveButtonTab> {
  final labelController = StringOptionController('Destructive Button');
  final isEnabled = ValueNotifier<bool>(true);
  late final _formListenable = Listenable.merge([labelController, isEnabled]);

  @override
  Widget build(BuildContext context) {
    return WidgetPreview(
      listenable: _formListenable,
      builder: (context) {
        return UiButton.destructive(
          labelController.value,
          onPressed: () {},
          icon: Icon(Icons.add),
          enabled: isEnabled.value,
        );
      },
      sidebarBuilder: (context) {
        return Sidebar(
          children: [
            ThemeOptionInput(),
            SizedBox(height: context.margin.level1),
            StringOptionInput(controller: labelController, label: 'Button Label'),
            SizedBox(height: context.margin.level1),
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
