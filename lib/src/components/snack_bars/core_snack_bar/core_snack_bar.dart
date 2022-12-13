import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter/material.dart';

/// Creates a snack bar
class CoreSnackBar extends SnackBar {
  /// [snackBarText] as primary content of snackbar.

  final String snackBarText;

  /// [actionLabel] label of action. It must be provided when action based
  /// snackbar is used.
  final String actionLabel;

  /// [snackBarDuration] is default set to 5 seconds.
  /// Duration unit is default set to 'seconds' only.
  final int snackBarDuration;

  /// [theme] uses chardonnay design theme.
  final DesignTokensThemeExtension theme;

  /// [variant] is snackbar variant for snackbars types.
  /// Must be provided for using particular snack bar.
  ///
  /// Variants are:
  ///
  /// * [DesignSnackBarVariant.neutral]
  ///
  /// * [DesignSnackBarVariant.success]
  ///
  /// * [DesignSnackBarVariant.error]
  ///
  /// * [DesignSnackBarVariant.singleLineWithAction]
  ///
  /// * [DesignSnackBarVariant.multiLineWithAction]
  final DesignSnackBarVariant variant;

  /// [onPressedAction] expects snackbar callback function.
  /// It must be provided when action based snackbar is used.
  final VoidCallback? onPressedAction;

  CoreSnackBar({
    required this.theme,
    required this.snackBarText,
    required this.variant,
    required this.snackBarDuration,
    required this.actionLabel,
    this.onPressedAction,
    super.key,
  })  : assert(
          _hasVariantActionButton(variant: variant)
              ? (actionLabel != '' && onPressedAction != null)
              : true,
          '''actionLabel and onPressedAction must be provided 
             when action based snackbar is needed''',
        ),
        super(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: _snackBarColor(variant: variant, theme: theme),
          duration: Duration(
            seconds: snackBarDuration,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: theme.spacings.spacing16,
            vertical: theme.spacings.spacing16,
          ),
          content: Text(
            snackBarText,
            style: theme.textStyles.secondary_500,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              theme.spacings.spacing4,
            ),
          ),
          action: _hasVariantActionButton(variant: variant)
              ? SnackBarAction(
                  label: actionLabel,
                  textColor: theme.colors.neutral.white,
                  onPressed: onPressedAction!,
                )
              : null,
        );

  static Color _snackBarColor({
    required DesignSnackBarVariant variant,
    required DesignTokensThemeExtension theme,
  }) {
    switch (variant) {
      case DesignSnackBarVariant.success:
        return theme.colors.messaging.success;
      case DesignSnackBarVariant.error:
        return theme.colors.messaging.error;
      default:
        return theme.colors.neutral.black;
    }
  }

  static bool _hasVariantActionButton({
    required DesignSnackBarVariant variant,
  }) =>
      [
        DesignSnackBarVariant.singleLineWithAction,
        DesignSnackBarVariant.multiLineWithAction,
      ].contains(variant);
}
