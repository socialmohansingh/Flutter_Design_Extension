import 'package:flutter/material.dart';
import 'package:flutter_design_extension/flutter_design_extension.dart';

class DesignMultiSelectorBottomSheetTextField<V> extends StatefulWidget {
  final String placeholderText;
  late final DesignTextFieldStatus status;
  late final TextEditingController textEditingController;
  final BoxDecoration? decoration;
  final Text? buttonText;
  final Icon? buttonIcon;
  final List<MultiSelectItem<V>> items;
  final List<V> initialValue;
  final Widget? title;
  final void Function(List<V>)? onSelectionChanged;
  final void Function(List<V>)? onConfirm;
  final bool searchable;
  final Text? confirmText;
  final Text? cancelText;
  final MultiSelectListType? listType;
  final Color? selectedColor;
  final String? searchHint;
  final double? initialChildSize;
  final double? minChildSize;
  final double? maxChildSize;
  final ShapeBorder? shape;
  final Color? barrierColor;
  final MultiSelectChipDisplay<V>? chipDisplay;
  final Color Function(V)? colorator;
  final Color? backgroundColor;
  final Color? unselectedColor;
  final Icon? searchIcon;
  final Icon? closeSearchIcon;
  final TextStyle? itemsTextStyle;
  final TextStyle? selectedItemsTextStyle;
  final TextStyle? searchTextStyle;
  final TextStyle? searchHintStyle;
  final bool separateSelectedItems;
  final Color? checkColor;
  final bool isDismissible;
  FormFieldState<List<V>>? state;
  final BoxDecoration? fieldDecoration;
  final bool showLabelText;
  final IconData? prefixIconData;
  final Widget? prefixIconWidget;
  final Widget? suffixIconWidget;
  final DesignTextFieldSuffixType? suffixType;

  DesignMultiSelectorBottomSheetTextField({
    required this.placeholderText,
    DesignTextFieldStatus? status,
    TextEditingController? textEditingController,
    this.prefixIconData,
    this.prefixIconWidget,
    this.suffixIconWidget,
    this.suffixType = DesignTextFieldSuffixType.dropDown,
    this.fieldDecoration,
    this.showLabelText = true,
    required this.items,
    this.title,
    this.buttonText,
    this.buttonIcon,
    this.listType,
    this.decoration,
    this.onSelectionChanged,
    this.onConfirm,
    this.chipDisplay,
    required this.initialValue,
    required this.searchable,
    this.confirmText,
    this.cancelText,
    this.selectedColor,
    this.initialChildSize,
    this.minChildSize,
    this.maxChildSize,
    this.shape,
    this.barrierColor,
    this.searchHint,
    this.colorator,
    this.backgroundColor,
    this.unselectedColor,
    this.searchIcon,
    this.closeSearchIcon,
    this.itemsTextStyle,
    this.searchTextStyle,
    this.searchHintStyle,
    this.selectedItemsTextStyle,
    this.separateSelectedItems = false,
    this.checkColor,
    required this.isDismissible,
    super.key,
  }) {
    this.textEditingController =
        textEditingController ?? TextEditingController();
    this.status = status ??
        DesignTextFieldStatus(statusType: DesignTextFieldStatusType.active);
    // if (selectData != null) {
    //   this.textEditingController.text = buildTitle(selectData as V, -1);
    // }
  }

  @override
  State<DesignMultiSelectorBottomSheetTextField> createState() =>
      _DesignMultiSelectorBottomSheetTextFieldState<V>();
}

class _DesignMultiSelectorBottomSheetTextFieldState<V>
    extends State<DesignMultiSelectorBottomSheetTextField<V>> {
  List<V> _selectedItems = [];
  @override
  void initState() {
    super.initState();
    _selectedItems.addAll(widget.initialValue);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DesignTextField(
          placeholderText: widget.placeholderText,
          status: widget.status,
          decoration: widget.fieldDecoration,
          showLabelText: widget.showLabelText,
          suffixType: widget.suffixType,
          prefixIconData: widget.prefixIconData,
          prefixIconWidget: widget.prefixIconWidget,
          suffixIconWidget: widget.suffixIconWidget,
          textEditingController: widget.textEditingController,
          focusNode: FocusNode(),
        ),
        if (!(widget.status.statusType == DesignTextFieldStatusType.disabled ||
            widget.status.statusType == DesignTextFieldStatusType.readOnly))
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: TextButton(
              onPressed: () {
                _showBottomSheet(context);
              },
              child: Container(),
            ),
          )
      ],
    );
  }

  _showBottomSheet(BuildContext ctx) async {
    List<V>? myVar = await showModalBottomSheet<List<V>>(
        isDismissible: widget.isDismissible,
        backgroundColor: widget.backgroundColor,
        barrierColor: widget.barrierColor,
        shape: widget.shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
            ),
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return MultiSelectBottomSheet<V>(
            checkColor: widget.checkColor,
            selectedItemsTextStyle: widget.selectedItemsTextStyle,
            searchTextStyle: widget.searchTextStyle,
            searchHintStyle: widget.searchHintStyle,
            itemsTextStyle: widget.itemsTextStyle,
            searchIcon: widget.searchIcon,
            closeSearchIcon: widget.closeSearchIcon,
            unselectedColor: widget.unselectedColor,
            colorator: widget.colorator,
            searchHint: widget.searchHint,
            selectedColor: widget.selectedColor,
            listType: widget.listType,
            items: widget.items,
            cancelText: widget.cancelText,
            confirmText: widget.confirmText,
            separateSelectedItems: widget.separateSelectedItems,
            initialValue: _selectedItems,
            onConfirm: (selected) {
              _selectedItems = selected;
              List<MultiSelectItem<V>?> displayItems = [];
              displayItems = _selectedItems.map((e) {
                final index =
                    widget.items.indexWhere((element) => e == element.value);
                if (index >= 0) {
                  return widget.items[index];
                }
                return null;
              }).toList();
              displayItems.removeWhere((element) => element == null);
              print(displayItems);
              String text = "";
              if (displayItems.isNotEmpty) {
                text = displayItems[0]!.label;
              }
              if (displayItems.length >= 2) {
                text = "$text, ${displayItems[1]!.label}";
              }

              if (displayItems.length > 2) {
                text = "$text, & ${displayItems.length - 2} more";
              }
              print(text);
              widget.textEditingController.text = text;
              if (widget.state != null) {
                widget.state!.didChange(selected);
              }
              if (widget.onConfirm != null) widget.onConfirm!(selected);
            },
            onSelectionChanged: widget.onSelectionChanged,
            searchable: widget.searchable,
            title: widget.title,
            initialChildSize: widget.initialChildSize,
            minChildSize: widget.minChildSize,
            maxChildSize: widget.maxChildSize,
          );
        });
    print(myVar.toString());
    if (myVar != null) {
      _selectedItems = myVar;
    }
  }
}
