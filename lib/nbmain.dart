import 'package:flutter/material.dart';

///
/// Created by NieBin on 18-12-1
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///

class NBMain extends StatefulWidget {
  @override
  NBState createState() => NBState();
}

const PAGE_ADD = 0;
const PAGE_ALARM = 1;
const CONTENTS = ["Add", "Alarm"];

class NBState extends State<NBMain> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          CONTENTS[currentIndex],
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: _itemBody(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          _item(PAGE_ADD),
          _item(PAGE_ALARM),
        ],
        onTap: _selectItem,
      ),
    );
  }

  BottomNavigationBarItem _item(var index) {
    return BottomNavigationBarItem(
      icon: Icon(
        _itemIcon(index),
        color: _itemColor(index),
      ),
      title: Text(
        _itemTitle(index),
        style: TextStyle(
          color: _itemColor(index),
        ),
      ),
    );
  }

  Widget _itemBody(var index) {
    var arr = CONTENTS;
    return Text(
      arr[index],
      style: TextStyle(
        color: _itemColor(index),
        fontSize: 30,
      ),
    );
  }

  IconData _itemIcon(var index) {
    var arr = [Icons.add, Icons.alarm];
    return arr[index % 2];
  }

  String _itemTitle(var index) {
    var arr = CONTENTS;
    return arr[index % 2];
  }

  Color _itemColor(index) {
    return currentIndex == index ? Colors.blue : Colors.blueGrey;
  }

  void _selectItem(index) {
    setState(() {
      currentIndex = index;
    });
  }
}
