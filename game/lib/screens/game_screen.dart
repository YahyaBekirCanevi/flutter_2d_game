import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game/constants.dart';
import 'package:game/player/player.dart';
import 'package:get/get.dart';

class GameScreen extends StatefulWidget {
  static String routeName = '/GameScreen';
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  double playerX = 0;
  double playerY = 1;
  double moveVelocity = 0.1;
  double jumpVelocity = 5;

  void moveHorizontal(int direction) {
    setState(() {
      playerX += moveVelocity * direction;
      playerX = playerX.clamp(-1, 1);
    });
  }

  double calculateHeight(double time, double velocity) {
    return (-9.8 * 0.5 * time * time) + velocity * time;
  }

  void jump() {
    var time = 0.0;
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      var height = calculateHeight(time, jumpVelocity);
      setState(() {
        if (1 - height > 1) {
          playerY = 1;
          timer.cancel();
        } else {
          playerY = 1 - height;
        }
      });
      time += 0.01;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: (event) {
        int direction = 0;
        if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) direction++;
        if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) direction--;

        moveHorizontal(direction);

        if (event.isKeyPressed(LogicalKeyboardKey.arrowUp) &&
            event is! RawKeyUpEvent &&
            playerY == 1) {
          jump();
        }
      },
      child: Column(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              color: kPrimaryColor,
              child: Center(
                child: Stack(
                  children: [
                    MyPlayer(positionX: playerX, positionY: playerY),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: kSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
