import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter/material.dart';

abstract class ThemeConfigState {}

class ThemeConfigInitialized extends ThemeConfigState {
  final TextDirection textDirection;
  final Brand brand;

  ThemeConfigInitialized({required this.textDirection, required this.brand});
}
