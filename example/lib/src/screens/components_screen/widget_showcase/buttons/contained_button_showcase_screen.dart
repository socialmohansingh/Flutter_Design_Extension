import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:example/src/utility_widgets/layout/widget_showcase_screen.dart';
import 'package:flutter/material.dart';

const String _kBtnLabel = 'Button label';
const dynamic _onPressedDisabled = null;
// ignore: avoid_print
void _onPressedEnabled() => print('onPressed');

class ContainedButtonShowcaseScreen extends StatelessWidget {
  const ContainedButtonShowcaseScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return WidgetShowcaseScreen(
      title: 'Contained Button',
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: theme.spacings.spacing16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: theme.spacings.spacing24),
              const _ContainedButtonSmallSubsection(),
              SizedBox(height: theme.spacings.spacing24),
              const _ContainedButtonMediumSubsection(),
              SizedBox(height: theme.spacings.spacing24),
              const _ContainedButtonLargeSubsection(),
              SizedBox(height: theme.spacings.spacing48),
              const _ContainedButtonFullWidthSubsection(),
              SizedBox(height: theme.spacings.spacing48),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContainedButtonSmallSubsection extends StatelessWidget {
  const _ContainedButtonSmallSubsection({Key? key}) : super(key: key);

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
            const DesignContainedButtonSmall(
              label: _kBtnLabel,
              onPressed: _onPressedEnabled,
            ),
            SizedBox(width: theme.spacings.spacing24),
            const DesignContainedButtonSmall(
              label: _kBtnLabel,
              onPressed: _onPressedDisabled,
            ),
          ],
        ),
        SizedBox(height: theme.spacings.spacing12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const DesignContainedButtonSmall(
              label: _kBtnLabel,
              leftIcon: Icons.edit,
              onPressed: _onPressedEnabled,
            ),
            SizedBox(width: theme.spacings.spacing24),
            const DesignContainedButtonSmall(
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
            const DesignContainedButtonSmall(
              label: _kBtnLabel,
              rightIcon: Icons.edit,
              onPressed: _onPressedEnabled,
            ),
            SizedBox(width: theme.spacings.spacing24),
            const DesignContainedButtonSmall(
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

class _ContainedButtonMediumSubsection extends StatelessWidget {
  const _ContainedButtonMediumSubsection({Key? key}) : super(key: key);

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
            const DesignContainedButtonMedium(
              label: _kBtnLabel,
              onPressed: _onPressedEnabled,
            ),
            SizedBox(width: theme.spacings.spacing24),
            const DesignContainedButtonMedium(
              label: _kBtnLabel,
              onPressed: _onPressedDisabled,
            ),
          ],
        ),
        SizedBox(height: theme.spacings.spacing12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const DesignContainedButtonMedium(
              label: _kBtnLabel,
              leftIcon: Icons.edit,
              onPressed: _onPressedEnabled,
            ),
            SizedBox(width: theme.spacings.spacing24),
            const DesignContainedButtonMedium(
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
            const DesignContainedButtonMedium(
              label: _kBtnLabel,
              rightIcon: Icons.edit,
              onPressed: _onPressedEnabled,
            ),
            SizedBox(width: theme.spacings.spacing24),
            const DesignContainedButtonMedium(
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

class _ContainedButtonLargeSubsection extends StatelessWidget {
  const _ContainedButtonLargeSubsection({Key? key}) : super(key: key);

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
            const DesignContainedButtonLarge(
              label: _kBtnLabel,
              onPressed: _onPressedEnabled,
            ),
            SizedBox(width: theme.spacings.spacing24),
            const DesignContainedButtonLarge(
              label: _kBtnLabel,
              onPressed: _onPressedDisabled,
            ),
          ],
        ),
        SizedBox(height: theme.spacings.spacing12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const DesignContainedButtonLarge(
              label: _kBtnLabel,
              leftIcon: Icons.edit,
              onPressed: _onPressedEnabled,
            ),
            SizedBox(width: theme.spacings.spacing24),
            const DesignContainedButtonLarge(
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
            const DesignContainedButtonLarge(
              label: _kBtnLabel,
              rightIcon: Icons.edit,
              onPressed: _onPressedEnabled,
            ),
            SizedBox(width: theme.spacings.spacing24),
            const DesignContainedButtonLarge(
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

class _ContainedButtonFullWidthSubsection extends StatelessWidget {
  const _ContainedButtonFullWidthSubsection({Key? key}) : super(key: key);

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
          child: DesignContainedButtonLarge(
            label: _kBtnLabel,
            onPressed: _onPressedEnabled,
          ),
        ),
        SizedBox(height: theme.spacings.spacing12),
        const SizedBox(
          width: double.infinity,
          child: DesignContainedButtonLarge(
            label: _kBtnLabel,
            onPressed: _onPressedDisabled,
          ),
        ),
        SizedBox(height: theme.spacings.spacing12),
      ],
    );
  }
}
