import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/consts/data.dart';
import 'package:provider/provider.dart';

import '../providers/current_state.dart';

class CustomDeviceButton extends StatelessWidget {
  const CustomDeviceButton({
    super.key,
    required this.currentState, required this.btnRadi, required this.borderRadi,
  });

  final CurrentState currentState;
  final double btnRadi;
  final double borderRadi;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ...List.generate(
            devices.length,
            (index) => Selector<CurrentState, DeviceInfo>(
                selector: (context, provider) => provider.currentDevice,
                builder: (context, _, __) {
                  return CustomButton(
                      backgroundColor: Colors.black,
                      isThreeD: true,
                      animate: true,
                      height: btnRadi,
                      width: btnRadi,
                      borderRadius: borderRadi,
                      shadowColor: Colors.white,
                      pressed:
                          currentState.currentDevice == devices[index].devices
                              ? Pressed.pressed
                              : Pressed.notPressed,
                      onPressed: () {
                        currentState
                            .changeSelectedDevice(devices[index].devices);
                      },
                      child: Center(
                        child: Icon(
                          devices[index].data,
                          color: Colors.white,
                        ),
                      ));
                }))
      ],
    );
  }
}
