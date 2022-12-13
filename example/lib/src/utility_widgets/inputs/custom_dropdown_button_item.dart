import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter/material.dart';

class CustomDropdownButtonItem<T> extends StatelessWidget {
  final T selectedItem;
  final List<T> itemList;
  final void Function(T? item) onItemSelected;

  const CustomDropdownButtonItem({
    required this.selectedItem,
    required this.itemList,
    required this.onItemSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return DropdownButton<T>(
      enableFeedback: true,
      isExpanded: true,
      elevation: 10,
      dropdownColor: theme.colors.neutral.white,
      value: selectedItem,
      style: theme.textStyles.buttonText.copyWith(
        color: theme.colors.neutral.gray50,
      ),
      items: _mapItemListToDropdownMenuItem(context, itemList: itemList),
      onChanged: onItemSelected,
    );
  }

  List<DropdownMenuItem<T>> _mapItemListToDropdownMenuItem(
    BuildContext context, {
    required List<T> itemList,
  }) {
    final theme = context.theme;
    return itemList
        .map(
          (T item) => DropdownMenuItem<T>(
            value: item,
            child: Text(
              item.toString(),
              style: theme.textStyles.buttonText.copyWith(
                color: selectedItem == item ? theme.colors.brand.main : null,
              ),
            ),
          ),
        )
        .toList();
  }
}
