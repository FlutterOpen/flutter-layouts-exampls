///
/// Created by NieBin on 18-12-2
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///
import "package:flutter/material.dart";
import '../view/app_bar.dart';
import '../constant/main_const.dart';
import '../view/nest_selector.dart';
import '../constant/size_const.dart';

final List<MaterialColor> _parentColors = [
  Colors.deepOrange,
  Colors.green,
  Colors.brown,
  Colors.indigo,
  Colors.purple,
];

class NestedScreen extends StatefulWidget {
  NestedScreen({Key key, this.group, this.onClick}) : super(key: key);
  final VoidCallback onClick;
  final GroupType group;

  @override
  _NestedState createState() => _NestedState();
}

class _NestedState extends State<NestedScreen> {
  var parentCount = 2;
  var childCount = 10;
  var _direction = Axis.vertical;

  Widget _buildParent() {
    var _height = 100.0;
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          constraints: _direction == Axis.vertical
              ? BoxConstraints.tightForFinite(height: _height)
              : BoxConstraints.tightForFinite(width: _height),
          alignment: AlignmentDirectional.centerStart,
          child: _buildChild(index, _height),
        );
      },
      itemCount: parentCount,
      scrollDirection: _direction,
    );
  }

  Widget _buildChild(parentIndex, height) {
    return ListView.builder(
      itemBuilder: (context, index) {
        var i = index % 5 + 4;
        i *= 100;
        return SizedBox(
          width: height,
          height: height,
          child: Container(
            color: _parentColors[parentIndex % 5][i],
            margin: EdgeInsets.all(1.0),
            alignment: AlignmentDirectional.center,
            child: Text(
              "$index",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        );
      },
      itemCount: childCount,
      scrollDirection:
          _direction == Axis.vertical ? Axis.horizontal : Axis.vertical,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(
        group: widget.group,
        itemType: ItemType.nested,
        onClick: widget.onClick,
        bottomView: PreferredSize(
          child: NestSelector(
            mainColor: Colors.white,
            clickChild: (count) {
              setState(() {
                childCount = count;
              });
            },
            clickParent: (count) {
              setState(() {
                parentCount = count;
              });
            },
            clickDirection: (direction) {
              setState(() {
                _direction = direction;
              });
            },
          ),
          preferredSize: Size(0.0, SELECTOR_TWO_HEIGHT),
        ),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: _buildParent(),
      ),
    );
  }
}
