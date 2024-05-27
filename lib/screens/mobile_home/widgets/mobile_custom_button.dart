import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../consts/data.dart';
import '../../../providers/current_state.dart';

class MobileCustomButtons extends StatelessWidget {
  const MobileCustomButtons({
    super.key,
    required this.currentState,
  });

  final CurrentState currentState;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ...List.generate(
            2,
            (index) => Selector<CurrentState, DeviceInfo>(
                selector: (context, provider) => provider.currentDevice,
                builder: (context, _, __) {
                  return CustomButton(
                      backgroundColor: Colors.black,
                      isThreeD: true,
                      animate: true,
                      height: 38,
                      width: 38,
                      borderRadius: 100,
                      shadowColor: Colors.white,
                      pressed: currentState.currentDevice ==
                              devices[index].devices
                          ? Pressed.pressed
                          : Pressed.notPressed,
                      onPressed: () {
                        currentState.changeSelectedDevice(
                            devices[index].devices);
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
