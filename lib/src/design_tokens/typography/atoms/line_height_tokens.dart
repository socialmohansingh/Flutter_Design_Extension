const double _kFallbackLineHeight = 1;

/// For details about [LineHeightTokens], please refer to document
class LineHeightTokens {
  static const double lineHeight16 = 16;
  static const double lineHeight20 = 20; // TODO: status 'TO BE REVIEWED'
  static const double lineHeight24 = 24;
  static const double lineHeight32 = 32;
  static const double lineHeight48 = 48;

  /// Helper function that transforms 'px'-based [lineHeight] value to
  /// percentage-based (as used in [TextStyle]'s height property).
  static double? calculateLineHeight({
    required double lineHeight,
    required double fontSize,
  }) {
    assert(
      (lineHeight / fontSize) >= 1,
      """LineHeight might be wrongly specified.
      Please double-check the TextStyleTokens definitions.""",
    );

    if (lineHeight <= 0 || fontSize <= 0) return _kFallbackLineHeight;
    return lineHeight / fontSize;
  }
}
