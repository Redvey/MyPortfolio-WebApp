import 'package:flutter/material.dart';

import 'package:portfolio/consts/data.dart';
import 'package:portfolio/providers/current_state.dart';
import 'package:portfolio/widgets/custom_device.dart';
import 'package:portfolio/widgets/custom_frames.dart';
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 10,
              ),
              CustomFrames(
                size: size,
                currentState: currentState,
                minimizer: 300,
              ),
              CustomDeviceButton(
                deviceNum: 2,
                currentState: currentState,
                btnRadi: 38,
                borderRadi: 100,
                size: 19,
              )
            ],
          ),
        ),
      ]),
    );
  }
}
