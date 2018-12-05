///
/// Created by NieBin on 18-12-5
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///

import "package:flutter/material.dart";
import 'view_selector.dart';

const _DIRECTION_TITTLE = "Parent Scroll Direction";
const _DIRECTION_VALUES = ["Vertical", "Horizontal"];

const _PARENT_TITLE = "Parent List Count";
const _PARENT_VALUES = ["2", "4", "6", "8", "10"];

const _CHILD_TITLE = "Clild List Count";
const _CHILD_VALUES = ["10", "20", "30", "40", "50"];

class NestSelector extends StatefulWidget {
  NestSelector(
      {Key key,
      this.clickParent,
      this.clickChild,
      this.clickDirection,
      this.mainColor = Colors.white})
      : super(key: key);
  final ValueChanged<int> clickParent;
  final ValueChanged<int> clickChild;
  final ValueChanged<Axis> clickDirection;
  final Color mainColor;

  @override
  _NestState createState() => _NestState();
}

class _NestState extends State<NestSelector> {
  void _clickParent(pos) {
    widget.clickParent((pos + 1) * 2);
  }

  void _clickChild(pos) {
    widget.clickChild((pos + 1) * 10);
  }

  void _clickDirection(pos) {
    widget.clickDirection(pos == 0 ? Axis.vertical : Axis.horizontal);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(children: <Widget>[
          Expanded(
            child: ViewSelector(
              title: _DIRECTION_TITTLE,
              values: _DIRECTION_VALUES,
              mainColor: widget.mainColor,
              onClick: _clickDirection,
            ),
          ),
        ]),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: ViewSelector(
                title: _PARENT_TITLE,
                values: _PARENT_VALUES,
                mainColor: widget.mainColor,
                onClick: _clickParent,
              ),
            ),
            Expanded(
              flex: 1,
              child: ViewSelector(
                title: _CHILD_TITLE,
                values: _CHILD_VALUES,
                mainColor: widget.mainColor,
                onClick: _clickChild,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
