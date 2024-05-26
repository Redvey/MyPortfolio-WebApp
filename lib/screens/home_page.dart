import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:o3d/o3d.dart';
import 'package:portfolio/consts/data.dart';
import 'package:portfolio/providers/current_state.dart';
import 'package:portfolio/screens/mini_projects/clocky/clockview.dart';
import 'package:portfolio/screens/phone_screen_wrapper.dart';
import 'package:portfolio/widgets/frosted_containers.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:url_launcher/url_launcher.dart';

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
                    SizedBox(
                      height: size.height - 100,
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //CLOCK
                        FrostedContainer(
                          height: 150,
                          width: 225,
                          // decoration: BoxDecoration(
                          //   color: Color(0xFF242633),
                          //   borderRadius: BorderRadius.circular(20),
                          // ),
                          childG: Row(
                            children: [
                              ClockView(
                                size: MediaQuery.of(context).size.height / 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 2,
                                    width: 20 * 2.5,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    formattedDate,
                                    style: GoogleFonts.robotoMono(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    formattedTime,
                                    style: GoogleFonts.robotoMono(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),

                        //ANIMATED TEXT

                        FrostedContainer(
                          height: 150,
                          width: 225,
                          childG: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: DefaultTextStyle(
                                style: GoogleFonts.robotoMono(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.white),
                                child: AnimatedTextKit(
                                  repeatForever: true,
                                  animatedTexts: [
                                    TypewriterAnimatedText('Hire me!'),
                                    TypewriterAnimatedText(
                                        "Hi! its Roopam's portfolio website\nClick here to hire me :)"),
                                  ],
                                  onTap: () async {
                                    String email = Uri.encodeComponent(
                                        "roopam12cse@gmail.com");
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
                          height: 150,
                          width: 225,
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
                                    borderRadius: 100,
                                    height: 52,
                                    width: 52,
                                    backgroundColor: colorPalette[index].color,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 320,
                      height: double.infinity,
                      child: Transform.rotate(
                        angle: -90 *
                            3.141592653589793 /
                            180, // Rotate by 90 degrees (in radians)
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Build with ',
                              style: GoogleFonts.orbitron(
                                  fontSize: 18, letterSpacing: 3.0),
                            ),
                            Text('FLUTTER ',
                                style: GoogleFonts.orbitron(
                                    fontSize: 22,
                                    letterSpacing: 3.0,
                                    color: Colors.blue)),
                            const FlutterLogo()
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
        ),
      ]),
    );
  }
}
