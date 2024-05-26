import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:o3d/o3d.dart';
import 'package:portfolio/consts/data.dart';
import 'package:portfolio/providers/current_state.dart';
import 'package:portfolio/screens/phone_screen_wrapper.dart';
import 'package:portfolio/widgets/frosted_containers.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //CLOCK
                  FrostedContainer(
                    height: 105,
                    width: 112,
                    // decoration: BoxDecoration(
                    //   color: Color(0xFF242633),
                    //   borderRadius: BorderRadius.circular(20),
                    // ),
                    childG: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 1,
                                width: 25,
                                color: Colors.white,
                              ),
                              Text(
                                formattedDate,
                                style: GoogleFonts.robotoMono(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                formattedTime,
                                style: GoogleFonts.robotoMono(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 1.5),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  //ANIMATED TEXT
                  FrostedContainer(
                    height: 105,
                    width: 112,
                    childG: Padding(
                      padding: const EdgeInsets.all(8.0 / 0.5),
                      child: Center(
                        child: DefaultTextStyle(
                          style: GoogleFonts.robotoMono(
                              fontWeight: FontWeight.bold,
                              fontSize: 14 / 0.5,
                              color: Colors.white),
                          child: AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              RotateAnimatedText('Hire me!',
                                  textStyle: const TextStyle(fontSize: 16)),
                              RotateAnimatedText('Send me Hello!',
                                  textStyle: const TextStyle(fontSize: 16)),
                            ],
                            onTap: () async {
                              String email =
                                  Uri.encodeComponent("roopam12cse@gmail.com");
                              String subject = Uri.encodeComponent(
                                  "Job Offer: [Position Title] - [Your Company Name]");
                              String body = Uri.encodeComponent(
                                  "Hi! I'm <type your name>");
                              Uri mail = Uri.parse(
                                  "mailto:$email?subject=$subject&body=$body");
                              if (await launchUrl(mail)) {
                                // Email app opened
                              } else {
                                // Email app is not opened
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  //THEME
                  FrostedContainer(
                    height: 105,
                    width: 112,
                    childG: Center(
                      child: Wrap(
                        children: [
                          ...List.generate(
                            colorPalette.length,
                            (index) => CustomButton(
                              onPressed: () {
                                currentState.changeGradient(index);
                              },
                              margin: const EdgeInsets.all(10),
                              animate: true,
                              borderRadius: 50,
                              height: 26,
                              width: 26,
                              backgroundColor: colorPalette[index].color,
                            ),
                          )
                        ],
                      ),
                    ),
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ...List.generate(
                            devices.length,
                            (index) => Selector<CurrentState, DeviceInfo>(
                                selector: (context, provider) =>
                                    provider.currentDevice,
                                builder: (context, _, __) {
                                  return CustomButton(
                                      backgroundColor: Colors.black,
                                      isThreeD: true,
                                      animate: true,
                                      height: 40,
                                      width: 40,
                                      borderRadius: 50,
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
                                          size: 19,
                                          color: Colors.white,
                                        ),
                                      ));
                                }))
                      ],
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    SizedBox(
                      height: size.height - 300,
                      child: Consumer<CurrentState>(
                        builder: (context, _, __) {
                          return DeviceFrame(
                            device: currentState.currentDevice,
                            screen: Container(
                              decoration: BoxDecoration(
                                gradient:
                                    colorPalette[currentState.knobSelected]
                                        .gradient,
                              ),
                              child: ScreenWrapper(
                                  childG: currentState.currentScreen),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 20,
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
