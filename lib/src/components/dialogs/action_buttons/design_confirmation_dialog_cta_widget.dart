import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter/material.dart';

/// This Widget will handle logic for the orientation of action buttons.
class DesignConfirmationDialogCTAWidget extends StatelessWidget {
  final Widget primaryActionWidget;
  final Widget? secondaryActionWidget;
  final bool isLongCTA;

  const DesignConfirmationDialogCTAWidget({
    required this.primaryActionWidget,
    required this.isLongCTA,
    this.secondaryActionWidget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLongCTA
        ? Column(
            key: key,
            children: [
              primaryActionWidget,
              if (secondaryActionWidget != null) ...{
                SizedBox(
                  height: context.theme.spacings.spacing16,
                ),
                secondaryActionWidget!,
              },
            ],
          )
        : Row(
            key: key,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (secondaryActionWidget != null) ...{
                secondaryActionWidget!,
                SizedBox(
                  width: context.theme.spacings.spacing16,
                ),
              },
              primaryActionWidget,
            ],
          );
  }
}
