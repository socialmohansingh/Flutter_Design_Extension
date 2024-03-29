import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:example/src/utility_widgets/layout/widget_showcase_screen.dart';
import 'package:flutter/material.dart';

class DialogShowcaseScreen extends StatelessWidget {
  const DialogShowcaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetShowcaseScreen(
      title: "Dialogs",
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () =>
                  showConfirmationDialogWithOnlyPrimaryCTA(context),
              child: const Text("Confirmation Dialog w/ 1 CTA"),
            ),
            ElevatedButton(
              onPressed: () => showConfirmationDialogWithBothCTA(context),
              child: const Text("Show Confirmation Dialog w/ 2 CTA"),
            ),
            ElevatedButton(
              onPressed: () => showLongOneCTADialog(context),
              child: const Text("Show Long CTA Dialog w/ 1 CTA"),
            ),
            ElevatedButton(
              onPressed: () => showLongTwoCTADialog(context),
              child: const Text("Show Long CTA Dialog w/ 2 CTA"),
            ),
            ElevatedButton(
              onPressed: () => showActionSheet(context),
              child: const Text("Show Action sheet"),
            ),
            ElevatedButton(
              onPressed: () => showActionSheetTitleOnly(context),
              child: const Text("Show Action sheet title only"),
            ),
            ElevatedButton(
              onPressed: () => showActionSheetMessageOnly(context),
              child: const Text("Show Action sheet message only"),
            ),
            ElevatedButton(
              onPressed: () => showActionSheetNoTitleAndMessage(context),
              child: const Text("Show Action sheet without title and message"),
            ),
          ],
        ),
      ),
    );
  }

  void showActionSheet(final BuildContext context) {
    DesignActionSheet.show(
      context,
      title: "Action Title",
      message: "Action message",
      actions: [
        DesignSheetAction(
          title: "Sheet action",
        ),
        DesignSheetAction(
          title: "Default action",
          isDefaultAction: true,
        ),
        DesignSheetAction(
          title: "Destructive action",
          isDestructiveAction: true,
        ),
      ],
    );
  }

  void showActionSheetNoTitleAndMessage(final BuildContext context) {
    DesignActionSheet.show(
      context,
      actions: [
        DesignSheetAction(
          title: "Sheet action",
        ),
        DesignSheetAction(
          title: "Default action",
          isDefaultAction: true,
        ),
        DesignSheetAction(
          title: "Destructive action",
          isDestructiveAction: true,
        ),
      ],
    );
  }

  void showActionSheetTitleOnly(final BuildContext context) {
    DesignActionSheet.show(
      context,
      title: "Action Title",
      actions: [
        DesignSheetAction(
          title: "Sheet action",
        ),
        DesignSheetAction(
          title: "Default action",
          isDefaultAction: true,
        ),
        DesignSheetAction(
          title: "Destructive action",
          isDestructiveAction: true,
        ),
      ],
    );
  }

  void showActionSheetMessageOnly(final BuildContext context) {
    DesignActionSheet.show(
      context,
      message: "Action message",
      actions: [
        DesignSheetAction(
          title: "Sheet action",
        ),
        DesignSheetAction(
          title: "Default action",
          isDefaultAction: true,
        ),
        DesignSheetAction(
          title: "Destructive action",
          isDestructiveAction: true,
        ),
      ],
    );
  }

  void showConfirmationDialogWithOnlyPrimaryCTA(final BuildContext context) {
    DesignConfirmationDialog.show(
      context: context,
      title: "Are you sure you want to exit?",
      subtitle: "All progress will be lost.",
      primaryActionText: "Confirm",
      barrierDismissible: true,
    );
  }

  void showConfirmationDialogWithBothCTA(final BuildContext context) {
    DesignConfirmationDialog.show(
      context: context,
      title: "Are you sure you want to exit?",
      subtitle: "All progress will be lost.",
      primaryActionText: "Confirm",
      secondaryActionText: "Cancel",
      onPressedPrimaryButton: () => {},
      onPressedSecondaryButton: () => Navigator.of(context).pop(),
      barrierDismissible: true,
    );
  }

  void showLongOneCTADialog(final BuildContext context) {
    DesignConfirmationDialog.show(
      context: context,
      title: "Are you sure you want to exit?",
      subtitle: "All progress will be lost.",
      primaryActionText: "Confirm",
      isLongCTA: true,
      barrierDismissible: true,
    );
  }

  void showLongTwoCTADialog(final BuildContext context) {
    DesignConfirmationDialog.show(
      context: context,
      title: "Are you sure you want to exit?",
      subtitle: "All progress will be lost.",
      primaryActionText: "Confirm",
      isLongCTA: true,
      barrierDismissible: true,
      secondaryActionText: "Cancel",
      onPressedPrimaryButton: () => {},
      onPressedSecondaryButton: () => Navigator.of(context).pop(),
    );
  }
}
