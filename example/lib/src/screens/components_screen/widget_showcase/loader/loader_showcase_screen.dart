import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:example/src/screens/components_screen/widget_showcase/loader/widget/loader_sub_widget.dart';
import 'package:example/src/utility_widgets/layout/widget_showcase_screen.dart';
import 'package:flutter/material.dart';

class LoaderShowcaseScreen extends StatelessWidget {
  const LoaderShowcaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return WidgetShowcaseScreen(
      title: "Loader",
      child: Padding(
        padding: EdgeInsets.all(
          theme.spacings.spacing32,
        ),
        child: Column(
          children: [
            Text(
              'Regular Loader',
              style: theme.textStyles.heading3_500,
            ),
            SizedBox(
              height: theme.spacings.spacing64,
            ),
            LoaderSubWidget(
              widgets: [
                DesignLoader(
                  color: theme.colors.brand.main,
                  type: DesignLoaderType.regular,
                ),
                DesignLoader(
                  color: theme.colors.neutral.gray20,
                  type: DesignLoaderType.regular,
                ),
              ],
            ),
            SizedBox(
              height: theme.spacings.spacing64,
            ),
            Text(
              'Small Loader',
              style: theme.textStyles.heading3_500,
            ),
            SizedBox(
              height: theme.spacings.spacing64,
            ),
            LoaderSubWidget(
              widgets: [
                DesignLoader(
                  color: theme.colors.brand.main,
                  type: DesignLoaderType.small,
                ),
                DesignLoader(
                  color: theme.colors.neutral.gray20,
                  type: DesignLoaderType.small,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
