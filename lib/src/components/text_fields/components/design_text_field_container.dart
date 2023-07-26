import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter_design_extension/src/components/text_fields/components/design_text_field_status_bar.dart';
import 'package:flutter/material.dart';

class DesignTextFieldContainer extends StatelessWidget {
  final Widget child;
  final DesignTextFieldStatus status;
  final bool isFocused;
  final BoxDecoration? decoration;
  static const List<DesignTextFieldStatusType> _visibleStatusTypes = [
    DesignTextFieldStatusType.success,
    DesignTextFieldStatusType.error,
    DesignTextFieldStatusType.checking,
    DesignTextFieldStatusType.warning
  ];

  const DesignTextFieldContainer(
      {required this.child,
      required this.status,
      required this.isFocused,
      this.decoration,
      super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Column(
      children: [
        Container(
          decoration: decoration ??
              BoxDecoration(
                color: backgroundColor(theme, status.statusType),
                borderRadius: BorderRadius.circular(
                    theme.borderRadiuses.borderRadiusSmall),
                border: Border.all(
                  width: 1,
                  color: borderColor(theme, status.statusType),
                ),
              ),
          child: ClipRRect(
            borderRadius:
                BorderRadius.circular(theme.borderRadiuses.borderRadiusSmall),
            child: child,
          ),
        ),
        if (_visibleStatusTypes.contains(status.statusType) &&
            status.statusText != null) ...[
          SizedBox(height: theme.spacings.spacing4),
          DesignTextFieldStatusBar(
            iconData: statusIconData(status.statusType),
            color: statusBarColor(theme),
            text: status.statusText!,
          ),
        ]
      ],
    );
  }

  IconData statusIconData(DesignTextFieldStatusType status) {
    switch (status) {
      case DesignTextFieldStatusType.checking:
        return Icons.search;
      case DesignTextFieldStatusType.error:
        return Icons.error;
      case DesignTextFieldStatusType.warning:
        return Icons.warning;
      case DesignTextFieldStatusType.success:
        return Icons.check;
      default:
        throw UnimplementedError(
            'No statusIconData specified for statusType.$status');
    }
  }

  Color statusBarColor(DesignTokensThemeExtension theme) {
    switch (status.statusType) {
      case DesignTextFieldStatusType.checking:
        return theme.colors.neutral.gray50;
      case DesignTextFieldStatusType.error:
        return theme.colors.messaging.error;
      case DesignTextFieldStatusType.warning:
        return theme.colors.messaging.warning;
      case DesignTextFieldStatusType.success:
        return theme.colors.messaging.success;
      default:
        return theme.colors.neutral.transparent;
    }
  }

  Color backgroundColor(
      DesignTokensThemeExtension theme, DesignTextFieldStatusType statusType) {
    if (statusType == DesignTextFieldStatusType.readOnly) {
      return theme.colors.neutral.transparent;
    }
    return theme.colors.neutral.gray05;
  }

  Color borderColor(
      DesignTokensThemeExtension theme, DesignTextFieldStatusType statusType) {
    switch (statusType) {
      case DesignTextFieldStatusType.checking:
      case DesignTextFieldStatusType.active:
        return isFocused
            ? theme.colors.neutral.black
            : theme.colors.neutral.transparent;
      case DesignTextFieldStatusType.disabled:
      case DesignTextFieldStatusType.readOnly:
        return theme.colors.neutral.transparent;
      case DesignTextFieldStatusType.error:
        return theme.colors.messaging.error;
      case DesignTextFieldStatusType.warning:
        return theme.colors.messaging.warning;
      case DesignTextFieldStatusType.success:
        return theme.colors.messaging.success;
      default:
        throw UnimplementedError(
            'No border color specified for statusType.$statusType');
    }
  }
}
