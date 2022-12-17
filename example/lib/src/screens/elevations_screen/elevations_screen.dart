import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:example/src/screens/elevations_screen/widgets/elevation_card.dart';
import 'package:flutter/material.dart';

class ElevationsScreen extends StatelessWidget {
  const ElevationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return CustomScaffold(
      title: 'Elevation',
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: theme.spacings.spacing16,
            vertical: theme.spacings.spacing32,
          ),
          child: Column(
            children: [
              ElevationCard(
                boxShadow: theme.elevations.elevationLow.getBoxShadow(),
                title: 'elevationLow',
              ),
              SizedBox(height: theme.spacings.spacing48),
              ElevationCard(
                boxShadow: theme.elevations.elevationMedium.getBoxShadow(),
                title: 'elevationMedium',
              ),
              SizedBox(height: theme.spacings.spacing48),
              ElevationCard(
                boxShadow: theme.elevations.elevationHigh.getBoxShadow(),
                title: 'elevationHigh',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
