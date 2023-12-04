import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:device_frame/device_frame.dart';
import 'package:portfolio/models/app_model.dart';
import 'package:portfolio/models/color_model.dart';
import 'package:portfolio/models/device_model.dart';
import 'package:portfolio/models/experience_model.dart';
import 'package:portfolio/screens/mini_projects/about/about.dart';
import 'package:portfolio/screens/mini_projects/eductaion/education.dart';
import 'package:portfolio/screens/mini_projects/jobs/jobs.dart';
import 'package:portfolio/screens/mini_projects/tictactoe/tictactoe.dart';




List<DeviceModel>devices=[
  DeviceModel(devices: Devices.android.samsungGalaxyNote20Ultra, data: Icons.android ),
  DeviceModel(devices: Devices.ios.iPhone13, data: Icons.apple ),
  DeviceModel(devices: Devices.ios.iPad, data: Icons.tablet ),
];

List<ColorModel>colorPalette=[
  ColorModel(svgPath: "assets/images/red.svg", gradient: const SweepGradient(
      stops: [0.0, 0.3, 0.6, 1.0],
      startAngle: 0.0,
      endAngle: 2 * 3.14,
      transform: GradientRotation(0.5),
      colors: [Color(0xFF36070E),Color(0xFFE27A7A),Color(0xFFA23E48),Color(0xFF79303A),]
  ),color: Colors.red),
  ColorModel(svgPath: "assets/images/blue.svg", gradient: const LinearGradient(
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
    colors: [Colors.indigo,Colors.lightBlueAccent,Color(0xFF3F72F8),Colors.blue,Colors.indigo,]
  ),color: Colors.blue),
  ColorModel(svgPath: "assets/images/gold.svg",
      gradient: const SweepGradient(
          stops: [0.0, 0.3, 0.6, 1.0],
          startAngle: 3.14 / 2,
          endAngle: 2 * 3.14,
          transform: GradientRotation(2),
      colors: [Color(0xFFAF7104),Color(0xFFDCAB01),Color(0xFFBB9C00),Color(0xFFAF7104)]
  ),color: Colors.amber),
  ColorModel(svgPath: "assets/images/night.svg", gradient: const LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
    colors: [Colors.purpleAccent,Colors.pinkAccent,Colors.purple,]
  ),color: Colors.purple),
  ColorModel(svgPath: "assets/images/green.svg", gradient: const SweepGradient(
      stops: [0.0, 0.3, 0.6, 1.0],
      startAngle: 3.14 / 2,
      endAngle: 2 * 3.14,
      transform: GradientRotation(2),
    colors: [Color(0xFF028373),Color(0xFF00957C),Color(0xFF01A784),Color(0xFF00BA8A)]
  ),color: Colors.green),
  ColorModel(svgPath: "assets/images/neon.svg", gradient: const LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
    colors: [Color(0xFFB3CC00),Color(0xFFB3CC00),Color(0xFFA8BA00),Color(0xFF8F9400)]
  ),color: Colors.greenAccent),

];

List<AppModel>apps=[
  AppModel(title: "About", color: Colors.white,icon: CupertinoIcons.sportscourt_fill,screen: const AboutMe()),
  AppModel(title: "Skills", color: Colors.white,icon: CupertinoIcons.infinite),
  AppModel(title: "LinkedIN", color: Colors.white,icon: CupertinoIcons.snow,link: linkedIN),
  AppModel(title: "Github", color: Colors.white,icon: CupertinoIcons.gift,link: github),
  AppModel(title: "Experience", color: Colors.white,icon: CupertinoIcons.briefcase_fill,screen: const JobApp()),
  AppModel(title: "Resume", color: Colors.white,icon: CupertinoIcons.book_circle_fill,link: resume),
  AppModel(title: "Education", color: Colors.white,icon: Icons.school,screen: const EducationPage()),
  AppModel(title: "TicketX", color: Colors.white,icon: Icons.flutter_dash),
  AppModel(title: "Twitter", color: Colors.white,icon: CupertinoIcons.xmark,link: twitter),
  AppModel(title: "Behance", color: Colors.white,icon: CupertinoIcons.paintbrush_fill,link: behance),
  AppModel(title: "LinkTree", color: Colors.white,icon: CupertinoIcons.tree,link: linktree),
  AppModel(title: "TicTac", color: Colors.white,icon: CupertinoIcons.game_controller_solid,screen: GameBoard()),
];


final List<JobExperience> education = [
  JobExperience(
    color: Colors.red,
    location: "Cooch Behar,West Bengal, India",
    title: 'Computer Science Engineering',
    company: 'Coochbehar Government Engineering College',
    startDate: 'Nov 2022',
    endDate: 'Present',
    bulletPoints: [
      "Currently in the 2nd year of my college!",
    ],
  ),
  JobExperience(
    color: Colors.blue,
    location: "Cooch Behar,West Bengal, India",
    title: 'Higher Secondary',
    company: 'Techno India Group Public School',
    startDate: 'April 2009',
    endDate: 'June 2022',
    bulletPoints: [
      'Some of the best years of life',
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
const String twitter="https://twitter.com/redvey10";
const String behance="https://www.behance.net/redvey";
const String linktree="https://linktr.ee/roop_dev";
String introduction=
    "Welcome to my portfolio website, this is highly inspire(almost copied) from Pawan Kunar\n I am developer btw";


class CustomGradient {
  static final Gradient primaryGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFFECD2),  // Start color
      Color(0xFFFCB69F),  // End color
    ],
  );
  static final Gradient secondGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFA9F1DF),  // Start color
      Color(0xFF0FBBBB),  // End color
    ],
  );


}