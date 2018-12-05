import 'package:flutter/material.dart';
import 'package:layout_demo_flutter/layout_type.dart';

class SliversPage extends StatelessWidget implements HasLayoutGroup {
  SliversPage({Key key, this.layoutGroup, this.onLayoutToggle})
      : super(key: key);
  final LayoutGroup layoutGroup;
  final VoidCallback onLayoutToggle;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
            pinned: true,
            expandedHeight: 120.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Slivers'),
            ),
            leading: IconButton(
              icon: Icon(layoutGroup == LayoutGroup.nonScrollable
                  ? Icons.filter_1
                  : Icons.filter_2),
              onPressed: onLayoutToggle,
            )),

        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 100.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 1.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('grid item $index'),
              );
            },
            childCount: 10,
          ),
        ),
//        SliverFixedExtentList(
//          itemExtent: 50.0,
//          delegate: SliverChildBuilderDelegate(
//            (BuildContext context, int index) {
//              return Container(
//                alignment: Alignment.center,
//                color: Colors.lightBlue[100 * (index % 9)],
//                child: Text('list item $index'),
//              );
//            },
//            childCount: 10,
//          ),
//        ),
//        SliverList(
//          delegate: SliverChildListDelegate(
//            [
//              Container(
//                alignment: Alignment.center,
//                color: Colors.red,
//                child: Text('Hello world'),
//              )
//            ],
//          ),
//        ),
//        SliverFillViewport(
//          delegate: SliverChildBuilderDelegate((context, index) {
//            return Container(
//              constraints: BoxConstraints.tight(Size(100.0, 100.0)),
//              margin: EdgeInsets.only(top: 1.0),
//              color: Colors.brown,
//              child: Text("Hello"),
//            );
//          }, childCount: 5),
//        ),
      ],
    );
  }
}
