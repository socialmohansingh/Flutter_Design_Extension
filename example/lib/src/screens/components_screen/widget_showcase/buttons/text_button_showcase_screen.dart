import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:example/src/utility_widgets/layout/widget_showcase_screen.dart';
import 'package:flutter/material.dart';

const String _kBtnLabel = 'Button label';
const dynamic _onPressedDisabled = null;
// ignore: avoid_print
void _onPressedEnabled() => print('onPressed');

class TextButtonShowcaseScreen extends StatelessWidget {
  const TextButtonShowcaseScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return WidgetShowcaseScreen(
      title: 'Text Button',
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: theme.spacings.spacing16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: theme.spacings.spacing24),
              const _TextButtonSmallSubsection(),
              SizedBox(height: theme.spacings.spacing24),
              const _TextButtonMediumSubsection(),
              SizedBox(height: theme.spacings.spacing24),
              const _TextButtonLargeSubsection(),
              SizedBox(height: theme.spacings.spacing24),
              const _TextButtonFullWidthSubsection(),
              SizedBox(height: theme.spacings.spacing48),
            ],
          ),
        ),
      ),
    );
  }
}

class _TextButtonSmallSubsection extends StatelessWidget {
  const _TextButtonSmallSubsection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Column(
      children: [
        Text(
          'Small',
          style: theme.textStyles.secondary_700,
        ),
        SizedBox(height: theme.spacings.spacing16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const DesignTextButtonSmall(
              label: _kBtnLabel,
              onPressed: _onPressedEnabled,
            ),
            SizedBox(width: theme.spacings.spacing24),
            const DesignTextButtonSmall(
              label: _kBtnLabel,
              onPressed: _onPressedDisabled,
            ),
          ],
        ),
        SizedBox(height: theme.spacings.spacing12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const DesignTextButtonSmall(
              label: _kBtnLabel,
              leftIcon: Icons.edit,
              onPressed: _onPressedEnabled,
            ),
            SizedBox(width: theme.spacings.spacing24),
            const DesignTextButtonSmall(
              label: _kBtnLabel,
              leftIcon: Icons.edit,
              onPressed: _onPressedDisabled,
            ),
          ],
        ),
        SizedBox(height: theme.spacings.spacing12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const DesignTextButtonSmall(
              label: _kBtnLabel,
              rightIcon: Icons.edit,
              onPressed: _onPressedEnabled,
            ),
            SizedBox(width: theme.spacings.spacing24),
            const DesignTextButtonSmall(
              label: _kBtnLabel,
              rightIcon: Icons.edit,
              onPressed: _onPressedDisabled,
            ),
          ],
        ),
      ],
    );
  }
}

class _TextButtonMediumSubsection extends StatelessWidget {
  const _TextButtonMediumSubsection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Column(
      children: [
        Text(
          'Medium',
          style: theme.textStyles.secondary_700,
        ),
        SizedBox(height: theme.spacings.spacing16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const DesignTextButtonMedium(
              label: _kBtnLabel,
              onPressed: _onPressedEnabled,
            ),
            SizedBox(width: theme.spacings.spacing24),
            const DesignTextButtonMedium(
              label: _kBtnLabel,
              onPressed: _onPressedDisabled,
            ),
          ],
        ),
        SizedBox(height: theme.spacings.spacing12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const DesignTextButtonMedium(
              label: _kBtnLabel,
              leftIcon: Icons.edit,
              onPressed: _onPressedEnabled,
            ),
            SizedBox(width: theme.spacings.spacing24),
            const DesignTextButtonMedium(
              label: _kBtnLabel,
              leftIcon: Icons.edit,
              onPressed: _onPressedDisabled,
            ),
          ],
        ),
        SizedBox(height: theme.spacings.spacing12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const DesignTextButtonMedium(
              label: _kBtnLabel,
              rightIcon: Icons.edit,
              onPressed: _onPressedEnabled,
            ),
            SizedBox(width: theme.spacings.spacing24),
            const DesignTextButtonMedium(
              label: _kBtnLabel,
              rightIcon: Icons.edit,
              onPressed: _onPressedDisabled,
            ),
          ],
        ),
      ],
    );
  }
}

class _TextButtonLargeSubsection extends StatelessWidget {
  const _TextButtonLargeSubsection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Column(
      children: [
        Text(
          'Large',
          style: theme.textStyles.secondary_700,
        ),
        SizedBox(height: theme.spacings.spacing16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const DesignTextButtonLarge(
              label: _kBtnLabel,
              onPressed: _onPressedEnabled,
            ),
            SizedBox(width: theme.spacings.spacing24),
            const DesignTextButtonLarge(
              label: _kBtnLabel,
              onPressed: _onPressedDisabled,
            ),
          ],
        ),
        SizedBox(height: theme.spacings.spacing12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const DesignTextButtonLarge(
              label: _kBtnLabel,
              leftIcon: Icons.edit,
              onPressed: _onPressedEnabled,
            ),
            SizedBox(width: theme.spacings.spacing24),
            const DesignTextButtonLarge(
              label: _kBtnLabel,
              leftIcon: Icons.edit,
              onPressed: _onPressedDisabled,
            ),
          ],
        ),
        SizedBox(height: theme.spacings.spacing12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const DesignTextButtonLarge(
              label: _kBtnLabel,
              rightIcon: Icons.edit,
              onPressed: _onPressedEnabled,
            ),
            SizedBox(width: theme.spacings.spacing24),
            const DesignTextButtonLarge(
              label: _kBtnLabel,
              rightIcon: Icons.edit,
              onPressed: _onPressedDisabled,
            ),
          ],
        ),
      ],
    );
  }
}

class _TextButtonFullWidthSubsection extends StatelessWidget {
  const _TextButtonFullWidthSubsection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Column(
      children: [
        Text(
          'Full Width',
          style: theme.textStyles.secondary_700,
        ),
        SizedBox(height: theme.spacings.spacing16),
        // No Icon
        const SizedBox(
          width: double.infinity,
          child: DesignTextButtonLarge(
            label: _kBtnLabel,
            onPressed: _onPressedEnabled,
          ),
        ),
        SizedBox(height: theme.spacings.spacing12),
        const SizedBox(
          width: double.infinity,
          child: DesignTextButtonLarge(
            label: _kBtnLabel,
            onPressed: _onPressedDisabled,
          ),
        ),
        SizedBox(height: theme.spacings.spacing12),
      ],
    );
  }
}
