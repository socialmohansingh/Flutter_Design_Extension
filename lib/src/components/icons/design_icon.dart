import 'package:flutter_design_extension/src/components/icons/types/icon_size.dart';
import 'package:flutter/material.dart';

class DesignIcon extends StatelessWidget {
  final IconData icon;
  final DesignIconSize iconSize;
  final Color? color;

  const DesignIcon(
    this.icon, {
    required this.iconSize,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) =>
      Icon(icon, size: iconSize.size, color: color);
}
