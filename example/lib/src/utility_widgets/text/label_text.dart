import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  final String title;

  const LabelText({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Text(
      title,
      style: theme.textStyles.secondary_400
          .copyWith(color: theme.colors.neutral.gray50),
    );
  }
}
