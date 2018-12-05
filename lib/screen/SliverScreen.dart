///
/// Created by NieBin on 18-12-2
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///
import "package:flutter/material.dart";
import '../view/app_bar.dart';
import '../constant/main_const.dart';

const _ITEM_CONTENTS = [
  "SliverGrid",
  "SliverFixedExtentList",
  "SliverList",
  "SliverFillViewport",
];

class SliverScreen extends StatefulWidget {
  SliverScreen({Key key, this.group, this.onClick}) : super(key: key);
  final VoidCallback onClick;
  final GroupType group;

  @override
  _SliverState createState() => _SliverState();
}

class _SliverState extends State<SliverScreen> {
  Widget _buildContent(context, index, int type) {
    var c = 100 * (index % 9);
    return Container(
      alignment: AlignmentDirectional.center,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      color: Colors.brown[c == 0 ? 400 : c],
      child: Text(
        "${_ITEM_CONTENTS[type]} $index",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _sliverGrid() {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.0,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 2.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return _buildContent(context, index, 0);
        },
        childCount: 20,
      ),
    );
  }

  Widget _sliverFixed() {
    return SliverFixedExtentList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return _buildContent(context, index, 1);
      }, childCount: 10),
      itemExtent: 100.0,
    );
  }

  Widget _sliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return _buildContent(context, index, 2);
      }, childCount: 10),
    );
  }

  Widget _sliverViewPort() {
    return SliverFillViewport(
      delegate: SliverChildBuilderDelegate((context, index) {
        return _buildContent(context, index, 2);
      }, childCount: 4),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverBar(
          group: widget.group,
          itemType: ItemType.sliver,
          onClick: widget.onClick,
        ),
        _sliverGrid(),
        _sliverFixed(),
        _sliverList(),
        _sliverViewPort(),
      ],
    );
  }
}
