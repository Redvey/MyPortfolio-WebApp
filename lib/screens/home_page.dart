
import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/consts/data.dart';
import 'package:portfolio/providers/current_state.dart';
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
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                colors: [Colors.deepPurpleAccent,Colors.blue]
              )
            ),
          ),
          SvgPicture.asset("assets/images/CloudyBlue.svg",height: size.height,
          fit: BoxFit.cover,),
          Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10,),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Column(
                  children: [
                    FrostedContainer(height: 396,width: 247,),
                    SizedBox(height: 10,),
                    FrostedContainer(height: 175,width: 247,),
                  ],
                ),
                SizedBox(
                  height: size.height-100,
                  child: Consumer<CurrentState>(
                    builder: (context,_,__) {
                      return DeviceFrame(
                          device: currentState.currentDevice,
                          screen: Container(
                            decoration: const BoxDecoration(color: Colors.green),
                            child: const Center(
                              child: Text("Hi it's Roopam",
                              style: TextStyle(
                                color: Colors.white
                              ),),
                            ),
                          ));
                    }
                  ),
                ),
                const Column(
                  children: [
                    FrostedContainer(height: 396,width: 247,),
                    SizedBox(height: 10,),
                    FrostedContainer(height: 175,width: 247,),
                  ],
                ),
              ],
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
