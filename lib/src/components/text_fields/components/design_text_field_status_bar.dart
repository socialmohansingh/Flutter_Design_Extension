import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter/material.dart';

class DesignTextFieldStatusBar extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final String text;

  const DesignTextFieldStatusBar(
      {required this.iconData,
      required this.color,
      required this.text,
      super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Row(
      children: [
        Icon(
          iconData,
          color: color,
          size: theme.spacings.spacing16,
        ),
        SizedBox(width: theme.spacings.spacing8),
        Expanded(
          child: Text(
            text,
            style: theme.textStyles.caption_400.copyWith(color: color),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
