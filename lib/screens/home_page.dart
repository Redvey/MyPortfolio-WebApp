
import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
                      FrostedContainer(height: 150,width: 247,childG: Center(child: Text("data"),),),
                      SizedBox(height: 10,),
                      FrostedContainer(height: 150,width: 247,childG: Center(child: Text("data"),),),
                      SizedBox(height: 10,),
                      FrostedContainer(height: 150,width: 247,childG: Center(child: Text("data"),),),
                    ],
                  ),
                  SizedBox(
                    height: size.height-100,
                    child: Consumer<CurrentState>(
                      builder: (context,_,__) {
                        return DeviceFrame(
                            device: currentState.currentDevice,
                            screen: Container(
                                padding: const EdgeInsets.only(top: 70, left: 24, right: 24),
                              decoration:  BoxDecoration(gradient: colorPalette[currentState.knobSelected].gradient),
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                alignment: WrapAlignment.start,
                                children: [
                                  ...List.generate(apps.length, (index) => Container(
                                    margin: EdgeInsets.only(right: 10,left: 10,top: 10,bottom: 20),
                                    child: Column(
                                      children: [
                                        CustomButton(onPressed: (){
                                          if(apps[index].link!=null){
                                            currentState.launchInBrowser(apps[index].link!);
                                          }
                                        },
                                          margin: EdgeInsets.only(bottom: 5),
                                        animate: true,
                                        width: 45,
                                        height: 45,
                                        backgroundColor: apps[index].color,
                                          borderRadius: currentState.currentDevice==Devices.ios.iPhone13?8:100,
                                        child: Center(
                                          child: Icon(apps[index].icon,size: 25,color: Colors.black12,),
                                        ),),
                                        SizedBox(width: 65,
                                        child: Center(child: Text(apps[index].title,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),),),)
                                      ],
                                    ),
                                  ))
                                ],
                              )
                            ));
                      }
                    ),
                  ),
                   Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FrostedContainer(height: 150,width: 247,childG: Center(child: Text("data"),),),
                      SizedBox(height: 10,),
                      FrostedContainer(height: 150,width: 247,childG: Center(child: Text("data"),),),
                      SizedBox(height: 10,),
                      FrostedContainer(height: 150,width: 247,childG:
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
