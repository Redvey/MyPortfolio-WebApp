
import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/consts/data.dart';
import 'package:portfolio/providers/current_state.dart';
import 'package:portfolio/screens/phone_screen_wrapper.dart';
import 'package:portfolio/widgets/frosted_containers.dart';
import 'package:provider/provider.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    CurrentState currentState =
       Provider.of<CurrentState>(context,listen: false);
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(CupertinoIcons.chat_bubble_2_fill),
          backgroundColor: Color(0xFF2A2929),
        elevation: 0,
      ),
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
                  Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FrostedContainer(height: 150,width: 225,childG: Center(child: Text("data"),),),
                      SizedBox(height: 10,),
                      FrostedContainer(height: 150,width: 225,childG: Center(child: Text("data"),),),
                      SizedBox(height: 10,),
                      FrostedContainer(height: 150,width: 225,childG: Center(child: Text("data"),),),
                    ],
                  ),
                  SizedBox(width: 20,),
                  SizedBox(
                    height: size.height-100,
                    child: Consumer<CurrentState>(
                      builder: (context,_,__) {
                        return DeviceFrame(
                            device: currentState.currentDevice,
                            screen: Container(
                                decoration:  BoxDecoration(
                                    gradient: colorPalette[currentState.knobSelected].gradient),
                                child: ScreenWrapper(childG: currentState.currentScreen)
                            ),
                        );
                      }
                    ),
                  ),
                  SizedBox(width: 20,),
                   Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FrostedContainer(height: 150,width: 225,childG: Center(child: Text("data"),),),
                      SizedBox(height: 10,),
                      FrostedContainer(height: 150,width: 225,childG: Center(child: Text("data"),),),
                      SizedBox(height: 10,),
                      FrostedContainer(height: 150,width: 225,childG:
                      Center(
                        child: Wrap(children: [
                          ...List.generate(colorPalette.length, (index) => CustomButton(onPressed: (){
                            currentState.changeGradient(index);
                          },
                            margin: EdgeInsets.all(10),
                            animate: true,
                            borderRadius: 100,
                            height: 52,
                            width: 52,
                            backgroundColor: colorPalette[index].color,))
                        ],),
                      )),
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