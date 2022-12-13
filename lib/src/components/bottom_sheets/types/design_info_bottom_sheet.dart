import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter_design_extension/src/components/bottom_sheets/core/design_core_bottom_sheet.dart';
import 'package:flutter/material.dart';

/// This helper class provides an Info Bottom Sheet with a [title], [subtitle]
/// (optional), child & two CTA buttons. Primary button is created using
/// [DesignContainedButtonLarge] and secondary button (optional) is created
/// using [DesignTextButtonLarge].
class DesignInfoBottomSheet {
  /// Function called to show the bottom sheet dialog.
  /// by default and prevents dismissing bottom sheet by tapping on the barrier.
  ///
  /// [BuildContext] required to show bottom sheet
  /// [content] contains the child to show between header and footer
  /// [title] contains the title for header for bottom sheet
  /// [subtitle] Optional, contains the subtitle for header for bottom sheet
  /// [primaryActionButtonLabel] contains label for primary action button in footer
  /// [primaryActionButtonPressed] called when primary action button in footer is
  /// pressed
  /// [secondaryActionButtonPressed] Optional, contains label for secondary action
  /// button in footer
  /// [secondaryActionButtonPressed] Optional, called when secondary action button in
  /// footer is pressed
  /// [isDismissible] contains flag to make bottom sheet dismissible by tapping
  /// on barrier, true by default
  DesignInfoBottomSheet._();

  static Future<T?> show<T>({
    required final BuildContext context,
    final Widget? content,
    final bool isDismissible = true,
    final String? title,
    final String? primaryActionButtonLabel,
    final Function()? primaryActionButtonPressed,
    final String? subtitle,
    final String? secondaryActionButtonLabel,
    final Function()? secondaryActionButtonPressed,
    Key? key,
  }) {
    final theme = context.theme;
    return DesignCoreBottomSheet.show(
      key: key,
      context: context,
      isDismissible: isDismissible,
      content: content,
      primaryActionButtonPressed: primaryActionButtonPressed,
      primaryActionButtonLabel: primaryActionButtonLabel,
      secondaryActionButtonLabel: secondaryActionButtonLabel,
      secondaryActionButtonPressed: secondaryActionButtonPressed,
      header: (title != null || subtitle != null)
          ? Padding(
              padding: EdgeInsets.only(
                left: theme.spacings.spacing16,
                right: theme.spacings.spacing16,
                top: theme.spacings.spacing16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null) ...{
                    Text(
                      title,
                      style: theme.textStyles.heading3_700.copyWith(
                        color: theme.colors.neutral.black,
                      ),
                    ),
                    SizedBox(
                      height: theme.spacings.spacing4,
                    ),
                  },
                  if (subtitle != null)
                    Text(
                      subtitle,
                      style: theme.textStyles.paragraph_400.copyWith(
                        color: theme.colors.neutral.black,
                      ),
                    ),
                  if (content == null) ...{
                    SizedBox(
                      height: theme.spacings.spacing16,
                    ),
                  }
                ],
              ),
            )
          : SizedBox(
              height: theme.spacings.spacing16,
            ),
    );
  }
}
