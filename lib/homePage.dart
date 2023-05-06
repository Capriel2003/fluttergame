import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

const double tileSize = 42;

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
        autofocus: true,
        joystick: Joystick(
          directional: JoystickDirectional(),
        ),
        map: WorldMapByTiled('map/island.json',
            forceTileSize: Vector2.all(tileSize)),
        player: Player(position: Vector2(130, 1450), size: Vector2.all(62)));
  }
}
