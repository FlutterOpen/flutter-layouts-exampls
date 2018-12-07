///
/// Created by NieBin on 18-12-1
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///
///
import 'package:flutter/material.dart';
import './view/app_bar.dart';
import './constant/main_const.dart';
import "./screen/screen.dart";

class NBMain extends StatefulWidget {
  @override
  NBState createState() => NBState();
}

const ITEM_COUNT = 5;

class NBState extends State<NBMain> {
  var curGroup = GroupType.scroll;
  var curItemType = ItemType.page_view;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _itemBody(curItemType),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: _bottomItems(),
        onTap: _selectItem,
      ),
    );
  }

  List<BottomNavigationBarItem> _bottomItems() {
    return curGroup == GroupType.simple
        ? [
            _bottomItem(ItemType.row_column),
            _bottomItem(ItemType.cross_align),
            _bottomItem(ItemType.stack),
            _bottomItem(ItemType.expanded),
            _bottomItem(ItemType.padding)
          ]
        : [
            _bottomItem(ItemType.page_view),
            _bottomItem(ItemType.list),
            _bottomItem(ItemType.sliver),
            _bottomItem(ItemType.hero),
            _bottomItem(ItemType.nested),
          ];
  }

  BottomNavigationBarItem _bottomItem(ItemType type) {
    return BottomNavigationBarItem(
      icon: Icon(
        BOTTOM_ICONS[type.index],
        color: _itemColor(type),
      ),
      title: Text(
        BOTTOM_TITLES[type.index],
        style: TextStyle(
          color: _itemColor(type),
        ),
      ),
    );
  }

  Widget _itemBody(ItemType type) {
    switch (type) {
      case ItemType.row_column:
        return RowColumnScreen(group: curGroup, onClick: _changeGroup);
      case ItemType.cross_align:
        return CrossAlignScreen(group: curGroup, onClick: _changeGroup);
      case ItemType.stack:
        return StackScreen(group: curGroup, onClick: _changeGroup);
      case ItemType.expanded:
        return ExpandScreen(group: curGroup, onClick: _changeGroup);
      case ItemType.padding:
        return PaddingScreen(group: curGroup, onClick: _changeGroup);
      case ItemType.page_view:
        return PageViewScreen(group: curGroup, onClick: _changeGroup);
      case ItemType.list:
        return ListScreen(group: curGroup, onClick: _changeGroup);
      case ItemType.sliver:
        return SliverScreen(group: curGroup, onClick: _changeGroup);
      case ItemType.hero:
        return HeroScreen(group: curGroup, onClick: _changeGroup);
      case ItemType.nested:
        return NestedScreen(group: curGroup, onClick: _changeGroup);
      default:
        return RowColumnScreen(group: curGroup, onClick: _changeGroup);
    }
  }

  Color _itemColor(type) {
    return curItemType == type ? BAR_BACK_COLORS[curGroup.index] : Colors.grey;
  }

  void _selectItem(index) {
    setState(() {
      var cur = curGroup == GroupType.simple ? index : index + ITEM_COUNT;
      curItemType = convertItemType(cur);
    });
  }

  void _changeGroup() {
    setState(() {
      if (curGroup == GroupType.simple) {
        curGroup = GroupType.scroll;
        if (curItemType.index < ITEM_COUNT) {
          curItemType = convertItemType(curItemType.index + ITEM_COUNT);
        }
      } else {
        curGroup = GroupType.simple;
        if (curItemType.index >= ITEM_COUNT) {
          curItemType = convertItemType(curItemType.index - ITEM_COUNT);
        }
      }
    });
  }
}
