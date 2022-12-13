import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter_design_extension/src/components/bottom_sheets/core/design_core_bottom_sheet.dart';
import 'package:flutter_design_extension/src/design_tokens/typography/atoms/font_size_tokens.dart';
import 'package:flutter/material.dart';

/// This helper class provides an Selection Bottom Sheet with a [title], child
/// & a primary CTA button. Primary button is created using
/// [DesignContainedButtonLarge].
class DesignSelectionBottomSheet {
  DesignSelectionBottomSheet._();

  /// Function called to show the bottom sheet dialog.
  /// by default and prevents dismissing bottom sheet by tapping on the barrier.
  ///
  /// [BuildContext] required to show bottom sheet
  /// [content] Optional, contains the child to show between header and footer
  /// [title] Optional, contains the title for header for bottom sheet
  /// [primaryActionButtonLabel] Optional, contains label for primary action button in footer
  /// [primaryActionButtonPressed] Optional, called when primary action button in footer is
  /// pressed
  /// [secondaryActionButtonPressed] Optional, contains label for secondary action
  /// button in footer
  /// [secondaryActionButtonPressed] Optional, called when secondary action button in
  /// footer is pressed
  /// [isDismissible] contains flag to make bottom sheet dismissible by tapping
  /// on barrier, true by default
  static Future<T?> show<T>({
    required final BuildContext context,
    final bool isDismissible = true,
    final Widget? content,
    final String? title,
    final String? primaryActionButtonLabel,
    final Function()? primaryActionButtonPressed,
    final String? secondaryActionButtonLabel,
    final Function()? secondaryActionButtonPressed,
    Key? key,
  }) {
    final theme = context.theme;
    // TODO: Replace header with VPM 1089
    return DesignCoreBottomSheet.show(
      context: context,
      key: key,
      content: content,
      isDismissible: isDismissible,
      primaryActionButtonPressed: primaryActionButtonPressed,
      primaryActionButtonLabel: primaryActionButtonLabel,
      secondaryActionButtonLabel: secondaryActionButtonLabel,
      secondaryActionButtonPressed: secondaryActionButtonPressed,
      header: title != null
          ? Padding(
              padding: EdgeInsets.only(
                top: theme.spacings.spacing24,
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: theme.textStyles.heading3_500.copyWith(
                        color: theme.colors.neutral.black,
                        fontSize: FontSizeTokens.fontSize16,
                      ),
                    ),
                    if (content == null) ...{
                      SizedBox(
                        height: theme.spacings.spacing16,
                      ),
                    }
                  ],
                ),
              ),
            )
          : null,
    );
  }
}
