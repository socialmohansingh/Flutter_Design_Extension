import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:example/src/screens/components_screen/widget_showcase/animations/transition_screen/transition_screen.dart';
import 'package:example/src/screens/components_screen/widget_showcase/bottom_sheet/bottom_sheet_showcase_screen.dart';
import 'package:example/src/screens/components_screen/widget_showcase/buttons/buttons_widget_showcase_submenu_screen.dart';
import 'package:example/src/screens/components_screen/widget_showcase/check_boxes/check_boxes_showcase_screen.dart';
import 'package:example/src/screens/components_screen/widget_showcase/dialogs/dialog_showcase_screen.dart';
import 'package:example/src/screens/components_screen/widget_showcase/dividers/divider_showcase_screen.dart';
import 'package:example/src/screens/components_screen/widget_showcase/icons/icons_showcase_screen.dart';
import 'package:example/src/screens/components_screen/widget_showcase/loader/loader_showcase_screen.dart';
import 'package:example/src/screens/components_screen/widget_showcase/radio_buttons/radio_buttons_showcase_screen.dart';
import 'package:example/src/screens/components_screen/widget_showcase/snack_bars/snack_bars_showcase_screen.dart';
import 'package:example/src/screens/components_screen/widget_showcase/tags/tags_screen.dart';
import 'package:example/src/screens/components_screen/widget_showcase/text_fields/text_fields_widget_showcase_screen.dart';
import 'package:example/src/screens/components_screen/widgets/showcase_list_item.dart';
import 'package:flutter/material.dart';

/// Holds all the showcase screens for all the different widgets.
///
/// Should be iteratively expanded whenever new widgets have been added to the
/// Flutter design system package.
const List<ShowcaseListItem> _kShowcaseListItems = [
  ShowcaseListItem(
    "Buttons",
    shouldOpenSubmenu: true,
    child: ButtonsWidgetShowcaseSubmenuScreen(),
  ),
  ShowcaseListItem(
    'Snack Bars',
    child: SnackBarShowcaseScreen(),
  ),
  ShowcaseListItem(
    'Text Fields',
    child: TextFieldsWidgetShowcaseScreen(),
  ),
  ShowcaseListItem(
    "Dividers",
    child: DividerShowcaseScreen(),
  ),
  ShowcaseListItem(
    'Dialogs',
    child: DialogShowcaseScreen(),
  ),
  ShowcaseListItem(
    'Loaders',
    child: LoaderShowcaseScreen(),
  ),
  ShowcaseListItem(
    'RadioButtons',
    child: RadioButtonsShowcaseScreen(),
  ),
  ShowcaseListItem(
    "BottomSheet",
    child: BottomSheetShowcaseScreen(),
  ),
  ShowcaseListItem(
    'Animations',
    child: TransitionScreen(),
  ),
  ShowcaseListItem(
    'Tags',
    child: TagsScreen(),
  ),
  ShowcaseListItem(
    'Icons',
    child: IconsShowcaseScreen(),
  ),
  ShowcaseListItem(
    'Check Boxes',
    child: CheckBoxesShowcaseScreen(),
  ),
];

class ComponentsScreen extends StatelessWidget {
  const ComponentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return CustomScaffold(
      title: const Text('Components'),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: theme.spacings.spacing16,
          vertical: theme.spacings.spacing24,
        ),
        child: ListView.builder(
          physics: const ClampingScrollPhysics(),
          itemCount: _kShowcaseListItems.length,
          itemBuilder: (context, index) => _kShowcaseListItems[index],
        ),
      ),
    );
  }
}
