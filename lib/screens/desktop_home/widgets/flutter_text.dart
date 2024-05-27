import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BwFlutterText extends StatelessWidget {
  const BwFlutterText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: double.infinity,
      child: Transform.rotate(
        angle: -90 *
            3.141592653589793 /
            180, // Rotate by 90 degrees (in radians)
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Build with ',
              style: GoogleFonts.orbitron(
                  fontSize: 18, letterSpacing: 3.0),
            ),
            Text('FLUTTER ',
                style: GoogleFonts.orbitron(
                    fontSize: 22,
                    letterSpacing: 3.0,
                    color: Colors.blue)),
            const FlutterLogo()
          ],
        ),
      ),
    );
  }
}
