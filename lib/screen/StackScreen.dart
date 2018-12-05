///
/// Created by NieBin on 18-12-2
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///
import "package:flutter/material.dart";
import '../view/app_bar.dart';
import '../constant/main_const.dart';
import '../view/stack_selector.dart';
import '../constant/size_const.dart';
const _BOX_COLORS = [
  Colors.deepPurple,
  Colors.cyan,
  Colors.amberAccent,
  Colors.red,
  Colors.lightGreen
];

class StackScreen extends StatefulWidget {
  StackScreen({Key key, this.group, this.onClick}) : super(key: key);
  final VoidCallback onClick;
  final GroupType group;

  @override
  _StackState createState() => _StackState();
}

class _StackState extends State<StackScreen> {
  var _type = StackType.Align;
  var _alignDirection = AlignmentDirectional.topStart;

  Widget _body() {
    return _type == StackType.Align
        ? Stack(
            alignment: _alignDirection,
            children: <Widget>[
              SizedBox(
                width: 400,
                height: 400,
                child: Container(
                  color: _BOX_COLORS[0],
                ),
              ),
              SizedBox(
                width: 200,
                height: 200,
                child: Container(
                  color: _BOX_COLORS[1],
                ),
              ),
              SizedBox(
                width: 100,
                height: 100,
                child: Container(
                  color: _BOX_COLORS[2],
                ),
              ),
              SizedBox(
                width: 50,
                height: 50,
                child: Container(
                  color: _BOX_COLORS[3],
                ),
              )
            ],
          )
        : Stack(
            alignment: _alignDirection,
            children: <Widget>[
              SizedBox(
                width: 400,
                height: 400,
                child: Container(
                  color: _BOX_COLORS[0],
                ),
              ),
              Positioned(
                top: 50,
                left: 30,
                width: 100,
                height: 100,
                child: Container(
                  color: _BOX_COLORS[1],
                ),
              ),
              Positioned(
                top: 50,
                right: 30,
                width: 100,
                height: 100,
                child: Container(
                  color: _BOX_COLORS[2],
                ),
              ),
              Positioned(
                bottom: 50,
                left: 30,
                width: 100,
                height: 100,
                child: Container(
                  color: _BOX_COLORS[3],
                ),
              ),
              Positioned(
                width: 100,
                height: 100,
                bottom: 50,
                right: 30,
                child: Container(
                  color: _BOX_COLORS[4],
                ),
              )
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(
        group: widget.group,
        itemType: ItemType.stack,
        onClick: widget.onClick,
        bottomView: PreferredSize(
          child: StackSelector(
            mainColor: Colors.white,
            typeClick: (type) {
              setState(() {
                _type = type;
              });
            },
            alignClick: (direction) {
              setState(() {
                _alignDirection = direction;
              });
            },
          ),
          preferredSize: Size(0.0, SELECTOR_ONE_HEIGHT),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        color: Colors.grey,
        child: _body(),
      ),
    );
  }
}
