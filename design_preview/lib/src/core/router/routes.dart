import '../tab.dart';
import 'route_handler.dart';
import '../widget/not_selected_tab_screen.dart';
import '../widget/tabs_root.dart';
import 'package:go_router/go_router.dart';

/// Builds a list of routes from a list of tabs.
RouteBase buildRootRoute(List<PreviewTab> tabs) {
  return ShellRoute(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => NotSelectedTabScreen(),
        routes: _buildRoutesForTabs(tabs),
      ),
    ],
    builder: (context, state, child) {
      return TabsRoot(tabs: tabs, navigator: child);
    },
  );
}

/// Recursively builds routes from tabs with the given path prefix.
List<RouteBase> _buildRoutesForTabs(List<PreviewTab> tabs) {
  final routes = <RouteBase>[];

  for (final tab in tabs) {
    final path = RouteHelper.getPathFromTitle(tab.title);

    if (tab is FolderTab) {
      // Create nested routes for folder tabs
      final childRoutes = _buildRoutesForTabs(tab.tabs);
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
