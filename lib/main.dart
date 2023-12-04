import 'package:flutter/material.dart';
import 'package:portfolio/providers/current_state.dart';
import 'package:portfolio/splash_screen.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyPortfolio());
}

class MyPortfolio extends StatelessWidget {
  const MyPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>CurrentState())
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}

