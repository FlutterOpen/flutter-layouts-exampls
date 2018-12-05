///
/// Created by NieBin on 18-12-5
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///

import "package:flutter/material.dart";
import 'view_selector.dart';

const _DIRECTION_TITLE = "Scroll Direction";
const _DIRECTION_VALUES = ["Horizontal", "Vertical"];

const _JUMP_TITLE = "Jump To Page";
const _JUMP_VALUES = ["1", "2", "3", "4"];

class PageSelector extends StatefulWidget {
  PageSelector({Key key, this.mainColor, this.clickDirection, this.clickPage})
      : super(key: key);
  final Color mainColor;
  final ValueChanged<Axis> clickDirection;
  final ValueChanged<int> clickPage;

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<PageSelector> {
  void _clickDirection(pos) {
    widget.clickDirection(pos == 0 ? Axis.horizontal : Axis.vertical);
  }

  void _clickPage(pos) {
    widget.clickPage(pos);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: ViewSelector(
            title: _DIRECTION_TITLE,
            values: _DIRECTION_VALUES,
            mainColor: widget.mainColor,
            onClick: _clickDirection,
          ),
        ),
        Expanded(
          flex: 1,
          child: ViewSelector(
            title: _JUMP_TITLE,
            values: _JUMP_VALUES,
            mainColor: widget.mainColor,
            onClick: _clickPage,
          ),
        )
      ],
    );
  }
}
