import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter/material.dart';

const double _designCheckBoxCheckMarkSide = 24;

class DesignCheckBox extends StatelessWidget {
  final bool? value;
  final Function(bool?) onChanged;
  final bool enabled;
  final bool tristate;

  const DesignCheckBox(
      {required this.value,
      required this.onChanged,
      this.enabled = true,
      this.tristate = false,
      super.key})
      : assert(tristate || value != null);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: enabled ? _onInkWellTap : null,
      highlightColor: _highlightColor(enabled, theme, value),
      splashColor: _splashColor(enabled, theme, value),
      child: Container(
          padding: EdgeInsets.all(theme.spacings.spacing8),
          child: SizedBox(
            height: _designCheckBoxCheckMarkSide,
            width: _designCheckBoxCheckMarkSide,
            child: Icon(
              _iconData(theme, value),
              color: _iconColor(enabled, theme, value),
            ),
          )),
    );
  }

  Color _highlightColor(
      bool enabled, DesignTokensThemeExtension theme, bool? value) {
    if (!enabled) {
      return theme.colors.neutral.transparent;
    }
    if (value == null || value == true) {
      return theme.colors.interaction.hover.withOpacity(0.1);
    }
    return theme.colors.neutral.gray50.withOpacity(0.1);
  }

  Color _splashColor(
      bool enabled, DesignTokensThemeExtension theme, bool? value) {
    if (!enabled) {
      return theme.colors.neutral.transparent;
    }
    if (value == null || value == true) {
      return theme.colors.interaction.pressed.withOpacity(0.2);
    }
    return theme.colors.neutral.gray50.withOpacity(0.2);
  }

  IconData _iconData(DesignTokensThemeExtension theme, bool? value) {
    // TODO: add Icons from DS
    switch (value) {
      case (true):
        return Icons.check_box;
      case (false):
        return Icons.check_box_outline_blank;
      default:
        return Icons.indeterminate_check_box;
    }
  }

  Color _iconColor(
      bool enabled, DesignTokensThemeExtension theme, bool? value) {
    if (!enabled) {
      return theme.colors.neutral.gray40;
    }

    switch (value) {
      case (false):
        return theme.colors.neutral.black;
      case (true):
      default:
        return theme.colors.interaction.main;
    }
  }

  void _onInkWellTap() {
    bool? valueToProvide;
    if (tristate) {
      if (value == true) {
        valueToProvide = null;
      } else if (value == null) {
        valueToProvide = false;
      } else {
        valueToProvide = true;
      }
    } else {
      valueToProvide = !value!;
    }

    onChanged(valueToProvide);
  }
}
