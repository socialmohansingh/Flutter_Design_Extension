import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:example/src/utility_widgets/layout/widget_showcase_screen.dart';
import 'package:flutter/material.dart';

const String _kBtnLabel = 'Button label';
const dynamic _onPressedDisabled = null;
// ignore: avoid_print
void _onPressedEnabled() => print('onPressed');

class OutlinedButtonShowcaseScreen extends StatelessWidget {
  const OutlinedButtonShowcaseScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return WidgetShowcaseScreen(
      title: 'Outlined Button',
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: theme.spacings.spacing16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: theme.spacings.spacing24),
              const _OutlinedButtonSmallSubsection(),
              SizedBox(height: theme.spacings.spacing24),
              const _OutlinedButtonMediumSubsection(),
              SizedBox(height: theme.spacings.spacing24),
              const _OutlinedButtonLargeSubsection(),
              SizedBox(height: theme.spacings.spacing24),
              const _OutlinedButtonFullWidthSubsection(),
              SizedBox(height: theme.spacings.spacing48),
            ],
          ),
        ),
      ),
    );
  }
}

class _OutlinedButtonSmallSubsection extends StatelessWidget {
  const _OutlinedButtonSmallSubsection({Key? key}) : super(key: key);

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
            const DesignOutlinedButtonSmall(
              label: _kBtnLabel,
              onPressed: _onPressedEnabled,
            ),
            SizedBox(width: theme.spacings.spacing24),
            const DesignOutlinedButtonSmall(
              label: _kBtnLabel,
              onPressed: _onPressedDisabled,
            ),
          ],
        ),
        SizedBox(height: theme.spacings.spacing12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const DesignOutlinedButtonSmall(
              label: _kBtnLabel,
              leftIcon: Icons.edit,
              onPressed: _onPressedEnabled,
            ),
            SizedBox(width: theme.spacings.spacing24),
            const DesignOutlinedButtonSmall(
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
            const DesignOutlinedButtonSmall(
              label: _kBtnLabel,
              rightIcon: Icons.edit,
              onPressed: _onPressedEnabled,
            ),
            SizedBox(width: theme.spacings.spacing24),
            const DesignOutlinedButtonSmall(
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

class _OutlinedButtonMediumSubsection extends StatelessWidget {
  const _OutlinedButtonMediumSubsection({Key? key}) : super(key: key);

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
            const DesignOutlinedButtonMedium(
              label: _kBtnLabel,
              onPressed: _onPressedEnabled,
            ),
            SizedBox(width: theme.spacings.spacing24),
            const DesignOutlinedButtonMedium(
              label: _kBtnLabel,
              onPressed: _onPressedDisabled,
            ),
          ],
        ),
        SizedBox(height: theme.spacings.spacing12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const DesignOutlinedButtonMedium(
              label: _kBtnLabel,
              leftIcon: Icons.edit,
              onPressed: _onPressedEnabled,
            ),
            SizedBox(width: theme.spacings.spacing24),
            const DesignOutlinedButtonMedium(
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
            const DesignOutlinedButtonMedium(
              label: _kBtnLabel,
              rightIcon: Icons.edit,
              onPressed: _onPressedEnabled,
            ),
            SizedBox(width: theme.spacings.spacing24),
            const DesignOutlinedButtonMedium(
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

class _OutlinedButtonLargeSubsection extends StatelessWidget {
  const _OutlinedButtonLargeSubsection({Key? key}) : super(key: key);

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
            const DesignOutlinedButtonLarge(
              label: _kBtnLabel,
              onPressed: _onPressedEnabled,
            ),
            SizedBox(width: theme.spacings.spacing24),
            const DesignOutlinedButtonLarge(
              label: _kBtnLabel,
              onPressed: _onPressedDisabled,
            ),
          ],
        ),
        SizedBox(height: theme.spacings.spacing12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const DesignOutlinedButtonLarge(
              label: _kBtnLabel,
              leftIcon: Icons.edit,
              onPressed: _onPressedEnabled,
            ),
            SizedBox(width: theme.spacings.spacing24),
            const DesignOutlinedButtonLarge(
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
            const DesignOutlinedButtonLarge(
              label: _kBtnLabel,
              rightIcon: Icons.edit,
              onPressed: _onPressedEnabled,
            ),
            SizedBox(width: theme.spacings.spacing24),
            const DesignOutlinedButtonLarge(
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

class _OutlinedButtonFullWidthSubsection extends StatelessWidget {
  const _OutlinedButtonFullWidthSubsection({Key? key}) : super(key: key);

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
          child: DesignOutlinedButtonLarge(
            label: _kBtnLabel,
            onPressed: _onPressedEnabled,
          ),
        ),
        SizedBox(height: theme.spacings.spacing12),
        const SizedBox(
          width: double.infinity,
          child: DesignOutlinedButtonLarge(
            label: _kBtnLabel,
            onPressed: _onPressedDisabled,
          ),
        ),
        SizedBox(height: theme.spacings.spacing12),
      ],
    );
  }
}
