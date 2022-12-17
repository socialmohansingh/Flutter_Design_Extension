import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter/material.dart';

const double _kRadioBtnOuterCircleDiameter = 24;

class DesignRadioButton<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final void Function(T value)? onChanged;
  final bool enabled;

  bool get _selected => value == groupValue;

  const DesignRadioButton(
      {required this.value,
      required this.groupValue,
      required this.onChanged,
      this.enabled = true,
      super.key});

  // TODO: there is a weird Flutter bug. The on tap ripple does not work if the widget is inside the Dismissible widget.
  // TODO: This bug can be recreated using the default Flutter Radio widget, so the issue is not specific to DesignRadioButton
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: enabled ? _onInkWellTap : null,
      highlightColor: _highlightColor(enabled, theme),
      splashColor: _splashColor(enabled, theme),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        padding: EdgeInsets.all(theme.spacings.spacing8),
        child: Container(
          height: _kRadioBtnOuterCircleDiameter,
          width: _kRadioBtnOuterCircleDiameter,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: _borderColor(enabled, theme),
                width: 2), //TODO: add border width token
          ),
          padding: EdgeInsets.all(theme.spacings.spacing4),
          child: Container(
            decoration: BoxDecoration(
              color: _innerCircleColor(enabled, theme),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }

  void _onInkWellTap() {
    if (onChanged != null) {
      onChanged!(value);
    }
  }

  Color _highlightColor(bool enabled, DesignTokensThemeExtension theme) {
    if (!enabled) {
      return theme.colors.neutral.transparent;
    }
    return _selected
        ? theme.colors.interaction.hover.withOpacity(0.1)
        : theme.colors.neutral.gray50.withOpacity(0.1);
  }

  Color _splashColor(bool enabled, DesignTokensThemeExtension theme) {
    if (!enabled) {
      return theme.colors.neutral.transparent;
    }
    return _selected
        ? theme.colors.interaction.pressed.withOpacity(0.2)
        : theme.colors.neutral.gray50.withOpacity(0.2);
  }

  Color _borderColor(bool enabled, DesignTokensThemeExtension theme) {
    if (!enabled) {
      return theme.colors.neutral.gray40;
    }

    return _selected
        ? theme.colors.interaction.main
        : theme.colors.neutral.black;
  }

  Color _innerCircleColor(bool enabled, DesignTokensThemeExtension theme) {
    if (!_selected) {
      return theme.colors.neutral.transparent;
    }
    return enabled
        ? theme.colors.interaction.main
        : theme.colors.neutral.gray40;
  }
}
