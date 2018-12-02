///
/// Created by NieBin on 18-12-2
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///
import "package:flutter/material.dart";
import '../view/top_app_bar.dart';
import '../constant/string_const.dart';

class BaseLineScreen extends StatefulWidget {
  BaseLineScreen({Key key, this.group, this.onClick}) : super(key: key);
  final VoidCallback onClick;
  final GroupType group;

  @override
  _BaselineState createState() => _BaselineState();
}

class _BaselineState extends State<BaseLineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(
        group: widget.group,
        itemType: ItemType.baseline,
        onClick: widget.onClick,
        bottomView: null,
      ),
      body: Text(
        BOTTOM_TITLES[ItemType.baseline.index],
      ),
    );
  }
}
