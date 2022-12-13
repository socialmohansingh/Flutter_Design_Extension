import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter/material.dart';

class DesignTextFieldPrefix extends StatelessWidget {
  final IconData iconData;

  const DesignTextFieldPrefix({required this.iconData, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Padding(
      padding: EdgeInsets.only(left: theme.spacings.spacing16),
      child: Icon(iconData,
          color: theme.colors.neutral.gray50, size: theme.spacings.spacing24),
    );
  }
}
