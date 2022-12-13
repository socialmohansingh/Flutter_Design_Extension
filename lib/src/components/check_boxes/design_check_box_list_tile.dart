import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter_design_extension/src/components/common/option_title_subtitle.dart';
import 'package:flutter/material.dart';

class DesignCheckBoxListTile extends StatelessWidget {
  final bool? value;
  final Function(bool?) onChanged;
  final String title;
  final String? subtitle;
  final bool enabled;
  final bool tristate;
  const DesignCheckBoxListTile(
      {required this.value,
      required this.onChanged,
      required this.title,
      this.subtitle,
      this.enabled = true,
      this.tristate = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DesignCheckBox(
          value: value,
          onChanged: onChanged,
          enabled: enabled,
          tristate: tristate,
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
            ),
          ],
        )
      ],
    );
  }
}
