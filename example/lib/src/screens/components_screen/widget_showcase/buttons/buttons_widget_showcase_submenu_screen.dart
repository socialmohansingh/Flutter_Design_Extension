import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:example/src/screens/components_screen/widget_showcase/buttons/contained_button_showcase_screen.dart';
import 'package:example/src/screens/components_screen/widget_showcase/buttons/outlined_button_showcase_screen.dart';
import 'package:example/src/screens/components_screen/widget_showcase/buttons/text_button_showcase_screen.dart';
import 'package:example/src/screens/components_screen/widgets/showcase_list_item.dart';
import 'package:example/src/utility_widgets/layout/widget_showcase_screen.dart';
import 'package:flutter/material.dart';

const List<ShowcaseListItem> _kShowcaseListItems = [
  ShowcaseListItem("Contained Button", child: ContainedButtonShowcaseScreen()),
  ShowcaseListItem("Outlined Button", child: OutlinedButtonShowcaseScreen()),
  ShowcaseListItem("Text Button", child: TextButtonShowcaseScreen()),
];

class ButtonsWidgetShowcaseSubmenuScreen extends StatelessWidget {
  const ButtonsWidgetShowcaseSubmenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return WidgetShowcaseScreen(
      closable: false,
      title: 'Buttons',
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: theme.spacings.spacing24,
            horizontal: theme.spacings.spacing16,
          ),
          child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            itemCount: _kShowcaseListItems.length,
            itemBuilder: (context, index) => _kShowcaseListItems[index],
          ),
        ),
      ),
    );
  }
}
