import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:flameteste/homePage.dart';
import 'package:flameteste/player_sprite_sheet.dart';

class GameHero extends SimplePlayer with ObjectCollision {
  GameHero(Vector2 position)
      : super(
          position: position,
          size: Vector2.all(62),
          speed: 180,
          animation: PlayerSpriteSheet.simpleDirectionAnimation,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(25, 35),
            align: Vector2(18, 27),
          )
        ],
      ),
    );
  }

  @override
  void joystickAction(JoystickActionEvent event) {
    if (event.event == ActionEvent.DOWN && event.id == 1) {
      _executeAttack();
    }
    super.joystickAction(event);
  }

  void _executeAttack() {
    simpleAttackMelee(
      damage: 20,
      size: Vector2.all(tileSize),
      //animationRight: PlayerSpriteSheet.attackRight,
      //animationLeft: PlayerSpriteSheet.attackLeft,
      //animationTop: PlayerSpriteSheet.attackTop,
      //animationBottom: PlayerSpriteSheet.attackBottom,
      //height: tileSize,
      //width: tileSize,
    );
  }
}
