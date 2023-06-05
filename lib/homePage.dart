import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

import 'player.dart';

const double tileSize = 60;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      autofocus: true,
      joystick: Joystick(
        directional: JoystickDirectional(),
      ),
      map: WorldMapByTiled(
        'map/island.json',
        forceTileSize: Vector2.all(tileSize),
      ),
      player: GameHero(Vector2(18 * tileSize, 14 * tileSize)),
      showCollisionArea: false,
    );
  }
}
