import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:example/src/utility_widgets/layout/widget_showcase_screen.dart';
import 'package:flutter/material.dart';

class IconsShowcaseScreen extends StatelessWidget {
  const IconsShowcaseScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return WidgetShowcaseScreen(
      title: 'Icons',
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: theme.spacings.spacing16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: theme.spacings.spacing24),
              ShowcaseIconSizeRow(icon: theme.icons.check_circle),
              SizedBox(height: theme.spacings.spacing24),
              ShowcaseIconSizeRow(icon: theme.icons.add_circle),
              SizedBox(height: theme.spacings.spacing24),
              ShowcaseIconSizeRow(icon: theme.icons.help_circle),
              SizedBox(height: theme.spacings.spacing24),
              ShowcaseIconSizeRow(icon: theme.icons.error_circle),
              SizedBox(height: theme.spacings.spacing24),
              ShowcaseIconSizeRow(icon: theme.icons.info_circle),
              SizedBox(height: theme.spacings.spacing24),
              ShowcaseIconSizeRow(icon: theme.icons.remove_circle),
              SizedBox(height: theme.spacings.spacing24),
              ShowcaseIconSizeRow(icon: theme.icons.warning_circle),
              SizedBox(height: theme.spacings.spacing48),
            ],
          ),
        ),
      ),
    );
  }
}

class ShowcaseIconSizeRow extends StatelessWidget {
  final IconData icon;

  const ShowcaseIconSizeRow({required this.icon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        DesignIcon(
          icon,
          iconSize: DesignIconSize.xSmall,
        ),
        SizedBox(width: theme.spacings.spacing12),
        DesignIcon(
          icon,
          iconSize: DesignIconSize.small,
        ),
        SizedBox(width: theme.spacings.spacing12),
        DesignIcon(
          icon,
          iconSize: DesignIconSize.medium,
        ),
        SizedBox(width: theme.spacings.spacing12),
        DesignIcon(
          icon,
          iconSize: DesignIconSize.large,
        ),
      ],
    );
  }
}
