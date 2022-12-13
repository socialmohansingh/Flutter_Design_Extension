import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter/material.dart';

class SnackBarVariantsButton extends StatefulWidget {
  final String textLabel;
  final Color buttonColor;
  final DesignSnackBarVariant variant;

  const SnackBarVariantsButton({
    super.key,
    required this.textLabel,
    required this.buttonColor,
    required this.variant,
  });

  @override
  State<SnackBarVariantsButton> createState() => _SnackBarVariantsButtonState();
}

class _SnackBarVariantsButtonState extends State<SnackBarVariantsButton> {
  late DesignTokensThemeExtension theme;

  @override
  Widget build(BuildContext context) {
    theme = context.theme;
    final size = MediaQuery.of(context).size;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.buttonColor,
        fixedSize: Size(
          size.width * 0.50,
          size.width * 0.15,
        ),
      ),
      onPressed: () => _showSnackBarVariant(widget.variant),
      child: Text(
        widget.textLabel,
        style: theme.textStyles.buttonText,
      ),
    );
  }

  void _showSnackBarVariant(DesignSnackBarVariant variant) {
    switch (variant) {
      case DesignSnackBarVariant.success:
        DesignSnackBars.show(
          context: context,
          snackBarText: 'This is a success snackbar.',
          variant: DesignSnackBarVariant.success,
        );
        break;
      case DesignSnackBarVariant.error:
        DesignSnackBars.show(
          context: context,
          snackBarText: 'This is a error snackbar.',
          variant: DesignSnackBarVariant.error,
        );
        break;
      case DesignSnackBarVariant.singleLineWithAction:
        DesignSnackBars.show(
          context: context,
          snackBarText: 'No internet connection.',
          variant: DesignSnackBarVariant.singleLineWithAction,
          actionLabel: 'RETRY',
          onPressedAction: () {},
        );
        break;
      case DesignSnackBarVariant.multiLineWithAction:
        DesignSnackBars.clear(context: context);
        DesignSnackBars.show(
          context: context,
          snackBarText:
              'Oops! It seems you don’t have internet connection at the moment.',
          variant: DesignSnackBarVariant.multiLineWithAction,
          actionLabel: 'RETRY',
          onPressedAction: () {},
        );
        break;
      default:
        DesignSnackBars.show(
          context: context,
          snackBarText: 'This is neutral snackbar',
          variant: DesignSnackBarVariant.neutral,
        );
    }
  }
}
