import 'package:flutter/material.dart';

class TetrominoButtons extends StatelessWidget {
  const TetrominoButtons({
    super.key,
  });

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
                    'assets/images/tetromino-I.png', 2),
                _buildImageWithNumber(
                    'assets/images/tetromino-O.png', 1),
                _buildImageWithNumber(
                    'assets/images/tetromino-J.png', 0),
                _buildImageWithNumber(
                    'assets/images/tetromino-L.png', 0),
              ],
            ),
            // Untere Reihe der sieben Icons (3 Icons)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildImageWithNumber(
                    'assets/images/tetromino-S.png', 0),
                _buildImageWithNumber(
                    'assets/images/tetromino-Z.png', 0),
                _buildImageWithNumber(
                    'assets/images/tetromino-T.png', 0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildImageWithNumber(String imagePath, int number) {
  return Row(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          "${number}x",
          style: const TextStyle(
              color: Color.fromARGB(255, 70, 70, 70), fontSize: 20),
        ),
      ),
      const SizedBox(height: 5), // Kleiner Abstand
      Image.asset(
        imagePath,
        width: 60,
        height: 60,
        fit: BoxFit.contain,
      ),
    ],
  );
}