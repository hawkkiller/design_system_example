import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Helper class that provides utilities for route management
class RouteHelper {
  /// Converts a tab title to a URL-friendly path segment.
  static String getPathFromTitle(String title) {
    return title.toLowerCase().replaceAll(' ', '-');
  }
  
  /// Checks if the current location contains the specified path
  static bool isPathActive(BuildContext context, String path) {
    final location = GoRouterState.of(context).uri.path;
    return location == '/$path' || location.startsWith('/$path/');
  }
  
  /// Checks if the path is a parent of the current location
  static bool isPathParentOfCurrent(BuildContext context, String path) {
    if (path.isEmpty) return false;
    final location = GoRouterState.of(context).uri.toString().substring(1); // Remove leading '/'
    if (location == path) return false;
    return location.startsWith('$path/');
  }
}
