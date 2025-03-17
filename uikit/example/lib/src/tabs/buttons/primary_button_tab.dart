import 'package:design_preview/design_preview.dart';
import 'package:example/src/core/sidebar.dart';
import 'package:example/src/core/theme_option.dart';
import 'package:example/src/core/widget_preview.dart';
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
  final labelController = StringOptionController('Primary Button');
  final isEnabled = ValueNotifier<bool>(true);
  late final _formListenable = Listenable.merge([labelController, isEnabled]);

  @override
  Widget build(BuildContext context) {
    return WidgetPreview(
      listenable: _formListenable,
      builder: (context) {
        return UiButton.primary(
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
