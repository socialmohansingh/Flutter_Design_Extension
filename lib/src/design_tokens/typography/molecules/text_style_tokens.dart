import 'package:flutter/material.dart';
import 'package:flutter_design_extension/src/design_tokens/typography/atoms/font_family_tokens.dart';
import 'package:flutter_design_extension/src/design_tokens/typography/atoms/font_size_tokens.dart';
import 'package:flutter_design_extension/src/design_tokens/typography/atoms/font_weight_tokens.dart';
import 'package:flutter_design_extension/src/design_tokens/typography/atoms/line_height_tokens.dart';
import 'package:flutter_design_extension/src/utils/flutter_design_constants.dart';

class TextStyleTokens {
  final TextDirection _textDirection;
  late final String _fontFamily; // FontFamily based on LTR/RTL directionality

  // Text style definitions
  late final TextStyle heading1_700;
  late final TextStyle heading2_700;
  late final TextStyle heading3_700;
  late final TextStyle heading3_500;
  late final TextStyle paragraph_700;
  late final TextStyle paragraph_500;
  late final TextStyle paragraph_400;
  late final TextStyle secondary_700;
  late final TextStyle secondary_500;
  late final TextStyle secondary_400;
  late final TextStyle caption_700;
  late final TextStyle caption_400;
  late final TextStyle buttonText;
  late final TextStyle pageTitleMobile;
  late final TextStyle sectionTitleMobile;
  late final TextStyle sectionSubtitleMobile;

  TextStyleTokens({
    required TextDirection textDirection,
  }) : _textDirection = textDirection {
    _fontFamily = FontFamilyTokens.getFontFamily(textDirection: _textDirection);
    _initDefaultTextStyles(fontFamily: _fontFamily);
  }

  TextStyleTokens copyWith({TextDirection? textDirection}) =>
      TextStyleTokens(textDirection: textDirection ?? _textDirection);

  /// Initializes text styles with their default values.
  void _initDefaultTextStyles({required String fontFamily}) {
    // HEADINGS
    heading1_700 = _getTextStyle(
      debugLabel: 'heading1_700',
      fontSize: FontSizeTokens.fontSize40,
      fontWeight: FontWeightTokens.fontWeight700,
      lineHeight: LineHeightTokens.lineHeight48,
    );

    heading2_700 = _getTextStyle(
      debugLabel: 'heading2_700',
      fontSize: FontSizeTokens.fontSize28,
      fontWeight: FontWeightTokens.fontWeight700,
      lineHeight: LineHeightTokens.lineHeight32,
    );

    heading3_700 = _getTextStyle(
      debugLabel: 'heading3_700',
      fontSize: FontSizeTokens.fontSize20,
      fontWeight: FontWeightTokens.fontWeight700,
      lineHeight: LineHeightTokens.lineHeight24,
    );

    heading3_500 = _getTextStyle(
      debugLabel: 'heading3_500',
      fontSize: FontSizeTokens.fontSize20,
      fontWeight: FontWeightTokens.fontWeight500,
      lineHeight: LineHeightTokens.lineHeight24,
    );

    // PARAGRAPHS

    paragraph_700 = _getTextStyle(
      debugLabel: 'paragraph_700',
      fontSize: FontSizeTokens.fontSize16,
      fontWeight: FontWeightTokens.fontWeight700,
      lineHeight: LineHeightTokens.lineHeight24,
    );

    paragraph_500 = _getTextStyle(
      debugLabel: 'paragraph_500',
      fontSize: FontSizeTokens.fontSize16,
      fontWeight: FontWeightTokens.fontWeight500,
      lineHeight: LineHeightTokens.lineHeight24,
    );

    paragraph_400 = _getTextStyle(
      debugLabel: 'paragraph_400',
      fontSize: FontSizeTokens.fontSize16,
      fontWeight: FontWeightTokens.fontWeight400,
      lineHeight: LineHeightTokens.lineHeight24,
    );

    secondary_700 = _getTextStyle(
      debugLabel: 'secondary_700',
      fontSize: FontSizeTokens.fontSize14,
      fontWeight: FontWeightTokens.fontWeight700,
      lineHeight: LineHeightTokens.lineHeight20,
    );

    secondary_500 = _getTextStyle(
      debugLabel: 'secondary_500',
      fontSize: FontSizeTokens.fontSize14,
      fontWeight: FontWeightTokens.fontWeight500,
      lineHeight: LineHeightTokens.lineHeight20,
    );

    secondary_400 = _getTextStyle(
      debugLabel: 'secondary_400',
      fontSize: FontSizeTokens.fontSize14,
      fontWeight: FontWeightTokens.fontWeight400,
      lineHeight: LineHeightTokens.lineHeight20,
    );

    caption_700 = _getTextStyle(
      debugLabel: 'caption_700',
      fontSize: FontSizeTokens.fontSize12,
      fontWeight: FontWeightTokens.fontWeight700,
      lineHeight: LineHeightTokens.lineHeight16,
    );

    caption_400 = _getTextStyle(
      debugLabel: 'caption_400',
      fontSize: FontSizeTokens.fontSize12,
      fontWeight: FontWeightTokens.fontWeight400,
      lineHeight: LineHeightTokens.lineHeight16,
    );

    // OTHER
    // TODO: Design Status TO BE REVIEWED --> not final

    buttonText = _getTextStyle(
      debugLabel: 'buttonText',
      fontSize: FontSizeTokens.fontSize16,
      fontWeight: FontWeightTokens.fontWeight700,
      lineHeight: LineHeightTokens.lineHeight24,
    );

    pageTitleMobile = _getTextStyle(
      debugLabel: 'pageTitleMobile',
      fontSize: FontSizeTokens.fontSize28,
      fontWeight: FontWeightTokens.fontWeight700,
      lineHeight: LineHeightTokens.lineHeight32,
    );

    // TODO: NOTE - Same values as [pageTitleMobile]
    sectionTitleMobile = _getTextStyle(
      debugLabel: 'sectionTitleMobile',
      fontSize: FontSizeTokens.fontSize28,
      fontWeight: FontWeightTokens.fontWeight700,
      lineHeight: LineHeightTokens.lineHeight32,
    );

    sectionSubtitleMobile = _getTextStyle(
      debugLabel: 'sectionSubtitleMobile',
      fontSize: FontSizeTokens.fontSize16,
      fontWeight: FontWeightTokens.fontWeight700,
      lineHeight: LineHeightTokens.lineHeight24,
    );
  }

  /// Reusable helper function for defining [TextStyle]s.
  TextStyle _getTextStyle({
    required String debugLabel,
    required double fontSize,
    required FontWeight fontWeight,
    required double lineHeight,
  }) =>
      TextStyle(
        debugLabel: debugLabel,
        package: FlutterDesignConstants.packageName,
        fontFamily: _fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: LineHeightTokens.calculateLineHeight(
          lineHeight: lineHeight,
          fontSize: fontSize,
        ),
      );
}
