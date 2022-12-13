import 'package:flutter_design_extension/src/components/dialogs/core/design_confirmation_dialog_widget.dart';
import 'package:flutter/material.dart';

/// Displays a Material dialog above the current contents of the app, with
/// Material entrance and exit animations, modal barrier color, and modal
/// barrier behavior (dialog is non-dismissible (by default) with a tap on the
/// barrier).
class DesignConfirmationDialog {
  /// This function takes a [BuildContext] required to display a [Dialog]. There
  /// are two text fields [title] & [subtitle], both are mandatory. The
  /// [primaryActionText] will be displayed on a [ElevatedButton] and
  /// [secondaryActionText] will be a [TextButton]. [onPressedPrimaryButton] &
  /// [onPressedSecondaryButton] functions will be triggered on pressing primary
  /// & secondary button respectively. The [isLongCTA] boolean (false, by default)
  /// will convert the show the primary & secondary buttons in a [Row] while setting
  /// it as true will display both buttons in a column. The [barrierDismissible]
  /// (false, by default), if set true, can be used to allow dialog to be
  /// dismissed with a tap on barrier.
  static Future<T?> show<T>({
    required final BuildContext context,
    required final String title,
    required final String subtitle,
    required final String primaryActionText,
    final String? secondaryActionText,
    final Function()? onPressedPrimaryButton,
    final Function()? onPressedSecondaryButton,
    final bool isLongCTA = false,
    final bool barrierDismissible = false,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => DesignConfirmationDialogWidget(
        context: context,
        title: title,
        primaryActionText: primaryActionText,
        secondaryActionText: secondaryActionText,
        subtitle: subtitle,
        isLongCTA: isLongCTA,
        onPressedPrimaryButton: onPressedPrimaryButton,
        onPressedSecondaryButton: onPressedSecondaryButton,
        key: UniqueKey(),
      ),
    );
  }
}
