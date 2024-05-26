import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';
import 'package:portfolio/consts/data.dart';
import 'package:portfolio/providers/current_state.dart';
import 'package:portfolio/screens/phone_screen_wrapper.dart';
import 'package:provider/provider.dart';

class PhoneScaffold extends StatefulWidget {
  const PhoneScaffold({super.key});

  @override
  State<PhoneScaffold> createState() => _PhoneScaffoldState();
}

class _PhoneScaffoldState extends State<PhoneScaffold> {
  O3DController o3dController = O3DController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CurrentState currentState =
        Provider.of<CurrentState>(context, listen: false);

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
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(
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
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
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
            )
          ],
        ),
      ]),
    );
  }
}
