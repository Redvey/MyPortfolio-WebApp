import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/consts/data.dart';
import 'package:portfolio/providers/current_state.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';


class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    CurrentState currentState =
    Provider.of<CurrentState>(context,listen: false);
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          // gradient: colorPalette[currentState.knobSelected].gradient,
            color:Color(0xFFE0B0FF)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            const CircleAvatar(
              backgroundImage: AssetImage("assets/mini_app_directory/about/my_img.png"),
              radius: 50,
            ),
            const SizedBox(height: 5,),
            Text(
              "Roopam Barman",
              style: GoogleFonts.ysabeau(
                fontSize: 17,
              ),
            ),
            Text(
              "FLUTTER DEVELOPER",
              style: GoogleFonts.chakraPetch(
                fontSize: 20,
              ),
            ),
            Container(
              height: 1,
              width: 150,
              color: const Color(0xFF39293F),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ElevatedButton(
                onPressed: () async {
                  Uri phoneno = Uri.parse('tel:+91 9799799799');
                  if (await launchUrl(phoneno)) {
                    // Dialer opened
                  } else {
                    // Dialer is not opened
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF5DEFD),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      color: Color(0xFF39293F),
                      width: 1,
                    ),
                  ),
                  fixedSize:Size(350, 55),

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.call),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(
                      "+91 9799799799",
                      style: GoogleFonts.chakraPetch(
                        color: const Color(0xFF39293F),
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ElevatedButton(

                onPressed: () async {
                  String email = Uri.encodeComponent("rickvey21@gmail.com");
                  String subject = Uri.encodeComponent("Hello Flutter");
                  String body = Uri.encodeComponent("Hi! I'm <type your name>");
                  Uri mail = Uri.parse("mailto:$email?subject=$subject&body=$body");
                  if (await launchUrl(mail)) {
                    // Email app opened
                  } else {
                    // Email app is not opened
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF5DEFD),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      color: Color(0xFF39293F),
                      width: 1,
                    ),
                  ),
                    fixedSize:Size(350, 55)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.mail),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(
                      "roopam12cse@gmail.com",
                      style: GoogleFonts.chakraPetch(
                        color: const Color(0xFF39293F),
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
