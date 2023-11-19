import 'package:flutter/material.dart';
import 'package:device_frame/device_frame.dart';
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