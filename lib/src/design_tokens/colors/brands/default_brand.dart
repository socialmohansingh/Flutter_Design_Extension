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
            main: ColorAtoms.blue200,
            dark: ColorAtoms.blue200,
            secondary: ColorAtoms.blue100,
            background: ColorAtoms.white,
          ),
          interaction: ColorInteraction(
            main: ColorAtoms.blue200,
            hover: ColorAtoms.blue200,
            pressed: ColorAtoms.blue200,
          ),
          neutral: ColorNeutralLight(),
          messaging: ColorMessagingLight(),
        );
}

class BrandColorsTokenInDarkMode extends ColorTokens {
  BrandColorsTokenInDarkMode()
      : super(
          brand: ColorBrand(
            main: ColorAtoms.blue200,
            dark: ColorAtoms.blue200,
            secondary: ColorAtoms.blue100,
            background: ColorAtoms.black,
          ),
          interaction: ColorInteraction(
            main: ColorAtoms.blue200,
            hover: ColorAtoms.blue200,
            pressed: ColorAtoms.blue200,
          ),
          neutral: ColorNeutralDark(),
          messaging: ColorMessagingDark(),
        );
}
