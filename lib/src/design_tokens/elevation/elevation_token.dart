import 'package:flutter/material.dart';

class ElevationToken {
  final double xOffset;
  final double yOffset;
  final double blurRadius;
  final double spreadRadius;
  final double opacity;
  final Color color;

  ElevationToken({
    required this.xOffset,
    required this.yOffset,
    required this.blurRadius,
    required this.spreadRadius,
    required this.opacity,
    required this.color,
  });

  /// Function that returns a [BoxShadow] with current [ElevationToken] values.
  BoxShadow getBoxShadow() => BoxShadow(
        color: color.withOpacity(opacity),
        blurRadius: blurRadius,
        spreadRadius: spreadRadius,
        offset: Offset(xOffset, yOffset),
      );
}
