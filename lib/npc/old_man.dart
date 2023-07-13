import 'package:bonfire/bonfire.dart';
import 'package:flameteste/homePage.dart';
import 'package:flameteste/player/player_sprite_sheet.dart';

class OldMan extends SimplePlayer with ObjectCollision {
  OldMan(Vector2 position)
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
}