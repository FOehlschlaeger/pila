// import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';
import 'package:pila/models/level_state.dart';
import 'package:pila/models/tetromino.dart';

class TetrominoButtons extends StatelessWidget {
  TetrominoButtons({
    super.key, 
    required LevelState lvlstate,
  });

  // final int tetrominoI_counter = lvlstate['counter_TetrominoI']['current'];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3, // Nimmt mehr Platz ein
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Obere Reihe der sieben Icons (4 Icons)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildImageWithNumber(
                    'assets/images/tetromino-I.png', 2, TetrominoI()),
                _buildImageWithNumber(
                    'assets/images/tetromino-O.png', 1, TetrominoO()),
                _buildImageWithNumber(
                    'assets/images/tetromino-J.png', 0, TetrominoJ()),
                _buildImageWithNumber(
                    'assets/images/tetromino-L.png', 0, TetrominoL()),
              ],
            ),
            // Untere Reihe der sieben Icons (3 Icons)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildImageWithNumber(
                    'assets/images/tetromino-S.png', 0, TetrominoS()),
                _buildImageWithNumber(
                    'assets/images/tetromino-Z.png', 0, TetrominoZ()),
                _buildImageWithNumber(
                    'assets/images/tetromino-T.png', 0, TetrominoT()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildImageWithNumber(String imagePath, int number, Tetromino f) {
  return IconButton(
    onPressed: () {
      f;
    }, // input variable for widget
    icon: Row(
      children: [
        Text(
          "${number}x",
          style: const TextStyle(
              color: Color.fromARGB(255, 70, 70, 70), fontSize: 20),
        ),
        const SizedBox(width: 5), // Kleiner Abstand
        Image.asset(
          imagePath,
          width: 50,
          height: 50,
          fit: BoxFit.contain,
        ),
      ],
    ),
  );
}