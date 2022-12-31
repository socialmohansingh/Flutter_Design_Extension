import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter/material.dart';

class SpacingScreen extends StatelessWidget {
  const SpacingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final spacings = theme.spacings;

    final spacingsMap = {
      'spacing4': spacings.spacing4,
      'spacing8': spacings.spacing8,
      'spacing12': spacings.spacing12,
      'spacing16': spacings.spacing16,
      'spacing24': spacings.spacing24,
      'spacing32': spacings.spacing32,
      'spacing40': spacings.spacing40,
      'spacing48': spacings.spacing48,
      'spacing56': spacings.spacing56,
      'spacing64': spacings.spacing64,
      'spacing96': spacings.spacing96,
    };

    final spacingsList = spacingsMap.values.toList();
    final spacingsNameList = spacingsMap.keys.toList();

    return CustomScaffold(
      title: const Text('Spacings'),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: theme.spacings.spacing48,
          vertical: theme.spacings.spacing24,
        ),
        itemCount: spacingsMap.length,
        itemBuilder: (context, index) {
          final size = spacingsList[index];
          final name = spacingsNameList[index];

          return Padding(
            padding: EdgeInsets.only(bottom: theme.spacings.spacing24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: theme.textStyles.secondary_500,
                ),
                SizedBox(width: theme.spacings.spacing12),
                UnconstrainedBox(
                  child: Container(
                    height: size,
                    width: size,
                    color: theme.colors.neutral.black,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
