import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter_design_extension/src/components/bottom_sheets/widgets/bottom_sheet_handle_widget.dart';
import 'package:flutter/material.dart';

/// Core bottom sheet used for showing different types of bottom sheet
/// [DesignSelectionBottomSheet] & [DesignInfoBottomSheet].
class DesignCoreBottomSheet {
  /// Function called to show the bottom sheet dialog.
  /// by default and prevents dismissing bottom sheet by tapping on the barrier.
  ///
  /// [BuildContext] required to show bottom sheet
  /// [content] contains the child to show between header and footer
  /// [header] contains the header for bottom sheet
  /// [primaryActionButtonLabel] contains label for primary action button in footer
  /// [secondaryActionButtonPressed] Optional, contains label for secondary action
  /// button in footer
  /// [primaryActionButtonPressed] called when primary action button in footer is
  /// pressed
  /// [secondaryActionButtonPressed] Optional, called when secondary action button in
  /// footer is pressed
  /// [isDismissible] contains flag to make bottom sheet dismissible by tapping
  /// on barrier
  static Future<T?> show<T>({
    required final BuildContext context,
    required final bool isDismissible,
    final Widget? content,
    final Widget? header,
    final Function()? primaryActionButtonPressed,
    final String? primaryActionButtonLabel,
    final String? secondaryActionButtonLabel,
    final Function()? secondaryActionButtonPressed,
    Key? key,
  }) {
    assert(
      secondaryActionButtonPressed != null
          ? secondaryActionButtonLabel != null
          : secondaryActionButtonLabel == null,
      'secondaryActionButtonLabel and secondaryActionButtonPressed must be provide if either is non null',
    );
    assert(
      primaryActionButtonPressed != null
          ? primaryActionButtonLabel != null
          : primaryActionButtonLabel == null,
      'primaryActionButtonLabel and primaryActionButtonPressed must be provide if either is non null',
    );
    assert(
        primaryActionButtonLabel == null
            ? secondaryActionButtonLabel == null
            : true,
        "If primaryActionButton isn't available, we can't have secondaryAction button");
    final theme = context.theme;
    // TODO: fix the max height of bottom sheet after discussion with Augustin
    // TODO: Add elevation on scroll for header and footer
    return showModalBottomSheet<T>(
      isScrollControlled: true,
      isDismissible: isDismissible,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            theme.spacings.spacing16,
          ),
          topRight: Radius.circular(
            theme.spacings.spacing16,
          ),
        ),
      ),
      backgroundColor: theme.colors.neutral.white,
      builder: (BuildContext context) {
        return Column(
          key: key,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: theme.spacings.spacing8,
            ),
            const BottomSheetHandleWidget(),
            if (header != null) ...[
              header,
            ],
            if (content != null) ...[
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: theme.spacings.spacing16,
                    bottom: theme.spacings.spacing16,
                  ),
                  child: content,
                ),
              ),
            ],
            if (primaryActionButtonLabel != null ||
                secondaryActionButtonLabel != null) ...[
              Padding(
                padding: EdgeInsets.all(
                  theme.spacings.spacing16,
                ),
                child: Row(
                  children: [
                    if (secondaryActionButtonLabel != null) ...{
                      Expanded(
                        child: DesignTextButtonLarge(
                          label: secondaryActionButtonLabel,
                          onPressed: secondaryActionButtonPressed,
                        ),
                      ),
                      SizedBox(
                        width: theme.spacings.spacing8,
                      ),
                    },
                    if (primaryActionButtonLabel != null) ...{
                      Expanded(
                        child: DesignContainedButtonLarge(
                          label: primaryActionButtonLabel,
                          onPressed: primaryActionButtonPressed,
                        ),
                      ),
                    }
                  ],
                ),
              )
            ],
          ],
        );
      },
    );
  }

  DesignCoreBottomSheet._();
}
