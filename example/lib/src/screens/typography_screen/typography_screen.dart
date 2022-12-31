import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:example/src/screens/typography_screen/widgets/text_style_list_item.dart';
import 'package:example/src/util/showcase_extensions.dart';
import 'package:flutter/material.dart';

class TypographyScreen extends StatelessWidget {
  const TypographyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textStyles = theme.textStyles.values;

    return CustomScaffold(
      title: const Text('Typography'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: theme.spacings.spacing16),
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: theme.spacings.spacing24),
          itemCount: textStyles.length,
          itemBuilder: (context, index) => TextStyleListItem(
            textStyles: textStyles,
            index: index,
          ),
        ),
      ),
    );
  }
}
