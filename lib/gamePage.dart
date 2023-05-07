import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
        joystick: Joystick(
          directional: JoystickDirectional(),
        ),
        map: WorldMapByTiled(
          'map/island.json',
          forceTileSize: Vector2(32, 32)

        ));
  }
}