import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter_design_extension/src/components/buttons/text_button/text_button_style.dart';
import 'package:flutter_design_extension/src/components/buttons/widgets/core_button_content_row.dart';
import 'package:flutter_design_extension/src/components/buttons/widgets/core_button_style.dart';
import 'package:flutter_design_extension/src/utils/material_state.dart';
import 'package:flutter/material.dart';

class CoreTextButton extends StatelessWidget {
  final String label;
  final double height;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final void Function()? onPressed;

  const CoreTextButton({
    required this.label,
    required this.height,
    this.leftIcon,
    this.rightIcon,
    this.onPressed,
    Key? key,
  })  : assert(
          !(leftIcon != null && rightIcon != null),
          'Please specify only one of the icons inside buttons.',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final materialStateColorMap = getTextButtonMaterialStateColorMap(theme);

    return SizedBox(
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: CoreButtonStyle(
          theme: theme,
          hasLeftIcon: leftIcon != null,
          hasRightIcon: rightIcon != null,
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) => resolveMaterialState(
              materialStateColorMap: materialStateColorMap,
              states: states,
            ).bgColor,
          ),
          foregroundColor: MaterialStateProperty.resolveWith(
            (states) => resolveMaterialState(
              materialStateColorMap: materialStateColorMap,
              states: states,
            ).fgColor,
          ),
        ),
        child: CoreButtonContentRow(
          label: label,
          leftIcon: leftIcon,
          rightIcon: rightIcon,
        ),
      ),
    );
  }
}
