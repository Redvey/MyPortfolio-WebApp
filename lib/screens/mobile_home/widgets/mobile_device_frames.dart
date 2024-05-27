import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../consts/data.dart';
import '../../../providers/current_state.dart';
import '../../phone_screen_wrapper.dart';

class MobileDeviceFrame extends StatelessWidget {
  const MobileDeviceFrame({
    super.key,
    required this.size,
    required this.currentState,
  });

  final Size size;
  final CurrentState currentState;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SizedBox(
          height: size.height - 300,
          child: Consumer<CurrentState>(
            builder: (context, _, __) {
              return DeviceFrame(
                device: currentState.currentDevice,
                screen: Container(
                  decoration: BoxDecoration(
                    gradient: colorPalette[currentState.knobSelected]
                        .gradient,
                  ),
                  child:
                      ScreenWrapper(childG: currentState.currentScreen),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
