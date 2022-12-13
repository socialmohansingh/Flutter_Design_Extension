import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter_design_extension/src/components/buttons/widgets/core_button_content_row.dart';
import 'package:flutter_design_extension/src/components/buttons/outlined_button/outlined_button_style.dart';
import 'package:flutter_design_extension/src/components/buttons/widgets/core_button_style.dart';
import 'package:flutter_design_extension/src/utils/material_state.dart';
import 'package:flutter/material.dart';

class CoreOutlinedButton extends StatelessWidget {
  final String label;
  final double height;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final void Function()? onPressed;

  const CoreOutlinedButton({
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
    final materialStateColorMap = getOutlinedButtonMaterialStateColorMap(theme);

    return SizedBox(
      height: height,
      child: OutlinedButton(
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
          side: MaterialStateProperty.resolveWith(
            (states) => BorderSide(
              color: resolveMaterialState(
                materialStateColorMap: materialStateColorMap,
                states: states,
              ).borderColor,
              width: 1, // TODO: add border width token when implemented
              style: BorderStyle.solid,
            ),
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
