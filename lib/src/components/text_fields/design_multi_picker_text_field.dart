import 'package:flutter/material.dart';
import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter_design_extension/src/components/picker/picker.dart';
import 'package:flutter_design_extension/src/components/picker/style/picker_style.dart';

class DesignMultiColumnPickerTextField extends StatefulWidget {
  final String placeholderText;
  late final DesignTextFieldStatus status;
  late final TextEditingController textEditingController;
  final List<List<String>> data;
  final List<String>? selectData;
  final List? suffix;
  final PickerStyle? pickerStyle;
  final void Function(List<String> res, List<int> position)? onChanged;
  final void Function(List<String> res, List<int> position)? onConfirm;
  final String Function(List<String> res, List<int> position)? onDisplay;
  final void Function(bool isCancel)? onCancel;
  final bool overlapTabBar;
  final BoxDecoration? decoration;
  final bool showLabelText;
  final IconData? prefixIconData;
  final Widget? prefixIconWidget;
  final Widget? suffixIconWidget;
  final DesignTextFieldSuffixType? suffixType;

  DesignMultiColumnPickerTextField({
    required this.placeholderText,
    required this.data,
    DesignTextFieldStatus? status,
    TextEditingController? textEditingController,
    this.onDisplay,
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
  }) {
    this.textEditingController =
        textEditingController ?? TextEditingController();
    this.status = status ??
        DesignTextFieldStatus(statusType: DesignTextFieldStatusType.active);
    if (selectData != null && selectData!.isNotEmpty) {
      this.textEditingController.text = this.onDisplay == null
          ? selectData!.join(", ")
          : this.onDisplay!(selectData!, []);
    }
  }

  @override
  State<DesignMultiColumnPickerTextField> createState() =>
      _DesignMultiColumnPickerTextFieldState();
}

class _DesignMultiColumnPickerTextFieldState
    extends State<DesignMultiColumnPickerTextField> {
  @override
  Widget build(BuildContext context) {
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
                  onConfirm: (res, position) {
                    if (widget.onDisplay != null) {
                      widget.textEditingController.text =
                          widget.onDisplay!(res, position);
                    } else {
                      widget.textEditingController.text = res.join(", ");
                    }
                    if (widget.onConfirm != null) {
                      widget.onConfirm!(res, position);
                    }
                  },
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
