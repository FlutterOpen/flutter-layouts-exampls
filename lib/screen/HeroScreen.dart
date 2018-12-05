///
/// Created by NieBin on 18-12-2
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///
import "package:flutter/material.dart";
import '../constant/main_const.dart';
import "../constant/size_const.dart";
import 'package:flutter/rendering.dart';

const BAR_FONT_SIZE = 21.0;
const BAR_TITLE_COLOR = Colors.white;
const IMAGES = [
  "pic_01",
  "pic_02",
  "pic_04",
  "pic_05",
  "pic_06",
  "pic_07",
  "pic_08",
  "pic_09"
];

Image _getAssetImage(name) {
  return Image.asset(
    "assets/$name.jpg",
    fit: BoxFit.cover,
  );
}

class HeaderDelegate implements SliverPersistentHeaderDelegate {
  HeaderDelegate({
    Key key,
    this.maxExtent,
    this.minExtent,
    this.group,
    this.onClick,
  });

  final VoidCallback onClick;
  final GroupType group;
  double maxExtent;
  double minExtent;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    print("shrinkOffset:$shrinkOffset");
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        _getAssetImage("pic_03"),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black54,
              ],
              stops: [0.2, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.repeated,
            ),
          ),
        ),
        Positioned(
          top: 4.0,
          left: 4.0,
          child: SafeArea(
              child: IconButton(
                  icon: Icon(
                    BAR_ICONS[this.group.index],
                    color: BAR_TITLE_COLOR,
                  ),
                  onPressed: onClick)),
        ),
        Container(
          alignment: shrinkOffset > 100
              ? AlignmentDirectional.topCenter
              : AlignmentDirectional.bottomStart,
          margin: shrinkOffset > 100
              ? EdgeInsets.only(top: 40.0)
              : EdgeInsets.only(left: 40.0, bottom: 20.0),
          child: Text(
            BOTTOM_TITLES[ItemType.hero.index],
            style: TextStyle(color: BAR_TITLE_COLOR, fontSize: BAR_FONT_SIZE),
          ),
        )
      ],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;
}

class HeroScreen extends StatefulWidget {
  HeroScreen({Key key, this.group, this.onClick}) : super(key: key);
  final VoidCallback onClick;
  final GroupType group;

  @override
  _HeroState createState() => _HeroState();
}

class _HeroState extends State<HeroScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverPersistentHeader(
        pinned: true,
        delegate: HeaderDelegate(
          maxExtent: 200,
          minExtent: 100,
          group: widget.group,
          onClick: widget.onClick,
        ),
      ),
      SliverGrid(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 1.0,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            var name = IMAGES[index % 8];
            return Container(
              margin: EdgeInsets.symmetric(vertical: 2.0),
              child: _getAssetImage(name),
            );
          },
          childCount: IMAGES.length,
        ),
      ),
    ]);
  }
}
