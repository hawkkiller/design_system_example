import 'package:design_preview/design_preview.dart';
import 'package:go_router/go_router.dart';

/// Recursively builds routes from tabs with the given path prefix.
List<RouteBase> buildRoutesForTabs(RouteHandler handler, List<PreviewTab> tabs) {
  final routes = <RouteBase>[];

  for (final tab in tabs) {
    final path = handler.encodeTitleToPath(tab.title);

    if (tab is FolderTab) {
      // Create nested routes for folder tabs
      final childRoutes = buildRoutesForTabs(handler, tab.tabs);
      if (childRoutes.isNotEmpty) {
        routes.add(
          GoRoute(
            path: path,
            routes: childRoutes,
            builder: (context, state) => NotSelectedTabScreen(),
          ),
        );
      }
    } else {
      // Create route for content tabs
      routes.add(
        GoRoute(
          path: path,
          pageBuilder: (context, state) {
            return NoTransitionPage(child: tab.buildWidget(context));
          },
        ),
      );
    }
  }

  return routes;
}
