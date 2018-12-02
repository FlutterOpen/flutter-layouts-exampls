///
/// Created by NieBin on 18-12-2
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///
import "package:flutter/material.dart";
import '../view/top_app_bar.dart';
import '../constant/string_const.dart';

class NestedScreen extends StatefulWidget {
  NestedScreen({Key key, this.group, this.onClick}) : super(key: key);
  final VoidCallback onClick;
  final GroupType group;

  @override
  _NestedState createState() => _NestedState();
}

class _NestedState extends State<NestedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(
        group: widget.group,
        itemType: ItemType.nested,
        onClick: widget.onClick,
        bottomView: null,
      ),
      body: Text(
        BOTTOM_TITLES[ItemType.nested.index],
      ),
    );
  }
}
