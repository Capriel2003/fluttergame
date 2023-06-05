import 'package:bonfire/bonfire.dart';

class GameSpriteSheet {
  static Future<SpriteAnimation> get heroIdleLeft => SpriteAnimation.load(
        'player/fHero.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(96,0),
        ), 
      );

      static Future<SpriteAnimation> get heroIdleRight => SpriteAnimation.load(
        'player/fHero.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(0,0),
        ), 
      );

      static Future<SpriteAnimation> get heroRunRight => SpriteAnimation.load(
        'player/fHero.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(0,48),
        ), 
      );

      static Future<SpriteAnimation> get heroRunLeft => SpriteAnimation.load(
        'player/fHero.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(96,48),
        ), 
      );
}
