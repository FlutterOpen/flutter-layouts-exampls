///
/// Created by NieBin on 18-12-4
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///

import "package:flutter/material.dart";
import 'view_selector.dart';

const ARRANGE_TITLE = "Row/Column";
const ARRANGE_VALUES = ["Row", "Column"];

const TITLES = ["Expand One", "Expand Two"];
const _NUM_VALUES = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"];

enum ArrangeType { Row, Column }

class ExpandSelector extends StatefulWidget {
  ExpandSelector(
      {Key key,
      this.clickArrange,
      this.clickOne,
      this.clickTwo,
      this.mainColor})
      : super(key: key);
  final ValueChanged<ArrangeType> clickArrange;
  final ValueChanged<int> clickOne;
  final ValueChanged<int> clickTwo;
  final Color mainColor;

  @override
  ExpandState createState() => ExpandState();
}

class ExpandState extends State<ExpandSelector> {
  void _clickArrange(pos) {
    widget.clickArrange(pos == 0 ? ArrangeType.Row : ArrangeType.Column);
  }

  void _clickOne(pos) {
    widget.clickOne(pos);
  }

  void _clickTwo(pos) {
    widget.clickTwo(pos);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ViewSelector(
          title: ARRANGE_TITLE,
          values: ARRANGE_VALUES,
          mainColor: widget.mainColor,
          onClick: _clickArrange,
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: ViewSelector(
                title: TITLES[0],
                values: _NUM_VALUES,
                mainColor: widget.mainColor,
                onClick: _clickOne,
              ),
            ),
            Expanded(
              flex: 1,
              child: ViewSelector(
                title: TITLES[1],
                values: _NUM_VALUES,
                mainColor: widget.mainColor,
                onClick: _clickTwo,
              ),
            ),
          ],
        )
      ],
    );
  }
}
