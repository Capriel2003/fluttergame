import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:flameteste/game_sprite_sheet.dart';

class GameHero extends SimplePlayer with ObjectCollision {
  GameHero(Vector2 position)
      : super(
          position: position,
          size: Vector2.all(62),
          speed: 170,

          
          animation: SimpleDirectionAnimation(
            idleLeft: GameSpriteSheet.heroIdleLeft,
            idleRight: GameSpriteSheet.heroIdleRight,
            runLeft: GameSpriteSheet.heroRunLeft,
            runRight: GameSpriteSheet.heroRunRight,
          ),
        ){
          setupCollision(
            CollisionConfig(
              collisions: [
                CollisionArea.rectangle(
                  size: Vector2(20, 20),
                  align: Vector2(22, 32),
                )
              ],
            ),
          );
        }

}
