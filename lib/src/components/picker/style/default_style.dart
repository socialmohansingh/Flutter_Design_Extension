// 日间圆角
import 'package:flutter/material.dart';
import 'package:flutter_design_extension/src/components/picker/style/picker_style.dart';

const headDecorationLight = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10), topRight: Radius.circular(10)));

class NoTitleStyle extends PickerStyle {
  NoTitleStyle() {
    showTitleBar = false;
  }

  /// 夜间
  NoTitleStyle.dark() {
    showTitleBar = false;
    backgroundColor = Colors.grey[800]!;
    textColor = Colors.white;
  }
}

/// 默认样式
class DefaultPickerStyle extends PickerStyle {
  DefaultPickerStyle({bool haveRadius: false, String? title}) {
    if (haveRadius) {
      headDecoration = const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)));
    }
    if (title != null && title != '') {
      this.title = Center(
          child: Text(title,
              style: const TextStyle(color: Colors.grey, fontSize: 14)));
    }
  }

  DefaultPickerStyle.dark({bool haveRadius: false, String? title}) {
    commitButton = Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 12, right: 22),
      child: const Text('DONE',
          style: TextStyle(color: Colors.white, fontSize: 16.0)),
    );

    cancelButton = Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 22, right: 12),
      child: const Text('CANCEL',
          style: TextStyle(color: Colors.white, fontSize: 16.0)),
    );

    headDecoration = BoxDecoration(
        color: Colors.grey[800],
        borderRadius: !haveRadius
            ? null
            : const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)));

    if (title != null && title != '') {
      this.title = Center(
          child:
              Text(title, style: TextStyle(color: Colors.white, fontSize: 14)));
    }

    backgroundColor = Colors.grey[800]!;
    textColor = Colors.white;
  }
}

class ClosePickerStyle extends PickerStyle {
  ClosePickerStyle({bool haveRadius: false, String? title}) {
    if (haveRadius) {
      headDecoration = const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)));
    }

    cancelButton = const SizedBox();
    if (title != null && title != '') {
      this.title = Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(title,
                style: const TextStyle(color: Colors.grey, fontSize: 14))),
      );
    }
    commitButton = Container(
      margin: const EdgeInsets.only(right: 12),
      child: const Icon(Icons.close, color: Colors.grey, size: 28),
    );
  }

  ClosePickerStyle.dark({bool haveRadius: false, String? title}) {
    headDecoration = BoxDecoration(
        color: Colors.grey[800],
        borderRadius: !haveRadius
            ? null
            : const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)));

    cancelButton = const SizedBox();
    commitButton = Container(
      margin: const EdgeInsets.only(right: 12),
      child: const Icon(Icons.close, color: Colors.white, size: 28),
    );
    if (title != null && title != '') {
      this.title = Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(title,
                style: const TextStyle(color: Colors.white, fontSize: 14))),
      );
    }

    backgroundColor = Colors.grey[800]!;
    textColor = Colors.white;
  }
}

class RaisedPickerStyle extends PickerStyle {
  RaisedPickerStyle(
      {bool haveRadius: false, String? title, Color color: Colors.blue}) {
    if (haveRadius) {
      headDecoration = const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)));
    }
    commitButton = Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
      margin: const EdgeInsets.only(right: 22),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(4)),
      child: const Text('DONE',
          style: TextStyle(color: Colors.white, fontSize: 15.0)),
    );

    cancelButton = Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
      margin: const EdgeInsets.only(left: 22),
      decoration: BoxDecoration(
          border: Border.all(color: color, width: 1),
          borderRadius: BorderRadius.circular(4)),
      child: Text('CANCEL', style: TextStyle(color: color, fontSize: 15.0)),
    );

    if (title != null && title != '') {
      this.title = Center(
          child: Text(title,
              style: const TextStyle(color: Colors.grey, fontSize: 14)));
    }
  }

  RaisedPickerStyle.dark({
    bool haveRadius = false,
    String? title,
    Color? color,
  }) {
    headDecoration = BoxDecoration(
        color: Colors.grey[800],
        borderRadius: !haveRadius
            ? null
            : const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)));

    commitButton = Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
      margin: const EdgeInsets.only(right: 22),
      decoration: BoxDecoration(
          color: color ?? Colors.blue, borderRadius: BorderRadius.circular(4)),
      child: const Text('DONE',
          style: TextStyle(color: Colors.white, fontSize: 15.0)),
    );

    cancelButton = Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
      margin: const EdgeInsets.only(left: 22),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(4)),
      child: const Text('CANCEL',
          style: TextStyle(color: Colors.white, fontSize: 15.0)),
    );

    if (title != null && title != '') {
      this.title = Center(
          child: Text(title,
              style: const TextStyle(color: Colors.white, fontSize: 14)));
    }

    backgroundColor = Colors.grey[800]!;
    textColor = Colors.white;
  }
}
