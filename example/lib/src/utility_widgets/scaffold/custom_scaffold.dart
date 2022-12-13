import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:example/src/screens/theme_config_screen/theme_config_screen.dart';
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
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: !closable,
        title: Text(title),
        iconTheme: const IconThemeData(color: Colors.white),
        actionsIconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: theme.colors.brand.main,
        actions: [
          if (showThemeConfigActionItem)
            IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ThemeConfigScreen(),
                ),
              ),
              icon: const Icon(Icons.style),
            ),
          if (closable)
            IconButton(
              onPressed: () => Navigator.maybePop(context),
              icon: const Icon(Icons.close),
            ),
        ],
      ),
      body: body,
    );
  }
}
