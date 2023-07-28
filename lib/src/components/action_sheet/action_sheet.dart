import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_extension/src/utils/context_extension.dart';

class DesignActionSheet {
  static void show(
    BuildContext context, {
    String? title,
    String? message,
    required List<DesignSheetAction> actions,
    bool showCancel = true,
    String cancelTitle = "Cancel",
    VoidCallback? onCancelTapped,
  }) {
    final theme = context.theme;
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: title == null
            ? null
            : Text(
                title,
                style: theme.textStyles.heading3_700.copyWith(
                  color: theme.colors.neutral.black,
                ),
              ),
        message: message == null
            ? null
            : Text(
                message,
                style: theme.textStyles.paragraph_400.copyWith(
                  color: theme.colors.neutral.black,
                ),
              ),
        cancelButton: showCancel
            ? Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () {
                    if (onCancelTapped != null) {
                      onCancelTapped();
                    }
                    Navigator.pop(context, true);
                  },
                  child: SizedBox(
                    height: 45,
                    child: Center(
                      child: Text(
                        cancelTitle,
                        style: theme.textStyles.paragraph_400.copyWith(
                          color: theme.colors.brand.main,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : null,
        actions: actions
            .map(
              (e) => CupertinoActionSheetAction(
                isDefaultAction: e.isDefaultAction,
                isDestructiveAction: e.isDestructiveAction,
                onPressed: () {
                  if (e.onPressed != null) {
                    e.onPressed!();
                  }
                  Navigator.pop(context, true);
                },
                child: Text(
                  e.title,
                  style: (e.isDefaultAction
                          ? theme.textStyles.paragraph_700
                          : theme.textStyles.paragraph_400)
                      .copyWith(
                    color: e.isDestructiveAction
                        ? theme.colors.messaging.error
                        : theme.colors.brand.main,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class DesignSheetAction {
  /// The callback that is called when the button is tapped.
  ///
  /// This attribute must not be null.
  final VoidCallback? onPressed;

  /// Whether this action is the default choice in the action sheet.
  ///
  /// Default buttons have bold text.
  final bool isDefaultAction;

  /// Whether this action might change or delete data.
  ///
  /// Destructive buttons have red text.
  final bool isDestructiveAction;

  /// The widget below this widget in the tree.
  ///
  /// Typically a [Text] widget.
  final String title;
  DesignSheetAction({
    required this.title,
    this.isDefaultAction = false,
    this.isDestructiveAction = false,
    this.onPressed,
  });
}
