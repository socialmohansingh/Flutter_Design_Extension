import 'package:flutter/material.dart';
import 'package:flutter_design_extension/src/design_tokens/colors/atoms/color_atoms.dart';

abstract class ColorNeutral {
  final Color black;
  final Color gray50;
  final Color gray40;
  final Color gray20;
  final Color gray10;
  final Color gray05;
  final Color white;
  final Color transparent;
  ColorNeutral({
    required this.black,
    required this.gray50,
    required this.gray40,
    required this.gray20,
    required this.gray10,
    required this.gray05,
    required this.transparent,
    required this.white,
  });
}

class ColorNeutralLight extends ColorNeutral {
  ColorNeutralLight()
      : super(
          black: ColorAtoms.black,
          gray50: ColorAtoms.gray50,
          gray40: ColorAtoms.gray40,
          gray20: ColorAtoms.gray20,
          gray10: ColorAtoms.gray10,
          gray05: ColorAtoms.gray05,
          white: ColorAtoms.white,
          transparent: ColorAtoms.transparent,
        );
}

class ColorNeutralDark extends ColorNeutral {
  ColorNeutralDark()
      : super(
          black: ColorAtoms.white,
          gray50: ColorAtoms.gray05,
          gray40: ColorAtoms.gray10,
          gray20: ColorAtoms.gray20,
          gray10: ColorAtoms.gray40,
          gray05: ColorAtoms.gray50,
          white: ColorAtoms.black,
          transparent: ColorAtoms.transparent,
        );
}
