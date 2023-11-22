import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/consts/data.dart';
import 'package:portfolio/providers/current_state.dart';
import 'package:provider/provider.dart';


class PhoneHomeScreen extends StatelessWidget {
  const PhoneHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CurrentState currentState =
    Provider.of<CurrentState>(context,listen: false);
    return Container(
        padding: const EdgeInsets.only(top: 70, left: 24, right: 24),

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
                    else if(apps[index].screen!=null){
                      currentState.changePhoneScreen(apps[index].screen!,false,titleL: apps[index].title);
                    }
                  },
                    margin: EdgeInsets.only(bottom: 5),
                    animate: true,
                    width: 45,
                    height: 45,
                    backgroundColor: apps[index].color,
                    borderRadius: currentState.currentDevice==Devices.ios.iPhone13?8:100,
                    child: Center(
                      child: Icon(apps[index].icon,size: 25,color: Color(0xFF2A2929),),
                    ),),
                  SizedBox(width: 65,
                    child: Center(child: Text(
                      apps[index].title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: GoogleFonts.openSans(
                          fontSize: 11,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),),)
                ],
              ),
            ))
          ],
        )
    );
  }
}
