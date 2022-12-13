import 'package:flutter_design_extension/src/components/loaders/type/design_loader_type.dart';
import 'package:flutter/material.dart';

/// Implements the chardonnay progress loader.
///
/// [DesignLoaderType.regular] can be used on loading screen level
/// whereas [DesignLoaderType.small] can be used on loading button level.
class DesignLoader extends StatelessWidget {
  const DesignLoader({
    required this.color,
    required this.type,
    super.key,
  });

  ///[color] uses for loader color.
  final Color color;

  ///[type] uses to identify regular or small type of loader.
  final DesignLoaderType type;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: type.size.height,
      width: type.size.width,
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: type.strokeWidth,
      ),
    );
  }
}
