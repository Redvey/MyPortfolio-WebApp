import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/widgets/frosted_containers.dart';

import '../screens/mini_projects/clocky/clockview.dart';



class ClockTime extends StatelessWidget {
  const ClockTime({
    super.key,
    required this.formattedDate,
    required this.formattedTime,
  });

  final String formattedDate;
  final String formattedTime;

  @override
  Widget build(BuildContext context) {
    return FrostedContainer(
      height: 150,
      width: 225,
      // decoration: BoxDecoration(
      //   color: Color(0xFF242633),
      //   borderRadius: BorderRadius.circular(20),
      // ),
      childG: Row(
        children: [
          ClockView(
            size: MediaQuery.of(context).size.height / 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 2,
                width: 20 * 2.5,
                color: Colors.white,
              ),
              Text(
                formattedDate,
                style: GoogleFonts.robotoMono(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                formattedTime,
                style: GoogleFonts.robotoMono(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 3,
              ),
            ],
          )
        ],
      ),
    );
  }
}
