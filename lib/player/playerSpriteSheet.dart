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

  static Future<SpriteAnimation> get receiveDamageRight => SpriteAnimation.load(
        'player/fHero.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(0, 96),
        ),
      );

  static Future<SpriteAnimation> get receiveDamageLeft => SpriteAnimation.load(
        'player/fHero.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(96, 96),
        ),
      );

  static Future<SpriteAnimation> get dieRight => SpriteAnimation.load(
        'player/fHero.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(0, 120),
        ),
      );

  static Future<SpriteAnimation> get dieLeft => SpriteAnimation.load(
        'player/fHero.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(96, 120),
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

  static Future<SpriteAnimation> cutAnimation() => SpriteAnimation.load(
        'attacks/cut.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(32, 32),
        ),
      );
}

class GreenNinjaSpriteSheet {
  static Future<void> load() async {
    final image = await Flame.images.load("player/green_ninja.png");
    spriteSheet = SpriteSheet.fromColumnsAndRows(
      image: image,
      columns: 4,
      rows: 7,
    );
  }

  static late SpriteSheet spriteSheet;
}
