import 'package:flutter_design_extension/src/design_tokens/colors/atoms/color_atoms.dart';
import 'package:flutter_design_extension/src/design_tokens/colors/molecules/color_brand.dart';
import 'package:flutter_design_extension/src/design_tokens/colors/molecules/color_interaction.dart';
import 'package:flutter_design_extension/src/design_tokens/colors/molecules/color_messaging.dart';
import 'package:flutter_design_extension/src/design_tokens/colors/molecules/color_neutral.dart';
import 'package:flutter_design_extension/src/design_tokens/colors/molecules/color_tokens.dart';

class BrandColorsTokenInLightMode extends ColorTokens {
  BrandColorsTokenInLightMode()
      : super(
          brand: ColorBrand(
            main: ColorAtoms.red600,
            dark: ColorAtoms.red800,
            secondary: ColorAtoms.blue200,
          ),
          interaction: ColorInteraction(
            main: ColorAtoms.red600,
            hover: ColorAtoms.red800,
            pressed: ColorAtoms.red1200,
          ),
          neutral: ColorNeutral(),
          messaging: ColorMessaging(),
        );
}

class BrandColorsTokenInDarkMode extends ColorTokens {
  BrandColorsTokenInDarkMode()
      : super(
          brand: ColorBrand(
            main: ColorAtoms.red600,
            dark: ColorAtoms.red800,
            secondary: ColorAtoms.blue200,
          ),
          interaction: ColorInteraction(
            main: ColorAtoms.red600,
            hover: ColorAtoms.red800,
            pressed: ColorAtoms.red1200,
          ),
          neutral: ColorNeutral(),
          messaging: ColorMessaging(),
        );
}
