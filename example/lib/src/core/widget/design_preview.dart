import 'package:design_system/design_system.dart';
import 'package:example/src/core/router/routes.dart';
import 'package:example/src/core/tab.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DesignPreview extends StatefulWidget {
  const DesignPreview({super.key, required this.tabs});

  final List<PreviewTab> tabs;

  @override
  State<DesignPreview> createState() => _DesignPreviewState();
}

class _DesignPreviewState extends State<DesignPreview> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    final route = buildRootRoute(widget.tabs);

    _router = GoRouter(
      routes: [route], 
      debugLogDiagnostics: true,
      redirect: (context, state) {
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      theme: buildThemeData(Defaults.tokens),
    );
  }
}
