import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget title;
  final bool centerTitle;
  final double elevation;
  final Widget body;
  final Color? alternativeBackgroundColor;
  final Widget? leading;
  final List<Widget> actions;
  final PreferredSizeWidget? customAppBar;
  final Widget? floatingActionButton;

  const CustomScaffold({
    required this.body,
    this.elevation = 0.5,
    this.centerTitle = true,
    this.leading,
    this.actions = const [],
    this.title = const Text(''),
    this.alternativeBackgroundColor,
    this.customAppBar,
    this.floatingActionButton,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: alternativeBackgroundColor ??
            theme.colors.brand.background ??
            theme.colors.neutral.white,
        body: body,
        appBar: customAppBar ??
            AppBar(
              elevation: elevation,
              centerTitle: centerTitle,
              foregroundColor: theme.colors.brand.background != null
                  ? theme.colors.brand.main
                  : theme.colors.neutral.white,
              backgroundColor:
                  theme.colors.brand.background ?? theme.colors.brand.main,
              title: title,
              leading: leading,
              actions: actions,
            ),
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}
