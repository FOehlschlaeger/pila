import 'tetromino.dart';

/*
Tetromino S - Basic
[
  [0, 0, 0, 0],
  [0, 1, 1, 0],
  [1, 1, 0, 0],
  [0, 0, 0, 0]
]
 */
class TetrominoS extends Tetromino {
  List<List<int>> basic = [
    [0, 0, 0, 0],
    [0, defineTetrominoNumber(), defineTetrominoNumber(), 0],
    [defineTetrominoNumber(), defineTetrominoNumber(), 0, 0],
    [0, 0, 0, 0],
  ];

  TetrominoS();
}
