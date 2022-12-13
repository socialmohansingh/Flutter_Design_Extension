import 'package:flutter_design_extension/src/design_tokens/design_token_theme_extension.dart';
import 'package:flutter_design_extension/src/utils/material_state.dart';

/// Returns a map of colors corresponding to button states of an [CoreOutlinedButton].
Map<DesignMaterialState, DesignMaterialStateColor>
    getOutlinedButtonMaterialStateColorMap(DesignTokensThemeExtension theme) =>
        {
          DesignMaterialState.main: DesignMaterialStateColor(
            bgColor: theme.colors.neutral.transparent,
            fgColor: theme.colors.interaction.main,
            borderColor: theme.colors.interaction.main,
          ),
          DesignMaterialState.disabled: DesignMaterialStateColor(
            bgColor: theme.colors.neutral.transparent,
            fgColor: theme.colors.neutral.gray40,
            borderColor: theme.colors.neutral.gray40,
          ),
          DesignMaterialState.hovered: DesignMaterialStateColor(
            bgColor: theme.colors.interaction.main.withOpacity(
              theme.opacities.opacity10,
            ),
            fgColor: theme.colors.interaction.main,
            borderColor: theme.colors.interaction.main,
          ),
          DesignMaterialState.pressed: DesignMaterialStateColor(
            bgColor: theme.colors.interaction.main.withOpacity(
              theme.opacities.opacity24,
            ),
            fgColor: theme.colors.interaction.main,
            borderColor: theme.colors.interaction.main,
          ),
        };
