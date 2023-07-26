import 'package:flutter/material.dart';
import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter_design_extension/src/components/picker/picker.dart';
import 'package:flutter_design_extension/src/components/picker/style/picker_style.dart';

class DesignMultiColumnPickerTextField extends StatefulWidget {
  final String placeholderText;
  final DesignTextFieldStatus status;
  final TextEditingController textEditingController;
  final List<List<String>> data;
  final List<String>? selectData;
  final List? suffix;
  final PickerStyle? pickerStyle;
  final void Function(List<String> res, List<int> position)? onChanged;
  final void Function(List<String> res, List<int> position)? onConfirm;
  final void Function(bool isCancel)? onCancel;
  final bool overlapTabBar;
  final BoxDecoration? decoration;
  final bool showLabelText;
  final IconData? prefixIconData;
  final Widget? prefixIconWidget;
  final Widget? suffixIconWidget;
  final DesignTextFieldSuffixType? suffixType;

  const DesignMultiColumnPickerTextField({
    required this.placeholderText,
    required this.status,
    required this.textEditingController,
    required this.data,
    this.selectData,
    this.suffix,
    this.pickerStyle,
    this.onChanged,
    this.onConfirm,
    this.onCancel,
    this.overlapTabBar = false,
    this.prefixIconData,
    this.prefixIconWidget,
    this.suffixIconWidget,
    this.suffixType = DesignTextFieldSuffixType.dropDown,
    this.decoration,
    this.showLabelText = true,
    super.key,
  });

  @override
  State<DesignMultiColumnPickerTextField> createState() =>
      _DesignMultiColumnPickerTextFieldState();
}

class _DesignMultiColumnPickerTextFieldState
    extends State<DesignMultiColumnPickerTextField> {
  TimeOfDay? time;
  @override
  Widget build(BuildContext context) {
    widget.textEditingController.text =
        time == null ? "" : time!.format(context);
    return Stack(
      children: [
        DesignTextField(
          placeholderText: widget.placeholderText,
          status: widget.status,
          decoration: widget.decoration,
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
                Pickers.showMultiPicker(
                  context,
                  data: widget.data,
                  selectData: widget.selectData,
                  suffix: widget.suffix,
                  pickerStyle: widget.pickerStyle,
                  onChanged: widget.onChanged,
                  onConfirm: widget.onConfirm,
                  onCancel: widget.onCancel,
                  overlapTabBar: widget.overlapTabBar,
                );
              },
              child: Container(),
            ),
          )
      ],
    );
  }
}
