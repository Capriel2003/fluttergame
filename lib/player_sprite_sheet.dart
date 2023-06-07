import 'package:bonfire/bonfire.dart';
import 'package:flutter/widgets.dart';

class PlayerSpriteSheet {
  static Future<SpriteAnimation> get heroIdleLeft => SpriteAnimation.load(
        'player/fHero.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(96, 0),
        ),
      );

  static Future<SpriteAnimation> get heroIdleRight => SpriteAnimation.load(
        'player/fHero.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(0, 0),
        ),
      );

  static Future<SpriteAnimation> get heroRunRight => SpriteAnimation.load(
        'player/fHero.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(0, 48),
        ),
      );

  static Future<SpriteAnimation> get heroRunLeft => SpriteAnimation.load(
        'player/fHero.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(96, 48),
        ),
      );

  //Movimentação para todos os lados do Player
  static SimpleDirectionAnimation get simpleDirectionAnimation =>
      SimpleDirectionAnimation(
        idleLeft: PlayerSpriteSheet.heroIdleLeft,
        idleRight: PlayerSpriteSheet.heroIdleRight,
        runLeft: PlayerSpriteSheet.heroRunLeft,
        runRight: PlayerSpriteSheet.heroRunRight,
      );

  static Future<SpriteAnimation> get attackLeft => SpriteAnimation.load(
        'attacks/attack_effect_left.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> get attackRight => SpriteAnimation.load(
        'attacks/attack_effect_right.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );
  static Future<SpriteAnimation> get attackTop => SpriteAnimation.load(
        'attacks/attack_effect_top.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> get attackBottom => SpriteAnimation.load(
        'attacks/attack_effect_bottom.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );
}
