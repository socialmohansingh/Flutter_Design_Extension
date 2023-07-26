import 'package:flutter_design_extension/src/components/buttons/outlined_button/core_outlined_button.dart';
import 'package:flutter_design_extension/src/components/buttons/types/button_size.dart';
import 'package:flutter/material.dart';

class DesignOutlinedButtonMedium extends StatelessWidget {
  final DesignButtonSize _buttonSize;
  final String label;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final Widget? leftIconWidget;
  final Widget? rightIconWidget;
  final void Function()? onPressed;

  const DesignOutlinedButtonMedium({
    required this.label,
    this.leftIcon,
    this.rightIcon,
    this.onPressed,
    this.leftIconWidget,
    this.rightIconWidget,
    super.key,
  }) : _buttonSize = DesignButtonSize.medium;

  @override
  Widget build(BuildContext context) {
    return CoreOutlinedButton(
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
