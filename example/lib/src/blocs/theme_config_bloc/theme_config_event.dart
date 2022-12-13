import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter/material.dart';

abstract class ThemeConfigEvent {}

class UpdateThemeConfig extends ThemeConfigEvent {
  final TextDirection textDirection;
  final Brand brand;

  UpdateThemeConfig({required this.textDirection, required this.brand});
}
