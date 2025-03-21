import 'package:design_preview/design_preview.dart';
import 'package:design_preview_gorouter/design_preview_gorouter.dart';
import 'package:example/src/core/theme_option.dart';
import 'package:example/src/tabs/buttons/destructive_button_tab.dart';
import 'package:example/src/tabs/buttons/icon_button_tab.dart';
import 'package:example/src/tabs/buttons/primary_button_tab.dart';
import 'package:example/src/tabs/buttons/secondary_button_tab.dart';
import 'package:example/src/tabs/textfields/standard_textfield_tab.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uikit/uikit.dart';

Future<void> main(List<String> args) async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static const tabs = [
    FolderTab('Buttons', [
      PrimaryButtonTab(),
      SecondaryButtonTab(),
      DestructiveButtonTab(),
      IconButtonTab(),
    ]),
    FolderTab('Textfields', [StandardTextfieldTab()]),
  ];

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final _router = buildGoRouter();

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    debugShowCheckedModeBanner: false,
    routerConfig: _router,
    theme: Defaults.lightTheme,
    builder: (context, child) {
      return ThemeOptionInherited(child: child!);
    },
  );
}

GoRouter buildGoRouter() {
  final handler = RouteHandlerGoRouter();

  return GoRouter(
    routes: [
      ShellRoute(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => NotSelectedTabScreen(),
            routes: buildRoutesForTabs(handler, MyApp.tabs),
          ),
        ],
        builder: (context, state, child) {
          return TabsRoot(routeHandler: handler, tabs: MyApp.tabs, navigator: child);
        },
      ),
    ],
  );
}
