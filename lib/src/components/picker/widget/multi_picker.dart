import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_extension/src/components/picker/style/picker_style.dart';

typedef MultipleCallback(List<String> res, List<int> position);

class MultiplePickerRoute<T> extends PopupRoute<T> {
  MultiplePickerRoute({
    required this.pickerStyle,
    required this.data,
    required this.selectData,
    this.suffix,
    this.onChanged,
    this.onConfirm,
    this.onCancel,
    this.theme,
    this.barrierLabel,
    RouteSettings? settings,
  }) : super(settings: settings);

  final List<List<String>> data;
  final List<String> selectData;
  final List? suffix;
  final void Function(List<String> res, List<int> position)? onChanged;
  final void Function(List<String> res, List<int> position)? onConfirm;
  final void Function(bool isCancel)? onCancel;
  final ThemeData? theme;

  final PickerStyle pickerStyle;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

  @override
  bool get barrierDismissible => true;

  @override
  bool didPop(T? result) {
    if (onCancel != null) {
      if (result == null) {
        onCancel!(false);
      } else if (!(result as bool)) {
        onCancel!(true);
      }
    }
    return super.didPop(result);
  }

  @override
  final String? barrierLabel;

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
    Widget bottomSheet = MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: _PickerContentView(
        data: data,
        selectData: selectData,
        pickerStyle: pickerStyle,
        route: this,
      ),
    );
    if (theme != null) {
      bottomSheet = Theme(data: theme!, child: bottomSheet);
    }

    return bottomSheet;
  }
}

class _PickerContentView extends StatefulWidget {
  _PickerContentView({
    Key? key,
    required this.data,
    required this.pickerStyle,
    required this.selectData,
    required this.route,
  }) : super(key: key);

  final List<List<String>> data;
  final List<String> selectData;
  final MultiplePickerRoute route;
  final PickerStyle pickerStyle;

  @override
  State<StatefulWidget> createState() =>
      _PickerState(this.data, this.selectData, this.pickerStyle);
}

class _PickerState extends State<_PickerContentView> {
  final PickerStyle _pickerStyle;
  late List<String> _selectData;
  late List<int> _selectDataPosition;
  List<List<String>> _data;

  AnimationController? controller;
  Animation<double>? animation;

  List<FixedExtentScrollController> scrollCtrl = [];

  _PickerState(this._data, List mSelectData, this._pickerStyle) {
    this._selectData = [];
    this._selectDataPosition = [];
    this._data.asMap().keys.forEach((index) {
      if (index >= mSelectData.length) {
        this._selectData.add('');
      } else {
        this._selectData.add(mSelectData[index]);
      }
      this._selectDataPosition.add(0);
    });

    _init();
  }

  @override
  void dispose() {
    scrollCtrl.forEach((element) {
      element.dispose();
    });
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
    int pindex;
    scrollCtrl.clear();

    this._data.asMap().keys.forEach((index) {
      pindex = 0;
      pindex = _data[index].indexWhere(
          (element) => element.toString() == _selectData[index].toString());
      if (pindex < 0) {
        _selectData[index] = _data[index][0];
        pindex = 0;
      }
      _selectDataPosition[index] = pindex;

      scrollCtrl.add(FixedExtentScrollController(initialItem: pindex));
    });
  }

  void _setPicker(int index, int selectIndex) {
    var selectedName = _data[index][selectIndex];

    _selectData[index] = selectedName;
    _selectDataPosition[index] = selectIndex;

    _notifyLocationChanged();
  }

  void _notifyLocationChanged() {
    if (widget.route.onChanged != null) {
      widget.route.onChanged!(_selectData, _selectDataPosition);
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
    List<Widget> pickerList =
        List.generate(this._data.length, (index) => pickerView(index)).toList();

    return Container(
      height: _pickerStyle.pickerHeight,
      color: _pickerStyle.backgroundColor,
      child: Row(children: pickerList),
    );
  }

  Widget pickerView(int position) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: CupertinoPicker.builder(
          scrollController: scrollCtrl[position],
          selectionOverlay: _pickerStyle.itemOverlay,
          itemExtent: _pickerStyle.pickerItemHeight,
          onSelectedItemChanged: (int selectIndex) =>
              _setPicker(position, selectIndex),
          childCount: _data[position].length,
          itemBuilder: (_, index) {
            String suffix = '';
            if (widget.route.suffix != null &&
                position < widget.route.suffix!.length) {
              suffix = widget.route.suffix![position];
            }

            String text = '${_data[position][index]}$suffix';
            return Align(
                alignment: Alignment.center,
                child: Text(text,
                    style: TextStyle(
                        color: _pickerStyle.textColor, fontSize: 18.0),
                    textAlign: TextAlign.start));
          },
        ),
      ),
    );
  }

  Widget _titleView() {
    return Container(
      height: _pickerStyle.pickerTitleHeight,
      decoration: _pickerStyle.headDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          InkWell(
              onTap: () => Navigator.pop(context, false),
              child: _pickerStyle.cancelButton),
          Expanded(child: _pickerStyle.title),
          InkWell(
              onTap: () {
                if (widget.route.onConfirm != null) {
                  widget.route.onConfirm!(_selectData, _selectDataPosition);
                }
                Navigator.pop(context, true);
              },
              child: _pickerStyle.commitButton)
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
