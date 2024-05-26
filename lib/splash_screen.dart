import 'package:flutter/material.dart';

import 'package:portfolio/responsive/responsive.dart';
import 'package:portfolio/screens/home_page.dart';
import 'package:portfolio/screens/mobile_home/phone_home.dart';
import 'package:portfolio/screens/tablet_home/tablet_home.dart';
import 'package:rive/rive.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate to HomePage after a delay
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
              mobileScaffold: PhoneScaffold(),
              tabletScaffold: TabletHome(),
              desktopScaffold: HomePage()),
        ),
      );
    });

    return const Scaffold(
      backgroundColor: Colors.black, // Set your desired background color
      body: Stack(
        children: [
          Positioned(child: Text("data")),
          RiveAnimation.asset(
            'assets/animations/circle_fui.riv', // Replace with your Lottie animation file
            // Set your desired height
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
