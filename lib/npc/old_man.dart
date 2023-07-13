import 'dart:developer';
import 'package:bonfire/bonfire.dart';
import 'package:flameteste/homePage.dart';
import 'package:flameteste/player/player_sprite_sheet.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class OldMan extends SimpleNpc with TapGesture, ObjectCollision {
  OldMan(Vector2 position)
      : super(
          position: position,
          size: Vector2.all(62),
          speed: 180,
          initDirection: Direction.down,
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
  void onTap() {
    bool flag = false;
    log("colidiu");
    seePlayer(
      observed: (player) {
        flag = true;
      },
      radiusVision: 3 * tileSize,
    );
    if (flag) {
      _showDialogTalk();
    }
  }

  void _showDialogTalk() {
    gameRef.camera.moveToTargetAnimated(this, zoom: 2, finish: () {
      TalkDialog.show(
        gameRef.context,
        [
          _speak(text: 'Fala meu mano, como voce ta?', isHero: false),
          _speak(text: 'To bem, e voce?', isHero: true),
          _speak(
              text:
                  'To indo, mas fiquei sabendo que aqui ta cheio de inimigo, toma cuidado',
              isHero: false),
        ],
        logicalKeyboardKeysToNext: [
          LogicalKeyboardKey.space,
          LogicalKeyboardKey.enter,
        ],
      );
    });
  }

  Say _speak({required String text, required bool isHero}) => Say(
        text: [
          TextSpan(text: text),
        ],
        person: SizedBox(
            height: 200,
            width: 200,
            child: isHero
                ? GreenNinjaSpriteSheet.spriteSheet.getSprite(0, 0).asWidget()
                : GreenNinjaSpriteSheet.spriteSheet.getSprite(1, 1).asWidget()),
        personSayDirection:
            isHero ? PersonSayDirection.LEFT : PersonSayDirection.RIGHT,
      );
}
