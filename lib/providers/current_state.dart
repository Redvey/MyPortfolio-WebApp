import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../screens/phone_home_page.dart';


class CurrentState extends ChangeNotifier {
   DeviceInfo currentDevice=Devices.ios.iPhone13;
   Gradient bgGradient=LinearGradient(colors: [Colors.deepPurple,Colors.blue],begin: Alignment.topLeft,end: Alignment.topRight);
   int knobSelected=2;

   void changeSelectedDevice(DeviceInfo device){
     currentDevice= device;
     notifyListeners();
   }
   void changeGradient(int index){
     knobSelected= index;
     notifyListeners();
   }
   Future<void>launchInBrowser(String link) async{
     Uri url= Uri.parse(link);
     if (await canLaunchUrl(url)){
       await launchUrl(url,mode: LaunchMode.externalApplication);
     } else{
       print("something went wrong");
     }
   }
   Widget currentScreen=const PhoneHomeScreen();

   void changePhoneScreen(Widget change,bool isMain,{String? titleL}){
     currentScreen= change;
     isMainScrren=isMain;
     notifyListeners();
   }
   bool isMainScrren=true;

   String? title;

   void changeAppBar(int index){
     knobSelected= index;
     notifyListeners();
   }

}
