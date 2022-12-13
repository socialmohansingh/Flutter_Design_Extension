import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:example/src/blocs/blocs.dart';
import 'package:example/src/screens/border_radius_screen/border_radius_screen.dart';
import 'package:example/src/screens/colors_screen/colors_screen.dart';
import 'package:example/src/screens/components_screen/components_screen.dart';
import 'package:example/src/screens/elevations_screen/elevations_screen.dart';
import 'package:example/src/screens/home_screen/widgets/design_system_category_card.dart';
import 'package:example/src/screens/icons_screen/icons_screen.dart';
import 'package:example/src/screens/opacity_screen/opacity_screen.dart';
import 'package:example/src/screens/spacing_screen/spacing_screen.dart';
import 'package:example/src/screens/typography_screen/typography_screen.dart';
import 'package:example/src/utility_widgets/scaffold/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// This should hold all the design system categories with corresponding screens.
const _kDesignSystemCategories = [
  DesignSystemCategoryCard(title: 'Components', child: ComponentsScreen()),
  DesignSystemCategoryCard(title: 'Typography', child: TypographyScreen()),
  DesignSystemCategoryCard(title: 'Colors', child: ColorsScreen()),
  DesignSystemCategoryCard(title: 'Border Radius', child: BorderRadiusScreen()),
  DesignSystemCategoryCard(title: 'Elevations', child: ElevationsScreen()),
  DesignSystemCategoryCard(title: 'Opacities', child: OpacityScreen()),
  DesignSystemCategoryCard(title: 'Spacings', child: SpacingScreen()),
  DesignSystemCategoryCard(title: 'Icons', child: IconsScreen()),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final cardSpacing = theme.spacings.spacing16;

    return BlocBuilder<ThemeConfigBloc, ThemeConfigState>(
      builder: (context, state) {
        final themeTitle =
            'Theme: ${(state as ThemeConfigInitialized).brand.toString().split('.').last.toUpperCase()}';

        return CustomScaffold(
          title: themeTitle,
          showThemeConfigActionItem: true,
          body: ListView.builder(
            padding: EdgeInsets.only(
              bottom: theme.spacings.spacing40,
              top: theme.spacings.spacing24,
            ),
            itemCount: _kDesignSystemCategories.length,
            itemBuilder: (context, index) => Column(
              children: [
                _kDesignSystemCategories[index],
                SizedBox(height: cardSpacing),
              ],
            ),
          ),
        );
      },
    );
  }
}
