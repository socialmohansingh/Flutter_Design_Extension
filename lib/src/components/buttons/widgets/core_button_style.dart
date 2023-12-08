import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter/material.dart';

class CoreButtonStyle extends ButtonStyle {
  final DesignTokensThemeExtension theme;
  final bool hasLeftIcon; // adds padding in case of leftIcon present
  final bool hasRightIcon; // adds padding  in case of rightIcon present
  final MaterialStateProperty<TextStyle?>? textStyle;
  CoreButtonStyle({
    required this.theme,
    required MaterialStateProperty<Color?>? backgroundColor,
    required MaterialStateProperty<Color?>? foregroundColor,
    required this.hasLeftIcon,
    required this.hasRightIcon,
    MaterialStateProperty<BorderSide?>? side,
    this.textStyle,
  })  : assert(
          !(hasLeftIcon == true && hasRightIcon == true),
          'Please specify only one of the icons inside buttons.',
        ),
        super(
          padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(
              horizontal: theme.spacings.spacing16,
            ).copyWith(
              // in case of a present icon --> padding is lower on the icon's side
              left: hasLeftIcon == true ? theme.spacings.spacing12 : null,
              right: hasRightIcon == true ? theme.spacings.spacing12 : null,
            ),
          ),
          textStyle: textStyle ??
              MaterialStatePropertyAll(theme.textStyles.buttonText),
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          side: side,
          splashFactory: NoSplash.splashFactory,
          elevation: null,
          shadowColor:
              MaterialStatePropertyAll(theme.colors.neutral.transparent),
          surfaceTintColor:
              MaterialStatePropertyAll(theme.colors.neutral.transparent),
          overlayColor:
              MaterialStatePropertyAll(theme.colors.neutral.transparent),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                theme.borderRadiuses.borderRadiusSmall,
              ),
            ),
          ),
        );
}
