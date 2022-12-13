import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter/material.dart';

class BorderRadiusCard extends StatelessWidget {
  final double borderRadius;
  final String title;

  const BorderRadiusCard({
    required this.borderRadius,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: _getBorderRadius(borderRadius),
      ),
      child: SizedBox(
          height: 100,
          width: double.infinity,
          child: Center(
            child: Text(
              title,
              style: theme.textStyles.heading3_500,
            ),
          )),
    );
  }

  BorderRadiusGeometry _getBorderRadius(double radius) =>
      BorderRadius.circular(radius);
}
