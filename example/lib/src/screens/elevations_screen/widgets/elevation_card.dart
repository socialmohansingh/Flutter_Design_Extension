import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter/material.dart';

const double _kCardHeight = 100;

class ElevationCard extends StatelessWidget {
  final String title;
  final BoxShadow boxShadow;

  const ElevationCard({
    required this.title,
    required this.boxShadow,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Container(
      decoration: BoxDecoration(
        boxShadow: [boxShadow],
        borderRadius: _getBorderRadius(theme.borderRadiuses.borderRadiusLarge),
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius:
              _getBorderRadius(theme.borderRadiuses.borderRadiusLarge),
        ),
        child: SizedBox(
            height: _kCardHeight,
            width: double.infinity,
            child: Center(
              child: Text(
                title,
                style: theme.textStyles.heading3_500,
              ),
            )),
      ),
    );
  }

  BorderRadiusGeometry _getBorderRadius(double radius) =>
      BorderRadius.circular(radius);
}
