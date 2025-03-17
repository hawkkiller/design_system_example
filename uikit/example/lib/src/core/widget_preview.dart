import 'package:design_preview/design_preview.dart';
import 'package:example/src/core/theme_option.dart';
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class WidgetPreview extends StatelessWidget {
  const WidgetPreview({
    required this.builder,
    this.sidebarBuilder,
    this.listenable,
    this.theme,
    this.constraints,
    super.key,
  });

  final WidgetBuilder builder;
  final BoxConstraints? constraints;
  final ThemeData? theme;
  final WidgetBuilder? sidebarBuilder;
  final Listenable? listenable;

  @override
  Widget build(BuildContext context) {
    final optionTheme = theme ?? ThemeOptionInherited.of(context);
    return PreviewWidget(
      sidebarBuilder: sidebarBuilder,
      listenable: listenable,
      builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: optionTheme,
          home: Builder(
            builder: (context) {
              return Material(
                color: context.colors.background,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ConstrainedBox(
                      constraints: constraints ?? BoxConstraints(),
                      child: builder(context),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
