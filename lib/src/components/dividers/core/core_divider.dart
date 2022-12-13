import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter_design_extension/src/components/dividers/types/design_divider_orientation.dart';
import 'package:flutter_design_extension/src/components/dividers/types/design_divider_size.dart';
import 'package:flutter/material.dart';

/// Core divider which contains the entire logic for creating the dividers.
class CoreDivider extends StatelessWidget {
  final DesignDividerSize dividerSize;
  final double spacing;
  final Color? color;
  final double? startIndent;
  final double? endIndent;
  final DesignDividerOrientation orientation;

  const CoreDivider({
    required this.dividerSize,
    required this.orientation,
    Key? key,
    this.spacing = 0,
    this.color,
    this.startIndent = 0,
    this.endIndent = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return orientation == DesignDividerOrientation.vertical
        ? VerticalDivider(
            key: key,
            width: spacing,
            thickness: dividerSize.height,
            color: color ?? theme.colors.neutral.gray05,
            indent: startIndent,
            endIndent: endIndent,
          )
        : Divider(
            key: key,
            height: spacing,
            thickness: dividerSize.height,
            color: color ?? theme.colors.neutral.gray05,
            indent: startIndent,
            endIndent: endIndent,
          );
  }
}
