import 'package:flutter/material.dart';

abstract mixin class PreviewTab {
  String get title;
  List<PreviewTab> get tabs;

  /// Whether the tab should render its content.
  ///
  /// This can be useful to prevent rendering folders.
  bool get shouldRenderContent;

  Widget buildWidget(BuildContext context);
}

mixin WidgetTab on Widget implements PreviewTab {
  @override
  List<PreviewTab> get tabs => const [];

  @override
  bool get shouldRenderContent => true;

  @override
  Widget buildWidget(BuildContext context) {
    return this;
  }
}

class FolderTab implements PreviewTab {
  const FolderTab({required this.title, required this.tabs});

  @override
  final String title;

  @override
  final List<PreviewTab> tabs;

  @override
  bool get shouldRenderContent => false;

  @override
  Widget buildWidget(BuildContext context) {
    throw UnsupportedError('FolderTab should not be rendered, unless explicitly handled.');
  }
}
