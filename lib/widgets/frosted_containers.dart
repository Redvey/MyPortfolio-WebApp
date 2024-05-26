import 'dart:ui';

import 'package:flutter/material.dart';


class FrostedContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget ?childG;
  const FrostedContainer({super.key,
  required this.height, required this.width,required this.childG});

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      child: Stack(
        children: [
          BackdropFilter(filter: ImageFilter.blur(sigmaX: 4,sigmaY: 4),
            child: Container(height: height,
              width: width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      colors: [Colors.white.withOpacity(0.2),Colors.white.withOpacity(0.3)]
                  )
              ),child: childG,
            ),),

        ],
      ),
    );
  }
}
