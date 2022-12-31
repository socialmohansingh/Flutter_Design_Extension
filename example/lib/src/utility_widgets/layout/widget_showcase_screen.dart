import 'package:flutter/material.dart';
import 'package:flutter_design_extension/flutter_design_extension.dart';

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
      title: Text(title),
      body: child,
      alternativeBackgroundColor: alternativeBackgroundColor,
    );
  }
}
