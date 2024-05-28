import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../widgets/frosted_containers.dart';

class TabHireMeBox extends StatelessWidget {
  const TabHireMeBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FrostedContainer(
      height: 105,
      width: 112,
      childG: Padding(
        padding: const EdgeInsets.all(8.0 / 0.5),
        child: Center(
          child: DefaultTextStyle(
            style: GoogleFonts.robotoMono(
                fontWeight: FontWeight.bold,
                fontSize: 14 / 0.5,
                color: Colors.white),
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                RotateAnimatedText('Hire me!',
                    textStyle: const TextStyle(fontSize: 16)),
                RotateAnimatedText('Send me Hello!',
                    textStyle: const TextStyle(fontSize: 16)),
              ],
              onTap: () async {
                String email = Uri.encodeComponent("roopam12cse@gmail.com");
                String subject = Uri.encodeComponent(
                    "Job Offer: [Position Title] - [Your Company Name]");
                String body = Uri.encodeComponent("Hi! I'm <type your name>");
                Uri mail =
                    Uri.parse("mailto:$email?subject=$subject&body=$body");
                if (await launchUrl(mail)) {
                  // Email app opened
                } else {
                  // Email app is not opened
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
