import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../consts/data.dart';
import '../providers/current_state.dart';

class CustomDeviceButton extends StatelessWidget {
  const CustomDeviceButton({
    super.key,
    required this.currentState,
    required this.btnRadi,
    required this.borderRadi,
    this.deviceNum = 3,
    required this.size,
    this.axis = Axis.horizontal,
  });

  final CurrentState currentState;
  final double btnRadi;
  final double borderRadi;
  final int deviceNum;
  final double size;
  final Axis axis;

  @override
  Widget build(BuildContext context) {
    final isHorizontal = axis == Axis.horizontal;
    return isHorizontal
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _buildButtons(context),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _buildButtons(context),
          );
  }

  List<Widget> _buildButtons(BuildContext context) {
    return List.generate(
      deviceNum,
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
            pressed: currentState.currentDevice == devices[index].devices
                ? Pressed.pressed
                : Pressed.notPressed,
            onPressed: () {
              currentState.changeSelectedDevice(devices[index].devices);
            },
            child: Center(
              child: Icon(
                size: size,
                devices[index].data,
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
