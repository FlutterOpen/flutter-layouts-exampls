///
/// Created by NieBin on 18-12-2
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///
import "package:flutter/material.dart";
import '../view/app_bar.dart';
import '../constant/main_const.dart';
import '../view/page_selector.dart';
import '../constant/size_const.dart';

const PAGE_CONTENTS = ["One Page", "Two Page", "Three Page", "Four Page"];
const PAGE_COLORS = [
  Colors.red,
  Colors.black38,
  Colors.deepPurple,
  Colors.brown
];

class PageViewScreen extends StatefulWidget {
  PageViewScreen({Key key, this.group, this.onClick}) : super(key: key);
  final VoidCallback onClick;
  final GroupType group;

  @override
  _PageViewState createState() => _PageViewState();
}

class _PageViewState extends State<PageViewScreen> {
  PageController _controller;

  @override
  void initState() {
    _controller = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  var direction = Axis.horizontal;

  void _clickDirection(Axis direction) {
    setState(() {
      this.direction = direction;
    });
  }

  void _changePage(int page) {
    _controller.jumpToPage(page);
  }

  Widget _childView(int pos) {
    return Container(
      color: PAGE_COLORS[pos],
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      constraints: BoxConstraints.expand(),
      alignment: AlignmentDirectional.center,
      child: Text(
        PAGE_CONTENTS[pos],
        style: TextStyle(color: Colors.white, fontSize: TEXT_HUGE_SIZE),
      ),
    );
  }

  Widget _bodyContent() {
    var list = List<Widget>();
    for (int i = 0; i < PAGE_CONTENTS.length; i++) {
      list.add(_childView(i));
    }
    if (_controller == null) {
      _controller = PageController(
        initialPage: 0,
      );
    }
    return PageView(
      controller: _controller,
      scrollDirection: direction,
      children: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(
        group: widget.group,
        itemType: ItemType.page_view,
        onClick: widget.onClick,
        bottomView: PreferredSize(
            child: PageSelector(
              mainColor: Colors.white,
              clickDirection: _clickDirection,
              clickPage: _changePage,
            ),
            preferredSize: Size(0.0, SELECTOR_ONE_HEIGHT)),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: _bodyContent(),
      ),
    );
  }
}
