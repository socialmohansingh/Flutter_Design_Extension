import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter_design_extension/src/components/dialogs/action_buttons/design_confirmation_dialog_cta_widget.dart';
import 'package:flutter_design_extension/src/components/dialogs/action_buttons/dialog_cta_primary.dart';
import 'package:flutter_design_extension/src/components/dialogs/action_buttons/dialog_cta_secondary.dart';
import 'package:flutter/material.dart';

/// This widget will build our custom UI for the Dialog.
class DesignConfirmationDialogWidget extends StatelessWidget {
  final BuildContext context;
  final String title;
  final String subtitle;
  final String primaryActionText;
  final bool isLongCTA;
  final String? secondaryActionText;
  final Function()? onPressedPrimaryButton;
  final Function()? onPressedSecondaryButton;

  const DesignConfirmationDialogWidget({
    required this.context,
    required this.title,
    required this.subtitle,
    required this.primaryActionText,
    required this.isLongCTA,
    this.onPressedPrimaryButton,
    this.onPressedSecondaryButton,
    this.secondaryActionText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(
      onPressedSecondaryButton != null
          ? secondaryActionText != null
          : secondaryActionText == null,
      'onPressedSecondaryButton and secondaryActionText must be provide if either is non null',
    );
    final theme = context.theme;
    return Dialog(
      key: key,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(theme.spacings.spacing8),
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: theme.spacings.spacing16),
      child: Padding(
        padding: EdgeInsets.all(theme.spacings.spacing24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textStyles.heading3_700.copyWith(
                color: theme.colors.neutral.black,
              ),
            ),
            SizedBox(
              height: theme.spacings.spacing8,
            ),
            Text(
              subtitle,
              style: theme.textStyles.paragraph_400.copyWith(
                color: theme.colors.neutral.black,
              ),
            ),
            SizedBox(
              height: theme.spacings.spacing32,
            ),
            DesignConfirmationDialogCTAWidget(
              isLongCTA: isLongCTA,
              secondaryActionWidget: (secondaryActionText != null &&
                      onPressedSecondaryButton != null)
                  ? DialogCTASecondary(
                      onPressed: onPressedSecondaryButton!,
                      label: secondaryActionText!,
                      isLongCTA: isLongCTA,
                      key: UniqueKey(),
                    )
                  : null,
              primaryActionWidget: DialogCTAPrimary(
                onPressed:
                    onPressedPrimaryButton ?? () => Navigator.maybePop(context),
                label: primaryActionText,
                isLongCTA: isLongCTA,
                key: UniqueKey(),
              ),
              key: UniqueKey(),
            ),
          ],
        ),
      ),
    );
  }
}
