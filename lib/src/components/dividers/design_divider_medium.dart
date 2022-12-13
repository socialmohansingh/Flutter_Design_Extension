import 'package:flutter_design_extension/src/components/dividers/core/core_divider.dart';
import 'package:flutter_design_extension/src/components/dividers/types/design_divider_orientation.dart';
import 'package:flutter_design_extension/src/components/dividers/types/design_divider_size.dart';
import 'package:flutter/material.dart';

/// Medium Divider with size [DesignDividerSize.medium]. It uses [ColorNeutral]'s 'gray05' as background color.
class DesignDividerMedium extends StatelessWidget {
  /// Optional: This field adds a margin between the widget above and below it,
  /// in case of [DesignDividerOrientation.horizontal]. In case of
  /// [DesignDividerOrientation.vertical] divider, it adds a margin between
  /// left and right component. It is set by default to 0.
  ///
  /// For [DesignDividerOrientation.vertical], ensure to wrap the widget in
  /// [IntrinsicHeight], [SizedBox] or a [Container] to provide a height.
  final double spacing;

  /// Optional: This fields overrides the [ColorNeutral]'s 'gray05' as background color which is used by default
  final Color? color;

  /// Optional: This fields provide start indent (margin)
  final double? startIndent;

  /// Optional: This fields provide end indent (margin)
  final double? endIndent;

  /// Optional: This fields provide [DesignDividerOrientation].
  final DesignDividerOrientation orientation;

  const DesignDividerMedium({
    Key? key,
    this.color,
    this.spacing = 0,
    this.startIndent = 0,
    this.endIndent = 0,
    this.orientation = DesignDividerOrientation.horizontal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CoreDivider(
      key: key,
      dividerSize: DesignDividerSize.medium,
      spacing: spacing,
      color: color,
      startIndent: startIndent,
      endIndent: endIndent,
      orientation: orientation,
    );
  }
}
