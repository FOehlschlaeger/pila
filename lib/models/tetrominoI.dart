import 'tetromino.dart';

/*
Tetromino I - Basic
[
  [0, 0, 1, 0],
  [0, 0, 1, 0],
  [0, 0, 1, 0],
  [0, 0, 1, 0]
]
 */
class TetrominoI extends Tetromino {
  List<List<int>> basic = [
    [0, 0, defineTetrominoNumber(), 0],
    [0, 0, defineTetrominoNumber(), 0],
    [0, 0, defineTetrominoNumber(), 0],
    [0, 0, defineTetrominoNumber(), 0],
  ];

  TetrominoI();
}
