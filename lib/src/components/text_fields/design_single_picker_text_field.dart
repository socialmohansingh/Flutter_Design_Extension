import 'package:flutter/material.dart';
import 'package:flutter_design_extension/flutter_design_extension.dart';

class DesignSingleColumnPickerTextField<T> extends StatefulWidget {
  final String placeholderText;
  late final DesignTextFieldStatus status;
  late final TextEditingController textEditingController;
  final List<T> data;
  final T? selectData;
  final String? suffix;
  final PickerStyle? pickerStyle;
  final void Function(T data, int position)? onChanged;
  final void Function(T data, int position)? onConfirm;
  final String Function(T data, int position) buildTitle;
  final void Function(bool isCancel)? onCancel;
  final bool overlapTabBar;
  final BoxDecoration? decoration;
  final bool showLabelText;
  final IconData? prefixIconData;
  final Widget? prefixIconWidget;
  final Widget? suffixIconWidget;
  final DesignTextFieldSuffixType? suffixType;

  DesignSingleColumnPickerTextField({
    required this.placeholderText,
    required this.data,
    required this.buildTitle,
    DesignTextFieldStatus? status,
    TextEditingController? textEditingController,
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
    if (selectData != null) {
      this.textEditingController.text = buildTitle(selectData as T, -1);
    }
  }

  @override
  State<DesignSingleColumnPickerTextField> createState() =>
      _DesignSingleColumnPickerTextFieldState<T>();
}

class _DesignSingleColumnPickerTextFieldState<T>
    extends State<DesignSingleColumnPickerTextField<T>> {
  TimeOfDay? time;
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
                Pickers.showSinglePicker<T>(
                  context,
                  data: widget.data,
                  selectData: widget.selectData,
                  suffix: widget.suffix,
                  pickerStyle: widget.pickerStyle,
                  onChanged: widget.onChanged,
                  onConfirm: (data, position) {
                    widget.textEditingController.text =
                        widget.buildTitle(data, position);
                    if (widget.onConfirm != null) {
                      widget.onConfirm!(data, position);
                    }
                  },
                  onCancel: widget.onCancel,
                  overlapTabBar: widget.overlapTabBar,
                  buildTitle: widget.buildTitle,
                );
              },
              child: Container(),
            ),
          )
      ],
    );
  }
}
