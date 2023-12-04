import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/screens/home_page.dart';





class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Navigate to HomePage after a delay
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.white, // Set your desired background color
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/animations/lottecat.json', // Replace with your Lottie animation file
              width: 200, // Set your desired width
              height: 200, // Set your desired height
              fit: BoxFit.cover,
            ),
            SizedBox(height: 90,),
            Text("Meow Meow Meow🥺\n        -Roopam",style: GoogleFonts.comicNeue(),)
          ],
        ),
      ),
    );
  }
}


