import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';


class CurrentState extends ChangeNotifier {
   DeviceInfo currentDevice=Devices.ios.iPhone13;
   Gradient bgGradient=LinearGradient(colors: [Colors.deepPurple,Colors.blue],begin: Alignment.topLeft,end: Alignment.topRight);
   int knobSelected=2;
   void changeSelectedDevice(DeviceInfo device){
     currentDevice= device;
     notifyListeners();
   }
   void chnageGradient(int index){
     knobSelected= index;
     notifyListeners();
   }

}
