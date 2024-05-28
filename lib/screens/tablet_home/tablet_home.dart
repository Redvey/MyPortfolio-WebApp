import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:o3d/o3d.dart';
import 'package:portfolio/consts/data.dart';
import 'package:portfolio/providers/current_state.dart';
import 'package:portfolio/screens/tablet_home/widgets/hire_me.dart';
import 'package:portfolio/screens/tablet_home/widgets/tablet_clock.dart';
import 'package:portfolio/widgets/custom_device.dart';
import 'package:portfolio/widgets/custom_frames.dart';
import 'package:portfolio/widgets/flutter_text.dart';
import 'package:provider/provider.dart';
import '../../widgets/color_box.dart';

class TabletHome extends StatefulWidget {
  const TabletHome({super.key});

  @override
  State<TabletHome> createState() => _TabletHomeState();
}

class _TabletHomeState extends State<TabletHome> {
  O3DController o3dController = O3DController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CurrentState currentState =
        Provider.of<CurrentState>(context, listen: false);
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE/d/MMM').format(now);

    //animatedtext
    // const colorizeColors = [
    //   Colors.orange,
    //   Colors.white,
    //   Colors.black,
    //   Colors.green,
    // ];
    // const colorizeTextStyle = TextStyle(
    //   fontSize: 22,
    //   fontFamily: 'Agne',
    //   fontWeight: FontWeight.bold,
    // );

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
        // Selector<CurrentState, int>(
        //     selector: (context, provider) => provider.knobSelected,
        //     builder: (context, _, __) {
        //       return SvgPicture.asset(
        //         colorPalette[currentState.knobSelected].svgPath,
        //         height: size.height,
        //         fit: BoxFit.cover,
        //       );
        //     }),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //CLOCK
                  TabletClock(
                      formattedDate: formattedDate,
                      formattedTime: formattedTime),
                  const SizedBox(height: 10),
                  //ANIMATED TEXT
                  const TabHireMeBox(),
                  const SizedBox(height: 10),
                  //THEME
                  ColorPalette(
                    currentState: currentState,
                    height: 105,
                    width: 112,
                    borderRadius: 50,
                    buttonRadius: 26,
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 20 / 0.5,
                    ),
                    CustomDeviceButton(
                      currentState: currentState,
                      btnRadi: 50,
                      borderRadi: 60,
                      size: 19,
                      axis: Axis.vertical,
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    CustomFrames(
                        size: size, currentState: currentState, minimizer: 270),
                    const BwFlutterText(
                      size: 14,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10 / 0.5,
        ),
      ]),
    );
  }
}
