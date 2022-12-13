import 'package:flutter_design_extension/src/components/buttons/text_button/core_text_button.dart';
import 'package:flutter_design_extension/src/design_tokens/design_token_theme_extension.dart';
import 'package:flutter_design_extension/src/utils/material_state.dart';

/// Returns a map of colors corresponding to button states of an [CoreTextButton].
Map<DesignMaterialState, DesignMaterialStateColor>
    getTextButtonMaterialStateColorMap(DesignTokensThemeExtension theme) => {
          DesignMaterialState.main: DesignMaterialStateColor(
            bgColor: theme.colors.neutral.transparent,
            fgColor: theme.colors.interaction.main,
            borderColor: theme.colors.neutral.transparent,
          ),
          DesignMaterialState.disabled: DesignMaterialStateColor(
            bgColor: theme.colors.neutral.transparent,
            fgColor: theme.colors.neutral.gray40,
            borderColor: theme.colors.neutral.transparent,
          ),
          DesignMaterialState.hovered: DesignMaterialStateColor(
            bgColor: theme.colors.interaction.main.withOpacity(
              theme.opacities.opacity10,
            ),
            fgColor: theme.colors.interaction.main,
            borderColor: theme.colors.neutral.transparent,
          ),
          DesignMaterialState.pressed: DesignMaterialStateColor(
            bgColor: theme.colors.interaction.main.withOpacity(
              theme.opacities.opacity24,
            ),
            fgColor: theme.colors.interaction.main,
            borderColor: theme.colors.neutral.transparent,
          ),
        };
