import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:device_frame/device_frame.dart';
import 'package:portfolio/models/app_model.dart';
import 'package:portfolio/models/color_model.dart';
import 'package:portfolio/models/device_model.dart';
import 'package:portfolio/models/experience_model.dart';
import 'package:portfolio/screens/mini_projects/about/about.dart';
import 'package:portfolio/screens/mini_projects/jobs/jobs.dart';




List<DeviceModel>devices=[
  DeviceModel(devices: Devices.android.samsungGalaxyNote20Ultra, data: Icons.android ),
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
  ColorModel(svgPath: "assets/images/gold.svg",
      gradient: LinearGradient(
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
  AppModel(title: "About", color: Colors.white,icon: CupertinoIcons.sportscourt_fill,screen: AboutMe()),
  AppModel(title: "Skills", color: Colors.white,icon: CupertinoIcons.infinite),
  AppModel(title: "LinkedIN", color: Colors.white,icon: CupertinoIcons.snow,link: linkedIN),
  AppModel(title: "Github", color: Colors.white,icon: CupertinoIcons.gift,link: github),
  AppModel(title: "Experience", color: Colors.white,icon: CupertinoIcons.briefcase_fill,screen: JobApp()),
  AppModel(title: "Resume", color: Colors.white,icon: CupertinoIcons.book_circle_fill,link: resume),
  AppModel(title: "Education", color: Colors.white,icon: Icons.school),
  AppModel(title: "TicketX", color: Colors.white,icon: Icons.flutter_dash),
];


final List<JobExperience> education = [
  JobExperience(
    color: Colors.red,
    location: "Patiala, India",
    title: 'Computer Engineering',
    company: 'Thapar Institure of Engineering',
    startDate: 'June 2021',
    endDate: 'Present',
    bulletPoints: [
      "Currently in the final year of my college!",
    ],
  ),
  JobExperience(
    color: Colors.blue,
    location: "Patiala, India",
    title: 'Diploma in Computer Science',
    company: 'Thapar Polytechnic College',
    startDate: 'June 2018',
    endDate: 'June 2021',
    bulletPoints: [
      'Some of the best years of college life',
    ],
  ),
];

final List<JobExperience> jobExperiences = [
  JobExperience(
    color: Colors.blue,
    location: "Kaliyaganj, West Bengal,India",
    title: 'Flutter UI/UX Developer',
    company: 'Solution Crafter',
    startDate: 'Sept 2023',
    endDate: 'Present',
    bulletPoints: [
      "A new budding Startup"
      "Actively develops and designs for  clients",
      "Crafted effective School management system and health care management system",
      "Employ Amplitude and Firebase Analytics to track and analyze user behavior, informing data-driven decisions.",
    ],
  ),
  // Add more job experiences here...
];

const String linkedIN="https://www.linkedin.com/in/roopam10/";
const String resume="https://drive.google.com/file/d/1SHvNFoXbTwWSUhW7SkXJsGeeyp4QvIMG/view";
const String github="https://github.com/Redvey";
String introduction=
    "Welcome to my portfolio website, this is highly inspire(almost copied) from Pawan Kunar\n I am developer btw";


