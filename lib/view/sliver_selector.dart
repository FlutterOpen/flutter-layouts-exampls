///
/// Created by NieBin on 18-12-5
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///

import "package:flutter/material.dart";
import 'view_selector.dart';

const _SLIVER_TITLE = "sliver type";
const _SLIVER_VALUES = [
  "SliverGrid",
  "SliverFixedExtentList",
  "SliverList",
  "SliverFillViewport"
];
enum SliverType {
  SliverGrid,
  SliverFixedExtentList,
  SliverList,
  SliverFillViewport,
}

class SliverSelector extends StatefulWidget {
  SliverSelector({Key key, this.clickType, this.mainColor}) : super(key: key);
  final ValueChanged<SliverType> clickType;
  final Color mainColor;

  @override
  _SliverState createState() => _SliverState();
}

class _SliverState extends State<SliverSelector> {
  void _clickType(pos) {
    var type = SliverType.SliverGrid;
    switch (pos) {
      case 0:
        type = SliverType.SliverGrid;
        break;
      case 1:
        type = SliverType.SliverFixedExtentList;
        break;
      case 2:
        type = SliverType.SliverList;
        break;
      case 3:
        type = SliverType.SliverFillViewport;
        break;
      default:
        type = SliverType.SliverGrid;
        break;
    }
    widget.clickType(type);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ViewSelector(
            title: _SLIVER_TITLE,
            values: _SLIVER_VALUES,
            mainColor: widget.mainColor,
            onClick: _clickType,
          ),
        )
      ],
    );
  }
}
