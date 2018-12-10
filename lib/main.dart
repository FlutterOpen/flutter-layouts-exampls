import 'package:flutter/material.dart';
import 'nbmain.dart';
import 'package:flutter_layout/constant/main_const.dart';
import 'package:flutter_layout/screen/move/GridViewPage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout',
      theme: ThemeData(
        primaryColor: Colors.grey[900],
      ),
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: NBMain(),
      ),
      routes: {
        GRID_VIEW_NAME: (context) => GridViewPage(),
      },
    );
  }
}
