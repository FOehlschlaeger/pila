import 'package:flutter/material.dart';
import 'package:pila/screens/home_actions.dart';
import 'package:pila/screens/home_grid.dart';
import 'package:pila/screens/home_reload.dart';
import 'package:pila/screens/home_tetrominos.dart';

class PilaBody extends StatelessWidget {
  const PilaBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 155, 182, 212),
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 148, 148, 148)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          // Upper row: Central area
          ReloadArea(),
    
          Expanded(
            flex: 5,
            child: Center(
              child: GameGridScreen(),
            )
          ),
    
          // Middle row: TetrominoButtons with counters (4 upper, 3 lower)
          TetrominoButtons(),
    
          // Lower row: ActionButtons
          ActionButtons(),
        ],
      ),
    );
  }
}
