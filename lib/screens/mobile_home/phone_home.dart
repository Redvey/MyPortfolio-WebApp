import 'package:flutter/material.dart';

import 'package:portfolio/consts/data.dart';
import 'package:portfolio/providers/current_state.dart';
import 'package:portfolio/screens/mobile_home/widgets/mobile_custom_button.dart';
import 'package:portfolio/screens/mobile_home/widgets/mobile_device_frames.dart';
import 'package:provider/provider.dart';

class PhoneScaffold extends StatefulWidget {
  const PhoneScaffold({super.key});

  @override
  State<PhoneScaffold> createState() => _PhoneScaffoldState();
}

class _PhoneScaffoldState extends State<PhoneScaffold> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CurrentState currentState =
        Provider.of<CurrentState>(context, listen: false);

    return Scaffold(
      body: Stack(children: [
        Selector<CurrentState, int>(
            selector: (context, provider) => provider.knobSelected,
            builder: (context, _, __) {
              return Container(
                decoration: BoxDecoration(
                    gradient: colorPalette[currentState.knobSelected].gradient),
              );
            }),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              MobileDeviceFrame(size: size, currentState: currentState),
              
              MobileCustomButtons(currentState: currentState)
            ],
          ),
        ),
      ]),
    );
  }
}
