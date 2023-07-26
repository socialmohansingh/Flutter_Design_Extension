import 'package:flutter/material.dart';

class PickerStyle {
  BuildContext? _context;

  bool? _showTitleBar;
  Widget? _menu;
  double? _pickerHeight;
  double? _pickerTitleHeight;
  double? _pickerItemHeight;
  double? _menuHeight;

  Widget? _cancelButton;
  Widget? _commitButton;
  Widget? _title;
  Decoration? _headDecoration;
  Color? _backgroundColor;
  Color? _textColor;
  Widget? _itemOverlay;

  PickerStyle({
    BuildContext? context,
    bool? showTitleBar,
    Widget? menu,
    double? pickerHeight,
    double? pickerTitleHeight,
    double? pickerItemHeight,
    double? menuHeight,
    Widget? cancelButton,
    Widget? commitButton,
    Widget? title,
    Decoration? headDecoration,
    Color? backgroundColor,
    Color? textColor,
    Widget? itemOverlay,
  }) {
    _context = context;
    _showTitleBar = showTitleBar;
    _menu = menu;

    _pickerHeight = pickerHeight;
    _pickerTitleHeight = pickerTitleHeight;
    _pickerItemHeight = pickerItemHeight;
    _menuHeight = menuHeight;

    _cancelButton = cancelButton;
    _commitButton = commitButton;
    _title = title;
    _headDecoration = headDecoration;
    _backgroundColor = backgroundColor;
    _textColor = textColor;
    _itemOverlay = itemOverlay;
  }

  set context(BuildContext? value) {
    _context = value;
  }

  set menuHeight(double value) {
    _menuHeight = value;
  }

  set menu(Widget? value) {
    _menu = value;
  }

  set pickerHeight(double value) {
    _pickerHeight = value;
  }

  set pickerTitleHeight(double value) {
    _pickerTitleHeight = value;
  }

  set pickerItemHeight(double value) {
    _pickerItemHeight = value;
  }

  set cancelButton(Widget value) {
    _cancelButton = value;
  }

  set commitButton(Widget value) {
    _commitButton = value;
  }

  set itemOverlay(Widget? value) {
    _itemOverlay = value;
  }

  set title(Widget value) {
    _title = value;
  }

  set headDecoration(Decoration value) {
    _headDecoration = value;
  }

  set backgroundColor(Color value) {
    _backgroundColor = value;
  }

  set textColor(Color value) {
    _textColor = value;
  }

  set showTitleBar(bool value) {
    _showTitleBar = value;
  }

  BuildContext? get context => _context;

  Color get backgroundColor => _backgroundColor ?? Colors.white;

  Decoration get headDecoration =>
      _headDecoration ?? const BoxDecoration(color: Colors.white);

  Widget? get menu => _menu;

  double get menuHeight => _menuHeight ?? 36.0;

  double get pickerHeight => _pickerHeight ?? 220.0;

  double get pickerItemHeight => _pickerItemHeight ?? 40.0;

  double get pickerTitleHeight => _pickerTitleHeight ?? 44.0;

  bool get showTitleBar => _showTitleBar ?? true;

  Color get textColor => _textColor ?? Colors.black87;

  Widget get title => _title ?? const SizedBox();

  Widget get commitButton => getCommitButton();

  Widget get cancelButton => getCancelButton();

  Widget? get itemOverlay => _itemOverlay;

  Widget getCommitButton() {
    return _commitButton ??
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(left: 12, right: 22),
          child: Text('DONE',
              style: TextStyle(
                  color: Theme.of(context!).primaryColor, fontSize: 16.0)),
        );
  }

  Widget getCancelButton() {
    return _cancelButton ??
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(left: 22, right: 12),
          child: Text('CANCEL',
              style: TextStyle(
                  color: Theme.of(context!).unselectedWidgetColor,
                  fontSize: 16.0)),
        );
  }
}
