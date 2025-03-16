import 'package:design_preview/design_preview.dart';
import 'package:design_preview_gorouter/design_preview_gorouter.dart';
import 'package:example/src/core/widget_preview.dart';
import 'package:example/src/tabs/buttons/destructive_button_tab.dart';
import 'package:example/src/tabs/buttons/icon_button_tab.dart';
import 'package:example/src/tabs/buttons/primary_button_tab.dart';
import 'package:example/src/tabs/buttons/secondary_button_tab.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uikit/uikit.dart';

Future<void> main(List<String> args) async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static final tabs = [
    FolderTab(
      title: 'Buttons',
      tabs: [PrimaryButtonTab(), SecondaryButtonTab(), DestructiveButtonTab(), IconButtonTab()],
    ),
  ];

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final goRouter = GoRouter(routes: [buildRootRoute(MyApp.tabs)]);

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    debugShowCheckedModeBanner: false,
    routerConfig: goRouter,
    theme: WidgetPreview.buildThemeData(Defaults.tokens),
  );
}
