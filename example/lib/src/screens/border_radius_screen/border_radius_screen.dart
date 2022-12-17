import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:example/src/screens/border_radius_screen/widgets/border_radius_card.dart';
import 'package:flutter/material.dart';

class BorderRadiusScreen extends StatelessWidget {
  const BorderRadiusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return CustomScaffold(
      title: 'Border Radius',
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: theme.spacings.spacing16,
            vertical: theme.spacings.spacing32,
          ),
          child: Column(
            children: [
              BorderRadiusCard(
                borderRadius: theme.borderRadiuses.borderRadiusZero,
                title: 'borderRadiusZero',
              ),
              SizedBox(height: theme.spacings.spacing12),
              BorderRadiusCard(
                borderRadius: theme.borderRadiuses.borderRadiusExtraSmall,
                title: 'borderRadiusExtraSmall',
              ),
              SizedBox(height: theme.spacings.spacing12),
              BorderRadiusCard(
                borderRadius: theme.borderRadiuses.borderRadiusSmall,
                title: 'borderRadiusSmall',
              ),
              SizedBox(height: theme.spacings.spacing12),
              BorderRadiusCard(
                borderRadius: theme.borderRadiuses.borderRadiusMedium,
                title: 'borderRadiusMedium',
              ),
              SizedBox(height: theme.spacings.spacing12),
              BorderRadiusCard(
                borderRadius: theme.borderRadiuses.borderRadiusLarge,
                title: 'borderRadiusLarge',
              ),
              SizedBox(height: theme.spacings.spacing12),
              BorderRadiusCard(
                borderRadius: theme.borderRadiuses.borderRadiusExtraLarge,
                title: 'borderRadiusExtraLarge',
              ),
              SizedBox(height: theme.spacings.spacing12),
            ],
          ),
        ),
      ),
    );
  }
}
