///
/// Created by NieBin on 18-12-2
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///
import "package:flutter/material.dart";
import '../view/app_bar.dart';
import '../constant/main_const.dart';
import '../view/cross_align_selector.dart';
import '../constant/size_const.dart';
import 'dart:math';

const CONTENT_VALUES_1 = ["This", "is", "an", "example."];
const CONTENT_VALUES_2 = ["Welcome", "To", "My", "World!"];
const COLORS = [
  Colors.red,
  Colors.yellowAccent,
  Colors.deepPurple,
  Colors.teal
];

class CrossAlignScreen extends StatefulWidget {
  CrossAlignScreen({Key key, this.group, this.onClick}) : super(key: key);
  final VoidCallback onClick;
  final GroupType group;

  @override
  _CrossAlignState createState() => _CrossAlignState();
}

class _CrossAlignState extends State<CrossAlignScreen> {
  CrossAxisAlignment _alignment = CrossAxisAlignment.baseline;

  List<Widget> _contents(List<String> values) {
    List<Widget> contents = List();
    for (var i = 0; i < 4; i++) {
      var value = values[i];
      Random random = Random();
      int pos = random.nextInt(4);
      var text = Text(
        value,
        style: TextStyle(
          color: COLORS[pos],
          fontSize: i % 2 == 0 ? TEXT_NORMAL_SIZE : TEXT_LARGE_SIZE,
        ),
      );
      contents.add(text);
    }
    return contents;
  }

  Container _bodyItem(List<String> values) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      height: 100.0,
      color: Colors.grey,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: _alignment,
        textBaseline: TextBaseline.alphabetic,
        children: _contents(values),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TopAppBar(
          group: widget.group,
          itemType: ItemType.cross_align,
          onClick: widget.onClick,
          bottomView: PreferredSize(
            child: CrossAlignSelector(
              mainColor: Colors.white,
              alignClick: (align) {
                setState(() {
                  _alignment = align;
                });
              },
            ),
            preferredSize: Size(0.0, SELECTOR_ONE_HEIGHT),
          ),
        ),
        body: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _bodyItem(CONTENT_VALUES_1),
              _bodyItem(CONTENT_VALUES_2),
            ],
          ),
        ));
  }
}
