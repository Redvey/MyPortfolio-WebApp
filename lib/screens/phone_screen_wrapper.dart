
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/consts/data.dart';
import 'package:portfolio/providers/current_state.dart';
import 'package:portfolio/screens/phone_home_page.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';



class ScreenWrapper extends StatelessWidget {
  final Widget childG;
  const ScreenWrapper({super.key, required this.childG});

  @override
  Widget build(BuildContext context) {
    CurrentState currentState =
    Provider.of<CurrentState>(context,listen: false);
    CurrentState instance = Provider.of<CurrentState>(context, listen: false);
    return Column(
      children: [
        // here can show the appbar
        Consumer<CurrentState>(builder: (context, _, __) {
          if (!instance.isMainScrren) {
            return Container(
              width: double.infinity,
              decoration:  BoxDecoration(
                  gradient: colorPalette[currentState.knobSelected].gradient),
              padding: const EdgeInsets.only(top: 30),
              // height: 50,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      instance.title ?? "My Dev Card",
                      style: GoogleFonts.inter(fontSize: 18,color: Colors.black),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.black,
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
              ),
            );
          }
          return Container();
        }),
        Expanded(
          child: Container(
            // padding: const EdgeInsets.only(top: 10),
            child: childG,
          ),
        ),
      ],
    );
  }
}