import 'package:flutter/material.dart';
import 'package:portfolio/screens/home_page.dart';
import 'package:portfolio/providers/current_state.dart';
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
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

