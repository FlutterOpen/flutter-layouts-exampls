///
/// Created by NieBin on 18-12-4
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///
import "package:flutter/material.dart";
import 'view_selector.dart';

const BASELINE_TITLE = "cross axis align";
const BASELINE_VALUES = ["baseline", "start", "end", "center", "stretch"];

class CrossAlignSelector extends StatefulWidget {
  CrossAlignSelector({Key key, this.mainColor, this.alignClick})
      : super(key: key);
  final Color mainColor;
  final ValueChanged<CrossAxisAlignment> alignClick;

  @override
  _CrossAlignState createState() => _CrossAlignState();
}

class _CrossAlignState extends State<CrossAlignSelector> {
  void _alignClick(int pos) {
    CrossAxisAlignment align = CrossAxisAlignment.baseline;
    switch (pos) {
      case 0:
        align = CrossAxisAlignment.baseline;
        break;
      case 1:
        align = CrossAxisAlignment.start;
        break;
      case 2:
        align = CrossAxisAlignment.end;
        break;
      case 3:
        align = CrossAxisAlignment.center;
        break;
      case 4:
        align = CrossAxisAlignment.stretch;
        break;
      default:
        align = CrossAxisAlignment.baseline;
        break;
    }
    widget.alignClick(align);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ViewSelector(
              title: BASELINE_TITLE,
              values: BASELINE_VALUES,
              mainColor: widget.mainColor,
              onClick: _alignClick,
            ),
          )
        ],
      ),
    );
  }
}
