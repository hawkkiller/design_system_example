import 'package:design_preview/design_preview.dart';
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class WidgetPreview extends StatelessWidget {
  const WidgetPreview({
    required this.builder,
    this.sidebarBuilder,
    this.listenable,
    this.theme,
    super.key,
  });

  final WidgetBuilder builder;
  final ThemeData? theme;
  final WidgetBuilder? sidebarBuilder;
  final Listenable? listenable;

  static ThemeData buildThemeData(Tokens tokens) {
    return ThemeData(
      extensions: [tokens],
      colorScheme: ColorScheme.fromSeed(
        seedColor: tokens.colors.primary,
        brightness: Brightness.light,
        dynamicSchemeVariant: DynamicSchemeVariant.monochrome,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PreviewWidget(
      sidebarBuilder: sidebarBuilder,
      listenable: listenable,
      builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme ?? buildThemeData(Defaults.tokens),
          home: Material(
            color: context.colors.background,
            child: Center(
              child: builder(context),
            ),
          ),
        );
      },
    );
  }
}
