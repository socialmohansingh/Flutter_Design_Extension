import 'package:flutter_design_extension/src/design_tokens/design_token_theme_extension.dart';
import 'package:flutter_design_extension/src/utils/material_state.dart';

Map<DesignMaterialState, DesignMaterialStateColor>
    getContainedButtonMaterialStateColorMap(DesignTokensThemeExtension theme) =>
        {
          DesignMaterialState.main: DesignMaterialStateColor(
            bgColor: theme.colors.interaction.main,
            fgColor: theme.colors.neutral.white,
            borderColor: theme.colors.neutral.transparent,
          ),
          DesignMaterialState.disabled: DesignMaterialStateColor(
            bgColor: theme.colors.neutral.gray05,
            fgColor: theme.colors.neutral.gray40,
            borderColor: theme.colors.neutral.transparent,
          ),
          DesignMaterialState.hovered: DesignMaterialStateColor(
            bgColor: theme.colors.interaction.hover,
            fgColor: theme.colors.neutral.white,
            borderColor: theme.colors.neutral.transparent,
          ),
          DesignMaterialState.pressed: DesignMaterialStateColor(
            bgColor: theme.colors.interaction.pressed,
            fgColor: theme.colors.neutral.white,
            borderColor: theme.colors.neutral.transparent,
          ),
        };
