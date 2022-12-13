import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter/material.dart';

class DesignTextFieldSuffix extends StatelessWidget {
  final Function()? onPressed;
  final IconData iconData;

  const DesignTextFieldSuffix(
      {required this.iconData, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return IconButton(
      onPressed: onPressed,
      splashColor: theme.colors.neutral.transparent,
      highlightColor: theme.colors.neutral.transparent,
      padding: EdgeInsets.only(right: theme.spacings.spacing16),
      icon: Icon(iconData,
          color: theme.colors.neutral.gray50, size: theme.spacings.spacing24),
    );
  }
}
