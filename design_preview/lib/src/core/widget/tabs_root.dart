import 'package:design_preview/design_preview.dart';
import 'package:flutter/material.dart';

class TabsRoot extends StatelessWidget {
  const TabsRoot({
    super.key,
    required this.routeHandler,
    required this.tabs,
    required this.navigator,
  });

  final RouteHandler routeHandler;
  final List<PreviewTab> tabs;
  final Widget navigator;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colors.surface,
      body: Row(
        children: [
          SizedBox(
            width: 250,
            child: Drawer(
              backgroundColor: colors.surface,
              shape: Border(
                right: BorderSide(color: colors.onSurface.withValues(alpha: .12)),
              ),
              child: SingleChildScrollView(child: TabsTree(tabs: tabs, routeHandler: routeHandler)),
            ),
          ),
          Expanded(child: navigator),
        ],
      ),
    );
  }
}
