import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:example/src/utility_widgets/layout/widget_showcase_screen.dart';
import 'package:flutter/material.dart';

class BottomSheetShowcaseScreen extends StatelessWidget {
  const BottomSheetShowcaseScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetShowcaseScreen(
      title: "Bottom Sheet",
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 200,
              child: DesignContainedButtonMedium(
                label: "Info Sheet",
                onPressed: () => DesignInfoBottomSheet.show(
                  context: context,
                  content: Padding(
                    padding: EdgeInsets.only(
                      left: context.theme.spacings.spacing16,
                      right: context.theme.spacings.spacing16,
                    ),
                    child: const SingleChildScrollView(
                      child: Text("something"),
                    ),
                  ),
                  title: 'Bottom sheet title',
                  subtitle: "This is sub title",
                  primaryActionButtonLabel: 'Confirm',
                  primaryActionButtonPressed: () => Navigator.pop(context),
                  secondaryActionButtonPressed: () => Navigator.pop(context),
                  secondaryActionButtonLabel: "Cancel",
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 200,
              child: DesignContainedButtonMedium(
                label: "Selection Sheet",
                onPressed: () => DesignSelectionBottomSheet.show(
                  isDismissible: true,
                  context: context,
                  content: SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        10,
                        (index) => ListTile(
                          title: Text("Option $index"),
                        ),
                      ),
                    ),
                  ),
                  title: 'Bottom sheet title',
                  primaryActionButtonLabel: 'Action',
                  primaryActionButtonPressed: () => Navigator.pop(context),
                  secondaryActionButtonPressed: () => Navigator.pop(context),
                  secondaryActionButtonLabel: "Cancel",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
