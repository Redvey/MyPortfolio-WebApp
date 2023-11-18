import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return  Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                colors: [Colors.deepPurpleAccent,Colors.blue]
              )
            ),
          ),
          SvgPicture.asset("assets/images/CloudyBlue.svg",height: size.height,
          fit: BoxFit.cover,),
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DeviceFrame(device: Devices.ios.iPhone13,
                screen: Container(
                  decoration: BoxDecoration(color: Colors.green),
                  child: Center(
                    child: Text("Hi it's Roopam",
                    style: TextStyle(
                      color: Colors.white
                    ),),
                  ),
                ))
          ],
        ),
      ]),
    );
  }
}
