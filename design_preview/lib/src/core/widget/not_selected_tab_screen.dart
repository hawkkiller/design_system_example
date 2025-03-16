import 'package:flutter/material.dart';

class NotSelectedTabScreen extends StatelessWidget {
  const NotSelectedTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Text(
        'Not Selected',
        style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurface),
      ),
    );
  }
}
