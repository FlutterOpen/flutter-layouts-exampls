///
/// Created by NieBin on 18-12-3
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///
import "package:flutter/material.dart";
import '../constant/size_const.dart';

class ViewSelector extends StatefulWidget {
  ViewSelector(
      {Key key,
      this.title,
      this.values,
      this.onClick,
      this.mainColor = Colors.white})
      : super(key: key);
  final String title;
  final List<String> values;
  final ValueChanged<int> onClick;
  final Color mainColor;

  @override
  _ViewSelectorState createState() => _ViewSelectorState();
}

class _ViewSelectorState extends State<ViewSelector> {
  var curPos = 0;

  void _update() {
    setState(() {});
    widget.onClick(curPos);
  }

  void _next() {
    curPos++;
    if (curPos >= widget.values.length) {
      curPos = 0;
    }
    _update();
  }

  void _back() {
    curPos--;
    if (curPos < 0) {
      curPos = widget.values.length - 1;
    }
    _update();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Divider(color: widget.mainColor),
          Padding(
            padding: EdgeInsets.all(1),
            child: Center(
              child: Text(
                widget.title,
                style: TextStyle(
                  color: widget.mainColor,
                  fontSize: TEXT_NORMAL_SIZE,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.arrow_left,
                  color: widget.mainColor,
                ),
                onPressed: _back,
              ),
              Text(
                widget.values[curPos],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: widget.mainColor,
                  fontSize: TEXT_NORMAL_SIZE,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_right,
                  color: widget.mainColor,
                ),
                onPressed: _next,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
