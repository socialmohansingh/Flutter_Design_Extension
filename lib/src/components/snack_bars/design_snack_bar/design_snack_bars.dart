import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter_design_extension/src/components/snack_bars/core_snack_bar/core_snack_bar.dart';
import 'package:flutter/material.dart';

/// Chardonnay snack bars class.
///
/// It is used for showing floating snackbars.
///
/// Contains neutral, success, error & action snackbars with possibility of
/// single-line, multi-line & long-text.
class DesignSnackBars {
  /// Shows the snack bar.
  ///
  /// This function takes [snackBarText] as primary content, [variant] uses
  /// chardonnay snackbars type, [context] for showing snackbar on particular
  /// screen, [duration] to display snackbar for amount of time, [actionLabel]
  /// is use for snackbar action title & [onPressedAction] is used for callback
  /// function for action based snackbar.
  static void show({
    required String snackBarText,
    required DesignSnackBarVariant variant,
    required BuildContext context,
    int duration = 5,
    String actionLabel = '',
    VoidCallback? onPressedAction,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      CoreSnackBar(
        snackBarText: snackBarText,
        actionLabel: actionLabel,
        snackBarDuration: duration,
        variant: variant,
        theme: context.theme,
        onPressedAction: onPressedAction,
      ),
    );
  }

  /// Clears the snack bar.
  static void clear({required BuildContext context}) {
    ScaffoldMessenger.of(context).clearSnackBars();
  }
}
