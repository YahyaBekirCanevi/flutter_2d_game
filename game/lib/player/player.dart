import 'package:flutter/material.dart';
import 'package:game/constants.dart';

class MyPlayer extends StatelessWidget {
  double positionX;
  double positionY;

  MyPlayer({ 
    Key? key,
    required this.positionX,
    required this.positionY,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(positionX, positionY),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: kTertiaryColor,
          height: 50,
          width: 50,
        ),
      ),
    );
  }
}