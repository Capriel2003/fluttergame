import 'package:bonfire/bonfire.dart';
import 'package:flameteste/player/player_sprite_sheet.dart';
import 'package:flutter/services.dart';

class GameHero extends SimplePlayer with ObjectCollision {
  bool canMove = true;
  GameHero(Vector2 position)
      : super(
          position: position,
          size: Vector2.all(62),
          speed: 180,
          life: 250,
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
    if (event.event == ActionEvent.DOWN && event.id == 1 ||
        event.id == LogicalKeyboardKey.numpad0.keyId) {
      _executeAttack();
    }
    super.joystickAction(event);
  }

  void _executeAttack() {
    simpleAttackMelee(
      damage: 20,
      withPush: false,
      size: size,
      animationRight: PlayerSpriteSheet.cutAnimation(),
      //animationLeft: PlayerSpriteSheet.attackLeft,
      //animationTop: PlayerSpriteSheet.attackTop,
      //animationBottom: PlayerSpriteSheet.attackBottom,
    );
  }

  @override
  void die() {
    if (lastDirectionHorizontal == Direction.left) {
      animation?.playOnce(
        PlayerSpriteSheet.dieLeft,
        runToTheEnd: true,
        onFinish: () {
          removeFromParent();
        },
      );
    } else {
      animation?.playOnce(
        PlayerSpriteSheet.dieRight,
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
        PlayerSpriteSheet.receiveDamageLeft,
        runToTheEnd: true,
        onFinish: () {
          canMove = true;
        },
      );
    } else {
      animation?.playOnce(
        PlayerSpriteSheet.receiveDamageRight,
        runToTheEnd: true,
        onFinish: () {
          canMove = true;
        },
      );
    }
    super.receiveDamage(attacker, damage, identify);
  }
}
