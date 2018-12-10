///
/// Created by NieBin on 18-12-7
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///
import "package:flutter/material.dart";

import 'GridViewDetailPage.dart';
import 'package:flutter_layout/constant/move_data.dart';
import 'package:flutter_layout/constant/size_const.dart';
import 'star_view.dart';
import 'package:flutter_layout/view/app_bar.dart';
import 'package:flutter_layout/constant/main_const.dart';

const RELEASE_DATE = "RELEASE DATE", RUNTIME = "RUMTIME";

class GridViewPage extends StatefulWidget {
  @override
  _GridState createState() => _GridState();
}

class _GridState extends State<GridViewPage> {
  Widget _backImage(MoveItem item) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Image.asset(
        item.trailerImg1,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _showtimeItem(name, value) {
    return Column(
      children: <Widget>[
        Text(
          name,
          style:
              TextStyle(fontSize: TEXT_SMALL_SIZE_2, color: Colors.grey[500]),
        ),
        SizedBox(height: 2.0),
        Text(
          value,
          style:
              TextStyle(fontSize: TEXT_SMALL_SIZE_2, color: Colors.grey[900]),
        )
      ],
    );
  }

  Widget _cardBottom(MoveItem item) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 1.0,
        ),
        Text(
          item.name,
          style: TextStyle(
            color: Colors.grey[900],
            fontSize: TEXT_SMALL_SIZE,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 1.0),
        Text(
          item.category,
          style: TextStyle(color: Colors.grey[500], fontSize: TEXT_SMALL_SIZE),
        ),
        SizedBox(height: 1.0),
        countStar(item.rating),
        SizedBox(height: 2.0),
        Row(
          children: <Widget>[
            _showtimeItem(RELEASE_DATE, item.releaseDate),
            SizedBox(width: 6.0),
            _showtimeItem(RUNTIME, item.runtime),
          ],
        )
      ],
    );
  }

  Widget _grdItem(MoveItem item) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => GridViewDetailPage(item: item)));
      },
      child: Card(
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _backImage(item),
            Container(
              padding: EdgeInsets.only(left: 4.0, right: 4.0, bottom: 6.0),
              child: _cardBottom(item),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var items = getItemList();
    var l = List<Widget>();
    for (var item in items) {
      l.add(_grdItem(item));
    }
    return Scaffold(
      appBar: MainAppBar(
        titleText: GRID_VIEW_NAME,

      ),
      body: Container(
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 2.0,
          childAspectRatio: 0.9,
          children: l,
        ),
      ),
    );
  }
}
