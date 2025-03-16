import 'package:design_preview/src/core/tab.dart';
import 'package:design_preview/src/core/widget/tabs_tree.dart';
import 'package:flutter/material.dart';

class TabsRoot extends StatelessWidget {
  const TabsRoot({super.key, required this.tabs, required this.navigator});

  final List<PreviewTab> tabs;
  final Widget navigator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: Row(
        children: [
          SizedBox(
            width: 250,
            child: Drawer(
              backgroundColor: context.colors.background,
              shape: Border(
                right: BorderSide(color: context.colors.foreground.withValues(alpha: .12)),
              ),
              child: SingleChildScrollView(
                child: TabsTree(tabs: tabs),
              ),
            ),
          ),
          Expanded(child: navigator),
        ],
      ),
    );
  }
}
