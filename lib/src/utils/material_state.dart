import 'package:flutter/material.dart';

enum DesignMaterialState {
  disabled,
  hovered,
  pressed,
  main,
}

class DesignMaterialStateColor {
  final Color bgColor;
  final Color fgColor;
  final Color borderColor;

  const DesignMaterialStateColor({
    required this.bgColor,
    required this.fgColor,
    required this.borderColor,
  });
}

/// Maps the current material button state [MaterialState] to the corresponding
/// state in the [materialStateColorMap].
DesignMaterialStateColor resolveMaterialState({
  required Set<MaterialState> states,
  required Map<DesignMaterialState, DesignMaterialStateColor>
      materialStateColorMap,
}) {
  if (states.contains(MaterialState.disabled)) {
    return materialStateColorMap[DesignMaterialState.disabled]!;
  } else if (states.contains(MaterialState.pressed)) {
    return materialStateColorMap[DesignMaterialState.pressed]!;
  } else if (states.contains(MaterialState.hovered)) {
    return materialStateColorMap[DesignMaterialState.hovered]!;
  }

  return materialStateColorMap[DesignMaterialState.main]!; // Default State
}
