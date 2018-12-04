///
/// Created by NieBin on 18-12-4
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///

import "package:flutter/material.dart";
import "view_selector.dart";

const _SET_TYPE_TITLE = "Set Type";
const _SET_TYPE_VALUES = ["Align", "Position"];

const _DIRECTION_TITLE = "Align Direcation";
const _DIRECTION_VALUES = [
  "top\nstart",
  "top\ncenter",
  "top\nend",
  "center\nstart",
  "center",
  "center\nend",
  "bottom\nstart",
  "bottom\ncenter",
  "bottom\nend",
];
enum StackType {
  Align,
  Position,
}

class StackSelector extends StatefulWidget {
  StackSelector(
      {Key key, this.typeClick, this.alignClick, this.mainColor = Colors.white})
      : super(key: key);
  final Color mainColor;
  final ValueChanged<StackType> typeClick;
  final ValueChanged<AlignmentDirectional> alignClick;

  @override
  _StackState createState() => _StackState();
}

class _StackState extends State<StackSelector> {
  void _clickType(pos) {
    widget.typeClick(pos == 0 ? StackType.Align : StackType.Position);
  }

  void _clickDirection(pos) {
    var align = AlignmentDirectional.topStart;
    switch (pos) {
      case 0:
        align = AlignmentDirectional.topStart;
        break;
      case 1:
        align = AlignmentDirectional.topCenter;
        break;
      case 2:
        align = AlignmentDirectional.topEnd;
        break;
      case 3:
        align = AlignmentDirectional.centerStart;
        break;
      case 4:
        align = AlignmentDirectional.center;
        break;
      case 5:
        align = AlignmentDirectional.centerEnd;
        break;
      case 6:
        align = AlignmentDirectional.bottomStart;
        break;
      case 7:
        align = AlignmentDirectional.bottomCenter;
        break;
      case 8:
        align = AlignmentDirectional.bottomEnd;
        break;
      default:
        align = AlignmentDirectional.topStart;
        break;
    }
    widget.alignClick(align);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: ViewSelector(
              title: _SET_TYPE_TITLE,
              values: _SET_TYPE_VALUES,
              mainColor: widget.mainColor,
              onClick: _clickType,
            ),
          ),
          Expanded(
            child: ViewSelector(
              title: _DIRECTION_TITLE,
              values: _DIRECTION_VALUES,
              mainColor: widget.mainColor,
              onClick: _clickDirection,
            ),
          ),
        ],
      ),
    );
  }
}
