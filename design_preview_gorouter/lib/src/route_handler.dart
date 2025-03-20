import 'package:design_preview/design_preview.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Helper class that provides utilities for route management
class RouteHandlerGoRouter implements RouteHandler {
  @override
  bool isPathActive(BuildContext context, String path) {
    final location = GoRouterState.of(context).uri.path;
    return location == '/$path' || location.startsWith('/$path/');
  }

  @override
  bool isPathParentOfCurrent(BuildContext context, String path) {
    if (path.isEmpty) return false;
    final location = GoRouterState.of(context).uri.toString().substring(1); // Remove leading '/'
    if (location == path) return false;
    return location.startsWith('$path/');
  }

  @override
  String encodeTitleToPath(String title) {
    return title.toLowerCase().replaceAll(' ', '-');
  }

  @override
  void navigateTo(BuildContext context, String path) {
    context.go('/$path');
  }
}
