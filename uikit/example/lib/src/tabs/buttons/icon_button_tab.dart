import 'package:design_preview/design_preview.dart';
import 'package:example/src/core/sidebar.dart';
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
  final iconSelector = ValueNotifier<IconData>(Icons.add);
  late final _formListenable = Listenable.merge([isEnabled, iconSelector]);

  @override
  void dispose() {
    super.dispose();
    isEnabled.dispose();
    iconSelector.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WidgetPreview(
      listenable: _formListenable,
      builder: (context) {
        return UiButton.icon(Icon(iconSelector.value), onPressed: () {}, enabled: isEnabled.value);
      },
      sidebarBuilder: (context) {
        return Sidebar(
          children: [
            UiListTile.checkbox(
              title: 'Enabled',
              value: isEnabled.value,
              onChanged: (value) => isEnabled.value = value,
            ),
            OptionSelector(
              label: 'Icon',
              controller: iconSelector,
              values: [
                OptionSelectorItem(value: Icons.add, label: 'Add'),
                OptionSelectorItem(value: Icons.remove, label: 'Remove'),
                OptionSelectorItem(value: Icons.check, label: 'Check'),
                OptionSelectorItem(value: Icons.close, label: 'Close'),
              ],
            ),
          ],
        );
      },
    );
  }
}
