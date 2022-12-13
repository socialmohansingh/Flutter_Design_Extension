import 'package:flutter/material.dart';

class FontFamilyTokens {
  static const String ltr = "Roboto";
  static const String rtl = "NotoSans";

  /// Helper function that returns the correct FontFamily
  /// based on [textDirection].
  static String getFontFamily({required TextDirection textDirection}) =>
      textDirection == TextDirection.ltr ? ltr : rtl;
}
