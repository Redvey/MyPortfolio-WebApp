import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/providers/current_state.dart';
import 'package:portfolio/screens/phone_home_page.dart';
import 'package:provider/provider.dart';

class ScreenWrapper extends StatelessWidget {
  final Widget childG;

  const ScreenWrapper({Key? key, required this.childG}) : super(key: key);
  Color getBackgroundColor(bool isDarkMode) {
    return isDarkMode ? const Color(0xFF1B1C16) : Color(0xFFC7C8B9);
  }
  Color getTextColor(bool isDarkMode) {
    return isDarkMode ? Color(0xFFC7C8B9) : Color(0xFF1B1C16);
  }
  Color getbgappbar(bool isDarkMode) {
    return isDarkMode ? const Color(0xFF1B1C16) : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    CurrentState instance = Provider.of<CurrentState>(context, listen: false);

    return Column(
      children: [
        // AppBar
        Consumer<CurrentState>(builder: (context, _, __) {
          if (!instance.isMainScrren) {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: getbgappbar(instance.isDarkMode),
              ),
              padding: const EdgeInsets.only(top: 30),
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      instance.title ?? "",
                      style: GoogleFonts.inter(fontSize: 18, color: getTextColor(instance.isDarkMode)),
                    ),
                    // Dark mode toggle icon
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            instance.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                            color: getTextColor(instance.isDarkMode),
                          ),
                          onPressed: () {
                            instance.toggleDarkMode(); // Method to toggle dark mode
                          },
                        ),
                        IconButton(
                          icon:  Icon(
                            Icons.close,
                            color: getTextColor(instance.isDarkMode),
                          ),
                          onPressed: () {
                            instance.changePhoneScreen(
                              const PhoneHomeScreen(),
                              true,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
          return Container();
        }),

        // Main content
        Expanded(
          child: Container(
            child: childG,
          ),
        ),
      ],
    );
  }
}
