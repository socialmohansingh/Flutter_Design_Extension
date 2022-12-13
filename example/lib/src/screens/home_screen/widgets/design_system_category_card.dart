import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter/material.dart';

const double _kCardHeight = 100;

class DesignSystemCategoryCard extends StatelessWidget {
  final String title;
  final Widget child;

  const DesignSystemCategoryCard({
    required this.title,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: theme.spacings.spacing16),
      decoration: BoxDecoration(
        borderRadius: _getBorderRadius(context),
        boxShadow: [theme.elevations.elevationLow.getBoxShadow()],
      ),
      child: Card(
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        color: theme.colors.neutral.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: _getBorderRadius(context)),
        child: InkWell(
          splashColor: theme.colors.neutral.gray20,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => child),
          ),
          child: Center(
            child: SizedBox(
              height: _kCardHeight,
              child: Center(
                child: Text(title, style: theme.textStyles.heading2_700),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

BorderRadiusGeometry _getBorderRadius(BuildContext context) =>
    BorderRadius.circular(
      context.theme.borderRadiuses.borderRadiusMedium,
    );
