import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter/material.dart';

class DesignTag extends StatelessWidget {
  final String label;
  final DesignTagType tagType;

  const DesignTag({required this.label, required this.tagType, super.key});

  @override
  Widget build(BuildContext context) {
    final spacings = context.theme.spacings;
    final radius = context.theme.borderRadiuses;
    final tagStyle = getTagStyle(context.theme)[tagType];
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(radius.borderRadiusSmall),
          child: Container(
            color: tagStyle!.bgColor,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: spacings.spacing4, horizontal: spacings.spacing8),
              child: Center(
                child: Text(
                  label,
                  style: TextStyleTokens(
                    textDirection: context.getCurrentLanguageDirection(),
                  ).caption_700.copyWith(color: tagStyle.fgColor, height: 1),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Map<DesignTagType, DesignTagStyle> getTagStyle(
    DesignTokensThemeExtension theme,
  ) =>
      {
        DesignTagType.success: DesignTagStyle(
          bgColor: theme.colors.messaging.successLight,
          fgColor: theme.colors.messaging.success,
        ),
        DesignTagType.error: DesignTagStyle(
          bgColor: theme.colors.messaging.errorLight,
          fgColor: theme.colors.messaging.error,
        ),
        DesignTagType.info: DesignTagStyle(
          bgColor: theme.colors.messaging.informationLight,
          fgColor: theme.colors.messaging.information,
        ),
        DesignTagType.neutral: DesignTagStyle(
          bgColor: theme.colors.neutral.gray05,
          fgColor: theme.colors.neutral.gray50,
        ),
        DesignTagType.static: DesignTagStyle(
          bgColor: theme.colors.neutral.transparent,
          fgColor: theme.colors.neutral.gray50,
        ),
      };
}
