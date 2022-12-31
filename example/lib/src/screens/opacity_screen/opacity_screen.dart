import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:example/src/utility_widgets/layout/colors_section.dart';
import 'package:flutter/material.dart';

class OpacityScreen extends StatelessWidget {
  const OpacityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colors = theme.colors;
    final opacities = theme.opacities;
    final opacityColors = {
      'opacity100': colors.interaction.main.withOpacity(opacities.opacity100),
      'opacity80': colors.interaction.main.withOpacity(opacities.opacity80),
      'opacity50': colors.interaction.main.withOpacity(opacities.opacity50),
      'opacity30': colors.interaction.main.withOpacity(opacities.opacity30),
      'opacity24': colors.interaction.main.withOpacity(opacities.opacity24),
      'opacity15': colors.interaction.main.withOpacity(opacities.opacity15),
      'opacity10': colors.interaction.main.withOpacity(opacities.opacity10),
      'opacity0': colors.interaction.main.withOpacity(opacities.opacity0),
    };

    return CustomScaffold(
      title: const Text('Opacity'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: theme.spacings.spacing16,
            vertical: theme.spacings.spacing24,
          ),
          child: ColorsSection(
            title: 'Opacities',
            colors: opacityColors.values.toList(),
            colorTitles: opacityColors.keys.toList(),
            childAspectRatio: 1,
            maxCrossAxisExtent: 200,
          ),
        ),
      ),
    );
  }
}
