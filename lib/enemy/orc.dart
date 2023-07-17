import 'dart:ui';
import 'package:bonfire/bonfire.dart';
import 'package:flameteste/homePage.dart';
import 'package:flameteste/enemy/orc_sprite_sheet.dart';
import 'package:flameteste/npc/old_man.dart';
import 'package:flameteste/player/player.dart';
import 'package:flameteste/player/player_sprite_sheet.dart';

bool canMove = false;

class Orc extends SimpleEnemy with ObjectCollision {
  Orc(Vector2 position)
      : super(
          position: position,
          size: Vector2.all(62),
          speed: 100,
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
        closePlayer: (player) {
          _executeAttack();
        },
        radiusVision: 1024,
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
    if (lastDirectionHorizontal == Direction.left) {
      animation?.playOnce(
        OrcSpriteSheet.dieLeft,
        runToTheEnd: true,
        onFinish: () {
          removeFromParent();
        },
      );
    } else {
      animation?.playOnce(
        OrcSpriteSheet.dieRight,
        runToTheEnd: true,
        onFinish: () {
          removeFromParent();
        },
      );
    }
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

  void _executeAttack() {
    simpleAttackMelee(
      damage: 20,
      size: size,
      animationRight: PlayerSpriteSheet.cutAnimation(),
      //animationLeft: PlayerSpriteSheet.attackLeft,
      //animationTop: PlayerSpriteSheet.attackTop,
      //animationBottom: PlayerSpriteSheet.attackBottom,
    );
  }
}
