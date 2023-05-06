import 'package:bonfire/bonfire.dart';

class GameSpriteSheet {
  static Future<SpriteAnimation> get playerIdLeft => SpriteAnimation.load(
      'fHero.png',
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 0.15,
        textureSize: Vector2(24, 24),
        texturePosition: Vector2(96, 0),
      ));

  static Future<SpriteAnimation> get playerIdRight => SpriteAnimation.load(
      'fHero.png',
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 0.15,
        textureSize: Vector2(24, 24),
        texturePosition: Vector2(0, 0),
      ));

  static Future<SpriteAnimation> get playerRunRight => SpriteAnimation.load(
      'fHero.png',
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 0.15,
        textureSize: Vector2(24, 24),
        texturePosition: Vector2(0, 72),
      ));

  static Future<SpriteAnimation> get playerRunLeft => SpriteAnimation.load(
      'fHero.png',
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 0.15,
        textureSize: Vector2(24, 24),
        texturePosition: Vector2(96, 72),
      ));

  static SimpleDirectionAnimation get simpleDirectionAnimation =>
      SimpleDirectionAnimation(
        idleRight: playerIdRight,
        idleLeft: playerIdLeft,
        runRight: playerRunRight,
        runLeft: playerRunLeft,
      );
}
