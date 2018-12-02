///
/// Created by NieBin on 18-12-2
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///
///
import "package:flutter/material.dart";
import '../view/top_app_bar.dart';
import '../constant/string_const.dart';

class RowColumnScreen extends StatefulWidget {
  RowColumnScreen({Key key, this.group, this.onClick}) : super(key: key);
  final VoidCallback onClick;
  final GroupType group;

  @override
  _RowColumnState createState() => _RowColumnState();
}

class _RowColumnState extends State<RowColumnScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(
        group: widget.group,
        itemType: ItemType.row_column,
        onClick: widget.onClick,
        bottomView: null,
      ),
      body: Text(
        BOTTOM_TITLES[ItemType.row_column.index],
      ),
    );
  }
}
