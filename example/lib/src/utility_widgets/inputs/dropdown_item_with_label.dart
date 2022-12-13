import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:example/src/utility_widgets/inputs/custom_dropdown_button_item.dart';
import 'package:flutter/material.dart';

class DropdownItemWithLabel<T> extends StatelessWidget {
  final String label;
  final T selectedItem;
  final List<T> itemList;
  final void Function(T? item) onItemSelected;

  const DropdownItemWithLabel({
    required this.label,
    required this.selectedItem,
    required this.itemList,
    required this.onItemSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: theme.textStyles.secondary_400),
        SizedBox(height: theme.spacings.spacing4),
        CustomDropdownButtonItem(
          selectedItem: selectedItem,
          itemList: itemList,
          onItemSelected: onItemSelected,
        ),
      ],
    );
  }
}
