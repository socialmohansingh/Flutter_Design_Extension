import 'package:flutter_design_extension/src/design_tokens/colors/molecules/color_tokens.dart';
import 'package:flutter_design_extension/src/design_tokens/elevation/elevation_token.dart';
import 'package:flutter_design_extension/src/design_tokens/opacity/opacity_tokens.dart';

class ElevationTokens {
  late final OpacityTokens _opacityTokens;
  late final ColorTokens _colorTokens;

  ElevationToken get elevationLow => ElevationToken(
        xOffset: 0,
        yOffset: 0,
        blurRadius: 4,
        spreadRadius: 0,
        opacity: _opacityTokens.opacity30,
        color: _colorTokens.neutral.gray50,
      );

  ElevationToken get elevationMedium => ElevationToken(
        xOffset: 0,
        yOffset: 0,
        blurRadius: 16,
        spreadRadius: 0,
        opacity: _opacityTokens.opacity24,
        color: _colorTokens.neutral.gray50,
      );

  ElevationToken get elevationHigh => ElevationToken(
        xOffset: 0,
        yOffset: 0,
        blurRadius: 50,
        spreadRadius: 0,
        opacity: _opacityTokens.opacity24,
        color: _colorTokens.neutral.gray50,
      );

  ElevationTokens({
    required OpacityTokens opacityTokens,
    required ColorTokens colorTokens,
  }) {
    _opacityTokens = opacityTokens;
    _colorTokens = colorTokens;
  }

  ElevationTokens copyWith({ColorTokens? colorTokens}) {
    return ElevationTokens(
      opacityTokens: _opacityTokens,
      colorTokens: colorTokens ?? _colorTokens,
    );
  }
}
