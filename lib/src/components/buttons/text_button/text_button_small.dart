import 'package:flutter_design_extension/src/components/buttons/text_button/core_text_button.dart';
import 'package:flutter_design_extension/src/components/buttons/types/button_size.dart';
import 'package:flutter/material.dart';

class DesignTextButtonSmall extends StatelessWidget {
  final DesignButtonSize _buttonSize;
  final String label;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final Widget? leftIconWidget;
  final Widget? rightIconWidget;
  final void Function()? onPressed;

  const DesignTextButtonSmall({
    required this.label,
    this.leftIcon,
    this.rightIcon,
    this.leftIconWidget,
    this.rightIconWidget,
    this.onPressed,
    super.key,
  }) : _buttonSize = DesignButtonSize.small;

  @override
  Widget build(BuildContext context) {
    return CoreTextButton(
      height: _buttonSize.height,
      label: label,
      onPressed: onPressed,
      leftIcon: leftIcon,
      rightIcon: rightIcon,
      leftIconWidget: leftIconWidget,
      rightIconWidget: rightIconWidget,
    );
  }
}
