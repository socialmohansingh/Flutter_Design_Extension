import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:example/src/utility_widgets/layout/widget_showcase_screen.dart';
import 'package:flutter/material.dart';

class DividerShowcaseScreen extends StatelessWidget {
  const DividerShowcaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return WidgetShowcaseScreen(
      title: "Dividers",
      child: Container(
        height: double.infinity,
        color: theme.colors.neutral.white,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Horizontal Dividers",
                  style: theme.textStyles.heading3_700.copyWith(
                    color: theme.colors.brand.main,
                  ),
                ),
                SizedBox(
                  height: theme.spacings.spacing16,
                ),
                Text(
                  "Divider Small",
                  style: theme.textStyles.secondary_500,
                ),
                DesignDividerSmall(
                  spacing: theme.spacings.spacing16,
                ),
                SizedBox(
                  height: theme.spacings.spacing24,
                ),
                Text(
                  "Divider Medium with color override, indent & spacing",
                  style: theme.textStyles.secondary_500,
                ),
                DesignDividerMedium(
                  spacing: theme.spacings.spacing16,
                  color: theme.colors.brand.main,
                  startIndent: 10,
                  endIndent: 10,
                ),
                SizedBox(
                  height: theme.spacings.spacing24,
                ),
                Text(
                  "Divider Large",
                  style: theme.textStyles.secondary_500,
                ),
                DesignDividerLarge(
                  spacing: theme.spacings.spacing16,
                ),
                SizedBox(
                  height: theme.spacings.spacing24,
                ),
                Text(
                  "Vertical Dividers",
                  style: theme.textStyles.heading3_700.copyWith(
                    color: theme.colors.brand.main,
                  ),
                ),
                SizedBox(
                  height: theme.spacings.spacing24,
                ),
                Text(
                  "Divider Small",
                  style: theme.textStyles.secondary_700,
                ),
                SizedBox(
                  height: 50,
                  child: DesignDividerSmall(
                    spacing: theme.spacings.spacing16,
                    orientation: DesignDividerOrientation.vertical,
                  ),
                ),
                SizedBox(
                  height: theme.spacings.spacing24,
                ),
                Text(
                  "Divider Medium with color override, indent & spacing",
                  style: theme.textStyles.secondary_700,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 80,
                      color: theme.colors.brand.secondary,
                    ),
                    SizedBox(
                      height: 50,
                      child: DesignDividerMedium(
                        spacing: theme.spacings.spacing16,
                        color: theme.colors.brand.main,
                        startIndent: 10,
                        endIndent: 10,
                        orientation: DesignDividerOrientation.vertical,
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 80,
                      color: theme.colors.brand.secondary,
                    ),
                  ],
                ),
                SizedBox(
                  height: theme.spacings.spacing24,
                ),
                Text(
                  "Divider Large",
                  style: theme.textStyles.secondary_700,
                ),
                SizedBox(
                  height: 50,
                  child: DesignDividerLarge(
                    spacing: theme.spacings.spacing16,
                    orientation: DesignDividerOrientation.vertical,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
