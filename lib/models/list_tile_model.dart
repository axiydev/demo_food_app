import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class LTileMod{
  final String str;
  final Widget widget;
  const LTileMod({required this.str,required this.widget});
  String get strInfo=>this.str;
  Widget get widgetInfo=>this.widget;
}