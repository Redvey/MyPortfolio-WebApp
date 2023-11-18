import 'dart:ui';

import 'package:flutter/material.dart';


class FrostedContainer extends StatelessWidget {
  final double height;
  final double width;
  const FrostedContainer({super.key,
  required this.height, required this.width});

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      child: Stack(
        children: [
          BackdropFilter(filter: ImageFilter.blur(sigmaX: 7,sigmaY: 7),
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      colors: [Colors.white.withOpacity(0.5),Colors.white.withOpacity(0.3)]
                  )
              ),
            ),),

        ],
      ),
    );
  }
}
