///
/// Created by NieBin on 18-12-2
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///

import 'package:flutter/material.dart';

const BOTTOM_TITLES = [
  "Row / Col",
  'CrossAlign',
  'Stack',
  'Expanded',
  'Padding',

  //The second items.
  'Page View',
  'List',
  'Slivers',
  'Hero',
  'Nested'
];
const BOTTOM_ICONS = [
  Icons.view_headline,
  Icons.format_size,
  Icons.layers,
  Icons.line_weight,
  Icons.format_line_spacing,

  // The second items.
  Icons.view_week,
  Icons.format_list_bulleted,
  Icons.view_day,
  Icons.gradient,
  Icons.dashboard,
];
const BAR_ICONS = [
  Icons.filter_1,
  Icons.filter_2,
];
const BAR_BACK_COLORS = [
  Colors.green,
  Colors.blueAccent,
];

enum GroupType {
  simple,
  scroll,
}

enum ItemType {
  row_column,
  cross_align,
  stack,
  expanded,
  padding,

  //The second items.
  page_view,
  list,
  sliver,
  hero,
  nested
}
const GRID_VIEW_NAME = "GridView";

ItemType convertItemType(index) {
  switch (index) {
    case 0:
      return ItemType.row_column;
    case 1:
      return ItemType.cross_align;
    case 2:
      return ItemType.stack;
    case 3:
      return ItemType.expanded;
    case 4:
      return ItemType.padding;

    case 5:
      return ItemType.page_view;
    case 6:
      return ItemType.list;
    case 7:
      return ItemType.sliver;
    case 8:
      return ItemType.hero;
    case 9:
      return ItemType.nested;
    default:
      return ItemType.row_column;
  }
}
