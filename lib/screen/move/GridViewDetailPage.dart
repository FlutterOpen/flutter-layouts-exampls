///
/// Created by NieBin on 18-12-7
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///
import "package:flutter/material.dart";
import '../../constant/size_const.dart';
import '../../constant/move_data.dart';
import 'package:flutter_layout/view/app_bar.dart';
import 'star_view.dart';
const OTHER_MOVES = "Other Moves";
const WATCH_MOVES = "Watch Move";

class GridViewDetailPage extends StatefulWidget {
  GridViewDetailPage({this.item});

  final MoveItem item;

  @override
  _GridDetailState createState() => _GridDetailState();
}

class _GridDetailState extends State<GridViewDetailPage> {
  MoveItem item;

  void initState() {
    super.initState();
    item = widget.item;
  }

  Text _textWhite(name, {size = TEXT_NORMAL_SIZE, bool isBold = false}) {
    return Text(
      name,
      style: TextStyle(
        color: Colors.white,
        fontSize: size,
        fontWeight: isBold ? FontWeight.w700 : null,
        shadows: isBold
            ? [
                Shadow(color: Colors.grey[500], offset: Offset(0.0, 1.0)),
              ]
            : null,
      ),
    );
  }

  Widget _topImage() {
    return Image.asset(item.bannerUrl, fit: BoxFit.cover);
  }

  Widget _topContent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          _textWhite(item.name, size: TEXT_LARGE_SIZE, isBold: true),
          SizedBox(height: 1.0),
          countStar(item.rating, color: Colors.white),
          SizedBox(height: 2.0),
          _textWhite(item.directors),
          SizedBox(height: 2.0),
          _textWhite(item.releaseDateDesc),
        ],
      ),
    );
  }

  Widget _categoryButton(name, VoidCallback back) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: InkWell(
        onTap: () {
          back();
        },
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Colors.white, width: 3.0),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Center(
            child: _textWhite(name, isBold: true),
          ),
        ),
      ),
    );
  }

  Widget _category() {
    var sp = item.category.split(",");
    assert(sp.length == 3);
    return Container(
      height: 50.0,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: _categoryButton(sp[0], () {
              print("click: ${sp[0]}");
            }),
          ),
          Expanded(
            flex: 1,
            child: _categoryButton(sp[1], () {
              print("click: ${sp[1]}");
            }),
          ),
          Expanded(
            flex: 1,
            child: _categoryButton(sp[2], () {
              print("click: ${sp[2]}");
            }),
          ),
        ],
      ),
    );
  }

  Widget _watchButton() {
    return InkWell(
      onTap: () {
        print(WATCH_MOVES);
      },
      child: Container(
          constraints: BoxConstraints.expand(height: 40.0),
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Center(
            child: Text(
              WATCH_MOVES,
              style: TextStyle(
                color: Colors.grey[900],
                fontWeight: FontWeight.w700,
                fontSize: TEXT_LARGE_SIZE,
                shadows: [
                  Shadow(color: Colors.grey[500], offset: Offset(0.0, 2.0)),
                ],
              ),
            ),
          )),
    );
  }

  Widget _topView() {
    return Container(
      constraints: BoxConstraints.expand(height: 380.0),
      padding: EdgeInsets.only(bottom: 4.0),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _topImage(),
          _topContent(),
        ],
      ),
    );
  }

  Widget _middleView() {
    return Container(
      child: Column(
        children: <Widget>[
          _category(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
            child: _textWhite(item.desc),
          ),
          _watchButton(),
        ],
      ),
    );
  }

  Widget _bottomView() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _textWhite(OTHER_MOVES),
          Container(
            height: 100.0,
            margin: EdgeInsets.only(top: 8.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _childMove(item.trailerImg1),
                SizedBox(width: 4.0),
                _childMove(item.trailerImg2),
                SizedBox(width: 4.0),
                _childMove(item.trailerImg3),
                SizedBox(width: 4.0),
                _childMove(item.trailerImg3),
                SizedBox(width: 4.0),
                _childMove(item.trailerImg3),
                SizedBox(width: 4.0),
                _childMove(item.trailerImg3),
                SizedBox(width: 4.0),
                _childMove(item.trailerImg3),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _childMove(img) {
    return Container(
      child: Image.asset(
        img,
        fit: BoxFit.cover,
        width: 140.0,
        height: 100.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        titleText: item.name,
      ),
      backgroundColor: Color(0xFF761322),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _topView(),
          _middleView(),
          _bottomView(),
        ],
      ),
    );
  }
}
