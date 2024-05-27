import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/widgets/frosted_containers.dart';

import '../consts/data.dart';
import '../providers/current_state.dart';

class ColorPalette extends StatelessWidget {
  const ColorPalette({
    super.key,
    required this.currentState,
    required this.height,
    required this.width,
    required this.borderRadius,
    required this.buttonRadius,
    
  });

  final CurrentState currentState;
  final double height;
  final double width;
  final double borderRadius;
  final double buttonRadius;


  @override
  Widget build(BuildContext context) {
    return FrostedContainer(
      height: height,
      width: width,
      childG: Center(
        child: Wrap(
          children: [
            ...List.generate(
              colorPalette.length,
              (index) => CustomButton(
                onPressed: () {
                  currentState.changeGradient(index);
                },
                margin: const EdgeInsets.all(10),
                animate: true,
                borderRadius: borderRadius,
                height: buttonRadius,
                width: buttonRadius,
                backgroundColor: colorPalette[index].color,
              ),
            )
          ],
        ),
      ),
    );
  }
}
