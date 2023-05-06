import 'package:bonfire/bonfire.dart';
import 'package:flameteste/game_sprite_sheet.dart';

class Player extends SimplePlayer {
  Player(Vector2 position)
      : super(
          position: position,
          size: Vector2.all(62),
          animation: GameSpriteSheet.simpleDirectionAnimation,
        );
}
