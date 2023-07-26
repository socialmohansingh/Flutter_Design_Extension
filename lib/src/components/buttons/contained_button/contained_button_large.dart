import 'package:flutter_design_extension/src/components/buttons/contained_button/core_contained_button.dart';
import 'package:flutter_design_extension/src/components/buttons/types/button_size.dart';
import 'package:flutter/material.dart';

class DesignContainedButtonLarge extends StatelessWidget {
  final DesignButtonSize _buttonSize;
  final String label;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final Widget? leftIconWidget;
  final Widget? rightIconWidget;
  final void Function()? onPressed;

  const DesignContainedButtonLarge({
    required this.label,
    this.leftIcon,
    this.rightIcon,
    this.onPressed,
    this.leftIconWidget,
    this.rightIconWidget,
    super.key,
  }) : _buttonSize = DesignButtonSize.large;

  @override
  Widget build(BuildContext context) {
    return CoreContainedButton(
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
