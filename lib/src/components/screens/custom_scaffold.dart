import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final bool showThemeConfigActionItem;
  final bool closable;
  final Color? alternativeBackgroundColor;

  const CustomScaffold({
    required this.body,
    this.title = '',
    this.showThemeConfigActionItem = false,
    this.closable = false,
    super.key,
    this.alternativeBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Scaffold(
      backgroundColor: alternativeBackgroundColor ?? theme.colors.neutral.white,
      body: body,
    );
  }
}
