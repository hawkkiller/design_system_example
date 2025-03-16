import 'package:example/src/core/tab.dart';
import 'package:example/src/core/widget/design_preview.dart';
import 'package:example/src/tabs/buttons/destructive_button_tab.dart';
import 'package:example/src/tabs/buttons/icon_button_tab.dart';
import 'package:example/src/tabs/buttons/primary_button_tab.dart';
import 'package:example/src/tabs/buttons/secondary_button_tab.dart';
import 'package:flutter/material.dart';

Future<void> main(List<String> args) async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final tabs = [
    FolderTab(
      title: 'Buttons',
      tabs: [PrimaryButtonTab(), SecondaryButtonTab(), DestructiveButtonTab(), IconButtonTab()],
    ),
  ];

  @override
  Widget build(BuildContext context) => DesignPreview(tabs: tabs);
}
