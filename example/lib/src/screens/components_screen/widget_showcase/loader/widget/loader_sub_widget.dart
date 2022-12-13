import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter/material.dart';

class LoaderSubWidget extends StatelessWidget {
  const LoaderSubWidget({
    required this.widgets,
    super.key,
  });

  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        widgets[0],
        SizedBox(
          width: theme.spacings.spacing24,
        ),
        widgets[1]
      ],
    );
  }
}
