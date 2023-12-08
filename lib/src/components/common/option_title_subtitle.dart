import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter/material.dart';

class OptionTitleSubtitle extends StatelessWidget {
  final String title;
  final bool enabled;
  final String? subtitle;
  final TextStyle? titleTextStyle;
  final TextStyle? subTitleTextStyle;

  const OptionTitleSubtitle(
      {required this.title,
      required this.enabled,
      this.subtitle,
      this.titleTextStyle,
      this.subTitleTextStyle,
      super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleTextStyle ??
              theme.textStyles.paragraph_400.copyWith(
                color: textColor(enabled, theme),
                height: 1,
              ),
        ),
        if (subtitle != null) ...[
          SizedBox(
            height: theme.spacings.spacing4,
          ),
          Text(
            subtitle!,
            style: subTitleTextStyle ??
                theme.textStyles.secondary_400.copyWith(
                  color: textColor(enabled, theme),
                  height: 1,
                ),
          ),
        ],
      ],
    );
  }

  Color textColor(bool enabled, DesignTokensThemeExtension theme) {
    if (!enabled) {
      return theme.colors.neutral.gray50;
    }
    return theme.colors.neutral.black;
  }
}
