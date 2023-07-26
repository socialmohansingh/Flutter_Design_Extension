import 'package:flutter/material.dart';
import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:intl/intl.dart';

class DesignDatePickerTextField extends StatefulWidget {
  final String placeholderText;
  final String dateFormat;
  final DesignTextFieldStatus status;
  final TextEditingController textEditingController;
  final Function(DateTime pickedDate) onDatePicked;
  final BoxDecoration? decoration;
  final DateTime? currentDate;
  final DatePickerMode initialDatePickerMode;
  final DateTime? initialDate;
  final bool showLabelText;
  final DateTime? lastDate;
  final IconData? prefixIconData;
  final Widget? prefixIconWidget;
  final Widget? suffixIconWidget;
  final DesignTextFieldSuffixType? suffixType;

  const DesignDatePickerTextField({
    required this.placeholderText,
    required this.status,
    required this.textEditingController,
    required this.onDatePicked,
    this.prefixIconData,
    this.prefixIconWidget,
    this.suffixIconWidget,
    this.suffixType = DesignTextFieldSuffixType.dropDown,
    this.dateFormat = "yyyy-MM-dd",
    this.currentDate,
    this.decoration,
    this.showLabelText = true,
    this.initialDatePickerMode = DatePickerMode.day,
    this.initialDate,
    this.lastDate,
    super.key,
  });

  @override
  State<DesignDatePickerTextField> createState() =>
      _DesignDatePickerTextFieldState();
}

class _DesignDatePickerTextFieldState extends State<DesignDatePickerTextField> {
  DateTime? dateTime;
  @override
  Widget build(BuildContext context) {
    widget.textEditingController.text =
        dateTime == null ? "" : DateFormat(widget.dateFormat).format(dateTime!);
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
                _showDatePickerDialog(
                  context,
                  currentDate: widget.currentDate,
                  firstDate: widget.initialDate,
                  lastDate: widget.lastDate,
                  initialDatePickerMode: widget.initialDatePickerMode,
                  onDatePicked: (value) {
                    dateTime = value;
                    widget.textEditingController.text =
                        DateFormat(widget.dateFormat).format(value);
                    widget.onDatePicked(value);
                    setState(() {});
                  },
                );
              },
              child: Container(),
            ),
          )
      ],
    );
  }
}

class DesignTimePickerTextField extends StatefulWidget {
  final String placeholderText;
  final DesignTextFieldStatus status;
  final TextEditingController textEditingController;
  final Function(TimeOfDay pickedTime) onTimePicked;
  final BoxDecoration? decoration;
  final TimeOfDay? currentTime;
  final bool showLabelText;
  final IconData? prefixIconData;
  final Widget? prefixIconWidget;
  final Widget? suffixIconWidget;
  final DesignTextFieldSuffixType? suffixType;

  const DesignTimePickerTextField({
    required this.placeholderText,
    required this.status,
    required this.textEditingController,
    required this.onTimePicked,
    this.prefixIconData,
    this.prefixIconWidget,
    this.suffixIconWidget,
    this.suffixType = DesignTextFieldSuffixType.dropDown,
    this.currentTime,
    this.decoration,
    this.showLabelText = true,
    super.key,
  });

  @override
  State<DesignTimePickerTextField> createState() =>
      _DesignTimePickerTextFieldState();
}

class _DesignTimePickerTextFieldState extends State<DesignTimePickerTextField> {
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
                _showTimePickerDialog(
                  context,
                  onTimePicked: (value) {
                    time = value;
                    widget.textEditingController.text = value.format(context);
                    widget.onTimePicked(value);
                    setState(() {});
                  },
                );
              },
              child: Container(),
            ),
          )
      ],
    );
  }
}

Future<void> _showDatePickerDialog(
  BuildContext context, {
  required Function(DateTime pickedDate) onDatePicked,
  DateTime? currentDate,
  DatePickerMode initialDatePickerMode = DatePickerMode.day,
  DateTime? firstDate,
  DateTime? lastDate,
}) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: currentDate ?? DateTime.now(),
    initialDatePickerMode: initialDatePickerMode,
    firstDate: firstDate ?? DateTime(1900),
    lastDate: lastDate ?? DateTime.now().add(const Duration(days: 365 * 20)),
  );
  if (picked != null) {
    onDatePicked(picked);
  }
}

Future<void> _showTimePickerDialog(
  BuildContext context, {
  required Function(TimeOfDay pickedTime) onTimePicked,
}) async {
  final TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );
  if (picked != null) {
    onTimePicked(picked);
  }
}
