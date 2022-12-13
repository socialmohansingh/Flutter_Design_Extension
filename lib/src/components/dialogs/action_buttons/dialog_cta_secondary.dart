import 'package:flutter_design_extension/src/components/buttons/buttons.dart';
import 'package:flutter/material.dart';

class DialogCTASecondary extends StatelessWidget {
  final Function() onPressed;
  final String label;
  final bool isLongCTA;

  const DialogCTASecondary({
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
      child: DesignTextButtonMedium(
        label: label,
        onPressed: onPressed,
      ),
    );
  }
}
