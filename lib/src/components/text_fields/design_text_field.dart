import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter_design_extension/src/components/text_fields/components/base_design_text_field.dart';
import 'package:flutter_design_extension/src/components/text_fields/components/design_text_field_container.dart';
import 'package:flutter_design_extension/src/components/text_fields/components/design_text_field_prefix.dart';
import 'package:flutter_design_extension/src/components/text_fields/components/design_text_field_suffix.dart';
import 'package:flutter/material.dart';

enum DesignTextFieldSuffixType { obscure, removeText, dropDown }

enum DesignTextFieldStatusType {
  active,
  error,
  warning,
  success,
  checking,
  disabled,
  readOnly
}

class DesignTextFieldStatus {
  final DesignTextFieldStatusType statusType;
  final String? statusText;

  DesignTextFieldStatus({required this.statusType, this.statusText});
}

class DesignTextField extends StatefulWidget {
  /// Basic placeholder text
  final String placeholderText;

  /// status affects the visibility and contents of the bottom bar, as well as the colors of the Text Field
  final DesignTextFieldStatus status;

  /// Basic TextEditingController
  final TextEditingController textEditingController;

  /// Basic FocusNode
  final FocusNode focusNode;

  /// Determines if the Text Field will have an obscure text or not
  final bool obscureText;

  /// Basic TextInputAction
  final TextInputAction textInputAction;

  /// Determines the number of maxLines in text field, specify null for endless vertical expansion
  final int? maxLines;

  /// Determines the presence of prefix by defining the icon, every other parameter of prefix is not changeable
  final IconData? prefixIconData;

  /// _suffixType Determines if the Text Field has a suffix, and if it does, what kind of suffix
  final DesignTextFieldSuffixType? suffixType;

  /// Do something when edit completes
  final Function()? onEditingComplete;

  /// Basic keyboardType
  final TextInputType? keyboardType;

  const DesignTextField(
      {required this.placeholderText,
      required this.status,
      required this.textEditingController,
      required this.focusNode,
      this.obscureText = false,
      this.textInputAction = TextInputAction.done,
      this.maxLines = 1,
      this.prefixIconData,
      this.suffixType,
      this.onEditingComplete,
      this.keyboardType,
      super.key});

  @override
  State<DesignTextField> createState() => _DesignTextFieldState();
}

class _DesignTextFieldState extends State<DesignTextField> {
  bool _isFocused = false;
  late bool _obscureText;

  void _onFocusChange() {
    setState(() {
      _isFocused = widget.focusNode.hasFocus;
    });
  }

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    widget.focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_onFocusChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return DesignTextFieldContainer(
        status: widget.status,
        isFocused: _isFocused,
        child: Row(
          children: [
            if (widget.prefixIconData != null)
              DesignTextFieldPrefix(iconData: widget.prefixIconData!),
            Expanded(
              child: BaseDesignTextField(
                placeholderText: widget.placeholderText,
                maxLines: widget.maxLines,
                obscureText: _obscureText,
                enabled: widget.status.statusType !=
                        DesignTextFieldStatusType.readOnly &&
                    widget.status.statusType !=
                        DesignTextFieldStatusType.disabled,
                textEditingController: widget.textEditingController,
                textInputAction: widget.textInputAction,
                labelColor:
                    labelColor(theme, widget.status.statusType, _isFocused),
                focusNode: widget.focusNode,
                onEditingComplete: widget.onEditingComplete,
                keyboardType: widget.keyboardType,
              ),
            ),
            if (widget.suffixType != null)
              DesignTextFieldSuffix(
                  iconData: suffixIconData(widget.suffixType!),
                  onPressed: suffixOnPressed(widget.suffixType!)),
          ],
        ));
  }

  IconData suffixIconData(DesignTextFieldSuffixType suffixType) {
    switch (suffixType) {
      // TODO: replace icons with tokens
      case DesignTextFieldSuffixType.obscure:
        return Icons.remove_red_eye_outlined;
      case DesignTextFieldSuffixType.removeText:
        return Icons.close_rounded;
      case DesignTextFieldSuffixType.dropDown:
        return Icons.arrow_drop_down;
      default:
        throw UnimplementedError(
            'No case handler found for DesignTextFieldSuffixType.$suffixType');
    }
  }

  Function()? suffixOnPressed(DesignTextFieldSuffixType suffixType) {
    switch (suffixType) {
      case DesignTextFieldSuffixType.obscure:
        return () {
          setState(() {
            _obscureText = !_obscureText;
          });
        };
      case DesignTextFieldSuffixType.removeText:
        return () {
          setState(() {
            widget.textEditingController.text = '';
          });
        };
      case DesignTextFieldSuffixType.dropDown:
        return null;
      default:
        throw UnimplementedError(
            'No case handler found for DesignTextFieldSuffixType.$suffixType');
    }
  }

  Color labelColor(DesignTokensThemeExtension theme,
      DesignTextFieldStatusType statusType, bool isFocused) {
    switch (statusType) {
      case DesignTextFieldStatusType.checking:
      case DesignTextFieldStatusType.active:
      case DesignTextFieldStatusType.readOnly:
        return isFocused
            ? theme.colors.neutral.black
            : theme.colors.neutral.gray50; // use tokens
      case DesignTextFieldStatusType.error:
        return theme.colors.messaging.error;
      case DesignTextFieldStatusType.warning:
        return theme.colors.messaging.warning;
      case DesignTextFieldStatusType.success:
        return theme.colors.messaging.success;
      case DesignTextFieldStatusType.disabled:
        return theme.colors.neutral.gray40;
    }
  }
}
