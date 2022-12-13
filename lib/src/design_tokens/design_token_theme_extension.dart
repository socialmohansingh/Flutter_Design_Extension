import 'package:flutter/material.dart';
import 'package:flutter_design_extension/src/design_tokens/border_radius/border_radius_tokens.dart';
import 'package:flutter_design_extension/src/design_tokens/colors/brands/brand_color_tokens.dart';
import 'package:flutter_design_extension/src/design_tokens/colors/molecules/color_tokens.dart';
import 'package:flutter_design_extension/src/design_tokens/elevation/elevation_tokens.dart';
import 'package:flutter_design_extension/src/design_tokens/icons/icons.dart';
import 'package:flutter_design_extension/src/design_tokens/opacity/opacity_tokens.dart';
import 'package:flutter_design_extension/src/design_tokens/spacing/spacing_tokens.dart';
import 'package:flutter_design_extension/src/design_tokens/typography/molecules/text_style_tokens.dart';

@immutable
class DesignTokensThemeExtension
    extends ThemeExtension<DesignTokensThemeExtension> {
  late final TextDirection textDirection;
  late final ColorTokens colors;
  late final ElevationTokens elevations;
  late final SpacingTokens spacings;
  late final OpacityTokens opacities;
  late final BorderRadiusTokens borderRadiuses;
  late final TextStyleTokens textStyles;
  late final IconTokens icons;

  DesignTokensThemeExtension({
    required this.textDirection,
    required this.colors,
    TextStyleTokens? textStyles,
    ElevationTokens? elevations,
    IconTokens? icons,
  }) {
    // Init unmodifiable tokens
    spacings = SpacingTokens();
    opacities = OpacityTokens();
    borderRadiuses = BorderRadiusTokens();

    // Init default values for tokens that are optional
    this.elevations = elevations ??
        ElevationTokens(opacityTokens: opacities, colorTokens: colors);

    this.textStyles =
        textStyles ?? TextStyleTokens(textDirection: textDirection);

    this.icons = icons ?? IconTokens(textDirection: textDirection);
  }

  /// Initializes the design tokens with default
  /// values based on [brand] and [textDirection].
  DesignTokensThemeExtension.initWithBrandAndTextDirection({
    required this.textDirection,
    required Brand brand,
    required bool isDarkMode,
  }) {
    // Init unmodifiable tokens
    spacings = SpacingTokens();
    opacities = OpacityTokens();
    borderRadiuses = BorderRadiusTokens();
    colors = brand.getColorTokens(isDarkMode);
    textStyles = TextStyleTokens(textDirection: textDirection);
    elevations = ElevationTokens(opacityTokens: opacities, colorTokens: colors);
    icons = IconTokens(textDirection: textDirection);
  }

  @override
  DesignTokensThemeExtension copyWith({
    TextDirection? textDirection,
    ColorTokens? colors,
    ElevationTokens? elevations,
    TextStyleTokens? textStyles,
  }) {
    final colorsUpdated = colors ?? this.colors;
    final textDirectionUpdated = textDirection ?? this.textDirection;

    return DesignTokensThemeExtension(
      textDirection: textDirectionUpdated,
      colors: colorsUpdated,
      // we make sure that elevations always depend on currently valid color tokens
      elevations: elevations?.copyWith(colorTokens: colorsUpdated) ??
          this.elevations.copyWith(colorTokens: colorsUpdated),
      textStyles: textStyles?.copyWith(textDirection: textDirectionUpdated) ??
          this.textStyles.copyWith(textDirection: textDirectionUpdated),
      icons: IconTokens(textDirection: textDirectionUpdated),
    );
  }

  @override
  DesignTokensThemeExtension lerp(
    ThemeExtension<DesignTokensThemeExtension>? other,
    double t,
  ) {
    if (other is! DesignTokensThemeExtension) {
      return this;
    }
    final ColorTokens colorsLerp = colors.lerp(other.colors, t) as ColorTokens;
    return DesignTokensThemeExtension(
      textDirection: textDirection,
      colors: colorsLerp,
      elevations: elevations.copyWith(colorTokens: colorsLerp),
      textStyles: textStyles,
      icons: icons,
    );
  }
}
