import 'package:flutter/material.dart';

class PreviewWidget extends StatelessWidget {
  const PreviewWidget({
    super.key,
    required this.builder,
    this.sidebarBuilder,
    this.listenable,
  });

  final WidgetBuilder builder;
  final WidgetBuilder? sidebarBuilder;
  final Listenable? listenable;

  @override
  Widget build(BuildContext context) {
    Widget widget;

    if (listenable != null) {
      widget = ListenableBuilder(
        listenable: listenable!,
        builder: (context, _) => _PreviewDesktop(builder: builder, sidebarBuilder: sidebarBuilder),
      );
    } else {
      widget = _PreviewDesktop(builder: builder, sidebarBuilder: sidebarBuilder);
    }

    return widget;
  }
}

class _PreviewDesktop extends StatelessWidget {
  const _PreviewDesktop({required this.builder, this.sidebarBuilder});

  final WidgetBuilder builder;
  final WidgetBuilder? sidebarBuilder;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Center(child: builder(context))),
        if (sidebarBuilder != null)
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Theme.of(context).colorScheme.onSurface.withValues(alpha: .12),
                ),
              ),
            ),
            child: SizedBox(width: 250, height: double.infinity, child: sidebarBuilder!(context)),
          ),
      ],
    );
  }
}
