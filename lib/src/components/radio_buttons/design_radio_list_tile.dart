import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter_design_extension/src/components/common/option_title_subtitle.dart';
import 'package:flutter/material.dart';

class DesignRadioListTile<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final void Function(T value)? onChanged;
  final String title;
  final String? subtitle;
  final bool enabled;
  final TextStyle? titleTextStyle;
  final TextStyle? subTitleTextStyle;

  const DesignRadioListTile(
      {required this.value,
      required this.groupValue,
      required this.onChanged,
      required this.title,
      this.subtitle,
      this.enabled = true,
      this.titleTextStyle,
      this.subTitleTextStyle,
      super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DesignRadioButton<T>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          enabled: enabled,
        ),
        SizedBox(
          width: theme.spacings.spacing4,
        ),
        Column(
          children: [
            SizedBox(
              height: theme.spacings.spacing12,
            ),
            OptionTitleSubtitle(
              title: title,
              enabled: enabled,
              subtitle: subtitle,
              titleTextStyle: titleTextStyle,
              subTitleTextStyle: subTitleTextStyle,
            ),
          ],
        )
      ],
    );
  }
}
