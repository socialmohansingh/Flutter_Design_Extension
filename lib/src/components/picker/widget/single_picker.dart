import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_extension/src/components/picker/style/picker_style.dart';

class SinglePickerRoute<T> extends PopupRoute<bool> {
  SinglePickerRoute({
    required this.data,
    this.selectData,
    this.suffix,
    this.onChanged,
    this.onConfirm,
    this.onCancel,
    required this.theme,
    this.barrierLabel,
    required this.pickerStyle,
    required this.buildTitle,
    RouteSettings? settings,
  }) : super(settings: settings);

  final T? selectData;
  final String Function(T data, int position)? buildTitle;
  final List<T> data;
  final void Function(T data, int position)? onChanged;
  final void Function(T data, int position)? onConfirm;
  final void Function(bool isCancel)? onCancel;
  final ThemeData theme;

  final String? suffix;
  final PickerStyle pickerStyle;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

  @override
  bool get barrierDismissible => true;

  @override
  final String? barrierLabel;

  @override
  bool didPop(bool? result) {
    if (onCancel != null) {
      if (result == null) {
        onCancel!(false);
      } else if (!result) {
        onCancel!(true);
      }
    }
    return super.didPop(result);
  }

  @override
  Color get barrierColor => Colors.black54;

  late AnimationController _animationController;

  @override
  AnimationController createAnimationController() {
    _animationController =
        BottomSheet.createAnimationController(navigator!.overlay!);
    return _animationController;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    List<T> mData = [];

    mData.addAll(data);

    Widget bottomSheet = MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: _PickerContentView<T>(
        data: mData,
        selectData: selectData,
        pickerStyle: pickerStyle,
        buildTitle: buildTitle,
        route: this,
        onChanged: onChanged,
        onConfirm: onConfirm,
      ),
    );
    bottomSheet = Theme(data: theme, child: bottomSheet);

    return bottomSheet;
  }
}

class _PickerContentView<T> extends StatefulWidget {
  _PickerContentView({
    Key? key,
    required this.data,
    this.selectData,
    required this.pickerStyle,
    required this.route,
    required this.buildTitle,
    required this.onChanged,
    required this.onConfirm,
  }) : super(key: key);
  final void Function(T data, int position)? onChanged;
  final void Function(T data, int position)? onConfirm;
  final List<T> data;
  final T? selectData;
  final SinglePickerRoute route;
  final PickerStyle pickerStyle;
  final String Function(T data, int position)? buildTitle;
  @override
  State<StatefulWidget> createState() => _PickerState<T>(
        data,
        this.selectData,
        this.pickerStyle,
        this.buildTitle,
        this.onChanged,
        this.onConfirm,
      );
}

class _PickerState<S> extends State<_PickerContentView> {
  final PickerStyle _pickerStyle;
  S? _selectData;
  int _selectPosition = 0;
  // ignore: prefer_final_fields
  List<S> _data = [];
  final String Function(S data, int position)? buildTitle;
  final void Function(S data, int position)? onChanged;
  final void Function(S data, int position)? onConfirm;
  late FixedExtentScrollController scrollCtrl;
  late double _laberLeft;
  _PickerState(
    this._data,
    this._selectData,
    this._pickerStyle,
    this.buildTitle,
    this.onChanged,
    this.onConfirm,
  ) {
    _init();
  }

  @override
  void dispose() {
    scrollCtrl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedBuilder(
        animation: widget.route.animation!,
        builder: (BuildContext context, Widget? child) {
          return ClipRect(
            child: CustomSingleChildLayout(
              delegate: _BottomPickerLayout(widget.route.animation!.value,
                  pickerStyle: _pickerStyle),
              child: GestureDetector(
                child: Material(
                  color: Colors.transparent,
                  child: _renderPickerView(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _init() {
    int pindex = 0;
    pindex = _data
        .indexWhere((element) => element.toString() == _selectData.toString());
    if (pindex < 0) {
      _selectData = _data[0];
      pindex = 0;
    }
    _selectPosition = pindex;

    scrollCtrl = FixedExtentScrollController(initialItem: pindex);
    _laberLeft = _pickerLaberPadding(_data[pindex].toString());
  }

  void _setPicker(int index) {
    var selectedProvince = _data[index];

    _selectData = selectedProvince;
    _selectPosition = index;

    _notifyLocationChanged();
  }

  void _notifyLocationChanged() {
    if (onChanged != null && _selectData != null) {
      onChanged!(_selectData as S, _selectPosition);
    }
  }

  double _pickerLaberPadding(String? text) {
    double left = 60;

    if (text != null) {
      left = left + text.length * 12;
    }
    return left;
  }

  double _pickerFontSize(String text) {
    if (text.length <= 6) {
      return 18.0;
    } else if (text.length < 9) {
      return 16.0;
    } else if (text.length < 13) {
      return 12.0;
    } else {
      return 10.0;
    }
  }

  Widget _renderPickerView() {
    Widget itemView = _renderItemView();

    if (!_pickerStyle.showTitleBar && _pickerStyle.menu == null) {
      return itemView;
    }
    List<Widget> viewList = <Widget>[];
    if (_pickerStyle.showTitleBar) {
      viewList.add(_titleView());
    }
    if (_pickerStyle.menu != null) {
      viewList.add(_pickerStyle.menu!);
    }
    viewList.add(itemView);

    return Column(children: viewList);
  }

  Widget _renderItemView() {
    Widget cPicker = CupertinoPicker.builder(
      scrollController: scrollCtrl,
      itemExtent: _pickerStyle.pickerItemHeight,
      selectionOverlay: _pickerStyle.itemOverlay,
      onSelectedItemChanged: (int index) {
        _setPicker(index);
        if (widget.route.suffix != null && widget.route.suffix != '') {
          double resuleLeft = _pickerLaberPadding(_data[index].toString());
          if (resuleLeft != _laberLeft) {
            setState(() {
              _laberLeft = resuleLeft;
            });
          }
        }
      },
      childCount: _data.length,
      itemBuilder: (_, index) {
        String text = buildTitle != null
            ? buildTitle!(_data[index], index)
            : _data[index].toString();
        return Align(
            alignment: Alignment.center,
            child: Text(text,
                style: TextStyle(
                    color: _pickerStyle.textColor,
                    fontSize: _pickerFontSize(text)),
                textAlign: TextAlign.start));
      },
    );

    Widget view;
    if (widget.route.suffix != null && widget.route.suffix != '') {
      Widget laberView = Center(
          child: AnimatedPadding(
        duration: const Duration(milliseconds: 100),
        padding: EdgeInsets.only(left: _laberLeft),
        child: Text(widget.route.suffix!,
            style: TextStyle(
                color: _pickerStyle.textColor,
                fontSize: 20,
                fontWeight: FontWeight.w500)),
      ));

      view = Stack(children: [cPicker, laberView]);
    } else {
      view = cPicker;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      height: _pickerStyle.pickerHeight,
      color: _pickerStyle.backgroundColor,
      child: view,
    );
  }

  Widget _titleView() {
    return Container(
      height: _pickerStyle.pickerTitleHeight,
      decoration: _pickerStyle.headDecoration,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          InkWell(
            onTap: () => Navigator.pop<bool>(context, false),
            child: _pickerStyle.cancelButton,
          ),
          Expanded(child: _pickerStyle.title),
          InkWell(
            onTap: () {
              if (onConfirm != null && _selectData != null) {
                onConfirm!(_selectData as S, _selectPosition);
              }

              Navigator.pop<bool>(context, true);
            },
            child: _pickerStyle.commitButton,
          )
        ],
      ),
    );
  }
}

class _BottomPickerLayout extends SingleChildLayoutDelegate {
  _BottomPickerLayout(this.progress, {required this.pickerStyle});

  final double progress;
  final PickerStyle pickerStyle;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    double maxHeight = pickerStyle.pickerHeight;
    if (pickerStyle.showTitleBar) {
      maxHeight += pickerStyle.pickerTitleHeight;
    }
    if (pickerStyle.menu != null) {
      maxHeight += pickerStyle.menuHeight;
    }

    return BoxConstraints(
        minWidth: constraints.maxWidth,
        maxWidth: constraints.maxWidth,
        minHeight: 0.0,
        maxHeight: maxHeight);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    double height = size.height - childSize.height * progress;
    return Offset(0.0, height);
  }

  @override
  bool shouldRelayout(_BottomPickerLayout oldDelegate) {
    return progress != oldDelegate.progress;
  }
}
