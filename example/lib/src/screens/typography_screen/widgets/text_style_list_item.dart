import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:example/src/util/showcase_extensions.dart';
import 'package:example/src/utility_widgets/text/label_text.dart';
import 'package:flutter/material.dart';

class TextStyleListItem extends StatelessWidget {
  final List<TextStyle> textStyles;
  final int index;

  const TextStyleListItem({
    Key? key,
    required this.textStyles,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textStyles = theme.textStyles.values;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabelText(title: '[${textStyles[index].debugLabel!}]'),
        Text(
          'Hey and welcome to Flutter Design!',
          style: textStyles[index],
        ),
        SizedBox(height: theme.spacings.spacing16),
      ],
    );
  }
}
