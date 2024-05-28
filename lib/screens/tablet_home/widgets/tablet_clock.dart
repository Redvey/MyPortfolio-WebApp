import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/widgets/frosted_containers.dart';

class TabletClock extends StatelessWidget {
  const TabletClock({
    super.key,
    required this.formattedDate,
    required this.formattedTime,
  });

  final String formattedDate;
  final String formattedTime;

  @override
  Widget build(BuildContext context) {
    return FrostedContainer(
      height: 105,
      width: 112,
      // decoration: BoxDecoration(
      //   color: Color(0xFF242633),
      //   borderRadius: BorderRadius.circular(20),
      // ),
      childG: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 1,
                  width: 25,
                  color: Colors.white,
                ),
                Text(
                  formattedDate,
                  style: GoogleFonts.robotoMono(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  formattedTime,
                  style: GoogleFonts.robotoMono(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 1.5),
              ],
            )
          ],
        ),
      ),
    );
  }
}