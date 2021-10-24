import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'add_alert': Icons.android_outlined,
  //'accessibility': Icons.accessibility,
  'folder_open': Icons.picture_in_picture
  /*'donut_large': Icons.donut_large,
  'input': Icons.input,
  'list': Icons.list,
  'tune': Icons.tune,*/
};

Icon getIcon(String nombreIcono) {
  return Icon(_icons[nombreIcono], color: Colors.blue);
}
