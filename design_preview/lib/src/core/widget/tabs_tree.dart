import 'package:design_preview/src/core/router/route_handler.dart';
import 'package:design_preview/src/core/tab.dart';
import 'package:flutter/material.dart';

class TabsTree extends StatelessWidget {
  const TabsTree({
    super.key,
    required this.tabs,
    required this.routeHandler,
    this.pathPrefix = '',
    this.indentLevel = 0,
  });

  final RouteHandler routeHandler;
  final List<PreviewTab> tabs;
  final String pathPrefix;
  final int indentLevel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: tabs.map((tab) => _buildTabItem(context, tab)).toList(),
    );
  }

  Widget _buildTabItem(BuildContext context, PreviewTab tab) {
    final path = routeHandler.encodeTitleToPath(tab.title);
    final fullPath = pathPrefix.isEmpty ? path : '$pathPrefix/$path';

    if (tab is FolderTab) {
      return _FolderTabItem(
        routeHandler: routeHandler,
        folder: tab,
        pathPrefix: fullPath,
        indentLevel: indentLevel,
      );
    } else {
      return _LeafTabItem(
        routeHandler: routeHandler,
        tab: tab,
        path: fullPath,
        indentLevel: indentLevel,
      );
    }
  }
}

class _LeafTabItem extends StatelessWidget {
  const _LeafTabItem({
    required this.routeHandler,
    required this.tab,
    required this.path,
    required this.indentLevel,
  });

  final RouteHandler routeHandler;
  final PreviewTab tab;
  final String path;
  final int indentLevel;

  @override
  Widget build(BuildContext context) {
    final isActive = routeHandler.isPathActive(context, path);
    final colors = Theme.of(context).colorScheme;
    final typography = Theme.of(context).textTheme;

    return InkWell(
      hoverColor: colors.onSurface.withValues(alpha: .05),
      onTap: () {
        if (isActive) return;
        routeHandler.navigateTo(context, path);
      },
      borderRadius: BorderRadius.circular(2),
      child: Padding(
        padding: EdgeInsets.only(left: 12.0 * indentLevel, top: 6.0, bottom: 6.0),
        child: Row(
          children: [
            Icon(
              Icons.circle,
              size: 6,
              color: isActive ? colors.onSurface : Colors.transparent,
            ),
            const SizedBox(width: 6),
            Text(
              tab.title,
              style: typography.labelLarge?.copyWith(
                color: colors.onSurface.withValues(alpha: isActive ? 1 : 0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FolderTabItem extends StatefulWidget {
  const _FolderTabItem({
    required this.routeHandler,
    required this.folder,
    required this.pathPrefix,
    required this.indentLevel,
  });

  final RouteHandler routeHandler;
  final FolderTab folder;
  final String pathPrefix;
  final int indentLevel;

  @override
  State<_FolderTabItem> createState() => _FolderTabItemState();
}

class _FolderTabItemState extends State<_FolderTabItem> {
  bool _isExpanded = false;
  bool _handledManually = false;

  @override
  Widget build(BuildContext context) {
    // Check if this folder contains the active route
    final isParentOfActive = widget.routeHandler.isPathParentOfCurrent(context, widget.pathPrefix);

    // Auto-expand if this folder is a parent of the active route
    if (isParentOfActive && !_isExpanded && !_handledManually) {
      _isExpanded = true;
    }

    final colors = Theme.of(context).colorScheme;
    final typography = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
              _handledManually = true;
            });
          },
          borderRadius: BorderRadius.circular(2),
          hoverColor: colors.onSurface.withValues(alpha: .05),
          child: Padding(
            padding: EdgeInsets.only(left: 12.0 * widget.indentLevel),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
              child: Row(
                children: [
                  Icon(
                    _isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
                    size: 14,
                    color: colors.onSurface,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    widget.folder.title,
                    style: typography.labelLarge?.copyWith(color: colors.onSurface),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (_isExpanded && widget.folder.tabs.isNotEmpty)
          TabsTree(
            routeHandler: widget.routeHandler,
            tabs: widget.folder.tabs,
            pathPrefix: widget.pathPrefix,
            indentLevel: widget.indentLevel + 1,
          ),
      ],
    );
  }
}
