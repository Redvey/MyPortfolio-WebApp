import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:o3d/o3d.dart';
import 'package:portfolio/consts/data.dart';
import 'package:portfolio/providers/current_state.dart';
import 'package:portfolio/widgets/flutter_text.dart';
import 'package:portfolio/screens/desktop_home/widgets/hire_me.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import '../../widgets/clock_time.dart';
import '../../widgets/color_box.dart';
import '../../widgets/custom_device.dart';
import '../../widgets/custom_frames.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  O3DController o3dController = O3DController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CurrentState currentState =
        Provider.of<CurrentState>(context, listen: false);
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE/d/MMM').format(now);

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
          padding: const EdgeInsets.all(24).copyWith(left: 9),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 525,
                          width: 525, // Set the width of the O3D widget
                          // child: O3D(
                          //   src: 'assets/animations/robot_32x.glb',
                          //   controller: o3dController,
                          //   ar: false,
                          //   autoPlay: true,
                          //   autoRotate: false,

                          // ),
                          child: RiveAnimation.asset(
                              'assets/animations/quantumannealer.riv'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CustomFrames(
                      size: size,
                      currentState: currentState,
                      minimizer: 100,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //CLOCK

                        ClockTime(
                            formattedDate: formattedDate,
                            formattedTime: formattedTime),
                        const SizedBox(height: 10),

                        //ANIMATED TEXT

                        const HireMeBox(),

                        const SizedBox(height: 10),

                        //THEME
                        ColorPalette(
                            currentState: currentState,
                            height: 150,
                            width: 225,
                            borderRadius: 100,
                            buttonRadius: 52),
                      ],
                    ),
                    const BwFlutterText(size: 18,),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomDeviceButton(
                currentState: currentState,
                size: 24,
                btnRadi: 38,
                borderRadi: 100,
              )
            ],
          ),
        ),
      ]),
    );
  }
}
