import 'tetromino.dart';

/*
Tetromino O - Basic
[
  [0, 0, 0, 0],
  [0, 1, 1, 0],
  [0, 1, 1, 0],
  [0, 0, 0, 0]
]
 */
class TetrominoO extends Tetromino {
  List<List<int>> basic = [
    [0, 0, 0, 0],
    [0, defineTetrominoNumber(), defineTetrominoNumber(), 0],
    [0, defineTetrominoNumber(), defineTetrominoNumber(), 0],
    [0, 0, 0, 0],
  ];

  TetrominoO();
}
