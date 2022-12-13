import 'package:flutter_design_extension/src/utils/context_extension.dart';
import 'package:flutter/material.dart';

/// Class to show a handle on the bottom sheet
class BottomSheetHandleWidget extends StatelessWidget {
  final double width = 36;
  final double height = 4;

  const BottomSheetHandleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Align(
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(
            theme.borderRadiuses.borderRadiusExtraLarge,
          ),
        ),
        child: Container(
          color: theme.colors.neutral.gray40,
          width: width,
          height: height,
        ),
      ),
    );
  }
}
