import 'package:design_preview/design_preview.dart';
import 'package:design_preview_gorouter/design_preview_gorouter.dart';
import 'package:go_router/go_router.dart';

/// Builds a list of routes from a list of tabs.
RouteBase buildRootRoute(List<PreviewTab> tabs) {
  final handler = RouteHandlerGoRouter();
  return ShellRoute(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => NotSelectedTabScreen(),
        routes: _buildRoutesForTabs(handler, tabs),
      ),
    ],
    builder: (context, state, child) {
      return TabsRoot(routeHandler: handler, tabs: tabs, navigator: child);
    },
  );
}

/// Recursively builds routes from tabs with the given path prefix.
List<RouteBase> _buildRoutesForTabs(RouteHandler handler, List<PreviewTab> tabs) {
  final routes = <RouteBase>[];

  for (final tab in tabs) {
    final path = handler.encodeTitleToPath(tab.title);

    if (tab is FolderTab) {
      // Create nested routes for folder tabs
      final childRoutes = _buildRoutesForTabs(handler, tab.tabs);
      if (childRoutes.isNotEmpty) {
        routes.add(
          GoRoute(
            path: path,
            routes: childRoutes,
            builder: (context, state) => NotSelectedTabScreen(),
          ),
        );
      }
    } else if (tab.shouldRenderContent) {
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
