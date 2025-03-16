import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class PreviewWidget extends StatelessWidget {
  const PreviewWidget({super.key, required this.builder, this.sidebarBuilder, this.listenable});

  final Listenable? listenable;
  final WidgetBuilder builder;
  final WidgetBuilder? sidebarBuilder;

  @override
  Widget build(BuildContext context) {
    if (listenable != null) {
      return ListenableBuilder(
        listenable: listenable!,
        builder: (context, _) =>  _PreviewDesktop(builder: builder, sidebarBuilder: sidebarBuilder),
      );
    }

    return _PreviewDesktop(builder: builder, sidebarBuilder: sidebarBuilder);
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
                left: BorderSide(color: context.colors.foreground.withValues(alpha: .12)),
              ),
            ),
            child: SizedBox(width: 250, height: double.infinity, child: sidebarBuilder!(context)),
          ),
      ],
    );
  }
}
