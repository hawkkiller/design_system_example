import 'package:flutter/material.dart';

class PreviewWidget extends StatelessWidget {
  const PreviewWidget({super.key, required this.builder, this.sidebarBuilder, this.listenable});

  final WidgetBuilder builder;
  final WidgetBuilder? sidebarBuilder;
  final Listenable? listenable;

  @override
  Widget build(BuildContext context) {
    if (listenable != null) {
      return ListenableBuilder(
        listenable: listenable!,
        builder: (context, _) {
          return _PreviewResponsive(builder: builder, sidebarBuilder: sidebarBuilder);
        },
      );
    }
    return _PreviewResponsive(builder: builder, sidebarBuilder: sidebarBuilder);
  }
}

class _PreviewResponsive extends StatelessWidget {
  const _PreviewResponsive({required this.builder, this.sidebarBuilder});

  final WidgetBuilder builder;
  final WidgetBuilder? sidebarBuilder;

  @override
  Widget build(BuildContext context) {
    return _PreviewLarge(builder: builder, sidebarBuilder: sidebarBuilder);
  }
}

class _PreviewLarge extends StatelessWidget {
  const _PreviewLarge({required this.builder, this.sidebarBuilder});

  final WidgetBuilder builder;
  final WidgetBuilder? sidebarBuilder;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: builder(context)),
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
