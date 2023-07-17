import 'package:bonfire/bonfire.dart';
import 'package:flameteste/gameScreen.dart';
import 'package:flameteste/homePage.dart';
import 'package:flutter/material.dart';

class MyGameController extends GameComponent {
  bool endGame = false;
  bool gameOver = false;
  final int stage;

  MyGameController(this.stage);
  @override
  void update(double dt) {
    if (checkInterval('end game', 500, dt)) {
      if (gameRef.livingEnemies() == 0 && !endGame) {
        endGame = true;
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('Parabens... voce ganhou'),
              actions: [
                TextButton(
                  onPressed: () {
                    _goStage(stage + 1);
                  },
                  child: Text('Proximo'),
                )
              ],
            );
          },
        );
      }
    }
    if (checkInterval('end game', 500, dt)) {
      if (gameRef.player?.isDead == true && !gameOver) {
        gameOver = true;
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('GAME OVER'),
              actions: [
                TextButton(
                  onPressed: () {
                    _goStage(1);
                  },
                  child: Text('Proximo'),
                )
              ],
            );
          },
        );
      }
    }
    super.update(dt);
  }

  void _goStage(int newStage) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) {
        return Game(stage: newStage);
      }),
      (route) => false,
    );
  }
}
