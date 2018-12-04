///
/// Created by NieBin on 18-12-4
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///
import "package:flutter/material.dart";
import "../constant/size_const.dart";
import "../view/view_selector.dart";

const _LEFT_TITLE = "padding left";
const _RIGHT_TITLE = "padding right";
const _TOP_TITLE = "padding top";
const _BOTTOM_TITLE = "padding bottom";

const PADDING_VALUES = [
  "0",
  "5",
  "10",
  "15",
  "20",
  "25",
  "30",
  "35",
  "40",
  "45",
  "50"
];

class PaddingSelector extends StatefulWidget {
  PaddingSelector(
      {Key key,
      this.clickLeft,
      this.clickRight,
      this.clickTop,
      this.clickBottom,
      this.mainColor = Colors.white})
      : super(key: key);
  final Color mainColor;
  final ValueChanged<int> clickLeft;
  final ValueChanged<int> clickRight;
  final ValueChanged<int> clickTop;
  final ValueChanged<int> clickBottom;

  @override
  _PaddingState createState() => _PaddingState();
}

class _PaddingState extends State<PaddingSelector> {
  Widget _selector(String title, List<String> values, ValueChanged<int> click) {
    return ViewSelector(
      title: title,
      values: values,
      mainColor: widget.mainColor,
      onClick: click,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: _selector(_LEFT_TITLE, PADDING_VALUES, widget.clickLeft),
            ),
            Expanded(
              flex: 1,
              child: _selector(_RIGHT_TITLE, PADDING_VALUES, widget.clickRight),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: _selector(_TOP_TITLE, PADDING_VALUES, widget.clickTop),
            ),
            Expanded(
              flex: 1,
              child:
                  _selector(_BOTTOM_TITLE, PADDING_VALUES, widget.clickBottom),
            ),
          ],
        ),
      ],
    );
  }
}
