import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final Color? alternativeBackgroundColor;
  final Widget? leading;
  final List<Widget> actions;
  final PreferredSizeWidget? customAppBar;

  const CustomScaffold({
    required this.body,
    this.leading,
    this.actions = const [],
    this.title = '',
    this.alternativeBackgroundColor,
    this.customAppBar,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Scaffold(
      backgroundColor: alternativeBackgroundColor ??
          theme.colors.brand.background ??
          theme.colors.neutral.white,
      body: body,
      appBar: customAppBar ??
          AppBar(
            foregroundColor: theme.colors.brand.background != null
                ? theme.colors.brand.main
                : theme.colors.neutral.white,
            backgroundColor:
                theme.colors.brand.background ?? theme.colors.brand.main,
            title: Text(
              title,
              style: theme.textStyles.caption_400.copyWith(
                color: theme.colors.brand.main,
              ),
            ),
            leading: leading,
            actions: actions,
          ),
    );
  }
}
