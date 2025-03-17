import 'package:design_preview/design_preview.dart';
import 'package:example/src/core/sidebar.dart';
import 'package:example/src/core/theme_option.dart';
import 'package:example/src/core/widget_preview.dart';
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class IconButtonTab extends StatefulWidget with WidgetTab {
  const IconButtonTab({super.key});

  @override
  String get title => 'Icon';

  @override
  State<IconButtonTab> createState() => _IconButtonTabState();
}

class _IconButtonTabState extends State<IconButtonTab> {
  final isEnabled = ValueNotifier<bool>(true);
  late final _formListenable = Listenable.merge([isEnabled]);

  @override
  Widget build(BuildContext context) {
    return WidgetPreview(
      listenable: _formListenable,
      builder: (context) {
        return UiButton.icon(Icon(Icons.add), onPressed: () {}, enabled: isEnabled.value);
      },
      sidebarBuilder: (context) {
        return Sidebar(
          children: [
            ThemeOptionInput(),
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
