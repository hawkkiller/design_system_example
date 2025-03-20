import 'package:flutter/material.dart';

abstract mixin class PreviewTab {
  String get title;

  Widget buildWidget(BuildContext context);
}

mixin WidgetTab on Widget implements PreviewTab {
  @override
  Widget buildWidget(BuildContext context) => this;
}

class FolderTab with PreviewTab {
  const FolderTab(this.title, this.tabs);

  @override
  final String title;

  final List<PreviewTab> tabs;
  
  @override
  Widget buildWidget(BuildContext context) {
    throw UnimplementedError('FolderTab does not implement buildWidget');
  }
}
