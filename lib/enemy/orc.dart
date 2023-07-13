import 'dart:ui';
import 'package:bonfire/bonfire.dart';
import 'package:flameteste/homepage/homePage.dart';
import 'package:flameteste/enemy/orc_sprite_sheet.dart';

class Orc extends SimpleEnemy with ObjectCollision {
  bool canMove = true;

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
    if (canMove) {
      seeAndMoveToPlayer(
        closePlayer: (player) {},
        radiusVision: 3 * tileSize,
      );
    }

    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    drawDefaultLifeBar(
      canvas,
      borderWidth: 2,
      height: 5,
      align: const Offset(0, -5),
    );

    super.render(canvas);
  }

  @override
  void die() {
    removeFromParent();
    super.die();
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
    canMove = false;
    if (lastDirectionHorizontal == Direction.left) {
      animation?.playOnce(
        OrcSpriteSheet.receiveDamageLeft,
        runToTheEnd: true,
        onFinish: () {
          canMove = true;
        },
      );
    } else {
      animation?.playOnce(
        OrcSpriteSheet.receiveDamageRight,
        runToTheEnd: true,
        onFinish: () {
          canMove = true;
        },
      );
    }
    super.receiveDamage(attacker, damage, identify);
  }
}
