import 'package:flutter/material.dart';

/// DesignLoaderType for small and regular progress loader.
enum DesignLoaderType {
  small(
    size: Size(
      20.0,
      20.0,
    ),
    strokeWidth: 2.0,
  ),

  regular(
    size: Size(
      40.0,
      40.0,
    ),
    strokeWidth: 4.0,
  );

  /// [size] gives height and width of loader variants.
  final Size size;

  /// [strokeWidth] gives stokeWidth of loader variants.
  final double strokeWidth;

  const DesignLoaderType({
    required this.size,
    required this.strokeWidth,
  });
}
