import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter/material.dart';

class BaseDesignTextField extends StatelessWidget {
  final String placeholderText;
  final bool obscureText;
  final bool enabled;
  final TextEditingController textEditingController;
  final TextInputAction textInputAction;
  final Color labelColor;
  final FocusNode focusNode;
  final int? maxLines;
  final Function()? onEditingComplete;
  final TextInputType? keyboardType;

  const BaseDesignTextField(
      {required this.placeholderText,
      required this.obscureText,
      required this.enabled,
      required this.textEditingController,
      required this.textInputAction,
      required this.labelColor,
      required this.focusNode,
      this.maxLines,
      this.onEditingComplete,
      this.keyboardType,
      super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return TextField(
      maxLines: maxLines,
      obscureText: obscureText,
      obscuringCharacter: '*',
      cursorWidth: 1,
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
        labelText: placeholderText,
        labelStyle: theme.textStyles.paragraph_400.copyWith(color: labelColor),
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(
            bottom: theme.spacings.spacing8,
            left: theme.spacings.spacing16,
            top: theme.spacings.spacing4,
            // text field itself has built in padding of 4, we add 4 on top of that
            right: theme.spacings.spacing16), // use token
      ),
      focusNode: focusNode,
    );
  }
}
