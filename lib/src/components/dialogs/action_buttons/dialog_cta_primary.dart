import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter/material.dart';

class DialogCTAPrimary extends StatelessWidget {
  final Function()? onPressed;
  final String label;
  final bool isLongCTA;

  const DialogCTAPrimary({
    required this.onPressed,
    required this.label,
    Key? key,
    this.isLongCTA = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: key,
      width: isLongCTA ? double.infinity : null,
      child: DesignContainedButtonMedium(
        label: label,
        onPressed: onPressed,
      ),
    );
  }
}
