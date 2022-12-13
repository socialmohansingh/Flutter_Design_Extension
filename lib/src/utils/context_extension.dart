import 'package:flutter/material.dart';
import 'package:flutter_design_extension/src/design_tokens/design_token_theme_extension.dart';

/// Extension that provides direct theme access via the current [BuildContext].
///
/// *Example usage inside widget's build function:*
/// ```
/// final theme = context.theme;
/// ```
extension DesignTokensThemeContextExtension on BuildContext {
  DesignTokensThemeExtension get theme =>
      Theme.of(this).extension<DesignTokensThemeExtension>()!;
}

/// Extension that provides direct text direction access via the current [BuildContext].
///
/// *Example usage inside widget's build function:*
/// ```
/// final textDirection = context.getCurrentLanguageDirection();
/// ```
extension TextDirectionContextExtension on BuildContext {
  TextDirection getCurrentLanguageDirection() {
    // if (intl.Bidi.isRtlLanguage(Localizations.localeOf(this).languageCode)) {
    return TextDirection.rtl;
    // }
    // return TextDirection.ltr;
  }
}
