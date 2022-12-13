import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:example/src/blocs/blocs.dart';
import 'package:example/src/utility_widgets/inputs/dropdown_item_with_label.dart';
import 'package:example/src/utility_widgets/scaffold/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeConfigScreen extends StatelessWidget {
  ThemeConfigScreen({super.key});

  final brands = [DefaultBrand()];
  final textDirections = TextDirection.values;

  void _onThemeConfigChanged(
    BuildContext context, {
    required Brand brand,
    required TextDirection textDirection,
  }) {
    BlocProvider.of<ThemeConfigBloc>(context).add(
      UpdateThemeConfig(textDirection: textDirection, brand: brand),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return CustomScaffold(
      title: 'Theme Config',
      body: BlocBuilder<ThemeConfigBloc, ThemeConfigState>(
          builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: theme.spacings.spacing32)
              .copyWith(top: theme.spacings.spacing24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownItemWithLabel<Brand>(
                itemList: brands,
                label: 'Selected Brand:',
                selectedItem: (state as ThemeConfigInitialized).brand,
                onItemSelected: (brand) => _onThemeConfigChanged(
                  context,
                  brand: brand!,
                  textDirection: state.textDirection,
                ),
              ),
              SizedBox(height: theme.spacings.spacing24),
              DropdownItemWithLabel<TextDirection>(
                itemList: textDirections,
                label: 'Selected TextDirection:',
                selectedItem: state.textDirection,
                onItemSelected: (textDirection) => _onThemeConfigChanged(
                  context,
                  brand: state.brand,
                  textDirection: textDirection!,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
