import 'tetromino.dart';

/*
Tetromino Z - Basic
[
  [0, 0, 0, 0],
  [1, 1, 0, 0],
  [0, 1, 1, 0],
  [0, 0, 0, 0]
]
 */
class TetrominoZ extends Tetromino {
  List<List<int>> basic = [
    [0, 0, 0, 0],
    [defineTetrominoNumber(), defineTetrominoNumber(), 0, 0],
    [0, defineTetrominoNumber(), defineTetrominoNumber(), 0],
    [0, 0, 0, 0],
  ];

  TetrominoZ();
}
