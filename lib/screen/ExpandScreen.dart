///
/// Created by NieBin on 18-12-2
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///
import "package:flutter/material.dart";
import '../view/app_bar.dart';
import '../constant/main_const.dart';
import '../view/expand_selector.dart';
import '../constant/size_const.dart';

const _EXPAND_COLORS = [
  Colors.deepPurple,
  Colors.amberAccent,
  Colors.red,
];

class ExpandScreen extends StatefulWidget {
  ExpandScreen({Key key, this.group, this.onClick}) : super(key: key);
  final VoidCallback onClick;
  final GroupType group;

  @override
  _ExpandState createState() => _ExpandState();
}

class _ExpandState extends State<ExpandScreen> {
  var _type = ArrangeType.Row;
  int _oneFlex = 1;
  int _twoFlex = 1;

  void _clickArrange(ArrangeType type) {
    setState(() {
      _type = type;
    });
  }

  void _clickOne(int num) {
    setState(() {
      _oneFlex = num;
    });
  }

  void _clickTwo(int num) {
    setState(() {
      _twoFlex = num;
    });
  }

  Widget _bodyContent() {
    var list = [
      Expanded(
        flex: _oneFlex,
        child: Container(
          color: _EXPAND_COLORS[0],
          child: Center(
            child: Text(
              TITLES[0],
              style: TextStyle(color: Colors.white, fontSize: TEXT_LARGE_SIZE),
            ),
          ),
        ),
      ),
      Expanded(
        flex: _twoFlex,
        child: Container(
          color: _EXPAND_COLORS[1],
          child: Center(
            child: Text(
              TITLES[1],
              style: TextStyle(color: Colors.white, fontSize: TEXT_LARGE_SIZE),
            ),
          ),
        ),
      ),
    ];
    return _type == ArrangeType.Row
        ? Row(
            mainAxisSize: MainAxisSize.max,
            children: list,
          )
        : Column(
            mainAxisSize: MainAxisSize.max,
            children: list,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(
        group: widget.group,
        itemType: ItemType.expanded,
        onClick: widget.onClick,
        bottomView: PreferredSize(
            child: ExpandSelector(
              mainColor: Colors.white,
              clickArrange: _clickArrange,
              clickOne: _clickOne,
              clickTwo: _clickTwo,
            ),
            preferredSize: Size(0.0, SELECTOR_TWO_HEIGHT)),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: _bodyContent(),
      ),
    );
  }
}
