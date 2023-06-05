import 'package:bonfire/bonfire.dart';
import 'package:flameteste/homePage.dart';
import 'package:flameteste/orc_sprite_sheet.dart';

class Orc extends SimpleEnemy with ObjectCollision {
  Orc(Vector2 position)
      : super(
          position: position,
          size: Vector2.all(62),
          speed: 140,
          animation: OrcSpriteSheet.simpleDirectionAnimation,
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
  void update(double dt) {
    seeAndMoveToPlayer(
      closePlayer: (player) {},
      radiusVision: 3 * tileSize,
    );
    super.update(dt);
  }
}
