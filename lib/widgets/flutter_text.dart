import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BwFlutterText extends StatelessWidget {
  const BwFlutterText({
    super.key, required this.size,

    
  });
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Transform.rotate(
        angle:
            -90 * 3.141592653589793 / 180, // Rotate by 90 degrees (in radians)
        child: Center(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Build with ',
                  style: GoogleFonts.orbitron(
                      fontSize: size,
                      letterSpacing: 3.0,
                      color: const Color.fromARGB(255, 48, 48, 48)),
                ),
                TextSpan(
                  text: 'FLUTTER ',
                  style: GoogleFonts.orbitron(
                      fontSize: size+4, letterSpacing: 3.0, color: Colors.blue),
                ),
                 WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: FlutterLogo(size: size +6),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
