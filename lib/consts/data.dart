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
import 'package:portfolio/screens/mini_projects/skills/skills.dart';
import 'package:portfolio/screens/mini_projects/tictactoe/tictactoe.dart';

import '../models/skills_model.dart';

List<DeviceModel> devices = [
  DeviceModel(
      devices: Devices.android.samsungGalaxyNote20Ultra, data: Icons.android),
  DeviceModel(devices: Devices.ios.iPhone13, data: Icons.apple),
  DeviceModel(devices: Devices.ios.iPad, data: Icons.tablet),
];

List<ColorModel> colorPalette = [
  ColorModel(
      gradient: const RadialGradient(
        center: Alignment(0.91, 0.67),
        radius: 0.88,
        colors: [Colors.black, Color(0xFF4F0F0F), Colors.black],
      ),
      color: const Color(0xFF4F0F0F)),
  ColorModel(
      gradient: const RadialGradient(
        center: Alignment(0.71, 0.76),
        radius: 0.73,
        colors: [Colors.black, Color(0xFF3D1B9D), Colors.black],
      ),
      color: const Color.fromARGB(255, 27, 44, 157)),
  ColorModel(
      gradient: const LinearGradient(
        begin: Alignment(0.92, -0.38),
        end: Alignment(-0.92, 0.38),
        colors: [Color(0xFF281E05), Color(0xFF9D791B), Color(0xFF392A03)],
      ),
      color: Colors.amber),
  ColorModel(
      gradient: const LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        colors: [Color(0xFF1C1144), Color(0xFF301159), Color(0xFF451187)],
      ),
      color: const Color(0xFF451187)),
  ColorModel(
    gradient: const RadialGradient(
      center: Alignment(-0.08, 0.46),
      radius: 0.95,
      colors: [Colors.black, Color(0xFF172225), Color(0xFF000506)],
    ),
    color: const Color(0xFF6B7122),
  ),
  ColorModel(
      gradient: const LinearGradient(
        begin: Alignment(1.00, 0.00),
        end: Alignment(-1, 0),
        colors: [
          Color(0xFF6B7122),
          Color(0xFFBECD82),
          Color(0xFF6B7122),
          Color(0xFFBECD82),
          Color(0xFF6B7122)
        ],
      ),
      color: Colors.greenAccent),
];

List<AppModel> apps = [
  AppModel(
      title: "About",
      color: Colors.white,
      icon: CupertinoIcons.sportscourt_fill,
      screen: const AboutMe()),
  AppModel(
      title: "Skills",
      color: Colors.white,
      icon: CupertinoIcons.infinite,
      screen: const Skills()),
  AppModel(
      title: "LinkedIN",
      color: Colors.white,
      icon: CupertinoIcons.snow,
      link: linkedIN),
  AppModel(
      title: "Github",
      color: Colors.white,
      icon: CupertinoIcons.gift,
      link: github),
  AppModel(
      title: "Experience",
      color: Colors.white,
      icon: CupertinoIcons.briefcase_fill,
      screen: const JobApp()),
  AppModel(
      title: "Resume",
      color: Colors.white,
      icon: CupertinoIcons.book_circle_fill,
      link: resume),
  AppModel(
      title: "Education",
      color: Colors.white,
      icon: Icons.school,
      screen: const EducationPage()),
  AppModel(title: "TicketX", color: Colors.white, icon: Icons.flutter_dash),
  AppModel(
      title: "Twitter",
      color: Colors.white,
      icon: CupertinoIcons.xmark,
      link: twitter),
  AppModel(
      title: "Behance",
      color: Colors.white,
      icon: CupertinoIcons.paintbrush_fill,
      link: behance),
  AppModel(
      title: "LinkTree",
      color: Colors.white,
      icon: CupertinoIcons.tree,
      link: linktree),
  AppModel(
      title: "TicTac",
      color: Colors.white,
      icon: CupertinoIcons.game_controller_solid,
      screen: const GameBoard()),
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

const String linkedIN = "https://www.linkedin.com/in/roopam10/";
const String resume =
    "https://drive.google.com/file/d/1SHvNFoXbTwWSUhW7SkXJsGeeyp4QvIMG/view";
const String github = "https://github.com/Redvey";
const String twitter = "https://twitter.com/redvey10";
const String behance = "https://www.behance.net/redvey";
const String linktree = "https://linktr.ee/roop_dev";
String introduction =
    "Welcome to my portfolio website, this is highly inspire(almost copied) from Pawan Kunar\n I am developer btw";

List<SkillsModel> skills = [
  SkillsModel(skillName: "Flutter", colorS: Colors.blue, iconPath: "random"),
  SkillsModel(
    skillName: "Firebase",
    colorS: Colors.yellow,
  ),
  SkillsModel(
    skillName: "Github",
    colorS: Colors.yellow,
  ),
  SkillsModel(
    skillName: "Dart",
    colorS: Colors.blue,
  ),
  SkillsModel(
    skillName: "Provider",
    colorS: Colors.orange,
  ),
  SkillsModel(
    skillName: "Riverpod",
    colorS: Colors.blue,
  ),
  SkillsModel(
    skillName: "CI/CD",
    colorS: Colors.yellow,
  ),
  SkillsModel(
    skillName: "Code Magic",
    colorS: Colors.orange,
  ),
  SkillsModel(
    skillName: "Firebase",
    colorS: Colors.yellow,
  ),
  SkillsModel(
    skillName: "REST API",
    colorS: Colors.yellow,
  ),
];

List<SkillsModel> languages = [
  SkillsModel(skillName: "Bengali", colorS: Colors.orange),
  SkillsModel(skillName: "Hindi", colorS: Colors.black),
  SkillsModel(skillName: "English", colorS: Colors.blueGrey),
];

class CustomGradient {
  static const Gradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFFECD2), // Start color
      Color(0xFFFCB69F), // End color
    ],
  );
  static const Gradient secondGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFA9F1DF), // Start color
      Color(0xFF0FBBBB), // End color
    ],
  );
}
