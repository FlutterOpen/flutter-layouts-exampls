///
/// Created by NieBin on 18-12-8
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///
import "package:flutter/material.dart";

//The total star is 5 and the total score is 10.
Widget countStar(double rating, {color = Colors.deepOrange}) {
  int num = rating ~/ 2; //the entire star
  bool isHalf = (rating - num * 2) > 1.0; // half star
  List<Widget> stars = List();
  var line = SizedBox(
    width: 0.0,
  );
  var size = 20.0;
  for (int n = 0; n < num; n++) {
    stars.add(
      Icon(
        Icons.star,
        color: color,
        size: size,
      ),
    );
    stars.add(line);
  }
  if (isHalf) {
    stars.add(Icon(
      Icons.star_half,
      color: color,
      size: size,
    ));
    stars.add(line);
  }
  int surplus = num + (isHalf ? 1 : 0);
  surplus = 5 - surplus;
  for (int n = 0; n < surplus; n++) {
    stars.add(
      Icon(
        Icons.star_border,
        color: color,
        size: size,
      ),
    );
    stars.add(line);
  }
  return Row(
    children: stars,
  );
}
