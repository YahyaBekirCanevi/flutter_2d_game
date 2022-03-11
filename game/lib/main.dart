import 'package:flutter/material.dart';
import 'package:game/routes.dart';
import 'package:game/screens/game_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: '2D Game',
    initialRoute: GameScreen.routeName,
    routes: routes,
  ));
}