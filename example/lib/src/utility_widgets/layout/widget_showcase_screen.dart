import 'package:example/src/utility_widgets/scaffold/custom_scaffold.dart';
import 'package:flutter/material.dart';

/// This class should be extended when creating showcase screens
/// for specific widgets to promote same style across the example app.
class WidgetShowcaseScreen extends StatelessWidget {
  final String title;
  final Widget child;
  final bool closable;
  final Color? alternativeBackgroundColor;

  const WidgetShowcaseScreen({
    required this.title,
    required this.child,
    this.closable = true,
    this.alternativeBackgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: title,
      closable: closable,
      body: child,
      alternativeBackgroundColor: alternativeBackgroundColor,
    );
  }
}
