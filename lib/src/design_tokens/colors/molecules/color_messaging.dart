import 'package:flutter/material.dart';
import 'package:flutter_design_extension/src/design_tokens/colors/atoms/color_atoms.dart';

abstract class ColorMessaging {
  final Color error;
  final Color errorLight;
  final Color success;
  final Color successLight;
  final Color warning;
  final Color warningLight;
  final Color information;
  final Color informationLight;

  ColorMessaging({
    required this.error,
    required this.errorLight,
    required this.success,
    required this.successLight,
    required this.warning,
    required this.warningLight,
    required this.information,
    required this.informationLight,
  });
}

class ColorMessagingLight extends ColorMessaging {
  ColorMessagingLight()
      : super(
          error: ColorAtoms.red400,
          errorLight: ColorAtoms.red100,
          success: ColorAtoms.green800,
          successLight: ColorAtoms.green100,
          warning: ColorAtoms.orange350,
          warningLight: ColorAtoms.orange50,
          information: ColorAtoms.blue200,
          informationLight: ColorAtoms.blue100,
        );
}

class ColorMessagingDark extends ColorMessaging {
  ColorMessagingDark()
      : super(
          error: ColorAtoms.red400,
          errorLight: ColorAtoms.red100,
          success: ColorAtoms.green800,
          successLight: ColorAtoms.green100,
          warning: ColorAtoms.orange350,
          warningLight: ColorAtoms.orange50,
          information: ColorAtoms.blue200,
          informationLight: ColorAtoms.blue100,
        );
}
