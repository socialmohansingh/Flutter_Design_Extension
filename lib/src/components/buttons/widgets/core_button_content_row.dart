import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter/material.dart';

const double _kDefaultIconSize =
    16; // TODO: Update with Icon Size Tokens when available

class CoreButtonContentRow extends StatelessWidget {
  final String label;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final Widget? leftIconWidget;
  final Widget? rightIconWidget;
  final TextStyle? style;
  const CoreButtonContentRow({
    required this.label,
    required this.leftIcon,
    required this.rightIcon,
    this.leftIconWidget,
    this.rightIconWidget,
    this.style,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (leftIconWidget != null) leftIconWidget!,
        if (leftIcon != null) ...[
          Icon(leftIcon, size: _kDefaultIconSize),
          SizedBox(width: theme.spacings.spacing8),
        ],
        Text(
          label,
          style: style,
        ),
        if (rightIcon != null) ...[
          SizedBox(width: theme.spacings.spacing8),
          Icon(rightIcon, size: _kDefaultIconSize),
        ],
        if (rightIconWidget != null) rightIconWidget!,
      ],
    );
  }
}
