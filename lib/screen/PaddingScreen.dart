///
/// Created by NieBin on 18-12-2
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///
import "package:flutter/material.dart";
import '../view/top_app_bar.dart';
import '../constant/string_const.dart';

class PaddingScreen extends StatefulWidget {
  PaddingScreen({Key key, this.group, this.onClick}) : super(key: key);
  final VoidCallback onClick;
  final GroupType group;

  @override
  _PaddingState createState() => _PaddingState();
}

class _PaddingState extends State<PaddingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(
        group: widget.group,
        itemType: ItemType.padding,
        onClick: widget.onClick,
        bottomView: null,
      ),
      body: Text(
        BOTTOM_TITLES[ItemType.padding.index],
      ),
    );
  }
}
