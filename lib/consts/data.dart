import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:device_frame/device_frame.dart';
import 'package:portfolio/models/app_model.dart';
import 'package:portfolio/models/color_model.dart';
import 'package:portfolio/models/device_model.dart';



List<DeviceModel>devices=[
  DeviceModel(devices: Devices.android.onePlus8Pro, data: Icons.android ),
  DeviceModel(devices: Devices.ios.iPhone13, data: Icons.apple ),
  DeviceModel(devices: Devices.ios.iPad, data: Icons.tablet ),
];

List<ColorModel>colorPalette=[
  ColorModel(svgPath: "assets/images/red.svg", gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.topRight,
    colors: [Colors.red,Colors.blue]
  ),color: Colors.red),
  ColorModel(svgPath: "assets/images/blue.svg", gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.topRight,
    colors: [Colors.amber,Colors.blue]
  ),color: Colors.blue),
  ColorModel(svgPath: "assets/images/gold.svg", gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.topRight,
    colors: [Colors.red,Colors.blue]
  ),color: Colors.amber),
  ColorModel(svgPath: "assets/images/night.svg", gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.topRight,
    colors: [Colors.pink,Colors.pinkAccent]
  ),color: Colors.purple),
  ColorModel(svgPath: "assets/images/green.svg", gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.topRight,
    colors: [Colors.orange,Colors.white]
  ),color: Colors.green),
  ColorModel(svgPath: "assets/images/neon.svg", gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.topRight,
    colors: [Colors.black,Colors.black12]
  ),color: Colors.greenAccent),

];

List<AppModel>apps=[
  AppModel(title: "About", color: Colors.white,icon: CupertinoIcons.sportscourt_fill),
  AppModel(title: "Skills", color: Colors.white,icon: CupertinoIcons.infinite),
  AppModel(title: "LinkedIN", color: Colors.white,icon: CupertinoIcons.snow,link: linkedIN),
  AppModel(title: "Github", color: Colors.white,icon: CupertinoIcons.gift,link: github),
  AppModel(title: "Experience", color: Colors.white,icon: CupertinoIcons.briefcase_fill),
  AppModel(title: "Resume", color: Colors.white,icon: CupertinoIcons.book_circle_fill,link: resume),
  AppModel(title: "Education", color: Colors.white,icon: Icons.school),
  AppModel(title: "TicketX", color: Colors.white,icon: Icons.flutter_dash),
];

const String linkedIN="https://www.linkedin.com/in/roopam10/";
const String resume="https://drive.google.com/file/d/1SHvNFoXbTwWSUhW7SkXJsGeeyp4QvIMG/view";
const String github="https://github.com/Redvey";