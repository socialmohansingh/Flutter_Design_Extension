import 'package:flutter/material.dart';
import 'package:flutter_design_extension/flutter_design_extension.dart';

class DesignMultiSelectorDialogTextField<V> extends StatefulWidget {
  final String placeholderText;
  late final DesignTextFieldStatus status;
  late final TextEditingController textEditingController;
  final MultiSelectListType? listType;
  final BoxDecoration? decoration;
  final Text? buttonText;
  final Icon? buttonIcon;
  final Widget? title;
  final List<MultiSelectItem<V>> items;
  final void Function(List<V>)? onSelectionChanged;
  final MultiSelectChipDisplay<V>? chipDisplay;
  final List<V> initialValue;
  final void Function(List<V>)? onConfirm;
  final bool? searchable;
  final Text? confirmText;
  final Text? cancelText;
  final Color? barrierColor;
  final Color? selectedColor;
  final double? dialogHeight;
  final double? dialogWidth;
  final String? searchHint;
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

  DesignMultiSelectorDialogTextField({
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
    this.initialValue = const [],
    this.searchable,
    this.confirmText,
    this.cancelText,
    this.barrierColor,
    this.selectedColor,
    this.searchHint,
    this.dialogHeight,
    this.dialogWidth,
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
  State<DesignMultiSelectorDialogTextField> createState() =>
      _DesignMultiSelectorDialogTextFieldState<V>();
}

class _DesignMultiSelectorDialogTextFieldState<V>
    extends State<DesignMultiSelectorDialogTextField<V>> {
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
                _showDialog(context);
              },
              child: Container(),
            ),
          )
      ],
    );
  }

  /// Calls showDialog() and renders a MultiSelectDialog.
  _showDialog(BuildContext ctx) async {
    await showDialog(
      barrierColor: widget.barrierColor,
      barrierDismissible: widget.isDismissible,
      context: context,
      builder: (ctx) {
        return MultiSelectDialog<V>(
          checkColor: widget.checkColor,
          selectedItemsTextStyle: widget.selectedItemsTextStyle,
          searchHintStyle: widget.searchHintStyle,
          searchTextStyle: widget.searchTextStyle,
          itemsTextStyle: widget.itemsTextStyle,
          searchIcon: widget.searchIcon,
          closeSearchIcon: widget.closeSearchIcon,
          unselectedColor: widget.unselectedColor,
          backgroundColor: widget.backgroundColor,
          colorator: widget.colorator,
          searchHint: widget.searchHint,
          selectedColor: widget.selectedColor,
          onSelectionChanged: widget.onSelectionChanged,
          height: widget.dialogHeight,
          width: widget.dialogWidth,
          listType: widget.listType,
          items: widget.items,
          title: widget.title ?? const Text("Select"),
          initialValue: _selectedItems,
          searchable: widget.searchable ?? false,
          confirmText: widget.confirmText,
          cancelText: widget.cancelText,
          separateSelectedItems: widget.separateSelectedItems,
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
            widget.textEditingController.text = text;
            if (widget.state != null) {
              widget.state!.didChange(_selectedItems);
            }
            if (widget.onConfirm != null) widget.onConfirm!(_selectedItems);
          },
        );
      },
    );
  }
}
