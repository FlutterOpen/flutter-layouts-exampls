///
/// Created by NieBin on 18-12-2
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///
///
import "package:flutter/material.dart";
import '../view/top_app_bar.dart';
import '../constant/string_const.dart';
import '../view/row_column_selector.dart' show RowColumnSelector, LayType;

class RowColumnScreen extends StatefulWidget {
  RowColumnScreen({Key key, this.group, this.onClick}) : super(key: key);
  final VoidCallback onClick;
  final GroupType group;

  @override
  _RowColumnState createState() => _RowColumnState();
}

class _RowColumnState extends State<RowColumnScreen> {
  void _changeLayout(LayType type) {}

  void _changeMainSize(MainAxisSize size) {}

  void _changeMainAlign(MainAxisAlignment align) {}

  void _changeCrossAlign(CrossAxisAlignment align) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(
          group: widget.group,
          itemType: ItemType.row_column,
          onClick: widget.onClick,
          bottomView: PreferredSize(
            preferredSize: Size(0.0, 160.0),
            child: RowColumnSelector(
              clickLayout: _changeLayout,
              clickMainSize: _changeMainSize,
              clickMainAlign: _changeMainAlign,
              clickCrossAlign: _changeCrossAlign,
              mainColor: Colors.white,
            ),
          )),
      body: Text(
        BOTTOM_TITLES[ItemType.row_column.index],
      ),
    );
  }
}
