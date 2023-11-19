import 'package:flutter/material.dart';


class AppModel{
  String title;
  String? assetPath;
  IconData? icon;
  Color color;
  Widget? screen;
  String? link;

  AppModel({
    required this.title,
    required this.color,
    this.assetPath,
    this.screen,
    this.link,
    this.icon,
}):assert(icon==null || assetPath==null);

}