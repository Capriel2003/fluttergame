import 'package:bonfire/bonfire.dart';
import 'package:flameteste/enemy/orc.dart';
import 'package:flameteste/interface/game_controller.dart';
import 'package:flameteste/interface/player_interface.dart';
import 'package:flameteste/npc/old_man.dart';
import 'package:flameteste/player/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const double tileSize = 40;

class Game extends StatefulWidget {
  final int stage;
  const Game({Key? key, this.stage = 1}) : super(key: key);

  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      autofocus: true,
      joystick: Joystick(
        directional: JoystickDirectional(
          color: Colors.red,
        ),
        actions: [
          JoystickAction(
            actionId: 1,
            color: Colors.red,
            margin: const EdgeInsets.all(50),
          ),
        ],
        keyboardConfig: KeyboardConfig(
          keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows,
          acceptedKeys: [
            LogicalKeyboardKey.numpadEnter,
            LogicalKeyboardKey.numpad0,
          ],
        ),
      ),
      map: WorldMapByTiled(
        'map/island.json',
        objectsBuilder: {
          'orc': (properties) => Orc(properties.position),
          'old_man': (properties) => OldMan(properties.position),
        },
        forceTileSize: Vector2.all(tileSize),
      ),
      player: GameHero(Vector2(18 * tileSize, 14 * tileSize)),
      overlayBuilderMap: {
        PlayerInterface.overlayKey: (context, game) => PlayerInterface(
              game: game,
            )
      },
      initialActiveOverlays: const [
        PlayerInterface.overlayKey,
      ],
      components: [
        MyGameController(widget.stage),
      ],
      showCollisionArea: false,
    );
  }
}
