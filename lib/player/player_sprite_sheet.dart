import 'package:bonfire/bonfire.dart';

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

  static Future<SpriteAnimation> get stoped => SpriteAnimation.load(
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
        idleUp: PlayerSpriteSheet.stoped,
        idleLeft: PlayerSpriteSheet.heroIdleLeft,
        idleRight: PlayerSpriteSheet.heroIdleRight,
        runLeft: PlayerSpriteSheet.heroRunLeft,
        runRight: PlayerSpriteSheet.heroRunRight,
      );

  static Future<SpriteAnimation> cutAnimation() => SpriteAnimation.load(
        'attacks/cut.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(32, 32),
        ),
      );
}