///
/// Created by NieBin on 18-12-3
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///
import "package:flutter/material.dart";
import 'view_selector.dart' show ViewSelector;

const LAY_TITLE = "layout";
const LAY_VALUES = ['row', 'column'];

const MAIN_SIZE_TITLE = "Main Axis Size";
const MAIN_SIZE_VALUES = ['min', 'max'];

const MAIN_ALIGN_TITLE = "Main Axis Alignment";
const MAIN_ALIGN_VALUES = [
  'start',
  'end',
  'center',
  'space\nbetween',
  'space\naround',
  'space\nevenly',
];

const CROSS_ALIGN_TITLE = "Cross Axis Alignment";
const CROSS_ALIGN_VALUES = [
  'start',
  'end',
  'center',
  'stretch',
];

enum LayType { row, column }
enum SizeType { min, max }
enum MainAlignType {
  start,
  end,
  center,
  space_between,
  space_around,
  space_evenly
}
//
enum CrossAlignType { start, end, center, stretch }

class RowColumnSelector extends StatefulWidget {
  RowColumnSelector(
      {Key key,
      this.clickLayout,
      this.clickMainSize,
      this.clickMainAlign,
      this.clickCrossAlign,
      this.mainColor = Colors.black26})
      : super(key: key);
  final ValueChanged<LayType> clickLayout;
  final ValueChanged<MainAxisSize> clickMainSize;
  final ValueChanged<MainAxisAlignment> clickMainAlign;
  final ValueChanged<CrossAxisAlignment> clickCrossAlign;
  final Color mainColor;

  @override
  _RowColumnState createState() => _RowColumnState();
}

class _RowColumnState extends State<RowColumnSelector> {
  void _changeLay(pos) {
    widget.clickLayout(pos == 0 ? LayType.row : LayType.column);
  }

  void _changeMainSize(pos) {
    MainAxisSize size = MainAxisSize.min;
    switch (pos) {
      case SizeType.min:
        size = MainAxisSize.min;
        break;
      case SizeType.max:
        size = MainAxisSize.max;
        break;
    }
    widget.clickMainSize(size);
  }

  void _changeMainAlign(pos) {
    var align = MainAxisAlignment.start;
    switch (pos) {
      case MainAlignType.start:
        align = MainAxisAlignment.start;
        break;
      case MainAlignType.end:
        align = MainAxisAlignment.end;
        break;
      case MainAlignType.center:
        align = MainAxisAlignment.center;
        break;
      case MainAlignType.space_between:
        align = MainAxisAlignment.spaceBetween;
        break;
      case MainAlignType.space_evenly:
        align = MainAxisAlignment.spaceEvenly;
        break;
      default:
        align = MainAxisAlignment.start;
        break;
    }
    widget.clickMainAlign(align);
  }

  void _changeCrossAlign(pos) {
    var align = CrossAxisAlignment.start;
    switch (pos) {
      case CrossAlignType.start:
        align = CrossAxisAlignment.start;
        break;
      case CrossAlignType.end:
        align = CrossAxisAlignment.end;
        break;
      case CrossAlignType.center:
        align = CrossAxisAlignment.center;
        break;
      case CrossAlignType.stretch:
        align = CrossAxisAlignment.stretch;
        break;
      default:
        align = CrossAxisAlignment.start;
        break;
    }
    widget.clickCrossAlign(align);
  }

  @override
  Widget build(BuildContext context) {
    var color = widget.mainColor;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              ViewSelector(
                title: LAY_TITLE,
                values: LAY_VALUES,
                onClick: _changeLay,
                mainColor: color,
              ),
              ViewSelector(
                title: MAIN_SIZE_TITLE,
                values: MAIN_SIZE_VALUES,
                onClick: _changeMainSize,
                mainColor: color,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              ViewSelector(
                title: MAIN_ALIGN_TITLE,
                values: MAIN_ALIGN_VALUES,
                onClick: _changeMainAlign,
                mainColor: color,
              ),
              ViewSelector(
                title: CROSS_ALIGN_TITLE,
                values: CROSS_ALIGN_VALUES,
                onClick: _changeCrossAlign,
                mainColor: color,
              ),
            ],
          ),
        )
      ],
    );
  }
}
