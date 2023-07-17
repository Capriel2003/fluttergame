import 'dart:developer';
import 'dart:io';
import 'package:bonfire/bonfire.dart';
import 'package:flameteste/enemy/orc.dart';
import 'package:flameteste/enemy/orcSpriteSheet.dart';
import 'package:flameteste/homePage.dart';
import 'package:flameteste/npc/oldManSpriteSheet.dart';
import 'package:flameteste/player/playerSpriteSheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class OldMan extends SimpleNpc with TapGesture {
  OldMan(Vector2 position)
      : super(
          position: position,
          size: Vector2.all(90),
          speed: 180,
          initDirection: Direction.down,
          animation: OldManSpriteSheet.simpleDirectionAnimation,
        );
  @override
  void onTap() {
    _showDialogTalk();
  }

  void _showDialogTalk() {
    gameRef.camera.moveToTargetAnimated(this, zoom: 2, finish: () {
      TalkDialog.show(gameRef.context, [
        _speak(text: 'Olá pequeno gafanhoto, como voce ta?', isHero: false),
        _speak(text: 'To bem... mas quem é voce?', isHero: true),
        _speak(
            text:
                'Eu sou alguém que está aqui para te ajudar durante essa jornada',
            isHero: false),
        _speak(text: 'Que jornada seria essa?', isHero: true),
        _speak(
            text:
                'A partir de agora, diversos inimigos aparecerão em seu caminho, o seu papel será de acabar com eles...',
            isHero: false),
        _speak(text: 'Eu não to preparado pra isso...', isHero: true),
        _speak(text: 'Te desejo sorte!', isHero: false),
      ], logicalKeyboardKeysToNext: [
        LogicalKeyboardKey.space,
        LogicalKeyboardKey.enter,
      ], onClose: () {
        gameRef.camera.moveToPlayerAnimated(zoom: 1);
        removeFromParent();
        canMove = true;
      });
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
                ? Image.asset('assets/images/autores/natan.png')
                : Image.asset('assets/images/autores/gabriel.png')),
        personSayDirection:
            isHero ? PersonSayDirection.LEFT : PersonSayDirection.RIGHT,
      );
}
