import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/providers/current_state.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrentState>(
      builder: (context, currentState, _) {
        Color getTextColor(bool isDarkMode) {
          return isDarkMode ? const Color(0xFFC7C8B9) : Color(0xFF1B1C16);
        }

        Color getBackgroundColor(bool isDarkMode) {
          return isDarkMode ? const Color(0xFF1B1C16) : Colors.white;
        }

        Color getbgboxes(bool isDarkMode) {
          return isDarkMode ? const Color(0xFF23251A) : Color(0xFFF5DEFD);
        }

        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              color: getBackgroundColor(currentState.isDarkMode),
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
                    color: getTextColor(currentState.isDarkMode),
                  ),
                ),
                Text(
                  "FLUTTER DEVELOPER",
                  style: GoogleFonts.chakraPetch(
                    fontSize: 20,
                    color: getTextColor(currentState.isDarkMode),
                  ),
                ),
                Container(
                  height: 1,
                  width: 150,
                  color: getTextColor(currentState.isDarkMode),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ElevatedButton(
                    onPressed: () async {
                      Uri phoneno = Uri.parse('tel:+91 7001628626');
                      if (await launchUrl(phoneno)) {
                        // Dialer opened
                      } else {
                        // Dialer is not opened
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: getbgboxes(currentState.isDarkMode),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                          color: Color(0xFF39293F),
                          width: 1,
                        ),
                      ),
                      fixedSize: Size(350, 55),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Icon(Icons.call
                         ,color: getTextColor(currentState.isDarkMode),),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          "+91 7001628626",
                          style: GoogleFonts.chakraPetch(
                            color: getTextColor(currentState.isDarkMode),
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
                      String email = Uri.encodeComponent("roopam12cse@gmail.com");
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
                      backgroundColor: getbgboxes(currentState.isDarkMode),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                          color: Color(0xFF39293F),
                          width: 1,
                        ),
                      ),
                      fixedSize: Size(350, 55),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Icon(Icons.mail,
                        color: getTextColor(currentState.isDarkMode),),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          "roopam12cse@gmail.com",
                          style: GoogleFonts.chakraPetch(
                            color: getTextColor(currentState.isDarkMode),
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
      },
    );
  }
}
