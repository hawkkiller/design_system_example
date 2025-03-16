import 'package:design_system/design_system.dart';
import 'package:example/src/core/router/routes_helper.dart';
import 'package:example/src/core/tab.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TabsTree extends StatelessWidget {
  const TabsTree({super.key, required this.tabs, this.pathPrefix = '', this.indentLevel = 0});

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
    final path = RouteHelper.getPathFromTitle(tab.title);
    final fullPath = pathPrefix.isEmpty ? path : '$pathPrefix/$path';

    if (tab is FolderTab) {
      return _FolderTabItem(folder: tab, pathPrefix: fullPath, indentLevel: indentLevel);
    } else {
      return _LeafTabItem(tab: tab, path: fullPath, indentLevel: indentLevel);
    }
  }
}

class _LeafTabItem extends StatelessWidget {
  const _LeafTabItem({required this.tab, required this.path, required this.indentLevel});

  final PreviewTab tab;
  final String path;
  final int indentLevel;

  @override
  Widget build(BuildContext context) {
    final isActive = RouteHelper.isPathActive(context, path);

    return InkWell(
      hoverColor: context.colors.foreground.withValues(alpha: .05),
      onTap: () {
        if (isActive) return;
        context.go('/$path');
      },
      borderRadius: BorderRadius.circular(2),
      child: Padding(
        padding: EdgeInsets.only(left: 12.0 * indentLevel, top: 6.0, bottom: 6.0),
        child: Row(
          children: [
            Icon(
              Icons.circle,
              size: 6,
              color: isActive ? context.colors.foreground : Colors.transparent,
            ),
            const SizedBox(width: 6),
            Text(
              tab.title,
              style: context.typography.labelLarge.copyWith(
                color: context.colors.foreground.withValues(alpha: isActive ? 1 : 0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FolderTabItem extends StatefulWidget {
  const _FolderTabItem({required this.folder, required this.pathPrefix, required this.indentLevel});

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
    final isParentOfActive = RouteHelper.isPathParentOfCurrent(context, widget.pathPrefix);

    // Auto-expand if this folder is a parent of the active route
    if (isParentOfActive && !_isExpanded && !_handledManually) {
      _isExpanded = true;
    }

    final isActive = RouteHelper.isPathActive(context, widget.pathPrefix);
    final highlightColor =
        isActive || isParentOfActive
            ? context.colors.primary
            : context.colors.foreground.withValues(alpha: 0.7);

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
          hoverColor: context.colors.foreground.withValues(alpha: .05),
          child: Padding(
            padding: EdgeInsets.only(left: 12.0 * widget.indentLevel),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
              child: Row(
                children: [
                  Icon(
                    _isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
                    size: 14,
                    color: highlightColor,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    widget.folder.title,
                    style: context.typography.labelLarge.copyWith(
                      color: highlightColor,
                      fontWeight:
                          (isActive || isParentOfActive) ? FontWeight.w500 : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (_isExpanded && widget.folder.tabs.isNotEmpty)
          TabsTree(
            tabs: widget.folder.tabs,
            pathPrefix: widget.pathPrefix,
            indentLevel: widget.indentLevel + 1,
          ),
      ],
    );
  }
}
