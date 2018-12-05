///
/// Created by NieBin on 18-12-5
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///
import "package:flutter/material.dart";
import 'view_selector.dart';

const _SCROLL_TITLE = "Scroll Direction";
const _SCROLL_VALUES = ["Vertical", "Horizontal"];

class ListSelector extends StatefulWidget {
  ListSelector({
    Key key,
    this.clickDirection,
    this.mainColor = Colors.white,
  }) : super(key: key);
  final Color mainColor;
  final ValueChanged<Axis> clickDirection;

  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<ListSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ViewSelector(
            title: _SCROLL_TITLE,
            values: _SCROLL_VALUES,
            mainColor: widget.mainColor,
            onClick: (pos) {
              widget.clickDirection(pos == 0 ? Axis.vertical : Axis.horizontal);
            },
          ),
        )
      ],
    );
  }
}
