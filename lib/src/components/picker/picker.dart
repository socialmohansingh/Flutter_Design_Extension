import 'package:flutter/material.dart';
import 'package:flutter_design_extension/src/components/picker/style/default_style.dart';
import 'package:flutter_design_extension/src/components/picker/style/picker_style.dart';
import 'package:flutter_design_extension/src/components/picker/widget/multi_link_picker.dart';
import 'package:flutter_design_extension/src/components/picker/widget/multi_picker.dart';
import 'package:flutter_design_extension/src/components/picker/widget/single_picker.dart';

class Pickers {
  static void showSinglePicker<T>(
    BuildContext context, {
    required List<T> data,
    required String Function(T data, int position) buildTitle,
    T? selectData,
    String? suffix,
    PickerStyle? pickerStyle,
    void Function(T data, int position)? onChanged,
    void Function(T data, int position)? onConfirm,
    void Function(bool isCancel)? onCancel,
    bool overlapTabBar = false,
  }) {
    pickerStyle ??= DefaultPickerStyle();
    pickerStyle.context ??= context;

    Navigator.of(context, rootNavigator: overlapTabBar)
        .push(SinglePickerRoute<T>(
      data: data,
      suffix: suffix,
      selectData: selectData,
      pickerStyle: pickerStyle,
      onChanged: onChanged,
      onConfirm: onConfirm,
      onCancel: onCancel,
      buildTitle: buildTitle,
      theme: Theme.of(context),
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    ));
  }

  static void showMultiPicker(
    BuildContext context, {
    required List<List<String>> data,
    List<String>? selectData,
    List? suffix,
    PickerStyle? pickerStyle,
    void Function(List<String> res, List<int> position)? onChanged,
    void Function(List<String> res, List<int> position)? onConfirm,
    void Function(bool isCancel)? onCancel,
    bool overlapTabBar = false,
  }) {
    selectData ??= [];
    pickerStyle ??= DefaultPickerStyle();
    pickerStyle.context ??= context;

    Navigator.of(context, rootNavigator: overlapTabBar)
        .push(MultiplePickerRoute(
      data: data,
      selectData: selectData,
      suffix: suffix,
      pickerStyle: pickerStyle,
      onChanged: onChanged,
      onConfirm: onConfirm,
      onCancel: onCancel,
      theme: Theme.of(context),
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    ));
  }

  static void showMultiLinkPicker(BuildContext context,
      {required Map<String, List<String>> data,
      required int columeNum,
      List<String>? selectData,
      List<String>? suffix,
      PickerStyle? pickerStyle,
      void Function(List<String> res, List<int> position)? onChanged,
      void Function(List<String> res, List<int> position)? onConfirm,
      void Function(bool isCancel)? onCancel,
      bool overlapTabBar = false}) {
    selectData ??= [];
    pickerStyle ??= DefaultPickerStyle();
    pickerStyle.context ??= context;

    Navigator.of(context, rootNavigator: overlapTabBar)
        .push(MultipleLinkPickerRoute(
      data: data,
      selectData: selectData,
      columeNum: columeNum,
      suffix: suffix,
      pickerStyle: pickerStyle,
      onChanged: onChanged,
      onConfirm: onConfirm,
      onCancel: onCancel,
      theme: Theme.of(context),
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    ));
  }
}
