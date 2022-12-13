import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter/material.dart';

import 'snack_bar_variant_button.dart';

class TabbarView extends StatelessWidget {
  const TabbarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Column(
      children: [
        Center(
          child: Text(
            'Choose Variants',
            style: theme.textStyles.heading2_700,
          ),
        ),
        SizedBox(
          height: theme.spacings.spacing24,
        ),
        SnackBarVariantsButton(
          buttonColor: theme.colors.neutral.black,
          textLabel: 'Neutral Snackbar',
          variant: DesignSnackBarVariant.neutral,
        ),
        SizedBox(
          height: theme.spacings.spacing16,
        ),
        SnackBarVariantsButton(
          buttonColor: theme.colors.messaging.success,
          textLabel: 'Success Snackbar',
          variant: DesignSnackBarVariant.success,
        ),
        SizedBox(
          height: theme.spacings.spacing16,
        ),
        SnackBarVariantsButton(
          buttonColor: theme.colors.messaging.error,
          textLabel: 'Error Snackbar',
          variant: DesignSnackBarVariant.error,
        ),
        SizedBox(
          height: theme.spacings.spacing16,
        ),
        SnackBarVariantsButton(
          buttonColor: theme.colors.neutral.black,
          textLabel: 'Single line with action',
          variant: DesignSnackBarVariant.singleLineWithAction,
        ),
        SizedBox(
          height: theme.spacings.spacing16,
        ),
        SnackBarVariantsButton(
          buttonColor: theme.colors.neutral.black,
          textLabel: 'Multi-line with action',
          variant: DesignSnackBarVariant.multiLineWithAction,
        ),
        SizedBox(
          height: theme.spacings.spacing16,
        ),
      ],
    );
  }
}
