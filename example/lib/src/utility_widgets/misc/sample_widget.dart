import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter/material.dart';

const double _kContainerSize = 200;

class SampleWidget extends StatelessWidget {
  const SampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Container(
      width: _kContainerSize,
      height: _kContainerSize,
      color: theme.colors.brand.main,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(theme.spacings.spacing12),
          child: Text(
            'Great place for showcasing the widgets you have built!',
            textAlign: TextAlign.center,
            style: theme.textStyles.secondary_500
                .copyWith(color: theme.colors.neutral.white),
          ),
        ),
      ),
    );
  }
}
