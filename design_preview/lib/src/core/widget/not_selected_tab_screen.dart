import 'package:uikit/uikit.dart';
import 'package:flutter/material.dart';

class NotSelectedTabScreen extends StatelessWidget {
  const NotSelectedTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Not Selected',
        style: context.typography.bodyLarge.copyWith(color: context.colors.foreground),
      ),
    );
  }
}
