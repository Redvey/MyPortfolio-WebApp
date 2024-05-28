import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/screens/device_frame/phone_screen_wrapper.dart';
import 'package:provider/provider.dart';

import '../consts/data.dart';
import '../providers/current_state.dart';

class CustomFrames extends StatelessWidget {
  const CustomFrames({
    super.key,
    required this.size,
    required this.currentState, required this.minimizer,
  });

  final Size size;
  final CurrentState currentState;
  final double minimizer;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height - minimizer,
      child: Consumer<CurrentState>(
        builder: (context, _, __) {
          return DeviceFrame(
            device: currentState.currentDevice,
            screen: Container(
              decoration: BoxDecoration(
                gradient: colorPalette[currentState.knobSelected].gradient,
              ),
              child: ScreenWrapper(childG: currentState.currentScreen),
            ),
          );
        },
      ),
    );
  }
}
