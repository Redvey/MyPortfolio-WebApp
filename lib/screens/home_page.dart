
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o3d/o3d.dart';
import 'package:portfolio/consts/data.dart';
import 'package:portfolio/providers/current_state.dart';
import 'package:portfolio/screens/mini_projects/clocky/clockview.dart';
import 'package:portfolio/screens/phone_screen_wrapper.dart';
import 'package:portfolio/widgets/frosted_containers.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';



class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  O3DController o3dController= O3DController();

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    CurrentState currentState =
       Provider.of<CurrentState>(context,listen: false);

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

    return  Scaffold(
      body: Stack(
        children: [

          Selector<CurrentState,int>(
            selector: (context,provider)=> provider.knobSelected,
            builder: (context,_,__) {
              return Container(
                decoration:  BoxDecoration(
                  gradient: colorPalette[currentState.knobSelected].gradient
                ),
              );
            }
          ),
          Selector<CurrentState,int>(
            selector: (context,provider)=> provider.knobSelected,
            builder: (context,_,__) {
              return SvgPicture.asset(colorPalette[currentState.knobSelected].svgPath,height: size.height,
                fit: BoxFit.cover,);
            }
          ),

          Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10,),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 500,
                          width: 225, // Set the width of the O3D widget
                          child: O3D(
                            src: 'assets/animations/robot_32x.glb',
                            controller: o3dController,
                            ar: false,
                            autoPlay: true,
                            autoRotate: false,

                          ),
                        ),
                      ],
                    ),
                    SizedBox(
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
                                gradient: colorPalette[currentState.knobSelected].gradient,
                              ),
                              child: ScreenWrapper(childG: currentState.currentScreen),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 150,
                          width: 225,
                          child: Center(child: ClockView(size: MediaQuery.of(context).size.height / 4,)),
                        ),
                        SizedBox(height: 10),
                        FrostedContainer(
                          height: 150,
                          width: 225,
                          childG: Center(child:
                          DefaultTextStyle(
                            style:  GoogleFonts.dancingScript(
                              fontSize: 14.0,
                              color: Colors.white
                            ),
                            child: AnimatedTextKit(
                              animatedTexts: [
                                TypewriterAnimatedText('Hire me!'),
                                TypewriterAnimatedText("This is Roopam's portfolio website"),
                              ],
                              onTap: () async {
                                String email = Uri.encodeComponent("roopam12cse@gmail.com");
                                String subject = Uri.encodeComponent("Job Offer: [Position Title] - [Your Company Name]");
                                String body = Uri.encodeComponent("Hi! I'm <type your name>");
                                Uri mail = Uri.parse("mailto:$email?subject=$subject&body=$body");
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
                        SizedBox(height: 10),
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
                                    margin: EdgeInsets.all(10),
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
                  ],
                ),
              ),


              const SizedBox(height: 10,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...List.generate(devices.length, (index) => Selector<CurrentState,DeviceInfo>(
                    selector: (context,provider)=>provider.currentDevice,
                    builder: (context,_,__) {
                      return CustomButton(
                        backgroundColor: Colors.black,
                          isThreeD:true,
                          animate: true,
                          height: 38,
                          width: 38,
                          borderRadius: 100,
                          shadowColor: Colors.white,
                          pressed: currentState.currentDevice==devices[index].devices?Pressed.pressed:Pressed.notPressed,
                          onPressed: () { currentState.changeSelectedDevice(devices[index].devices); },
                          child: Center(child: Icon(devices[index].data,color: Colors.white,),)
                      );
                    }
                  ))
                ],
              )
            ],
          ),
      ]),
    );
  }
}
