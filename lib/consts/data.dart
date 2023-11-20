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
  ColorModel(svgPath: "assets/images/red.svg", gradient: SweepGradient(
      stops: [0.0, 0.3, 0.6, 1.0],
      startAngle: 0.0,
      endAngle: 2 * 3.14,
      transform: GradientRotation(0.5),

      colors: [Color(0xFF36070E),Color(0xFFE27A7A),Color(0xFFA23E48),Color(0xFF79303A),]
  ),color: Colors.red),
  ColorModel(svgPath: "assets/images/blue.svg", gradient: LinearGradient(
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
    colors: [Colors.indigo,Colors.lightBlueAccent,Colors.blue]
  ),color: Colors.blue),
  ColorModel(svgPath: "assets/images/gold.svg", gradient: LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [Color(0xFFAF7104),Color(0xFFDCAB01),Color(0xFFFFD500),Color(
          0xFFF3AE00)]
  ),color: Colors.amber),
  ColorModel(svgPath: "assets/images/night.svg", gradient: LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
    colors: [Colors.purpleAccent,Colors.pinkAccent,Colors.purple,]
  ),color: Colors.purple),
  ColorModel(svgPath: "assets/images/green.svg", gradient: SweepGradient(
      stops: [0.0, 0.3, 0.6, 1.0],
      startAngle: 3.14 / 2,
      endAngle: 2 * 3.14,
      transform: GradientRotation(2),
    colors: [Color(0xFF028373),Color(0xFF00957C),Color(0xFF01A784),Color(0xFF00BA8A)]
  ),color: Colors.green),
  ColorModel(svgPath: "assets/images/neon.svg", gradient: LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
    colors: [Color(0xFFB3CC00),Color(0xFFB3CC00),Color(0xFFA8BA00),Color(0xFF8F9400)]
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