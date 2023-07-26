import 'package:flutter/services.dart';
import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter/material.dart';

class BaseDesignTextField extends StatelessWidget {
  final String placeholderText;
  final bool obscureText;
  final bool enabled;
  final bool autocorrect;
  final TextEditingController textEditingController;
  final TextInputAction textInputAction;
  final Color labelColor;
  final FocusNode focusNode;
  final int? maxLines;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final Function()? onEditingComplete;
  final TextInputType? keyboardType;
  final bool showLabelText;

  const BaseDesignTextField({
    required this.placeholderText,
    required this.obscureText,
    required this.enabled,
    required this.textEditingController,
    required this.textInputAction,
    required this.labelColor,
    required this.focusNode,
    this.maxLines,
    this.maxLength,
    this.maxLengthEnforcement,
    this.showLabelText = true,
    this.autocorrect = false,
    this.onEditingComplete,
    this.keyboardType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return TextField(
      maxLines: maxLines,
      obscureText: obscureText,
      obscuringCharacter: '*',
      cursorWidth: 1,
      maxLength: maxLength,
      maxLengthEnforcement: maxLengthEnforcement,
      autocorrect: autocorrect,
      cursorColor: theme.colors.neutral.black,
      onEditingComplete: onEditingComplete,
      keyboardType: keyboardType,
      // use token
      enabled: enabled,
      style: theme.textStyles.paragraph_400
          .copyWith(color: theme.colors.neutral.black),
      controller: textEditingController,
      textInputAction: textInputAction,

      decoration: InputDecoration(
        alignLabelWithHint: (maxLines ?? 0) > 1,
        labelText: showLabelText ? placeholderText : "",
        hintText: showLabelText ? "" : placeholderText,
        labelStyle: theme.textStyles.paragraph_400.copyWith(color: labelColor),
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(
          bottom: theme.spacings.spacing8,
          left: theme.spacings.spacing16,
          top: theme.spacings.spacing4,
          right: theme.spacings.spacing16,
        ),
      ),
      focusNode: focusNode,
    );
  }
}
